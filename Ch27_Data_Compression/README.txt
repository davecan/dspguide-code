The text discusses using delta encoding on slowly varying data to reduce the amplitude of the signal, then applying run-length encoding to compress it.

Demo:

    data = slowdata(512);
    plot(data)
  
![slowdata.png](./slowdata.png?raw=true "slowdata.png")  
    
    delta_data = delta_decode(data);
    plot(delta_data)

![slowdata_delta.png](dspguide-code/Ch27_Data_Compression/slowdata_delta.png?raw=true "slowdata_delta.png")
    
    rle_data = rle(delta_data);
    plot(rle_data)
    
![slowdata_rle.png](./slowdata_rle.png?raw=true "slowdata_rle.png")
    
    >>> whos('data')
      Name      Size             Bytes  Class     Attributes

      data      1x512             4096  double              

    >>> whos('delta_data')
      Name            Size             Bytes  Class     Attributes

      delta_data      1x512             4096  double              

    >>> whos('rle_data')
      Name          Size             Bytes  Class     Attributes

      rle_data      1x238             1904  double              

    >>> 1904/4096

    ans =

        0.4648
        
