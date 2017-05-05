function result = openit(img)
% OPENIT  erodes the image, then dilates it
    result = dilate(erode(img));
end