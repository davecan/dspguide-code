class LinearSystemTester:
    input_signal = None
    output_signal = None

    def __init__(self, input_signal, output_signal):
        self.input_signal = input_signal
        self.output_signal = output_signal

    def is_linear(self):
        return self.is_homogeneous() and self.is_additive()

    # change in output amplitude must equal change in input amplitude
    def is_homogeneous(self):
        for i in range(0, len(self.input_signal)):
            x = self.input_signal[i]
            y = self.output_signal[i]
            x_prev = 0 if i == 0 else self.input_signal[i-1]
            y_prev = 0 if i == 0 else self.output_signal[i-1]
            delta_x = x - x_prev
            delta_y = y - y_prev
            if (delta_x != delta_y) and (i != 0):
                print("Not homogeneous on sample %s: x = %s, y = %s, delta_x = %s, delta_y = %s" % (i, x, y, delta_x, delta_y))
                return False
        return True

    def get_delta(self, x, y):
        return x-y if x >= y else y-x

    def is_additive(self):
        delta = self.get_delta(self.input_signal[0], self.output_signal[0])
        for i in range(0, len(self.input_signal)):
            x = self.input_signal[i]
            y = self.output_signal[i]
            curr_delta = self.get_delta(x, y)
            if (curr_delta != delta) and (i != 0):
                print("Not additive on sample %s: x = %s, y = %s, delta = %s, curr_delta = %s" % (i, x, y, delta, curr_delta))
                return False
        return True

    # this only tests if a signal is shifted a known number of positions forward at same amplitude
    # it doesn't handle detecting unknown shifts in position + amplitude
    def is_shift_invariant(self, shift):
        # verify all zero up to shifted position
        if not self.output_signal[0:shift] == [0 for x in range(0,shift)]:
            print("Not shift invariant. Nonzero value in shifted prefix.")
            print("Input: %s" % self.input_signal)
            print("Output: %s" % self.output_signal)
            return False

        for i in range(shift, len(self.input_signal)):
            if not self.input_signal[i-shift] == self.output_signal[i]:
                print("Not shift invariant. Mismatch at position %s (%s, %s)." % (i, self.input_signal[i], self.output_signal[i]))
                print("Input: %s" % self.input_signal)
                print("Output: %s" % self.output_signal)
                return False

        return True        


if __name__ == "__main__":
    X = [1,2,3,4,5]
    Y = [0,1,2,3,4]
    LST = LinearSystemTester(X, Y)
    print(LST.is_shift_invariant(1))