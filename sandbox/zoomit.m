% basic zoom algorithm
function s = zoomit(img, c)
  [rows, cols] = size(img);
  s = ones(c * rows, c * cols);
  for m = 1:rows
    for n = 1:cols
      p = img(m,n);
      s(m+m-1,n+n-1) = p;
      s(m+m-1,n+n) = p;
      s(m+m,n+n-1) = p;
      s(m+m,n+n) = p;
    end
  end
  s = uint8(s);
end
  