#!/bin/bash


PAGE_LIST=`seq 0 4`
#PAGE_LIST=`seq 5 9`
COPY_METHOD="seq mt"
BATCH_MODE="no_batch"
MULTI="1 4"


if [ ! -d dram_thp_verify_2mb ]; then
	mkdir dram_thp_verify_2mb
fi

if [ ! -d dram_stats_2mb ]; then
	mkdir dram_stats_2mb
fi

if [ ! -d nv_thp_verify_2mb ]; then
	mkdir nv_thp_verify_2mb
fi

if [ ! -d nv_stats_2mb ]; then
	mkdir nv_stats_2mb
fi

sudo sysctl vm.accel_page_copy=0

#for I in `seq 1 5`; do
for I in `seq 1 1`; do
	for MT in ${MULTI}; do
		sudo sysctl vm.limit_mt_num=${MT}
		for BATCH in ${BATCH_MODE}; do
			for METHOD in ${COPY_METHOD}; do
				PARAM=${METHOD}
				if [[ "x${METHOD}" == "xseq" && "x${MT}" != "x1" ]]; then
					continue
				fi
				if [[ "x${METHOD}" == "xmt" && "x${MT}" == "x1" ]]; then
					continue
				fi
				for N in ${PAGE_LIST}; do
					NUM_PAGES=$((1<<N))

					echo "NUM_PAGES: "${NUM_PAGES}", METHOD: "${PARAM}", BATCH: "${BATCH}", MT: "${MT}

					if [[ "x${I}" == "x1" ]]; then
						numactl -N 1 -m 1 ./thp_move_pages_dram ${NUM_PAGES} ${PARAM} ${BATCH} 2>./dram_thp_verify_2mb/${METHOD}_${MT}_2mb_page_order_${N}_${BATCH} | grep -A 3 "\(Total_cycles\|Test successful\)" > ./dram_stats_2mb/${METHOD}_${MT}_page_order_${N}_${BATCH}
					else
						numactl -N 1 -m 1 ./thp_move_pages_dram ${NUM_PAGES} ${PARAM} ${BATCH} 2>./dram_thp_verify_2mb/${METHOD}_${MT}_2mb_page_order_${N}_${BATCH} | grep -A 3 "\(Total_cycles\|Test successful\)" >> ./dram_stats_2mb/${METHOD}_${MT}_page_order_${N}_${BATCH}
					fi

					sleep 5
				done
				for N in ${PAGE_LIST}; do
					NUM_PAGES=$((1<<N))

					echo "NUM_PAGES: "${NUM_PAGES}", METHOD: "${PARAM}", BATCH: "${BATCH}", MT: "${MT}

					if [[ "x${I}" == "x1" ]]; then
						numactl -N 0 -m 2 ./thp_move_pages_nv ${NUM_PAGES} ${PARAM} ${BATCH} 2>./nv_thp_verify_2mb/${METHOD}_${MT}_2mb_page_order_${N}_${BATCH} | grep -A 3 "\(Total_cycles\|Test successful\)" > ./nv_stats_2mb/${METHOD}_${MT}_page_order_${N}_${BATCH}
					else
						numactl -N 0 -m 2 ./thp_move_pages_nv ${NUM_PAGES} ${PARAM} ${BATCH} 2>./nv_thp_verify_2mb/${METHOD}_${MT}_2mb_page_order_${N}_${BATCH} | grep -A 3 "\(Total_cycles\|Test successful\)" >> ./nv_stats_2mb/${METHOD}_${MT}_page_order_${N}_${BATCH}
					fi

					sleep 5
				done
			done
		done
	done
done


sudo sysctl vm.accel_page_copy=1
