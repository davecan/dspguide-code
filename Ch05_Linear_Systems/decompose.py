# Implements several of the decompositions mentioned later in Chapter 5.
# Each decomposition returns a list of lists.
# Each list is a separate component of the decomposition.

class Decompose:
    # N point signal is decomposed into N impulse signals.
    # Ex: [1, 2, 3] -> [ [1, 0, 0], [0, 2, 0], [0, 0, 3] ]
    def impulse(self, signal):
        x = []
        for i in range(0, len(signal)):
            y = [0]*len(signal)
            y[i] = signal[i]
            x.append(y)
        return x

    # N point signal is decomposed into N step signals.
    # Ex: [1, 2, 3] -> [ [1, 1, 1], [0, 2, 2], [0, 0, 3] ]
    def step(self, signal):
        x = []
        for i in range(0, len(signal)):
            y = [0]*len(signal)
            y = y[0:i] + [signal[i]]*(len(y)-i)
            x.append(y)
        return x

    # N point signal is decomposed into two signals.
    # First signal has odd samples set to zero.
    # Second signal has even samples set to zero.
    def interlaced(self, signal):
        e = []
        o = []
        for i in range(0, len(signal)):
            if i % 2 == 0:
                e.append(signal[i])
                o.append(0)
            else:
                e.append(0)
                o.append(signal[i])
        return [e,o]