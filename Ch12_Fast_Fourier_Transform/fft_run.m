n = 16;
s1 = sin(1:n);
s2 = 2*sin(1:n);
rex = s1 + s2;
imx = zeros(1,n);

[rex2, imx2] = fft(rex,imx);
[rex3, imx3] = inverse_fft(rex2, imx2);