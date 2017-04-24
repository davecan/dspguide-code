  # standard grayscale algorithm
  # produces muddy dark images
function y = grayscale_avg(img)
  y = uint8( (img(:,:,1) + img(:,:,2) + img(:,:,3)) / 3 );
end