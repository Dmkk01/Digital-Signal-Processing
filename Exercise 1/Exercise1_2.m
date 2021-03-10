%% Task a)
% Write your own sinc function called 'sinc_own' to the end of the script
% and plot it using time vector 't_a' to figure(1)
fs = 8000;
t_a = (-5*fs:5*fs)/fs;  % Time vector from -5s to 5s

x_a = sinc_own(t_a);

figure(1)
plot(t_a, x_a)

%% Task b)
% Write your own digital diracs delta funktion and digital step function at the end of this
% script. Then use stem() to draw your own diracs delda function and
% plot() for your step function.
fs = 8000;
t_b = (-fs:fs)/fs;  %Time vector from -1s to 1s

x_b1 = dirac_own(t_b);
x_b2 = step_own(t_b);

figure(2)
stem(t_b, x_b1);
hold on
plot(t_b, x_b2);
xlabel('x axis');
ylabel('y axix');

%% Functions here

function y = sinc_own(x)
    y = (sin(x))./(x);
    y(x==0)=1;  
end

function y = dirac_own(x)
    a = length(x);
    y = zeros(1,a);
    y(8000) = 1;
end

function y = step_own(x)
    a = length(x);
    y = zeros(1,a);
    y(8000:end) = 1;
end

    
