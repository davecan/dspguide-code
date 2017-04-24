# https://www.youtube.com/watch?v=XofmaKJ8RnA

img_pulse = double(imread('pulse.png'));
img_pulse = rgb2gray(img_pulse);
pulse_freq = fft2(img_pulse);
imshow(pulse_freq)
imshow(abs(pulse_freq))
imshow(imadjust(abs(pulse_freq)))
imshow(imadjust(abs(fftshift(pulse2_freq))))


img_pulse2 = double(imread('pulse2.png'));
img_pulse2 = rgb2gray(img_pulse2);
pulse2_freq = fft2(img_pulse2);
imshow(pulse2_freq)
imshow(abs(pulse2_freq))
imshow(imadjust(abs(pulse2_freq)))
imshow(imadjust(abs(fftshift(pulse2_freq))))