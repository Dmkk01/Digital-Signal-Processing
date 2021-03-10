function [A,b,a] = Exe3_2(A_mono,fs,fs_new)

% Filter coefficients
x = 0.7*(fs_new/2)/fs;

[b,a] = ellip(6, 2, 100, x, 'low'); % Using the elliptic filter design

% Signal
A = filter(b,a,A_mono);
end