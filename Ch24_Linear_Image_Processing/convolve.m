# handles arbitrary sized img
# but only works for 3x3 filter kernel
function result = convolve(img,kernel)
  x = expand(img);
  kernel = flipud(fliplr(kernel));  # have to rotate 180 or the result is inverted
  result = zeros(rows(x), columns(x));
  for xrow = 1:rows(x)-2         # -2 offsets to account for positioning the kernel
    for xcol = 1:columns(x)-2    # at the top left pixel of the expanded image matrix
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
      result(xrow+1, xcol+1) = v;
    end
  end
  result = reduce(result, img);
end



