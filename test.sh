#!/bin/bash

option=("","","","","","","")

for i in `seq 0 4096`; do
  #echo "obase=2;$i" | bc
  options = " -O2 "
  derp="obase=2;$i" | bc
  printf "%013d" derp

  if [ ${i:0:1} -eq 1 ]
  then
    options = options +
  fi

  sed

  ../configure-cmake

  make

  time ./brolti MOCK_DATA_HUGE.csv 2> results.txt

  make clean

done

#need to make a make clean

#make -j 16 * to run mutli core stuff
