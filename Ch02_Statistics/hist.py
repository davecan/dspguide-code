# Implements Table 2-3

from math import sqrt
from collections import defaultdict

class Hist:
    # defaultdict creates a key with default value if it doesn't exist
    groups = defaultdict(int)  
    num_samples = 0

    def add_samples(self, X):
        N = len(X)
        self.num_samples += N
        for i in range(0, N):
            self.groups[X[i]] += 1

    def show_hist(self):
        for key in sorted(self.groups.keys()):
            print(str(key) + " => " + str(self.groups[key]))

    def mean(self):
        m = 0
        for k in self.groups.keys():
            m += k * self.groups[k]
        return m / self.num_samples

    def variance(self):
        v = 0
        the_mean = self.mean()
        for k in self.groups.keys():
            v += self.groups[k] * ( (k - the_mean)**2 )
        return v / (self.num_samples - 1)

    def stddev(self):
        return sqrt(self.variance())
 


if __name__ == "__main__":
    import random

    D = range(1,5)
    X = list(map(lambda _: random.choice(D), range(10)))

    print(X)
    hist = Hist()
    hist.add_samples(X)
    hist.show_hist()

    print()
    print("mean: " + str(hist.mean()))
    print("variance: " + str(hist.variance()))
    print("stddev: " + str(hist.stddev()))