# this is better than the naive averaging grayscale algorithm
# but much slower since it iterates per pixel
# it just picks the brightest component in each pixel
function y = grayscale_max(img)
  for m = 1:rows(img)
    for n = 1:columns(img)
      y(m,n) = max([img(m,n,1) img(m,n,2) img(m,n,3)]);
    end
  end
end