a = imread('tree.jpg');
a1 = a(:,:,1);

# edge detection
f1 = [-1 -1 -1; -1 2 -1; -1 -1 -1];
b1 = convolve(a1,f1);
imshow(b1)

# moar edge detection
f2 = [-2 -2 -2; -2 4 -2; -2 -2 -2];
b2 = convolve(a1,f2);
imshow(b2)

f3 = 2 * f2;
img = edgify(a, f2);
imshow(img)

