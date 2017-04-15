# simple bilinear interpolation
# assumes image cells are packed -- no gaps
# i.e. it can't interpolate between cols 10 and 12, only 10-11, 11-12, etc.

from math import floor, ceil

class Bilinear:
    def interpolate(self, x, y, points):
        # horizontal, then vertical
        x1 = floor(x)
        x2 = ceil(x)
        y1 = floor(y)
        y2 = ceil(y)

        q11 = points[(x1, y1)]
        q12 = points[(x1, y2)]
        q21 = points[(x2, y1)]
        q22 = points[(x2, y2)]

        a = q11 * (x2 - x) * (y2 - y)
        b = q21 * (x - x1) * (y2 - y)
        c = q12 * (x2 - x) * (y - y1)
        d = q22 * (x - x1) * (y - y1)

        return (a + b + c + d) / ( (x2 - x1) * (y2 - y1) )


if __name__ == "__main__":
    points = {
        (14,20) : 91,
        (14, 21) : 162,
        (15, 20) : 210,
        (15, 21) : 95
    }
    B = Bilinear()
    B.points = points
    
    # returns 146.1, different from the text
    # but checked it by hand as well
    v = B.interpolate(14.5, 20.2, points)  
    print(str(v))