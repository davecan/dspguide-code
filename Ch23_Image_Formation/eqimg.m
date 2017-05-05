# simple image histogram equalization experiment
# automatically boosts contrast of pixels having
# the most frequently occurring value in the image
function s = eqimg(r, H)
  s = r;
  
  hi_val = -1;
  hi_key = -1;
  for [val,key] = H
    if val > hi_val
      hi_key = str2num(key);
      hi_val = val;
    end
  end
  s(s == hi_key) = hi_key * 1.5;
end