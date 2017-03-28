import unittest
from util import Util
from decompose import Decompose

class TestDecompose(unittest.TestCase):
    def test_impulse(self):
        X = [0, 1, 2, 3, 4, 5]
        D = Decompose()
        I = D.impulse(X)
        self.assertTrue(len(I) == len(X))
        # expected = [ [0,0,0,0,0,0], [0,1,0,0,0,0],[0,0,2,0,0,0],[0,0,0,3,0,0],[0,0,0,0,4,0],[0,0,0,0,0,5]]
        # self.assertTrue(I == expected)
        for i in range(0, len(I)):
            impulse = I[i]
            for j in range(0, len(impulse)):
                if i == j:
                    self.assertTrue(impulse[j] == X[i])
                else:
                    self.assertTrue(impulse[j] == 0)        

    def test_step(self):
        X = [0, 1, 2, 3, 4, 5]
        D = Decompose()
        S = D.step(X)
        self.assertTrue(len(S) == len(X))
        # expected = [ [0,0,0,0,0,0],[0,1,1,1,1,1],[0,0,2,2,2,2],[0,0,0,3,3,3],[0,0,0,0,4,4],[0,0,0,0,0,5]]
        # self.assertTrue(S == expected)
        for x in range(0, len(X)):
            step = S[x]
            for s in range(0, len(step)):
                if s >= x:
                    self.assertTrue(step[s] == X[x], "x: %s, X[x]: %s, s: %s, step[s]: %s" % (x, X[x], s, step[s]))
                else:
                    self.assertTrue(step[s] == 0, "x: %s, s: %s, step[s]: %s" % (x, s, step[s]))

    def test_interlaced(self):
        X = [0,1,2,3,4,5]
        D = Decompose()
        S = D.interlaced(X)
        self.assertTrue(len(S) == 2)



if __name__ == '__main__':
    unittest.main()