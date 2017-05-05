function result = dilate(img)
% DILATE  gets the min value of a moving 3x3 mask centered on each pixel in img
    result = morph(img, 'dilate');
end