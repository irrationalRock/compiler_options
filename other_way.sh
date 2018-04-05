#!/bin/bash

readarray a < options.txt

for i in "${a[@]}"
do
	echo $i

	sed 's/CMAKE_CXX_FLAGS_DEBUG:STRING=.*/$i/g' CMakeCache.txt

	../configure-cmake

	make

	time ./brotli MOCK_DATA_HUGE.csv

	rm MOCK_DATA_HUGE.csv.br

	make clean
done
