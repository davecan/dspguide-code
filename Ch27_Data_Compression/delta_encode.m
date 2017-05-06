% implements delta encoding algorithm for slowly varying signals
function y = delta_encode(x)
    y = [x(1) diff(x)];
end

% example
% msg = [17 19 24 24 24 21 15 10 89 95 96 96 96 95 94 94 95 93 90 87 86 86];
% delta_encode(msg)