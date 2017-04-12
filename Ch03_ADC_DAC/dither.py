from random import random

def digitize(samples):
    L = []
    for s in samples:
        L.append(round(s))
    return L

def dither(samples):
    L = []
    for s in samples:
        r = 3*random() 
        r = r if (random() % 2 == 0) else 0 - r
        L.append(s + r)
    return L



if __name__ == "__main__":
    samples = []
    for i in range(0, 20):
        samples.append(3000 + random())
    
    dithered = dither(samples)
    digitized = digitize(samples)
    dithered_digitized = digitize(dithered)

    print("original | digitized | dithered | dithered & digitized")
    for i in range(0, len(samples)):
        print(str(samples[i]) + "\t\t" + str(digitized[i]) + "\t\t" + str(dithered[i]) + "\t\t" + str(dithered_digitized[i]))
