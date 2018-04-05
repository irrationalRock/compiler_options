import subprocess
import re
import time

compiler_options = [
"-finline-functions ",
"-funswitch-loops ",
"-fpredictive-commoning ",
"-fgcse-after-reload ",
"-ftree-loop-vectorize ",
"-ftree-loop-distribution ",
"-ftree-loop-distribute-patterns ",
"-floop-interchange ",
"-fsplit-paths ",
"-ftree-slp-vectorize ",
"-fvect-cost-model ",
"-ftree-partial-pre ",
"-fpeel-loops ",
"-fipa-cp-clone "
]

cur = ""
options = "CMAKE_CXX_FLAGS_DEBUG:STRING= -O2 "

all_options = []
for x in range(0,16384):
    print '{0:0>14}'.format(str(bin(x))[2:])
    cur = '{0:0>14}'.format(str(bin(x))[2:])

    if cur[0] == "1":
        options += compiler_options[0]

    if cur[1] == "1":
        options += compiler_options[1]

    if cur[2] == "1":
        options += compiler_options[2]

    if cur[3] == "1":
        options += compiler_options[3]

    if cur[4] == "1":
        options += compiler_options[4]

    if cur[5] == "1":
        options += compiler_options[5]

    if cur[6] == "1":
        options += compiler_options[6]

    if cur[7] == "1":
        options += compiler_options[7]

    if cur[8] == "1":
        options += compiler_options[8]

    if cur[9] == "1":
        options += compiler_options[9]

    if cur[10] == "1":
        options += compiler_options[10]

    if cur[11] == "1":
        options += compiler_options[11]

    if cur[12] == "1":
        options += compiler_options[12]

    if cur[13] == "1":
        options += compiler_options[13]

    print options
    all_options.append(options)
    options = "CMAKE_CXX_FLAGS_DEBUG:STRING= -O2 "
    cur = ""


file = open('options.txt','w')
for j in all_options:
    file.write(j + '\n')
file.close()
