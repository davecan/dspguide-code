function out = rle(msg, val)
% RLE   Implements run-length encoding as described in the book.
%   MSG = the message to encode.
%   VAL = the integer value to compress. Default = 0.

    if nargin < 2
        val = 0;
    end
    out = [];
    nv = find(msg ~= val);   % nv contains all index positions having values != val
    nvl = length(nv);
    for i = 1:nvl
        out(end+1) = msg(nv(i));
        if (nv(i) >= 1) && (i < nvl) && (abs(nv(i+1) - nv(i)) > 1)
            out(end+1) = val;
            out(end+1) = nv(i+1) - nv(i) - 1;
        end
    end
end