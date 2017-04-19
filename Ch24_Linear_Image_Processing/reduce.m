# extract the actual data after convolution -- removes surrounding rows/cols
# extracts matrix of same size as <small from center of <big>
# big and small must have odd number of rows and columns
function y = reduce(big, small)
  # finds center point of big
  # then builds back to start/end row/col numbers
  # and then extracts the slice from those points
  big_center_row = ceil(rows(big)/2);
  big_center_col = ceil(columns(big)/2);
  small_center_row = ceil(rows(small)/2);
  small_center_col = ceil(columns(small)/2);
  start_row = big_center_row - (small_center_row - 1);          # subtracts distance to start row of small
  end_row = big_center_row + (rows(small) - small_center_row);  # adds distance to end row of small
  start_col = big_center_col - (small_center_col - 1);        
  end_col = big_center_col + (columns(small) - small_center_col);
  y = big(start_row:end_row, start_col:end_col);
end