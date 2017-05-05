function y = expand(x, val, passes)
% EXPAND  Surrounds the matrix by VAL rows and columns PASSES number of times.
%   X = The matrix to expand. 
%   VAL = The value to surround X with. Default is 0.
%   PASSES = The number of times to surround X with VAL.
% given:
%   1 2 3
%   4 5 6
% returns:
%   0 0 0 0 0
%   0 1 2 3 0
%   0 4 5 6 0
%   0 0 0 0 0

    if nargin < 2
        val = 0;
    end
    if nargin < 3
        passes = 1;
    end
    [rows,cols] = size(x);
    y = zeros(rows+2*passes,cols+2*passes);
    y(:) = val;
    start_pos = passes+1;
    y(start_pos:end-passes,start_pos:end-passes) = x;
end