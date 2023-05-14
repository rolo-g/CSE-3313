% Rolando Rosales 1001850424 - Filter Design Project
% clear; close all; clc; clear sound;
clearvars

[x, fs] = audioread('noisyconversation.wav');

f = linspace(-fs/2, fs/2, length(x));
figure(1),plot(f,fftshift(abs(fft(x))));
title("noisyconversation.wav FFT");

wp = 3400;
ws = 4100;
Rp = 3;
Rs = 60;

Wp = wp/(fs/2);
Ws = ws/(fs/2);

[N, Wc] = buttord(Wp, Ws, Rp, Rs);
[b, a] = butter(N, Wc, 'low');
lowpassout = filter(b,a,x);

figure(2),plot(f,fftshift(abs(fft(lowpassout))));
title("noisyconversation.wav FFT after Butterworth LPF");

wp = 440;
ws = 320;
Rp = 3;
Rs = 30;

Wp = wp/(fs/2);
Ws = ws/(fs/2);

[N, Wc] = buttord(Wp, Ws, Rp, Rs);
[b, a] = butter(N, Wc, 'high');
highpassout = filter(b,a,lowpassout);

figure(3),plot(f,fftshift(abs(fft(highpassout))));
title("noisyconversation.wav FFT after Butterworth LPF and HPF");

figure(4),freqz(highpassout,128,fs);
title("Frequency response of filteredconversation.wav");

% sound(highpassout,fs);
% audiowrite('filteredconversation.wav', highpassout, fs);