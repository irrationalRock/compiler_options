import re

def parseTime(time):
    min_location = time.index('m')
    sec_location = time.rindex('s')
    min = time[min_location-1:min_location]
    dot = time[min_location+1:sec_location]
    return (int(min) * 100) + float(dot)

with open("derp.txt") as f:
    data = f.read().splitlines()

real = re.compile('real\s[0-9m.s]+')
user = re.compile('user\s[0-9m.s]+')

list_of_real = []
list_of_user = []

for x in data:
    if real.match(x) != None:
        list_of_real.append(real.match(x).group())

for x in data:
    if user.match(x) != None:
        list_of_user.append(user.match(x).group())

max = 0

print len(list_of_real)

for x in list_of_real:
    if parseTime(x) > max:
        max = parseTime(x)

print "real max:" + str(max)

min = list_of_real[0]

for x in list_of_real:
    if parseTime(x) < min:
        min = parseTime(x)

print  "real min:" + str(min)

###############################################################

max = 0
min = list_of_real[0]

for x in list_of_user:
    if parseTime(x) > max:
        max = parseTime(x)

print "user max:" + str(max)

for x in list_of_user:
    if parseTime(x) < min:
        min = parseTime(x)

print "user min:" + str(min)
