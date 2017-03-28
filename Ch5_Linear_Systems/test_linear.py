import unittest
from util import Util
from linear import LinearSystemTester

class TestLinearSystemsTester(unittest.TestCase):
    input_signal = None 

    def setUp(self):
        U = Util("linear")
        self.input_signal = [int(x) for x in U.get_signal("input")]

    def test_is_homogeneous(self):
        X = self.input_signal
        Y = [x + 100 for x in X]
        LST = LinearSystemTester(X, Y)
        self.assertTrue(LST.is_homogeneous())

    def test_non_homogeneous(self):
        X = self.input_signal
        Y = [x for x in X]
        Y[25] = Y[25] + 1
        LST = LinearSystemTester(X, Y)
        self.assertFalse(LST.is_homogeneous())

    def test_is_additive(self):
        X = self.input_signal
        Y = [x + 1 for x in X]
        LST = LinearSystemTester(X, Y)
        self.assertTrue(LST.is_additive())

        Y = [x - 1 for x in X]
        LST = LinearSystemTester(X, Y)
        self.assertTrue(LST.is_additive())

    def test_non_additive(self):
        X = self.input_signal
        Y = [x + 1 for x in X]
        Y[25] = -141414
        LST = LinearSystemTester(X, Y)
        self.assertFalse(LST.is_additive())

        Y = [x * x for x in X]
        LST = LinearSystemTester(X, Y)
        self.assertFalse(LST.is_additive())

    def test_is_linear(self):
        X = self.input_signal
        Y = [x + 1 for x in X]
        LST = LinearSystemTester(X, Y)
        self.assertTrue(LST.is_linear())

        Y = [x - 1 for x in X]
        LST = LinearSystemTester(X, Y)
        self.assertTrue(LST.is_linear())

    def test_non_linear(self):
        X = self.input_signal
        Y = [x + 1 for x in X]
        Y[25] = Y[1] + Y[2]
        LST = LinearSystemTester(X, Y)
        self.assertFalse(LST.is_linear())

        Y = [x * x for x in X]
        LST = LinearSystemTester(X, Y)
        self.assertFalse(LST.is_linear())

    def shift(self, l, n):
        if n == 0:
            return l
        m = [0 for x in range(0, n)]
        m.extend(l[0:-n])
        return m

    # sanity check
    def test_shift(self):
        X = [1,2,3,4,5]
        Y = self.shift(X, 1)
        self.assertEqual(Y, [0,1,2,3,4])

        Y = self.shift(X, 3)
        self.assertEqual(Y, [0,0,0,1,2])

    def test_is_shift_invariant(self):
        # shift 0
        X = [1,2,3,4,5]
        LST = LinearSystemTester(X, X)
        self.assertTrue(LST.is_shift_invariant(0))

        # shift 1
        X = [1,2,3,4,5]
        Y = self.shift(X, 1)
        LST = LinearSystemTester(X, Y)
        self.assertTrue(LST.is_shift_invariant(1))

        # shift 4
        Y = self.shift(X, 4)
        LST = LinearSystemTester(X, Y)
        self.assertTrue(LST.is_shift_invariant(4))

    def test_non_shift_invariant(self):
        X = [1,2,3,4,5]
        Y = self.shift(X, 1)
        Y[0] = -1
        LST = LinearSystemTester(X, Y)
        self.assertFalse(LST.is_shift_invariant(1))


if __name__ == '__main__':
    unittest.main()