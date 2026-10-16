%FHSS>>>>>>>>>>>>>>>>>>>>>>>>
clc;
clear;
close all;

data=[1 0 1 1 0 1];
hop=[1 3 6 2 7 4];
F=[5 10 15 20 25 30 35];

N=100;
t= 0 : 1/N : 1-1/N;

d=2*data-1;
D=repelem(d,N);

carrier=repmat(cos(2*pi*5*t),1,length(data));
bpsk=D.*carrier;

hc=[];

for k=1:length(data)
    c=cos(2*pi*F(hop(k))*t);
    hc=[hc c];
end

fhss=bpsk.*hc;

subplot(4,1,1)
plot(D)
title('Original Bit Sequence')
ylim([-1 1.5]);

subplot(4,1,2)
plot(bpsk)
title('BPSK Signal')

subplot(4,1,3)
plot(hc)
title('Hopping Signal with 7 Frequencies')

subplot(4,1,4)
plot(fhss)
title('Frequency Hopped Spread Spectrum Signal')
