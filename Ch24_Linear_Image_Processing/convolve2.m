# INPUT SIDE algorithm!
# same as convolve() but with kernel loop
# only handles 3x3 kernels
function result = convolve2(img,kernel)
  x = expand(img);
  kernel = flipud(fliplr(kernel));  # have to rotate 180 or the result is inverted
  result = zeros(rows(x), columns(x));
  for xrow = 1:rows(x)-2         # -2 offsets to account for positioning the kernel
    for xcol = 1:columns(x)-2    # at the top left pixel of the expanded image matrix
      v = 0;
      for krow = 1:rows(kernel)
        for kcol = 1:columns(kernel)
          v = v + x(xrow+krow-1, xcol+kcol-1) * kernel(krow,kcol);
        end
      end
      # now set the weighted sum under the center pixel of the filter kernel
      result(xrow+1, xcol+1) = v;
    end
  end
  result = reduce(result, img);
end