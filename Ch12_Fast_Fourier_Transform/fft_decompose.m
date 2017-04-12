# implements decomposition shown in figure 12-2
# given:      S = 0:15;
# returns:    [0    8    4   12    2   10    6   14    1    9    5   13    3   11    7   15]
function y = fft_decompose(S)
  y1 = [];
  y2 = [];
  for k = 1:length(S)
    if mod(k,2) == 0
      y2(end + 1) = S(k);
    else
      y1(end + 1) = S(k);
    end
  end
  if length(y1) > 1
    y1 = fft_decompose(y1);
    y2 = fft_decompose(y2);
  end
  y = [y1 y2];
end