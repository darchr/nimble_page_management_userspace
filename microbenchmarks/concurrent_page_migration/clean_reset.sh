#! /bin/bash

rm -rf dram_non_thp_verify_4kb/*
rm -rf dram_stats_2mb/*
rm -rf dram_stats_4kb/*
rm -rf dram_thp_verify_2mb/*
rm -rf nv_non_thp_verify_4kb/*
rm -rf nv_stats_2mb/*
rm -rf nv_stats_4kb/*
rm -rf nv_thp_verify_2mb/*

rm non_thp_move_pages_dram
rm thp_move_pages_dram
rm non_thp_move_pages_nv
rm thp_move_pages_nv