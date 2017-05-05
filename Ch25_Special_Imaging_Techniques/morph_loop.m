function result = morph_loop(img, name, kernel)
% MORPH_MANUAL  Applies a morphological operation to an image using nested loops.
%   RESULT = MORPH(IMG, NAME) Applies the specified operation using the default masking kernel.
%   RESULT = MORPH(IMG, NAME, KERNEL) Applies the specified operation using the specified masking kernel.
%   NAME can be either 'erode' or 'dilate'.
%   KERNEL is a 3x3 matrix. All nonzero values mark pixels that are tested for the center pixel.
%          The kernel is swept across the img as in convolution.
%   DEFAULT KERNEL = [1 1 1; 1 1 1; 1 1 1].

    default_kernel = [1 1 1; 1 1 1; 1 1 1];
    if nargin < 3
        kernel = default_kernel;  % pattern to check for morph operation
    end
    if nargin < 4
        if ischar(kernel) && kernel == 'default'
            kernel = default_kernel;
        end
    end
    [r,c] = size(img);
    if strcmp(name, 'erode')
        wrapval = -1;
    else
        wrapval = 999;
    end
    result = ones(r, c) * -1;
    x = expand(img, wrapval);
    [r,c] = size(x);
    
    F = find(kernel);       % Gets the linearized positions of all nonzero values in the kernel.
                            % These mark where the morph should check for differences in value.

    kern_row_offset = 2;
    kern_col_offset = 2;
                            
    for m = 1:r-2                   % The -2 offset accounts for positioning the kernel
        for n = 1:c-2               % at the top left pixel of the expanded image matrix.
            % Extract region of interest centered on current pixel of source img.
            s = x(m:m+kern_row_offset,n:n+kern_col_offset);     
            switch name
                case 'erode'
                    result(m,n) = max(s(F));    % checks all linear index positions marked in the kernel as found in F
                case 'dilate'
                    result(m,n) = min(s(F));
            end
        end
    end
end
