function y = edgify(img, f)
  y = img;
  for i = 1:3
    y(:,:,i) = convolve(img(:,:,i),f);
  end
end