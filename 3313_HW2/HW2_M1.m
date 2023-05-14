%{
Rolando Rosales - 1001850424
CSE 3313 - Homework 2 - Problem M1
%}

SeqSize = 20;
x = (-SeqSize:SeqSize);
len = length(x);

StepFunc = zeros(1,len);
for i = len-20:len
    StepFunc(i) = 1;
end

xn = zeros(1,len);
for n = 1:len
    xn(n) = (1/2)^(n-SeqSize-1)*cos((2*pi*(n-SeqSize-1))/(13))*StepFunc(n);
end

hn = zeros(1,len);
for n = 4:len
    hn(n) = StepFunc(n) - StepFunc(n - 3);
end

yn = conv(xn,hn,'same');

subplot(4,1,1);
stem(x,StepFunc);
title('Step Function');
xlabel('n');
ylabel('u[n]');
ylim([-2 2]);

subplot(4,1,2);
stem(x,xn);
title('x[n] Plot');
xlabel('n');
ylabel('x[n]');
ylim([-2 2]);

subplot(4,1,3);
stem(x,hn);
title('h[n] Plot');
xlabel('n');
ylabel('h[n]');
ylim([-2 2]);

subplot(4,1,4);
stem(x,yn);
title('y[n] Plot');
xlabel('n');
ylabel('y[n]');
ylim([-2 2]);
