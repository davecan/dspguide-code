pkg load image;

a = imread('child.png');

function a = xedge(a, s=0)
  a = rgb2gray(a);
  for i = 1:rows(a)
    first = a(i,1);
    for j = 1:columns(a)
      if a(i,j) > first+s
        for k = 0:3
          a(i,j+k) = 0;
        end
        break;
      end
    end
  end
end