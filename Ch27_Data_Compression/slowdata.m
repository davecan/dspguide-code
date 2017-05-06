function y = slowdata(n)
    y = [1];
    for i = 2:n
        r = randi(10);
        if r <= 8
            y(end+1) = y(i-1);
        % can rise/fall by 10%
        elseif r <= 9
            y(end+1) = y(i-1) + y(i-1) * 0.1;
        else
            y(end+1) = y(i-1) - y(i-1) * 0.1;
        end
    end
end