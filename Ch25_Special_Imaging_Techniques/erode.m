function result = erode(img, steps)
% ERODE  gets the min value of a moving 3x3 mask centered on each pixel in img.
%   IMG = the image to erode.
%   STEPS = the number of times to erode.

    if nargin == 1
        steps = 1;
    end
    for i = 1:steps
        img = morph(img, 'erode');
    end
    result = img;
end