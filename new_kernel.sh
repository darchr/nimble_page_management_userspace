#! /bin/bash
find ./microbenchmarks -type f -exec sed -i -e 's/333/439/g' {} \;
find ./microbenchmarks -type f -exec sed -i -e 's/334/440/g' {} \;
