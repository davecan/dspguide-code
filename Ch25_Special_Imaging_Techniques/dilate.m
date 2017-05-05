function result = dilate(img, steps)
% DILATE  gets the min value of a moving 3x3 mask centered on each pixel in img.
%   IMG = the image to dilate.
%   STEPS = the number of times to dilate.

    if nargin == 1
        steps = 1;
    end
    for i = 1:steps
        img = morph(img, 'dilate');
    end
    result = img;
end