# quick configurable sine wave generator
# A = amplitude
# w = frequency
# phi = phase offset
function s = Sine(t,A=1,w=1,phi=0)
  s = A * sin(w*t - phi);
endfunction