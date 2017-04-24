# zooms image to arbitrary size c > 1
function y = zoomit(x, c=2)
  y = zeros(c * rows(x), c * columns(x));
  for m = 1:c
    for n = 1:c
      y(m:c:end, n:c:end) = x;
    end
  end
end
  