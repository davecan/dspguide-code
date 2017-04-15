# implements the interlacing algorithm demonstrated in figure 12-4.
# given:  x1 = [1 2 3 4]   x2 = [5 6 7 8]
# returns:  [1 5 2 6 3 7 4 8]
# octave is a pain when dealing with strings....
function y = interlace(x1, x2)
  y = [];
  for k = 1:length(x1)
    y(end + 1) = x1(k);
    y(end + 1) = x2(k);
    k += 1;
  end
end