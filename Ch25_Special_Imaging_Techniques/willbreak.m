function b = willbreak(img, rowind, colind)
% WILLBREAK  determines if a point removal will break a line in the image.
%   IMG = a logical b/w image.
%   ROWIND = row index of the pixel to check.
%   COLIND = col index of the pixel to check.

    % strategy is to treat the matrix as a linear array
    li = sub2ind(size(img), rowind, colind);  % get linear index of the coordinate pair
    h = size(img, 1);
    b = 0;
    
    % check offsets -- close neighbors to the left and right are H pixels away
    check = [];
    if li - h > 0; check(end+1) = li - h; end;
    if li - 1 > 0; check(end+1) = li - 1; end;
    if li + 1 > 0; check(end+1) = li + 1; end;
    if li + h > 0; check(end+1) = li + h; end;
    
    v = img(check)         % get all values from img at indices from check
    b = sum(v == 0) > 1;    % true if at least two of the checked index values in img are 0, false otherwise
end