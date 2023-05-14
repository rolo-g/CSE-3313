%{
Rolando Rosales - 1001850424
CSE 3313 - Homework 3 - Problem M1
%}

SeqSize = 10;
n = (-SeqSize:SeqSize)
len = length(n)
y = zeros(1, len);
h = zeros(1, len);

y(11) = 1;

for i = 2:SeqSize*2
    y(i) = y(i) + .5*y(i - 1);
end

stem(n, y);
title('h[n] Plot');
xlabel('n');
ylabel('h');
ylim([0 2]);
xlim([-10 10]);