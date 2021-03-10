% This exercise uses speksitIIR.m function from Mycourses. The function has
% to be in the same folder as this skript to work.
% You can write 'help speksitIIR' to  Command Window to get information
% about speksitIIR function. Sampling frequency in both sections is 48000Hz
% Use legend() to name each magnitude response clearly.
fs = 48000;
%% Task a)
% Design digital minimum order (lowest possible order) 
% I) Butterworth,
% II) Chebyshev 1,
% III) and Elliptic
% high-pass filters that fulfill specs drawn on the figure(1) and plot them
% to figure(1).
% Helpful functions: butter, buttord, cheb1, cheb1ord, ellip, ellipord
% freqz.
%speksitIIR --- Wp,Ws,Rp,Rs,type,Fs
Wp = 0.5;
Ws = 0.3;
Rp = 3;
Rs = 40;

[en,eWn] = ellipord(Wp,Ws,Rp,Rs);
[eb,ea] = ellip(en,Rp,Rs,Wp,'high'); 
[eh,ew] = freqz(eb,ea);

[bn,bWn] = buttord(Wp,Ws,Rp,Rs);
[bb,ba] = butter(bn,bWn,'high');
[bh,bw] = freqz(bb,ba);

[cn,cWp] = cheb1ord(Wp,Ws,Rp,Rs);
[cb,ca] = cheby1(cn,Rp,cWp,'high');
[ch,cw] = freqz(cb,ca);

figure(1);clf
hold on


plot(ew/pi*fs/2, 20*log10(abs(eh)))
plot(bw/pi*fs/2, 20*log10(abs(bh)))
plot(cw/pi*fs/2, 20*log10(abs(ch)))

grid on
speksitIIR(0.5, 0.3, 3, 40, 'high', 48000);
hold off
legend('ellip','butter','cheby1')
xlabel('Frequency / Hz')
ylabel('Magnitude / dB')

%% Task b)
% Design digital minimum order (lowest possible order) 
% I) Butterworth,
% II) Chebyshev 1,
% III) and Elliptic
% band-pass filters that fulfill specs drawn on the figure(2) and plot them
% to figure(2).
% Helpful functions: butter, buttord, cheb1, cheb1ord, ellip, ellipord
% freqz.

Wp = [0.5,0.7];
Ws = [0.3 0.8];
Rp = 1;
Rs = 40;

[en,eWn] = ellipord(Wp,Ws,Rp,Rs);
[eb,ea] = ellip(en,Rp,Rs,Wp,'bandpass'); 
[eh,ew] = freqz(eb,ea);

[bn,bWn] = buttord(Wp,Ws,Rp,Rs);
[bb,ba] = butter(bn,bWn,'bandpass');
[bh,bw] = freqz(bb,ba);

[cn,cWp] = cheb1ord(Wp,Ws,Rp,Rs);
[cb,ca] = cheby1(cn,Rp,cWp,'bandpass');
[ch,cw] = freqz(cb,ca);


figure(2);clf
hold on

plot(ew/pi*fs/2, 20*log10(abs(eh)))
plot(bw/pi*fs/2, 20*log10(abs(bh)))
plot(cw/pi*fs/2, 20*log10(abs(ch)))

grid on
speksitIIR([0.5 0.7], [0.3 0.8], 1, 40, '', 48000);
hold off
legend('ellip','butter','cheby1')
xlabel('Frequency / Hz')
ylabel('Magnitude / dB')

%% Task c)
% What are the orders of each filters and what differences: butterworth,
% chebyshev 1 and elliptic filter have?


% en = 4, bn = 6, cn = 3 (can be checked from the workspace)



%Butterworth: Flattest pass-band but a poor roll-off rate.
%Chebyshev: Some pass-band ripple but a better (steeper) roll-off rate.
%Elliptic: Some pass- and stop-band ripple but with the steepest roll-off rate.





