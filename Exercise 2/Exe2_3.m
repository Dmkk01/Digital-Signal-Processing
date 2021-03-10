

% This time you have to create a fft from .mat file data. You can plot the
% data to visualize and reason what kind of data you would like to see

function fft2_3 = Exe2_3(filename)

% First 3 rows are correct replace the rest and produce 
    M = load(filename);
    Fs = M.fT;
    t = M.time;
    signal = M.signal;
    
    fft2_3 = mag2db(abs(fft(signal, Fs)));
    df = 1/Fs;
    x = linspace(df,Fs, Fs);
    
    figure(1);
    semilogx(x, fft2_3);
    ylabel('Magnitude');
    xlabel('Frequency');
end

   
    
