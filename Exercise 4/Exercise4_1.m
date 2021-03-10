% Use windowed Fourier series method and design a FIR-type (causal) lowpass
% filter with cutoff frequency w_c = 3*pi/4.
% Impulse response of an ideal lowpass filter with cutoff frequency at w_c
% in matlab is w_c/pi*sinc(w_c/pi *n), where w_c = 2*pi*f_c/fs and 'n' is
% sample index.
clf;
fs = 8000;
n = (-70:70);

% h_d[n] = sin(3*pi/4*n) / (pi*n) = (3/4)*sinc(3/4*n)
h_d = 3/4*sinc(3/4*n);

wc = 3*pi/4;
fc=3000;

figure(1)
stem(n,h_d)
title('Ideal IR')
grid on

%% Task a)
% generate 4th order FIR lowpass filter by windowing ideal impulse resonse
% with rectangular window: w_r[n] = 1, -M =< n =< M, M = 2 and else 0.
% Plot the impulse response and magnitude response
M=2;
awindow = 0*n;

for i = -M:M
    awindow(i+71) = 1;
end
rectangle = h_d.*awindow;
b = rectangle(find(rectangle,1):find(rectangle,1,'last'));
[H,s] = freqz(b,1,512,fs);

%Plot in linear graph
figure(2)
subplot(1,2,1)
%plot() here
plot(s,abs(H))
hold on
speksitFIR([3/4*fs/2-10 fs/2*3/4+10], [1 0], [0.01 0.1], fs);
hold off
grid on



%% Task b)
% generate 4th order FIR lowpass filter by windowing ideal impulse resonse
% with Hamming window: w_h[n] = 0.54+0.46*cos(pi*n/M), -M =< n =< M, M = 2.
% Plot the impulse response and magnitude response

M=2;
w = 0:pi/100:pi;
bwindow = 0*n;
for i = -M:M
    bwindow(i+71) = 0.54+0.46*cos(pi*i/M);
    
end
rectangle = h_d.*bwindow;
b = rectangle(find(rectangle,1):find(rectangle,1,'last'));
[H,s] = freqz(b,1,512,fs);

%Plot in linear graph

subplot(1,2,2)
%plot() here
plot(s,abs(H))
hold on
speksitFIR([3/4*fs/2-10 fs/2*3/4+10], [1 0], [0.01 0.1], fs);
hold off
grid on

%% Task c)
% Compare how the magnitude responses of the filters designed in (a) and 
% (b) differ.
% Then do the same as in a) and b) but use filter order of 100 (M=50).



M=50;
awindow = 0*n;
for i = -M:M
    awindow(i+71) = 1;
    
end
rectangle = h_d.*awindow;
b = rectangle(find(rectangle,1):find(rectangle,1,'last'));


[H,s] = freqz(b,1,512,fs);

%Plot in linear graph
figure(3)

%plot() here
plot(s,abs(H))
hold on
speksitFIR([3/4*fs/2-10 fs/2*3/4+10], [1 0], [0.01 0.1], fs);
hold off
grid on


