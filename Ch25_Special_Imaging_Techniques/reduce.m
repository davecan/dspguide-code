function y = reduce(big, small)
% REDUCE  Extracts matrix of same size as SMALL from the center of BIG.
%         This is the opposite operation of EXPAND.
%   BIG = The larger matrix. Contains SMALL. Must have odd number of rows & cols.
%   SMALL = The smaller matrix. Must have odd number of rows & cols.

  % finds center point of big
  % then builds back to start/end row/col numbers
  % and then extracts the slice from those points.
  % bcr -> big center row, scc -> small center column, etc.
  [rows_big, cols_big] = size(big);
  [rows_small, cols_small] = size(small);
  bcr = ceil(rows_big/2);
  bcc = ceil(cols_big/2);
  scr = ceil(rows_small/2);
  scc = ceil(cols_small/2);
  start_row = bcr - (scr - 1);          % subtracts distance to start row of small
  end_row = bcr + (rows_small - scr);   % adds distance to end row of small
  start_col = bcc - (scc - 1);        
  end_col = bcc + (cols_small - scc);
  y = big(start_row:end_row, start_col:end_col);
end