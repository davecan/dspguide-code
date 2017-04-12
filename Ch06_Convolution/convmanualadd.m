# Octave
# Simulation of adding the 9 signals from 6-5 and 6-6
# values are rough estimates but the plot gets pretty close to the textbook image

x1 = [0 0 0 0 0 0 0 0 0 0 0 0];
x2 = [0 -1 .5 .3 .2 0 0 0 0 0 0 0];
x3 = [0 0 -1.2 0.8 0.5 0.3 0 0 0 0 0 0];
x4 = [0 0 0 2 -1 -.8 -3 0 0 0 0 0];
x5 = [0 0 0 0 1.3 -.8 -.5 -.3 0 0 0 0];
x6 = [0 0 0 0 0 1.3 -.7 -.5 -.3 0 0 0];
x7 = [0 0 0 0 0 0 .7 -.2 -.1 -.5 0 0];
x8 = [0 0 0 0 0 0 0 0 0 0 0 0];
x9 = [0 0 0 0 0 0 0 0 -.8 .3 .2 .1];

y = x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9;

plot(y, "marker", "*", "markersize", 12, "linestyle", "none")