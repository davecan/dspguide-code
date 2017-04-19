# surrounds matrix with zero values to prep for convolution
# given:
#   1 2 3
#   4 5 6
# returns:
#   0 0 0 0 0
#   0 1 2 3 0
#   0 4 5 6 0
#   0 0 0 0 0
function y = expand(x)
  a = x;
  b = resize(a,rows(a)+2,columns(a)+2);
  c = circshift(b,[1,1]);
  y = c;
end