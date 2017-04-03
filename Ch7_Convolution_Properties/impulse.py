class ImpulseResponse:
    def delta(self, n=1):
        s = [0]*n
        s[0] = 1
        return s

    # scales all samples in x by k
    def scale(self, x, k):
        return [k*s for s in x]

    def shift(self, x, s):
        if s > 0:
            if len(x) == 1:
                return [0]*s + x
            else:
                return [0]*s + x[0:len(x)-s]
        elif s < 0:
            y = x[(-s):len(x)]
            y.extend([0]*(-s))
            return y
        else:
            return x