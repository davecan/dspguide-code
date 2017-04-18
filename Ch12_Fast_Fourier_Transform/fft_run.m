n = 2*pi;
s1 = sin(0:.1:n);
s2 = 2*sin(0:.1:n);
rex = s1 + s2;
imx = zeros(1,length(rex));

[rex2, imx2] = fft(rex,imx);
[rex3, imx3] = inverse_fft(rex2, imx2);
y = rex3 + imx3;