function [a0, a1, a2, b0, b1, b2] = Exe3_1(fs, fc, G, Q)
    
    % Computing some variables:
    A = 10^(G/40);
    w_0 = 2*pi*(fc/fs);
    alpha = sin(w_0)/(2*Q);
    
    
    % Berkeley Packet Filter (constant skirt gain, peak gain = Q)
    % H(s) = s / (s^2 + s/Q + 1)
    b0 = Q * alpha;
    b1 = 0;
    b2 = -Q * alpha;
    
    a0 = 1 + alpha;
    a1 = -2 * cos(w_0);
    a2 = 1 - alpha;
end