# crude pixelation filter
function y = pixelate(x)
  for m = 1:2:rows(x)
    for n = 1:2:columns(x)
      v = x(m,n);
      y(m,n) = v;
      y(m,n+1) = v;
      y(m+1,n) = v;
      y(m+1,n+1) = v;
    end
  end
end