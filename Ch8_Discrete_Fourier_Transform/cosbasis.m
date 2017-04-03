# n is the sample length
# w is the number of full cycles in that length
function y = cosbasis(w, n)
  c = [];
  for i = 1:n
    c(i) = cos( (2 * pi * w * i / n) );
  endfor
  y = c;
endfunction