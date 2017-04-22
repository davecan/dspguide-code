# inverts colors pixel by pixel
# inversion is simply the distance from the actual color to 255
function a = invert_colors(a)
  for i = 1:rows(a)
    for j = 1:columns(a)
      for k = 1:3
        a(i,j,k) = 255 - a(i,j,k);
      end
    end
  end
end


a = imread('mario.png');
imshow(a);
b = invert_colors(a);
imshow(b);

a = imread('nvd.jpg');
imshow(a);
b = invert_colors(a);
imshow(b);