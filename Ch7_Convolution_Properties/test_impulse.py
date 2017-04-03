import unittest
from impulse import ImpulseResponse

class TestImpulseResponse(unittest.TestCase):
    def test_impulse(self):
        I = ImpulseResponse()
        self.assertEqual([1], I.delta())
        self.assertEqual([1,0], I.delta(2))
        self.assertEqual([1,0,0,0,0,0,0,0,0,0], I.delta(10))

    def test_scale(self):
        I = ImpulseResponse()
        self.assertEqual([1], I.scale([1], 1))
        self.assertEqual([0], I.scale([1], 0))
        self.assertEqual([2], I.scale([1], 2))
        self.assertEqual([3, 6, 0, -3, -6], I.scale([1, 2, 0, -1, -2], 3))
        self.assertEqual([0.5, 1, 0, -0.5, -1], I.scale([1, 2, 0, -1, -2], 0.5))

    def test_shift(self):
        I = ImpulseResponse()
        self.assertEqual([0,1], I.shift([1], 1))
        self.assertEqual([0], I.shift([1], -1))
        self.assertEqual([1,2,3], I.shift([1,2,3], 0))
        self.assertEqual([0,1,2], I.shift([1,2,3], 1))
        self.assertEqual([0,0,1], I.shift([1,2,3], 2))
        self.assertEqual([0,0,0], I.shift([1,2,3], 3))
        self.assertEqual([2,3,0], I.shift([1,2,3], -1))
        self.assertEqual([3,0,0], I.shift([1,2,3], -2))
        self.assertEqual([0,0,0], I.shift([1,2,3], -3))

    def test_shift_and_scale_delta(self):
        I = ImpulseResponse()
        self.assertEqual([0,2], I.shift(I.scale(I.delta(), 2), 1))
        self.assertEqual([0,0,0,4], I.shift(I.scale(I.delta(), 4), 3))
        self.assertEqual([0,0,0.5], I.scale(I.shift(I.delta(), 2), 0.5))



if __name__ == '__main__':
    unittest.main()