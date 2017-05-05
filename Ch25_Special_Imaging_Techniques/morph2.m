function result = morph2(img, name)
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
                result(li) = max(v);    % checks all linear index positions marked in the kernel as found in F
            case 'dilate'
                result(li) = min(v);
        end 
    end
        
    %v = reshape(v,[3 3]);
    %v = rot90(v);
    
end