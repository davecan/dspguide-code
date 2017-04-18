pkg load image;

a = imread('bad.jpg');

b = a*12;  # ultra brighten
b = imsmooth(b);
imshow(b);