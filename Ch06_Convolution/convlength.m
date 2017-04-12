# Octave
# Quick check of convolution operation lengths

x = [1 2 3 4 5];
impulse = [1];
conv(x, impulse)

impulse = [1 0];
conv(x, impulse)

impulse = [0 1];
conv(x, impulse)

impulse = [0 0 1 0 0];
conv(x, impulse)

length(conv(x,impulse)) == length(x) + length(impulse) - 1
# ans=1