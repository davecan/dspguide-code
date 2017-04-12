function mu = dsp_mean (X)
  N = length(X)
  mu = (1/N) * sum(X)
endfunction

function result = dsp_variance (X)
  N = length(X)
  v = 0
  mu = dsp_mean(X)
  for x = X
    v = v + ((x - mu) ** 2)
  endfor
  result = v / (N-1)
endfunction

function sigma = dsp_stddev (X)
  sigma = sqrt(dsp_variance(X))
endfunction