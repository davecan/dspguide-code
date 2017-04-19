function [rex, imx] = fft(rex, imx)
  n = length(rex);
  nm1 = n-1;
  nd2 = n/2;
  m = int16(log2(n)/log2(2));
  j = nd2;
  
  rex = fft_decompose(rex);
  imx = fft_decompose(imx);
    
  # construct signal by walking backward up the tree, 
  # calculating the butterfly for each value in each level.
  
  # outer loop is for each level of the tree
  for l = 1:m
    le = int16(2**l);
    le2 = le/2;
    ur = 1;
    ui = 0;
    sr = cos(pi/le2);  # real part sinusoid
    si = -sin(pi/le2); # complex part sinusoid
    
    # for each node in this level of the tree
    for j = 1:le2
      # calculate the butterfly for this node
      for i = j:le:n
        if i <= length(rex) - le2
          ip = i + le2;
        else
          ip = i;
        end
        
        #[i le2 ip]
        
        tr = rex(ip) * ur - imx(ip) * ui;
        ti = rex(ip) * ui + imx(ip) * ur;
        rex(ip) = rex(i) - tr;
        imx(ip) = imx(i) - ti;
        rex(i) = rex(i) + tr;
        imx(i) = imx(i) + ti;
      end
      tr = ur;
      ur = tr * sr - ui * si;
      ui = tr * si + ui * sr;
    end
  end
end