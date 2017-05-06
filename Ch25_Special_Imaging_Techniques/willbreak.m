function b = willbreak(img, rowind, colind, neighborhood)
% WILLBREAK  determines if a point removal will break a line in the image.
%   IMG = a logical b/w image.
%   ROWIND = row index of the pixel to check.
%   COLIND = col index of the pixel to check.
%   NEIGHBORHOOD = neighborhood of points to check:  'close' or 'distant' or 'all'.  Default is 'close' only.

% TODO this doesn't handle corner cases in distant mode -- linearizing causes checks to wrap too far

    if nargin < 4
        neighborhood = 'close';
    end

    % strategy is to treat the matrix as a linear array
    li = sub2ind(size(img), rowind, colind);  % get linear index of the coordinate pair
    [h w] = size(img);
    els = length(img);
    b = 0;
    
    if img(rowind,colind) ~= 0
        return;
    end
    
    % check offsets -- close neighbors to the left and right are H pixels away
    check = [];
    
    if strcmp(neighborhood,'close') || strcmp(neighborhood,'all')
        if li - h > 0; check(end+1) = li - h; end;
        if li - 1 > 0; check(end+1) = li - 1; end;
        if li + 1 <= els; check(end+1) = li + 1; end;
        if li + h <= els; check(end+1) = li + h; end;
    end
    if strcmp(neighborhood,'distant') || strcmp(neighborhood,'all')    % distants are H +/- 1 linear pixels away
        if li - h - 1 > 0; check(end+1) = li - h - 1; end;
        if li - h + 1 > 0; check(end+1) = li - h + 1; end;
        if li + h - 1 <= els; check(end+1) = li + h - 1; end;
        if li + h + 1 <= els; check(end+1) = li + h + 1; end;
    end
    
    v = img(check);         % get all values from img at indices from check
    b = sum(v == 0) > 1;    % true if at least two of the checked index values in img are 0, false otherwise
end