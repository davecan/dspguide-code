a = [1 2 3; 4 5 6; 7 8 9];

f = [0 0 0; 0 1 0; 0 0 0];  # identity
convolve(a,f)
convolve2(a,f)

f = ones(3);  # smoothing
convolve(a,f)
convolve2(a,f)

f = [-1 -1 -1; -1 3 -1; -1 -1 -1];  # high-pass filter / "edge detection"
convolve(a,f)
convolve2(a,f)

a = [1 2 3 4 5 6 7; 2 3 4 5 6 7 8; 3 4 5 6 7 8 9; 4 5 6 7 8 9 0; 7 6 5 4 3 2 1; 8 7 6 5 4 3 2; 9 8 7 6 5 4 3; 0 9 8 7 6 5 4];
f = [0 1 0; 0 2 0; 0 1 0];
convolve(a,f)
convolve2(a,f)
