# crude attempts at the Sobel edge detection at https://en.wikipedia.org/wiki/Sobel_operator
function y = sobel(img)
  y = img;
  
  sobel_horz = [1 0 -1; 2 0 -2; 1 0 -1];
  sobel_vert = [1 2 1; 0 0 0; -1 -2 -1];
  smooth = 3 * ones(3);

  # process each channel separately
  for i = 1:3
    ch = img(:,:,i);
    # apply the sobel operators
    ch2 = reduce(conv2(ch, sobel_horz), ch);
    ch2 = ch2 + reduce(conv2(ch, sobel_vert), ch);
    ch2 = reduce(conv2(ch2, [0 0 0; 0 2 0; 0 0 0]),ch2);
    y(:,:,i) = ch2;
  end
  y = imsmooth(y);
end