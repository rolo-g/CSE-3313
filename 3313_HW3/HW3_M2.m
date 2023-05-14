%{
Rolando Rosales - 1001850424
CSE 3313 - Homework 3 - Problem M2
%}

SeqSize = 101;
pidiv = pi*2/(SeqSize-1);

w = zeros(1, SeqSize);
w(1) = -pi;

for i = 2:SeqSize
		w(i) = w(i-1) + pidiv;
end

H = (0:SeqSize-1);
H = (1-.5*exp(-2*j*w)).^-1;

H2 = abs(H).^2;

stem(w, H2);
title('H_m[w] Plot');
xlabel('w');
ylabel('H_m');
ylim([0 4]);
xlim([-pi pi]);