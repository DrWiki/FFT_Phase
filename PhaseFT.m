%%
tt = 0:0.01:3*pi;
TT = 0:0.01:12*pi;
TT_part = 3*pi:0.01:9*pi;
y1 = 2*sin(0.5*pi.*tt)+3*sin(2*pi.*tt)+sin(3*pi.*tt)+sin(4*pi.*tt)+sin(5*pi.*tt)+sin(6*pi.*tt)+sin(7*pi.*tt)+sin(14*pi.*tt)+sin(60*pi.*tt);
y2 = zeros(1,length(TT));
temp = zeros(1,length(TT));



% figure;
Fs = 100;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = length(tt);             % Length of signal
t = (0:L-1)*T;        % Time vector
Y1 = fft(y1);
P2 = abs(Y1/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
subplot(323);plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
subplot(321),plot(tt,y1)
title('Main waveform of X(t)')
xlabel('t/s')
ylabel('Amplitude')
for d = 1:10:length(0:0.01:9*pi)
    y2 = zeros(1,length(TT));
    y2(1,d:d+length(y1)-1) = temp(1,d:d+length(y1)-1) + y1;
    y2_2 = y2(1,length(0:0.01:3*pi):length(0:0.01:9*pi));
    
    Fs = 100;            % Sampling frequency                    
    T = 1/Fs;             % Sampling period       
    L = length(y2_2);             % Length of signal
    t = (0:L-1)*T;        % Time vector
    Y2 = fft(y2_2);
    
    phase = angle(Y2/L);
    
    P2 = abs(Y2/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = Fs*(0:(L/2))/L;
    subplot(324);plot(f,P1) 
    title('Single-Sided Amplitude Spectrum of X(t)')
    xlabel('f (Hz)')
    ylabel('|P1(f)|')


    subplot(322),plot(TT,y2),hold on, plot([3*pi,3*pi],[-8,8]),hold off;
    hold on, plot([9*pi,9*pi],[-8,8]),hold off;
    title('Combined waveform of X(t)')
    xlabel('t/s')
    ylabel('Amplitude')
    subplot(326),plot(Fs*(0:(L-1))/L,phase);
    title('Single-Sided angle Spectrum of X(t)')
    xlabel('f (Hz)')
    ylabel('Phase angle')
    pause(0.001);
end
