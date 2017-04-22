# extract the actual data after convolution -- removes surrounding rows/cols
# extracts matrix of same size as <small from center of <big>
# big and small must have odd number of rows and columns
function y = reduce(big, small)
  # finds center point of big
  # then builds back to start/end row/col numbers
  # and then extracts the slice from those points.
  # bcr -> big center row, scc -> small center column, etc.
  bcr = ceil(rows(big)/2);
  bcc = ceil(columns(big)/2);
  scr = ceil(rows(small)/2);
  scc = ceil(columns(small)/2);
  start_row = bcr - (scr - 1);          # subtracts distance to start row of small
  end_row = bcr + (rows(small) - scr);  # adds distance to end row of small
  start_col = bcc - (scc - 1);        
  end_col = bcc + (columns(small) - scc);
  y = big(start_row:end_row, start_col:end_col);
end