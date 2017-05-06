function msg = rledecode(cmp, val)
% RLEDECODE Implements a run-length decoding algorithm.
%   CMP = the RLE-compressed message to decode.
%   VAL = the integer value to expand. Default = 0.

    if nargin < 2
        val = 0;
    end
    msg = [];
    len = length(cmp);
    i = 1;
    while i <= len
        if cmp(i) == val
            n = cmp(i+1);  % next array slot contains number of repeats
            for k = 1:n
                msg(end+1) = val;
            end
            i = i + 2;
        else
            msg(end+1) = cmp(i);
            i = i + 1;
        end
    end
end