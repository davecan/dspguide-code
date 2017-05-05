function img_delta(img1, img2, thresh, minblocksize)
    sz1 = size(size(img1));
    sz2 = size(size(img2));
    if ~isequal(sz1,sz2)
       error('images must be the same size'); 
    end
    
    if sz1(2) > 2
        img1 = rgb2gray(img1);
    end
    if sz2(2) > 2
        img2 = rgb2gray(img2);
    end

    % build the template to look for the differences
    D = img1 - img2;  % get difference for templating
    Dbw = D > thresh;  % threshold at graylevel = thresh
    Dbw = bwareaopen(Dbw, minblocksize);   % remove all regions smaller than minblocksize
    
    % dilate objects in the template for easier identification
    se1 = strel('square',3);  % establish morphological structuring element
    Dbw = imdilate(Dbw,se1);  % dilate using the structuring element
    
    % identify the individual objects
    [L,N] = bwlabel(Dbw);  % label the connected components in the matrix
    s = regionprops(L,'all');
    C = [s.Centroid];
    
    img_delta_show('img1', img1, N, C);
    img_delta_show('img2', img2, N, C);
end

function y = img_delta_show(name, img, numdiffs, centroid)
    figure('Name', name, 'NumberTitle', 'off');
    imshow(img);
    for i = 1:numdiffs
        h=rectangle('Position',[centroid(2*i-1)-15 centroid(2*i)-15  30 30],'Curvature',[1 1],'LineWidth',2);
        set(h,'EdgeColor',[1 1 0]);
    end
end