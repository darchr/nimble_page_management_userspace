#!/bin/bash


PAGE_LIST=`seq 0 9`
COPY_METHOD="mt"
MULTI="1 2 4 8 16"

if [ ! -d dram_non_thp_verify_4kb ]; then
	mkdir dram_non_thp_verify_4kb
fi

if [ ! -d dram_stats_4kb ]; then
	mkdir dram_stats_4kb
fi

if [ ! -d nv_non_thp_verify_4kb ]; then
	mkdir nv_non_thp_verify_4kb
fi

if [ ! -d nv_stats_4kb ]; then
	mkdir nv_stats_4kb
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
					numactl -N 1 -m 1 ./non_thp_move_pages_dram ${NUM_PAGES} ${PARAM} 2>./dram_non_thp_verify_4kb/${METHOD}_${MT}_4kb_page_order_${N} | grep -A 3 "\(Total_cycles\|Test successful\)" > ./dram_stats_4kb/${METHOD}_${MT}_4kb_page_order_${N}
				else
					numactl -N 1 -m 1 ./non_thp_move_pages_dram ${NUM_PAGES} ${PARAM} 2>./dram_non_thp_verify_4kb/${METHOD}_${MT}_4kb_page_order_${N} | grep -A 3 "\(Total_cycles\|Test successful\)" >> ./dram_stats_4kb/${METHOD}_${MT}_4kb_page_order_${N}
				fi

				sleep 1
			done
			for N in ${PAGE_LIST}; do
				NUM_PAGES=$((1<<N))

				if [[ "x${I}" == "x1" ]]; then
					numactl -N 0 -m 2 ./non_thp_move_pages_nv ${NUM_PAGES} ${PARAM} 2>./nv_non_thp_verify_4kb/${METHOD}_${MT}_4kb_page_order_${N} | grep -A 3 "\(Total_cycles\|Test successful\)" > ./nv_stats_4kb/${METHOD}_${MT}_4kb_page_order_${N}
				else
					numactl -N 0 -m 2 ./nv_non_thp_move_pages ${NUM_PAGES} ${PARAM} 2>./nv_non_thp_verify_4kb/${METHOD}_${MT}_4kb_page_order_${N} | grep -A 3 "\(Total_cycles\|Test successful\)" >> ./nv_stats_4kb/${METHOD}_${MT}_4kb_page_order_${N}
				fi

				sleep 1
			done
		done
	done
done


