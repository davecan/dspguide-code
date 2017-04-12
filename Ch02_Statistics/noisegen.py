import random
import statistics
import math

class NoiseGen:
    target_mean = 0
    target_std_dev = 0

    def __init__(self, mean, std_dev):
        self.target_mean = mean
        self.target_std_dev = std_dev

    def __get_rand(self, num):
        x = 0
        for i in range(0, num):
            x += random.random()
        return x

    def method_one(self, num_samples, num_rands=12):
        s1 = []
        for i in range(0, num_samples):
            x = self.__get_rand(num_rands)
            s1.append(x)
        mean = sum(s1) / len(s1)
        s2 = [x - mean for x in s1]
        s3 = [x * self.target_std_dev + self.target_mean for x in s2]
        return s3

    def method_two(self, num_samples):
        s = []
        for i in range(0, num_samples):
            r1 = random.random()
            r2 = random.random() 
            x = math.sqrt(-2 * math.log(r1)) * math.cos(2 * math.pi * r2)
            x = x * self.target_std_dev + self.target_mean
            s.append(x)
        return s

if __name__ == "__main__":
    # all values will be within 1/4 std dev of 5...
    NG = NoiseGen(5, 0.25)
    L = NG.method_one(10, 20)
    print(L)    
    L = NG.method_two(10)
    print(L)

    # within 2 std dev of 3...
    NG = NoiseGen(3, 2)
    L = NG.method_one(10, 20)
    print(L)    
    L = NG.method_two(10)
    print(L)