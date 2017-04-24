# inverse log grayscale transform
# r is the image
function s = invlog(r,c=1,d=1)
  s = exp(r/c) - 1;
end