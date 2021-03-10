function fft_exe = Exe2_2(IR, fs)
% Remove all of this
 fft_exe = mag2db(abs(fft(IR,fs)));
 t = 1/fs;
 x = linspace(t,fs,fs);
 figure(1)
 semilogx(x, fft_exe);
 ylabel('Magnitude');
 xlabel('Frequency');
end

