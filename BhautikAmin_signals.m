%{
Bhautik (Brian) Amin
Biomedical Signals and Systems Matlab Problem
%}

%load  {ecg, fs}
load ('ECG_assign(1).mat')

%Ts is sampling time (1/Hz)
Ts = 1/Fs;

%Define time row vector for 
%Between 700-710 seconds
t = linspace(700,710,length(ecg));

%plot t on x, plot ecg raw on y
figure
plot(t,ecg);
title('ECG Raw Data Plot');
xlabel('time (s)');
ylabel('Raw ECG Data');

%FFT of ecg data
f_ecg = fft(ecg);


%plot fourier transform of ecg (magnitidue, dB) against positive frequency
magf_ecg = abs(f_ecg(1:ceil(length(f_ecg)/2)));
freq = linspace(0,Fs/2,length(magf_ecg));
figure
plot(freq,20*log10(magf_ecg));
title('FFT ECG Data Plot');
xlabel('Frequency (Hz)');
ylabel('Magnitude ECG (dB)');



%Filter

%2nd order bandpass filter 0.1 to 12 Hz
[b,a] = butter(2,[(0.1/Fs),(12/Fs)],'bandpass');
filt_ecg = filter(b,a,ecg);

%Plot with time
figure 
plot(t,filt_ecg)
title('Filt ECG and Time');
xlabel('Time (s)'), ylabel('Mag ECG (dB)');

%Plot with Frequency
F_filt_ecg = fft(filt_ecg);
magF_filt_ecg = abs(F_filt_ecg(1:ceil(length(F_filt_ecg)/2)));
figure
plot(freq,20*log10(magF_filt_ecg))
title('Filtered ECG and Freq')
xlabel('Frequency (Hz)'), ylabel('Mag ECG (dB)');






