function [rex, imx] = inverse_fft(rex, imx)
  n = length(rex);
  for k = 1:n
    imx(k) = -imx(k);
  end
  
  [rex, imx] = fft(rex, imx);
  
  for i = 1:n
    rex(i) = rex(i)/n;
    imx(i) = -imx(i)/n;
  end
end