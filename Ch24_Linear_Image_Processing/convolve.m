function x = convolve(x,kernel)
  *** Should call expand() here instead of requiring the caller to prep the matrix first
  original = x;
  for xrow = 1:rows(x)-2         # -2 offset to account for positioning 
    for xcol = 1:columns(x)-2    # the top left pixel of the 3x3 kernel
      # kernel row 1
      v = x(xrow,xcol) * kernel(1,1);   #****  CONVERT THIS TO AN INNER LOOP!!
      v = v + x(xrow, xcol+1) * kernel(1,2);
      v = v + x(xrow, xcol+2) * kernel(1,3);
      # kernel row 2
      v = v + x(xrow+1, xcol) * kernel(2,1);
      v = v + x(xrow+1, xcol+1) * kernel(2,2);
      v = v + x(xrow+1, xcol+2) * kernel(2,3);
      # kernel row 3
      v = v + x(xrow+2, xcol) * kernel(3,1);
      v = v + x(xrow+2, xcol+1) * kernel(3,2);
      v = v + x(xrow+2, xcol+2) * kernel(3,3);
      # now set the weighted sum under the center pixel of the filter kernel
      x(xrow+1, xcol+1) = v;
    end
  end
  x = reduce(x, original);
end