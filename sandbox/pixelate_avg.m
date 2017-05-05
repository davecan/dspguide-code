% interpolates intermediate values for neighbors
function y = pixelate_avg(x)
  [r c] = size(x);
  for m = 1:2:r
    for n = 1:2:c
      v = x(m,n);
      if m < r -1 && n < c - 1
        % gets average of this pixel and the pixel to the right and the bottom
        vr = (v + x(m,n+1)) / 2;
        vb = (v + x(m+1,n)) / 2;
        vbr = uint8(vr + vb / 2);
      else
        vr = 0;
        vb = 0;
        vbr = 0;
      end
      x(m,n+1) = vr;
      x(m+1,n) = vb;
      x(m+1,n+1) = vbr;
    end
  end
end