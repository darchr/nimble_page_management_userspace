
CC=gcc

thp_move_pages_dram: move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

non_thp_move_pages_dram: non_thp_move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

thp_move_pages_nv: move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@

non_thp_move_pages_nv: non_thp_move_page_breakdown.c
	$(CC) -o $@ $^ -lnuma
	sudo setcap "all=ep" $@
