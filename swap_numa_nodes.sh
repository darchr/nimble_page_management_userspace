#! /bin/bash

find ./microbenchmarks -type f -exec sed -i -e 's/new_nodes, 0/new_nodes, 2/g' {} \;
find ./microbenchmarks -type f -exec sed -i -e 's/old_nodes, 1/old_nodes, 1/g' {} \;
