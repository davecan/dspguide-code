# Implements Table 2-1

from math import sqrt
from math import pow

def mean(X):
    N = len(X)
    m = 0
    for i in range(0, N):
        m += X[i]
    return m / (N)

def variance(X):
    N = len(X)
    v = 0
    m = mean(X)
    for i in range(0, N):
        v += (X[i] - m) ** 2
    return v / (N-1)

def stddev(X):
    return sqrt(variance(X))

if __name__ == "__main__":
    S = [1,2,3,4,5,6,7,8,9,10]
    print(mean(S))
    print(variance(S))
    print(stddev(S))