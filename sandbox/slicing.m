a = imread('smbw.png');

# a contains 3 matrices, one for each channel: red, green, blue.
# to select a specific channel N in a slice:
#   a(:,:,N)  --  all rows, all cols, channel N only
# to select all channels in a slice:
#   a(:,:,:) 

# every other column turns black
for i = 1:columns(a)
  if mod(i, 2) == 0
    a(:,i,:) = 0;
  end
end

imshow(a);

# every other row turns red
for i = 1:rows(a)
  if mod(i, 2) == 0
    a(i,:,:) = 0;
    a(i,:,1) = 255;
  end
end

imshow(a);

# every grey square turns green
for i = 1:rows(a)
  for j = 1:columns(a)
    if a(i,j,:) == 105
      a(i,j,:) = 0;
      a(i,j,2) = 255;
    end
  end
end


