# rotates colors
function a = rotate_colors(a)
  for i = 1:rows(a)
    for j = 1:columns(a)
      x = a(i,j,1);
      a(i,j,1) = a(i,j,2);
      a(i,j,2) = a(i,j,3);
      a(i,j,3) = x;
    end
  end
end  