#!/bin/bash


PAGE_LIST=`seq 0 9`
COPY_METHOD="mt"
MULTI="1 2 4 8 16"

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

#for I in `seq 1 5`; do
for I in `seq 1 1`; do
	for MT in ${MULTI}; do
		sudo sysctl vm.limit_mt_num=${MT}
		for METHOD in ${COPY_METHOD}; do
			if [[ "x${METHOD}" == "xmt" && "x${MT}" == "x1" ]]; then
				PARAM="st"
			else
				PARAM=${METHOD}
			fi
			for N in ${PAGE_LIST}; do
				NUM_PAGES=$((1<<N))

				if [[ "x${I}" == "x1" ]]; then
					numactl -N 1 -m 1 ./thp_move_pages_dram ${NUM_PAGES} ${PARAM} 2>./dram_thp_verify_2mb/${METHOD}_${MT}_2mb_page_order_${N} | grep -A 3 "\(Total_cycles\|Test successful\)" > ./dram_stats_2mb/${METHOD}_${MT}_2mb_page_order_${N}
				else
					numactl -N 1 -m 1 ./thp_move_pages_dram ${NUM_PAGES} ${PARAM} 2>./dram_thp_verify_2mb/${METHOD}_${MT}_2mb_page_order_${N} | grep -A 3 "\(Total_cycles\|Test successful\)" >> ./dram_stats_2mb/${METHOD}_${MT}_2mb_page_order_${N}
				fi

				sleep 1
			done
			for N in ${PAGE_LIST}; do
				NUM_PAGES=$((1<<N))

				if [[ "x${I}" == "x1" ]]; then
					numactl -N 0 -m 2 ./thp_move_pages_nv ${NUM_PAGES} ${PARAM} 2>./nv_thp_verify_2mb/${METHOD}_${MT}_2mb_page_order_${N} | grep -A 3 "\(Total_cycles\|Test successful\)" > ./nv_stats_2mb/${METHOD}_${MT}_2mb_page_order_${N}
				else
					numactl -N 0 -m 2 ./nv_thp_move_pages ${NUM_PAGES} ${PARAM} 2>./nv_thp_verify_2mb/${METHOD}_${MT}_2mb_page_order_${N} | grep -A 3 "\(Total_cycles\|Test successful\)" >> ./nv_stats_2mb/${METHOD}_${MT}_2mb_page_order_${N}
				fi

				sleep 1
			done
		done
	done
done


