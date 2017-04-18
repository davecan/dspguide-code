img = imread('zd30.jpg');

a = img;
b = img;

figure('Position', [100,100,1536,802]);
imshow(a);

# normalizes all channels to the green channel -- grayscale-ish?
function a = greenscale(a)
  for i = 1:rows(a)
    for j = 1:columns(a)
      if a(i,j,1) < a(i,j,2)
        a(i,j,1) = a(i,j,2);
      end
      if a(i,j,3) < a(i,j,2)
        a(i,j,3) = a(i,j,2);
      end
    end
  end  
end

# bring excessively bright or dark greens closer to other two channels
# makes the NVD1 image less glaring, but makes the ZD30 image muddy
function a = normalize(a)
  for i = 1:rows(a)
    for j = 1:columns(a)
      dist = abs(a(i,j,1) - a(i,j,3));
      if a(i,j,2) > a(i,j,1) && a(i,j,2) > a(i,j,3)
        a(i,j,2) = a(i,j,2) - dist;
      elseif a(i,j,2) < a(i,j,1) && a(i,j,2) < a(i,j,3)
        a(i,j,2) = a(i,j,2) + dist;
      end
    end
  end
end

# brightens green channel
function a = brightgreen(a)
  for i = 1:rows(a)
    for j = 1:columns(a)
      dist = abs(a(i,j,1) - a(i,j,3));
      if a(i,j,2) > a(i,j,1) && a(i,j,2) > a(i,j,3)
        a(i,j,2) = a(i,j,2) + dist;
      elseif a(i,j,2) < a(i,j,1) && a(i,j,2) < a(i,j,3)
        a(i,j,2) = a(i,j,2) - dist;
      end
    end
  end  
end

