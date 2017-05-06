% run-length encoding for only zeroes
function out = simple_rle(msg)
    out = [];
    nv = find(msg);
    nvl = length(nv);
    for i = 1:nvl
        out(end+1) = msg(nv(i));
        if (nv(i) >= 1) && (i < nvl) && (abs(nv(i+1) - nv(i)) > 1)
            out(end+1) = 0;
            out(end+1) = nv(i+1) - nv(i) - 1;
        end
    end
end