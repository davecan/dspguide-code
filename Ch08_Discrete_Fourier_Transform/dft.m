function [ReX, ImX] = dft(XX, N)
  M = int16(N/2) + 1;
  ReX = zeros(1,M);
  ImX = zeros(1,M);
  for k = 1:M
    for i = 1:N
      ReX(k) += XX(i) * cos(2 * pi * k * i / N);
      ImX(k) -= XX(i) * sin(2 * pi * k * i / N);
    endfor
  endfor
endfunction

