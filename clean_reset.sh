#! /bin/bash

dirs=" concurrent_page_migration exchange_page_migration thp_page_migration_and_parallel"

for dir in ${dirs}; do
    rm -rf ./microbenchmarks/${dir}/dram_non_thp_verify_4kb/*
    rm -rf ./microbenchmarks/${dir}/dram_stats_2mb/*
    rm -rf ./microbenchmarks/${dir}/dram_stats_4kb/*
    rm -rf ./microbenchmarks/${dir}/dram_thp_verify_2mb/*
    rm -rf ./microbenchmarks/${dir}/nv_non_thp_verify_4kb/*
    rm -rf ./microbenchmarks/${dir}/nv_stats_2mb/*
    rm -rf ./microbenchmarks/${dir}/nv_stats_4kb/*
    rm -rf ./microbenchmarks/${dir}/nv_thp_verify_2mb/*

    rm ./microbenchmarks/${dir}/non_thp_move_pages_dram
    rm ./microbenchmarks/${dir}/thp_move_pages_dram
    rm ./microbenchmarks/${dir}/non_thp_move_pages_nv
    rm ./microbenchmarks/${dir}/thp_move_pages_nv
done
