import random

def zhold(samples, hold_duration):
    L = []
    hold = None
    for i in range(0, len(samples)):
        if (i % hold_duration == 0):
            hold = samples[i]
            L.append(hold)
        else:
            L.append(hold)
    return L

if __name__ == "__main__":
    from util import Util
    U = Util("zerohold")
    X = U.get_signal()

    U.tofile(zhold(X, 3), "hold_3")
    U.tofile(zhold(X, 10), "hold_10")
    U.tofile(zhold(X, 25), "hold_25")
    U.tofile(zhold(X, 50), "hold_50")

    print("DONE!")