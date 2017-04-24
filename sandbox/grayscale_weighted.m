# weighted aka luminous grayscale algorithm
function y = grayscale_weighted(img)
  img = double(img);
  for m = 1:rows(img)
    for n = 1:columns(img)
      r = img(m,n,1);
      g = img(m,n,2);
      b = img(m,n,3);
      rgb = r + g + b + 1;  # +1 in case it is all black to avoid divide by zero
      rw = r / rgb;
      gw = g / rgb;
      bw = b / rgb;
      y(m,n) = r*rw + g*gw + b*bw;
    end
  end
  y = uint8(y);
end