# algo as implemented in equation 7-3
function y = backward_difference(x)
  y(1) = 0;
  for n = 2:length(x)
    y(n) = x(n) - x(n-1);
  end
endfunction

# alternate algo from https://calculus.subwiki.org/wiki/Discrete_derivative
function y = forward_difference(x)
  for n = 1:length(x)
    if (n == length(x))
      y(n) = 0;
    else
      y(n) = x(n+1) - x(n);
    endif
  end
endfunction


s = linspace(0, 2*pi, 20);
x = sin(s);

y = backward_difference(x);
stem(y)

z = forward_difference(x);
stem(z)


# recreate figure 7-3
a = zeros(1,10);
b = linspace(0,0.4,10);
c = linspace(0.4,1,8);
d = ones(1,12);
e = linspace(1,-0.8,10);
f = [-.7 -.58 -.47 -.37 -.28 -.2 -.13 -.07 -.06 -.05];
g = [-.04 -.03 -.02 -.01 0 0 0 0 0 0];

x = cat(2,a,b,c,d,e,f,g);

y = backward_difference(x);
stem(y)

z = backward_difference(x);
stem(z)