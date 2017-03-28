# Ch 4, Table 4-1

from random import random

x = 1.0
k = 0

print("0,1.0")

for i in range(1, 2000001):
    a = random()
    b = random()
    x = x + a
    x = x + b
    x = x - a
    x = x - b
    if i % 100000 == 0:
        k += 1
        print("%s,%s" % (k, x))
