function y = discrete_integral(x)
  y(1) = x(1);
  for n = 2:length(x)
    y(n) = y(n-1) + x(n);
  end
endfunction



s = linspace(0, 2*pi, 20);
x = sin(s);

y = backward_difference(x);
stem(y)

z = discrete_integral(x);
stem(z)