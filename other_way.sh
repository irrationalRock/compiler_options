#!/bin/bash

cat options.txt | while
read i
do
	echo $i

	sed -i "s/CMAKE_CXX_FLAGS_DEBUG:STRING=.*/$i/g" CMakeCache.txt

	../configure-cmake

	make

	time ./brotli MOCK_DATA_HUGE.csv

	rm MOCK_DATA_HUGE.csv.br

	make clean
done
