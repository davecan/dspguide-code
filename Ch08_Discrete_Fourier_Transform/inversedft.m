function y = inversedft(ReX, ImX, N)
  M = int16(N/2) + 1;
  
  # find cosine and sine amplitudes
  for k = 1:M
    ReX(k) = ReX(k) / (N/2);
    ImX(k) = -ImX(k) / (N/2);
  endfor
  
  ReX(1) = ReX(1) / 2;
  ReX(M) = ReX(M) / 2;
  
  # initialize time domain accumulator
  XX = zeros(1,N);
  
  # calculates IDFT
  for k = 1:M
    for i = 1:N
      XX(i) = XX(i) + ReX(k) * cos(2 * pi * k * i / N);
      XX(i) = XX(i) + ImX(k) * sin(2 * pi * k * i / N);
    endfor
  endfor
  
  y = XX;
endfunction


