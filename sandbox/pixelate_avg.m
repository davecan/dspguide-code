# interpolates intermediate values for neighbors
function r = pixelate_avg(r)
  for m = 1:2:rows(r)
    for n = 1:2:columns(r)
      v = r(m,n);
      if m < rows(r) -1 && n < columns(r) - 1
        # gets average of this pixel and the pixel to the right and the bottom
        vr = (v + r(m,n+1)) / 2;
        vb = (v + r(m+1,n)) / 2;
        vbr = uint8(vr + vb / 2);
      else
        vr = 0;
        vb = 0;
        vbr = 0;
      end
      r(m,n+1) = vr;
      r(m+1,n) = vb;
      r(m+1,n+1) = vbr;
    end
  end
end