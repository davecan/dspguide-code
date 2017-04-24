function y = grayscale(img)
  # supposedly averagin the channels is the grayscale algorithm?
  # but it produces muddy dark images....
  #y = uint8( (img(:,:,1) + img(:,:,2) + img(:,:,3)) / 3 );
  
  # this is much better
  # just picks the brightest component
  for m = 1:rows(img)
    for n = 1:columns(img)
      y(m,n) = max([img(m,n,1) img(m,n,2) img(m,n,3)]);
    end
  end
end