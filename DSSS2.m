clc;
clear;
close all;
% Data and PN sequence
data = [1 0 1 1 1 0 1 0 0 1 0 1];
pn = [1 0 0 1 1 0 ];

% Convert 0 to -1
d = 2*data-1;
p = 2*pn-1;

% Repeat data and PN for graph
D = repelem(d,length(pn));
P = repmat(p,1,length(data));
DSSS= D.*P;

%BPSK modulation
spread=repelem(DSSS,20);
t = 0:length(spread)-1;
carrier = cos(2*pi*0.03*t);
BPSK = spread.*carrier;

% Plot
subplot(4,1,1);
stairs(D);
title('Original Data');
ylim([-1.5 1.5]);
grid on;

subplot(4,1,2);
stairs(P);
title('PN Sequence');
ylim([-1.5 1.5]);
grid on;

subplot(4,1,3);
stairs(DSSS);
title('DSSS Spread Signal');
ylim([-1.5 1.5]);
grid on;

subplot(4,1,4);
plot(BPSK);
title('DSSS-BPSK Signal');
ylim([-1.5 1.5]);
grid on;