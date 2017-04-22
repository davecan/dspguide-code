function [rex, imx] = fourier(img)
  n = columns(img);
  m = rows(img);
  rex = zeros(m,n);
  imx = zeros(m,n);
  for i = 1:rows(img)
    F = fft(img(i,1:columns(img)));
    rex(i,:) = real(F);
    imx(i,:) = complex(F);
  end
  for i = 1:columns(img)
    v = rex(1:rows(rex),i) + imx(1:rows(imx),i);
    F = fft(v);
    rex(:,i) = real(F);
    imx(:,i) = complex(F);
  end
end


img = imread('wall2.jpg');
imshow(img);
[rex,imx] = fourier(img);
