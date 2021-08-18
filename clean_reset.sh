#! /bin/bash

dirs=" concurrent_page_migration exchange_page_migration thp_page_migration_and_parallel"

for dir in ${dirs}; do
    rm -rf ./microbenchmarks/${dir}/dram2dram_non_thp_verify_4kb/
    rm -rf ./microbenchmarks/${dir}/dram2dram_stats_2mb/
    rm -rf ./microbenchmarks/${dir}/dram2dram_stats_4kb/
    rm -rf ./microbenchmarks/${dir}/dram2dram_thp_verify_2mb/
    rm -rf ./microbenchmarks/${dir}/nv2dram_non_thp_verify_4kb/
    rm -rf ./microbenchmarks/${dir}/nv2dram_stats_2mb/
    rm -rf ./microbenchmarks/${dir}/nv2dram_stats_4kb/
    rm -rf ./microbenchmarks/${dir}/nv2dram_thp_verify_2mb/
    rm -rf ./microbenchmarks/${dir}/dram2nv_non_thp_verify_4kb/
    rm -rf ./microbenchmarks/${dir}/dram2nv_stats_2mb/
    rm -rf ./microbenchmarks/${dir}/dram2nv_stats_4kb/
    rm -rf ./microbenchmarks/${dir}/dram2nv_thp_verify_2mb/
    rm -rf ./microbenchmarks/${dir}/nv2nv_non_thp_verify_4kb/
    rm -rf ./microbenchmarks/${dir}/nv2nv_stats_2mb/
    rm -rf ./microbenchmarks/${dir}/nv2nv_stats_4kb/
    rm -rf ./microbenchmarks/${dir}/nv2nv_thp_verify_2mb/
    rm -rf ./microbenchmarks/${dir}/dram2local_stats_4kb/
    rm -rf ./microbenchmarks/${dir}/dram2local_thp_verify_2mb/
    rm -rf ./microbenchmarks/${dir}/dram2local_stats_2mb/
    rm -rf ./microbenchmarks/${dir}/dram2local_non_thp_verify_4kb/
    rm -rf ./microbenchmarks/${dir}/local2dram_stats_4kb/
    rm -rf ./microbenchmarks/${dir}/local2dram_thp_verify_2mb/
    rm -rf ./microbenchmarks/${dir}/local2dram_stats_2mb/
    rm -rf ./microbenchmarks/${dir}/local2dram_non_thp_verify_4kb/

    rm ./microbenchmarks/${dir}/non_thp_move_pages_dram2dram
    rm ./microbenchmarks/${dir}/thp_move_pages_dram2dram
    rm ./microbenchmarks/${dir}/non_thp_move_pages_dram2nv
    rm ./microbenchmarks/${dir}/thp_move_pages_dram2nv
    rm ./microbenchmarks/${dir}/non_thp_move_pages_dram2local
    rm ./microbenchmarks/${dir}/thp_move_pages_dram2local
    rm ./microbenchmarks/${dir}/non_thp_move_pages_nv2dram
    rm ./microbenchmarks/${dir}/thp_move_pages_nv2dram
    rm ./microbenchmarks/${dir}/non_thp_move_pages_nv2nv
    rm ./microbenchmarks/${dir}/thp_move_pages_nv2nv
    rm ./microbenchmarks/${dir}/non_thp_move_pages_local2dram
    rm ./microbenchmarks/${dir}/thp_move_pages_local2dram
done

for dir in ${dirs}; do
    mkdir ./microbenchmarks/${dir}/dram2dram_non_thp_verify_4kb/
    mkdir ./microbenchmarks/${dir}/dram2dram_stats_2mb/
    mkdir ./microbenchmarks/${dir}/dram2dram_stats_4kb/
    mkdir ./microbenchmarks/${dir}/dram2dram_thp_verify_2mb/
    mkdir ./microbenchmarks/${dir}/nv2dram_non_thp_verify_4kb/
    mkdir ./microbenchmarks/${dir}/nv2dram_stats_2mb/
    mkdir ./microbenchmarks/${dir}/nv2dram_stats_4kb/
    mkdir ./microbenchmarks/${dir}/nv2dram_thp_verify_2mb/
    mkdir ./microbenchmarks/${dir}/dram2nv_non_thp_verify_4kb/
    mkdir ./microbenchmarks/${dir}/dram2nv_stats_2mb/
    mkdir ./microbenchmarks/${dir}/dram2nv_stats_4kb/
    mkdir ./microbenchmarks/${dir}/dram2nv_thp_verify_2mb/
    mkdir ./microbenchmarks/${dir}/nv2nv_non_thp_verify_4kb/
    mkdir ./microbenchmarks/${dir}/nv2nv_stats_2mb/
    mkdir ./microbenchmarks/${dir}/nv2nv_stats_4kb/
    mkdir ./microbenchmarks/${dir}/nv2nv_thp_verify_2mb/
    mkdir ./microbenchmarks/${dir}/dram2local_stats_4kb/
    mkdir ./microbenchmarks/${dir}/dram2local_thp_verify_2mb/
    mkdir ./microbenchmarks/${dir}/dram2local_stats_2mb/
    mkdir ./microbenchmarks/${dir}/dram2local_non_thp_verify_4kb/
    mkdir ./microbenchmarks/${dir}/local2dram_stats_4kb/
    mkdir ./microbenchmarks/${dir}/local2dram_thp_verify_2mb/
    mkdir ./microbenchmarks/${dir}/local2dram_stats_2mb/
    mkdir ./microbenchmarks/${dir}/local2dram_non_thp_verify_4kb/
done
