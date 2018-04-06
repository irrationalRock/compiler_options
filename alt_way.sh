#!/bin/bash

cat options_c.txt | while
read i
do
	echo $i

	sed "s/CMAKE_C_FLAGS_DEBUG:STRING=.*/$i/g" CMakeCache.txt > CMakeCache.txt

	../configure-cmake

	make

	time ./brotli MOCK_DATA_HUGE.csv

	rm MOCK_DATA_HUGE.csv.br

	make clean
done
