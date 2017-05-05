function result = closeit(img)
% CLOSEIT  dilates the image, then erodes it
    result = erode(dilate(img));
end