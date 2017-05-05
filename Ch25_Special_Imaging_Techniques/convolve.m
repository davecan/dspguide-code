function result = convolve(img, kernel)
    [h w] = size(img);
    [kh kw] = size(kernel);
    nel = numel(img);  % total number elements in the matrix -- equals h * w
    result = ones(h, w) * -1;
    
    kl = reshape(kernel,1,[]);  % linearize the kernel
    
    for li = 1:nel
        img_check = [];     % contains positions of the pixels in the img to include in the calculations
        kern_vals = [];    % contains the values from the kernel
        
        % find image pixels affected by checking linear offsets
        % top row
        if li - h - 1 > 0;    img_check(end+1) = li - h - 1; end;
        if li - 1 > 0;        img_check(end+1) = li - 1;     end;
        if li + h - 1 <= nel; img_check(end+1) = li + h - 1; end;
        % middle row
        if li - h > 0;        img_check(end+1) = li - h;     end;
        img_check(end+1) = li;
        if li + h <= nel;     img_check(end+1) = li + h;     end;
        % bottom row
        if li - h + 1 > 0;    img_check(end+1) = li - h + 1; end;
        if li + 1 <= nel;     img_check(end+1) = li + 1;     end;
        if li + h + 1 <= nel; img_check(end+1) = li + h + 1; end;
        
        % find kernel pixels affected by checking linear offsets
        % top row
        if any(img_check == li - h - 1)
            kern_vals(end+1) = kl(1);          % top left always linearized to 1
        end;
        if any(img_check == li - 1)
            kern_vals(end+1) = kl(kh+1);       % top center == top left pos shifted 1 column
        end
        if any(img_check == li + h - 1)
            kern_vals(end+1) = kl(kh*2+1);     % top right == top left pos shifted 2 columns
        end
        % middle row
        if any(img_check == li - h)             
            kern_vals(end+1) = kl(2);          % mid left always linearized to 2
        end
        kern_vals(end+1) = kl(5);              % center pixel is always used
        if any(img_check == li + h)
            kern_vals(end+1) = kl(kh*2+2);     % mid right == mid left shifted 2 cols
        end
        % bottom row
        if any(img_check == li - h + 1)
            kern_vals(end+1) = kl(3);          % bottom left always linearized to 3
        end
        if any(img_check == li + 1)
            kern_vals(end+1) = kl(kh*2);       % bottom center == 2 * kernel height linearly
        end
        if any(img_check == li + h + 1)
            kern_vals(end+1) = kl(end);        % bottom right always end of kernel
        end
        
        img_vals = uint8(img(img_check));
        kern_vals = uint8(kern_vals);
        
        result(li) = sum(img_vals.*kern_vals);  % weighted sum of elements
    end
    result = uint8(result);
end