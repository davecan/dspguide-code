from collections import defaultdict
import math

class BinnedHist:
    # defaultdict creates a key with default value if it doesn't exist
    bins = defaultdict(int)  
    num_samples = 0
    smallest_value = None
    largest_value = None
    bin_count = 10
    bin_size = 0

    def __init__(self, bin_count):
        self.bin_count = bin_count
        # self.bins = dict.fromkeys(range(self.bin_count))
        # append a +1 key to the dict to handle roundups at the end
        # self.bins[len(self.bins)] = len(self.bins)

    def add_samples(self, X):
        N = len(X)
        self.num_samples = N
        self.smallest_value = X[0]
        self.largest_value = self.smallest_value

        # calculate bins
        for i in range(0, N):
            if X[i] < self.smallest_value:
                self.smallest_value = math.floor(X[i])
            elif X[i] > self.largest_value:
                self.largest_value = math.ceil(X[i])

        self.bin_size = int((self.largest_value / self.bin_count))

        # bin it
        for i in range(0, N):
            bin_num = int(round(X[i] / self.bin_size))
            self.bins[bin_num] += 1

    def show_hist(self):
        # for key in sorted(self.bins.keys()):
        print("bin_size: " + str(self.bin_size))
        for k in range(0, self.bin_count + 1):
            label = str(int((self.bin_size) * k))
            value = self.bins[k] if (k in self.bins) else 0
            print(str(k) + ": " + label + " => " + str(value))

    def mean(self):
        # mean is broken... :(
        m = 0
        for k in self.bins.keys():
            m += k * self.bins[k]
        return m / self.num_samples

    

if __name__ == "__main__":
    import random

    X = [random.uniform(0, 201) for _ in range(400)]

    hist = BinnedHist(5)
    hist.add_samples(X)
    hist.show_hist()

    print()
    print("mean: " + str(hist.mean()))
    # print("variance: " + str(hist.variance()))
    # print("stddev: " + str(hist.stddev()))