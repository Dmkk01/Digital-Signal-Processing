% Record some interesting locations impulse response (local church, your
% bathroom/livingroom, lecture hall, guildroom...) (for
% example with you phone). Or you can use 'LoveLibrary.wav' from this
% folder.
% Import your IR to Matlab and exam it and use it to add
% reveberation to 'Guitar.wav'. Make sure that your IR and 'Guitar.wav' has
% the same sampling frequency by using resample() if neaded to convert your
% IRs samplerate.

% Write down what impulse response you used and how you got it.


%% Import audios and match samplerates

[rsdata,rsfs]=resample(lovedata,guitarfs,lovefs);


%% IR Analysis
% Plot your IR
% Plot one sided magnitude and phase responses of you IR
% Analyse spectrums with couple of sentenses.
% You can smooth the the plot by lowpass filtering the responce

%for phase response: angle and unwrap functions
%mag :abs  
figure(1)
plot(rsdata)
title('IR')

frqrs = fft(rsdata);%freq respnse
figure(2)
plot(abs(frqrs))
title('Frequency response')

mag = abs(frqrs(1:floor(length(frqrs)/2)));
figure(3)
plot(mag)
title('Magnitude response')

phasers = unwrap(angle(rsdata));
figure(4)
plot(phasers)
axis([0 1000 0 3.5])
title('Phase response')
%% Adding Reverb
% Add reverberation to Guitar.wav by using convolution

a = conv(rsdata,guitardata);

