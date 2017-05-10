function y=caesar(x,n)
    if nargin < 2; n = 5; end;
    x(find(x == ' ')) = [];  % delete spaces
    x = upper(x);
    y = char(mod(double(x) + n - 64, 26) + 64);
end

