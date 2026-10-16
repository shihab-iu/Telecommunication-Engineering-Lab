% LAB1--PCM---------
clc;
clear;
close all;
fm = 5;
fs = 80;
bit=6;
L=2^bit;
t= 0:0.001:1;
n= 0:1/fs:1;

% Sine signal
msg = sin(2*pi*fm*t);

% Sampling
sample = sin(2*pi*fm*n);

% PCM
q = round((sample+1)*(L-1)/2);
pcm = dec2bin(q,bit);

% Demodulation
d = bin2dec(pcm);
d = (2*d)/(L-1) - 1;
demod = interp1(n,d,t,'spline');

% Plot
subplot(4,1,1);
plot(msg);
title('Original Sine Signal');

subplot(4,1,2);
stem(sample);
title('Sampled Signal');

subplot(4,1,3);
stairs(q);
title('Quantization');

subplot(4,1,4);
plot(demod);
title('Reconstructed Signal');

