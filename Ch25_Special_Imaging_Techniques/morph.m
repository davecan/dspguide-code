function result = morph(img, name)
% MORPH_MANUAL  Applies a morphological operation to an image using nested loops.
%   RESULT = MORPH(IMG, NAME) Applies the specified operation using a 3x3 structuring element / kernel.
%   NAME can be either 'erode' or 'dilate'.

% TODO allow different 3x3 patterns -- can use method of linearized convolve.m in this folder
% TODO allow arbitrary sized structuring elements?

    % Strategy: Treat img as linear array, checking linear offsets from current img pixel based on 
    %           the linear distance of each pixel in the structuring element from its center

    [h w] = size(img);
    nel = numel(img);  % total number elements in the matrix -- equals h * w
    result = ones(h, w) * -1;
    
    for li = 1:nel
        % check linear offsets
        check = [];
        % top row
        if li - h - 1 > 0;    check(end+1) = li - h - 1; end;
        if li - 1 > 0;        check(end+1) = li - 1;     end;
        if li + h - 1 <= nel; check(end+1) = li + h - 1; end;
        % middle row
        if li - h > 0;        check(end+1) = li - h;     end;
        check(end+1) = li;
        if li + h <= nel;     check(end+1) = li + h;     end;
        % bottom row
        if li - h + 1 > 0;    check(end+1) = li - h + 1; end;
        if li + 1 <= nel;     check(end+1) = li + 1;     end;
        if li + h + 1 <= nel; check(end+1) = li + h + 1; end;

        v = img(check);
        
        switch name
            case 'erode'
                result(li) = max(v);
            case 'dilate'
                result(li) = min(v);
        end 
    end
end