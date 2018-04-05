#!/bin/bash

option=("-finline-functions","-funswitch-loops","-fpredictive-commoning","-fgcse-after-reload","-ftree-loop-vectorize","-ftree-loop-distribution","-ftree-loop-distribute-patterns","-floop-interchange","-fsplit-paths","-ftree-slp-vectorize","-fvect-cost-model","-ftree-partial-pre","-fpeel-loops","-fipa-cp-clone")

for i in `seq 0 4096`; do
  #echo "obase=2;$i" | bc
  #options = " -O2 "
  derp="obase=2;$i" | bc | printf "%014d"

  #printf "%013d" derp

  if [ ${i:0:1} -eq 1 ]
  then
    options = options + ${ARRAY[0]}
  fi

  if [ ${i:1:1} -eq 1 ]
  then
    options = options + ${ARRAY[0]}
  fi

  if [ ${i:2:1} -eq 1 ]
  then
    options = options + ${ARRAY[0]}
  fi

  if [ ${i:3:1} -eq 1 ]
  then
    options = options + ${ARRAY[0]}
  fi

  if [ ${i:4:1} -eq 1 ]
  then
    options = options + ${ARRAY[0]}
  fi

  if [ ${i:5:1} -eq 1 ]
  then
    options = options + ${ARRAY[0]}
  fi

  if [ ${i:6:1} -eq 1 ]
  then
    options = options + ${ARRAY[0]}
  fi

  if [ ${i:7:1} -eq 1 ]
  then
    options = options + ${ARRAY[0]}
  fi

  if [ ${i:8:1} -eq 1 ]
  then
    options = options + ${ARRAY[0]}
  fi

  if [ ${i:9:1} -eq 1 ]
  then
    options = options + ${ARRAY[0]}
  fi

  if [ ${i:10:1} -eq 1 ]
  then
    options = options + ${ARRAY[0]}
  fi

  if [ ${i:11:1} -eq 1 ]
  then
    options = options + ${ARRAY[0]}
  fi

  if [ ${i:12:1} -eq 1 ]
  then
    options = options + ${ARRAY[0]}
  fi

  if [ ${i:13:1} -eq 1 ]
  then
    options = options + ${ARRAY[0]}
  fi

  sed 's/CMAKE_CXX_FLAGS_DEBUG:STRING=/CMAKE_CXX_FLAGS_DEBUG:STRING=$options/g'

  ../configure-cmake

  make

  echo "$options"

  time ./brolti MOCK_DATA_HUGE.csv 2> results.txt

  make clean

done
#need to make a make clean

#make -j 16 * to run mutli core stuff
