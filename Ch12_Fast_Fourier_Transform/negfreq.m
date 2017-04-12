function [ReX, ImX] = negfreq(ReX, ImX, N)
  M = int16((N/2)) + 1
  for k = M:N
    k
    ReX(k) = ReX(N-k+1);
    ImX(k) = -ImX(N-k+1);
  end
end