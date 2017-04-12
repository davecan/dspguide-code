#
# Octave implementation of Fourier series of square wave.
# 

function result = fsquare(t, x)
  F = 3/2;
  for n = 1:2:x
    F = F + ( 6 / (n * pi) ) * sin(n * t);
  endfor
  result = F;
endfunction

# to run:
# > t = linspace(0, 4*pi);
# > F = fsquare(t, x);    where x is desired number of expansions
# > plot(F)
#
# ex:  F = fsquare(t, 2000);  expands series to n=2000