% example from the book
msg = [17 8 54 0 0 0 97 5 16 0 45 23 0 0 0 0 0 3 67 0 0 8];
cmp = rle(msg)

% good compression
msg = [11 0 22 0 0 33 0 0 0 44 0 0 0 0 55 0 0 0 0 0 66 0 0 0 0 0 0 77 0 0 0 0 0 0 0 88 0 0 0 0 0 0 0 0 99 0 0 0 0 0 0 0 0 0 111 0 0 0 0 0 0 0 0 0 0 122];
cmp = rle(msg)

% custom values
msg0 = [1 0 2 0 0 3 0 0 0 4 0 0 0 0 5];
cmp = rle(msg0,0)

msg8 = [1 8 2 8 8 3 8 8 8 4 8 8 8 8 5];
cmp = rle(msg8,8)

% roundtrip tests
cmp0 = rle(msg0);
rld0 = rledecode(cmp0);
unique(msg0 == rld0)

cmp8 = rle(msg8,8);
rld8 = rledecode(cmp8,8);
unique(msg8 == rld8)