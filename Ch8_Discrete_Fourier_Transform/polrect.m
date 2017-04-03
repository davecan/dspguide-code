function [ReX, ImX] = polrect(MagX, PhaseX)
  M = length(ReX)
  ReX = zeros(1,M)
  ImX = zeros(1,M)
  
  for k = 1:M
    ReX(k) = MagX(k) * cos(PhaseX(k))
    ImX(k) = MagX(k) * sin(PhaseX(k))
  endfor
endfunction