function result = erode(img)
% ERODE  gets the min value of a moving 3x3 mask centered on each pixel in img
    result = morph(img, 'erode');
end