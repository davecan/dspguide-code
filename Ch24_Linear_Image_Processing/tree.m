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

#img = a;
#img(:,:,1) = b2;  # embiggen the red channel's edges
#img(:,:,2) = convolve(a(:,:,2),f2);  # convolve green channel
#img(:,:,3) = convolve(a(:,:,3),f2);
#imshow(img)

f3 = 2 * f2;
img = edgify(a, f2);
imshow(img)
