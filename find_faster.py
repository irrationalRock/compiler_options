import re

def parseTime(time):
    min_location = time.index('m')
    sec_location = time.rindex('s')
    min = time[min_location-1:min_location]
    dot = time[min_location+1:sec_location]
    #print "time: " + time
    #print "min: " + str(min) 
    #print "dot: " + str(dot) 
    #print min_location
    #print sec_location
    return (int(min) * 100) + float(dot)

with open("data.txt") as f:
    data = f.read().splitlines()

real = re.compile('real: [0-9m.s]+')
user = re.compile('user: [0-9m.s]+')

list_of_real = []
list_of_user = []

#print data

for x in data:
    if real.match(x) != None:
        list_of_real.append(real.match(x).group())
    
for x in data:
    if user.match(x) != None:
        list_of_user.append(user.match(x).group())

max = 0

for x in list_of_real:
    if parseTime(x) > max:
        max = parseTime(x)

print max

min = list_of_real[0]

for x in list_of_real:
    print x
    if parseTime(x) < min:
        min = parseTime(x)

print min




###############################################################

max = 0
min = list_of_real[0]

for x in list_of_user:
    #print parseTime(x)
    if parseTime(x) > max:
        max = parseTime(x)

print max

for x in list_of_user:
    if parseTime(x) < min:
        min = parseTime(x)

print min
