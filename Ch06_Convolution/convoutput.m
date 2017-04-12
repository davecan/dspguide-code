# This doesn't quite work right... off by one somehow...

function result = convoutput(x, h)
  input_length = length(x);
  impulse_length = length(h);
  output_length = input_length + impulse_length -1;
  y = zeros(1, output_length);    # prefill output as zero-filled vector
  for i = 1:output_length
    for j = 1:impulse_length
      if (i-j > 0 && i-j <= input_length)
        y(i) += h(j) * x(i-j);
      endif
    end
  end
  result = y;
endfunction


x = [1   2   3   0  -1  -2  -3];
h = [1 2];

convinput(x, h)

conv(x,h)   # built in for comparison