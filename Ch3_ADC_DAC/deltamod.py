# Rough simulation of the delta modulation circuit in 3-16 on page 61.
# This isn't exactly correct but it looks like it gets pretty close...

class DeltaModulator:
    signal = None
    # latch = 0
    capacitor = 0
    latch = 0
    output = []
    num_ones = 0
    num_zeros = 0

    def __init__(self, signal):
        self.signal = signal

    def run(self):
        for i in range(0, len(self.signal), 2):  # simulate clock pulse on every other signal value
            s = float(self.signal[i])
            if s > self.capacitor:
                self.latch += 1
            elif s < self.capacitor:
                self.latch -= 1
            self.output.append(self.latch) 
            self.output.append(self.latch)  # append a copy to simulate holding steady till next pulse
            if self.latch > self.capacitor:
                self.capacitor += 1
            elif self.latch < self.capacitor:
                self.capacitor -= 1



if __name__ == "__main__":
    from util import Util
    U = Util("deltamod")
    X = U.get_signal("input")
    DM = DeltaModulator(X)
    DM.run()
    U.tofile(DM.output)
    print(DM.output)