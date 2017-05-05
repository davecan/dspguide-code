# manually builds histogram of values from the matrix/image
function H = gethist(M)
  H._ = 0;  # primes with dummy value so H exists later
  for m = 1:rows(M)
    for n = 1:columns(M)
      v = M(m,n);
      if isfield(H, num2str(v))
        H.(num2str(v)) = H.(num2str(v)) + 1;
      else
        H.(num2str(v)) = 1;
      end
    end
  end
end