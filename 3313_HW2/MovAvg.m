function [y] = MovAvg(x,N)
n = length(x);
y = zeros(1, n);
    for i = 1:n
        for j = (n - N + 1):n
            S = S + x(j);
        end
        y(i) = (1/N)*S;
        S = 0;
    end
end
