#!/bin/bash

readarray a < options.txt

for i in "${a[@]}"
do
	echo $i

	sed '  sed 's/CMAKE_CXX_FLAGS_DEBUG:STRING=/$i/g' CMakeCache.txt'

	../configure-cmake
	
	make

	time ./brotli

	make clean
done
