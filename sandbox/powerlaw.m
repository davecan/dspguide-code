# nth power / gamma correction grayscale transform
# r is the image
# g is the gamma value
function s = powerlaw(r, g, c=1)
  s = c * (r.^g);
end