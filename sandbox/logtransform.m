# log grayscale transformation
# r is the image
function s = logtransform(r, c=1, d=1)
  s = c * log(r + d);
end