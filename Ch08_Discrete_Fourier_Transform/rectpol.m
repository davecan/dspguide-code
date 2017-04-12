function [MagX, ImX] = rectpol(ReX, ImX)
  M = length(ReX)
  MagX = zeros(1,M)
  PhaseX = zeros(1,M)
  
  for k = 1:M
    MagX(k) = sqrt(ReX(k)^2 + ImX(k)^2)
    if ReX(k) == 0
      ReX(k) = 1E-20
    endif
    PhaseX(k) = atan(ImX(k) / ReX(k))
    if ReX(k) < 0 
      if ImX(k) < 0
        PhaseX(k) -= pi
      else
        PhaseX(k) += pi
      endif
    endif
  endfor
endfunction