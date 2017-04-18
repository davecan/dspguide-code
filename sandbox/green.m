a = imread('green.jpg');

# nonlinear contrast boost
function a = nonlincontrast(a)
  for i = 1:rows(a)
    for j = 1:columns(a)
      a(i,j,1) = (a(i,j,1)/255.0) ** 2 * 255.0;
      #a(i,j,2) = (a(i,j,2)/255.0) ** 2 * 255.0;
      a(i,j,3) = (a(i,j,3)/255.0) ** 2 * 255.0;
    end
  end  
end