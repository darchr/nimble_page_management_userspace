
CC=gcc

thp_move_pages_dram2dram: move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

non_thp_move_pages_dram2dram: non_thp_move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

thp_move_pages_dram2nv: move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

non_thp_move_pages_dram2nv: non_thp_move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

thp_move_pages_nv2dram: move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

non_thp_move_pages_nv2dram: non_thp_move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

thp_move_pages_nv2nv: move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

non_thp_move_pages_nv2nv: non_thp_move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

thp_move_pages_dram2local: move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

non_thp_move_pages_dram2local: non_thp_move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

thp_move_pages_local2dram: move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

non_thp_move_pages_local2dram: non_thp_move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

thp_move_pages_nv2local: move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

non_thp_move_pages_nv2local: non_thp_move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@
