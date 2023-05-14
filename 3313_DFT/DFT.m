%clear; close all; clc
clearvars

tone = inputdlg("Enter the DTMF tone's directory");
[x, fs] = audioread(tone{1});
hold on;
plot(x)
x = [x' zeros(1,5000)];

N = length(x);

for k = 0:N-1
    X(k+1) = 0;
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1)*exp(-2*pi*1i*n*k/N);
    end
end

X = X(1:N/2+1);
PSD = (1/(fs*N))*abs(X).^2;
PSD(2:end-1) = 2*PSD(2:end-1);
f = 0:fs/N:fs/2;

[~, I1] = max(PSD);
max1 = f(I1);

if (max1 > 1000)
    [~, I2] = max(PSD(1:I1-(round(length(PSD)*.01))));
    max2 = f(I2);
else
    [~, I2] = max(PSD(I1+(round(length(PSD)*.01)):end));
    max2 = f(I2+I1+(round(length(PSD)*.01)));
    [max1, max2] = deal(max2, max1);
end

% plot(f, pow2db(PSD), "magenta")
% grid("on")
% title("Power Density of " + tone{1} + " using the DFT")
% xlabel("Frequency (Hz)")
% ylabel("Power/Frequency (dB/Hz)")

if (max1 > 1209-10 && max1 < 1209+10)
    if (max2 > 697-10 && max2 < 697+10)
        msgbox("Tone 1 pressed");
    elseif (max2 > 770-10 && max2 < 770+10)
        msgbox("Tone 4 pressed");
    elseif (max2 > 852-10 && max2 < 852+10)
        msgbox("Tone 7 pressed");
    elseif (max2 > 941-10 && max2 < 941+10)
        msgbox("Tone * pressed");
    else
        msgbox("Tone does not exist", '', "error");
    end
elseif (max1 > 1336-10 && max1 < 1336+10)
    if (max2 > 697-10 && max2 < 697+10)
        msgbox("Tone 2 pressed");
    elseif (max2 > 770-10 && max2 < 770+10)
        msgbox("Tone 5 pressed");
    elseif (max2 > 852-10 && max2 < 852+10)
        msgbox("Tone 8 pressed");
    elseif (max2 > 941-10 && max2 < 941+10)
        msgbox("Tone 0 pressed");
        elsee
        msgbox("Tone does not exist", '', "error");
    end
elseif (max1 > 1477-10 && max1 < 1477+10)
    if (max2 > 697-10 && max2 < 697+10)
        msgbox("Tone 3 pressed");
    elseif (max2 > 770-10 && max2 < 770+10)
        msgbox("Tone 6 pressed");
    elseif (max2 > 852-10 && max2 < 852+10)
        msgbox("Tone 9 pressed");
    elseif (max2 > 941-10 && max2 < 941+10)
        msgbox("Tone # pressed");
    else
        msgbox("Tone does not exist", '', "error");
    end
elseif (max1 > 1633-10 && max1 < 1633+10)
    if (max2 > 697-10 && max2 < 697+10)
        msgbox("Tone A pressed");
    elseif (max2 > 770-10 && max2 < 770+10)
        msgbox("Tone B pressed");
    elseif (max2 > 852-10 && max2 < 852+10)
        msgbox("Tone C pressed");
    elseif (max2 > 941-10 && max2 < 941+10)
        msgbox("Tone D pressed");
    else
        msgbox("Tone does not exist", '', "error");
    end
else
    msgbox("Tone does not exist", '', "error");
end