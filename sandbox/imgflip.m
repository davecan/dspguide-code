a = imread('child.png');

function b = imgflip(a)
  b = [];
  for i = 1:rows(a)
    for j = 1:columns(a)
      b(j,i,:) = a(i,j,:);
    end
  end
end
