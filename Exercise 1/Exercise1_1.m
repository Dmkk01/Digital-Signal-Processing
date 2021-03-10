%% How to import audio data
audio_file = 'Guitar.wav';        % Save path to tha audio file to a string  
[signal, fs] = audioread(audio_file); % Read audio file to vector and its' sampling frequency to fs

%% Analysing audio signal in time domain
audioinfo(audio_file)   % Prints information about a audio file

figure(1)               % New figure
plot(signal)            % Plot the mono audio signal to figure(1)
        
grid on                 % Draws gridlines to the figure(1)
xlabel('Samples')       % Label the x-axis of the plot
ylabel('Amlitude')      % Label the y-axis of the plot
title(audio_file)       % Give a tittle to the plot
axis([0 length(signal) min(signal) max(signal)]) % Zooms to the plot


%% Playing audio signal

gain = 1;                % Try different values to gain and see how it affect the played audio
soundsc(gain*signal, fs) % Scales signal to 1 and plays it with correct sampling frequency
%sound(gain*signal, fs)   % Plays signal with original amplitude and sampling frequency

%% Task a) (replace 0 with a correct answer)
% What is the sampling frequency of 'signal'?
sampling_frequency = 48000

% How long the 'signal' is in second?
length_in_seconds = 4

% What are the maximum and minimum values of the 'signal' and corresponding
% indexes that those values occur?

signal_max = max(signal)
signal_min = min(signal)
signal_max_idx = find(signal == signal_max)
signal_min_idx = find(signal == signal_min)

%% Task b)
% Generate a signal named 'signal_a' that is same as 'signal' but it is
% reversed and scaled to 1

signal_a = flip(signal)*gain;

%% Task c)
% Generate a vector that is equally long as 'signal' that grows linearly
% from 0 to 1 and element-wise multiply 'signal' with it to generate
% 'signal_b'. Scale 'signal_b' also to 1.

signal_b = transpose(linspace(0,1, length(signal))).*signal * gain;


%% d) 
% Plot 'signal_a' and 'signal_b' to same figure but in different graphs
% using subplot() so that 'signal_a' is on top of 'signal_b' and y-axises
% are amplitude and x-axises are time in seconds. Name the plots
% and all axises. Also set the axises so that there is no unnecessary
% space in the plots.
figure(2)

subplot(2,1,1) 
plot(signal_a)
xlabel('Seconds * 48000')      
ylabel('Amplitude')      
title('Signal A')       
axis([0 length(signal_a) min(signal_a) max(signal_a)]) 

subplot(2,1,2) 
plot(signal_b)
xlabel('Seconds * 48000')      
ylabel('Amplitude')      
title('Signal B')       
axis([0 length(signal_b) min(signal_b) max(signal_b)])