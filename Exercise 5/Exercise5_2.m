% Write your own downBy2 and upBy2 function at the end of the script and
% learn how to use them.
clf;
%% Task a)
% Read audio file 'Guitar.wav' to Matlab and confirm that its
% sampling frequency is 48000 Hz.

%I imported the file and I can see in workspace that fs is 48000.
plot(data)
%% Task b)
% Write a 'downsampling by 2' function without using Matlabs own 
% downsampling functions.
% This is done by first filtering the signal with lowpass filter with
% cutoff frequency at fs/4 and then taking every other sample.

% Then downsample 'Guitar.wav' with it and plot it (samples in  x axis)
% and listen it so that it looks/sound correct (should sound and look like
% original signal but has half to amount of samples).
% Sampling frequency should be now 24000 Hz.
% Plot the magnitude and phase response of the filter you use in the downsampling.


[by,bfs_y] = downBy2(data,fs);

subplot(2,1,1)
plot(by)


%% Task c)
% Write a 'upsampling by 2' function without using Matlabs build in
% upsampling functions. 
% This can be done by first adding 0 between every sample and then
% filtering the signal with a lowpass filter with cutoff frequency at
% fs_new/4.

% Then upsample the down sampled signal in part (a) with it and plot it 
% (samples in x axis) and listen it so that it looks/sound correct (should 
% sound and look like original signal).
% Sampling frequency should be at the end 48000 Hz.
% Plot the magnitude and phase response of the filter you use in the upsampling.


[cy,cfs_y] = upBy2(data,fs);
%fvtool(cy)
subplot(2,1,2)
plot(cy)

%plotting the magnitude and phase response of task b and c
fvtool(cy)
fvtool(by)
%% Functions

% [y, fs_y] = downBy2(x,fs);
% x    = input signal
% fs   = input signals original sampling frequency
% xd2  = x downsampled by 2
% fs_y = correct sampling frequency for y
function [y, fs_y] = downBy2(x,fs)

    yy = lowpass(x,fs/4,fs);
    y = yy(1:2:end);
    fs_y = fs/2;
end 


% [y, fs_y] = upBy2(x,fs);
% x     = input signal
% fs    = input signals original sampling frequency
% y     = x upsampled by 2
% fs_y  = correct sampling frequency for y
function [y,fs_y] = upBy2(x,fs)
   
    zerosAdded = 0*(1:fs*2);
    for i = 1:fs*2
        if(mod(i,2) == 0)
            zerosAdded(i) = 0;
        else
            zerosAdded(i) = x((i/2) +1/2);
        end
    end
    y = lowpass(zerosAdded,fs/4,fs); 
    fs_y = fs;
end 