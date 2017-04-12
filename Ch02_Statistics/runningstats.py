# Implements Table 2-2

from math import sqrt

class RunningStats:
    samples = 0
    sum = 0
    sum_of_squares = 0

    def mean(self):
        return self.sum if (self.samples == 1) else self.sum / (self.samples)

    def variance(self):
        if self.samples == 1:
            return (self.sum_of_squares - ( (self.sum ** 2) / self.samples ) )
        else:
            return (self.sum_of_squares - ( (self.sum ** 2) / self.samples ) ) / (self.samples - 1)

    def stddev(self):
        return sqrt(self.variance())

    def add_samples(self, X):
        N = len(X)
        self.samples += N
        for i in range(0, N):
            self.sum += X[i]
            self.sum_of_squares += X[i] ** 2
            

if __name__ == "__main__":
    X = []
    for i in range(1,11):
        stats = RunningStats()
        X.append(i)
        stats.add_samples(X)
        print("samples: " + " ".join(str(x) for x in X))
        print("mean: " + str(stats.mean()))
        print("variance: " + str(stats.variance()))
        print("stddev: " + str(stats.stddev()))
        print("")