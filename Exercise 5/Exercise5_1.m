% Listen the audio file 'Noisy_speech.wav' and import it to Matlab.
% Filter the unwanted noises from it so that speech can be heard clearly.
% Plot spectrograms (time on x-axis) from original and filtered signals.
% Also plot magnitude responses, phase responses, impulse responses and
% zero-pole plots from all filters you used.

% Be careful not to filter out consonants characteric "high frequency noise" 
% so that all 's', 'k' and so on can be heard clearly.


%Useful commands for exercise 1 (search matlab documentation for more info):
%spectrogram, iirnotch, filter, lowpass, fvtool

%Also freqz for plotting magnitude and phase responses and pzmap or zplane 
%for plotting the pole-zero map
clf;
subplot(3,1,1)
spectrogram(data,254,'yaxis');

[n,d1]=iirnotch(3300/(fs/2),3300/(fs/2)/35);
y = filter(n,d1,data);
subplot(3,1,2)
spectrogram(y,254,'yaxis')

[y2,d2] = lowpass(data,9000,fs);
subplot(3,1,3)
spectrogram(y2,254,'yaxis')


fvtool(d1)
fvtool(d2)




