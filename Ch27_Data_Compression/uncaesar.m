function y = uncaesar(x,n)
    if nargin < 2; n = 5; end;
    m = 26 - n;
    y = char(mod(double(x) + m - 64, 26) + 64);
end