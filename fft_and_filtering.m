%{
Bhautik (Brian) Amin
Biomedical Signals and Systems Matlab Problem
%}

%load  {ecg, fs}
load ECG.assign(1).mat

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
tile('FFT ECG Data Plot');
xlabel('Frequency (Hz)');
ylabel('Magnitude ECG (dB)');


%{
Filtering
Butterworth 1st order will be used

%}

[b,a] = butter(1,(10/Fs));
filt_ecg = filter(b,a,ecg);

figure;
plot(t,filt_ecg)
xlabel('time (sec)'),ylabel('Filt ECG Data');





%make 1st order butterworth lowpass filter with cut at 10 Hz 

%use interactive zoom on the plot to see the removal of high frequency noise
figure, plot(t,filt_ecg)
xlabel('time (sec)'),ylabel('Raw ECG Data');

%calc & plot fft of filtered signal
F_filt_ecg = fft(filt_ecg);
magF_filt_ecg = abs(F_filt_ecg(1:ceil(length(F_filt_ecg)/2)));
figure, plot(f,20*log10(magF_filt_ecg))
xlabel('Frequency (Hz)'), ylabel('Mag ECG (dB)');

%make 1st order butterworth highpass filter with cut at .1 Hz 
[b,a] = butter(1,(.1/Fs),'high');
filt_ecg = filter(b,a,ECG1);
figure, plot(t,filt_ecg)

%calc & plot fft of filtered signal, not decrease in sigal at
%f=0 Hz
F_filt_ecg = fft(filt_ecg);
magF_filt_ecg = abs(F_filt_ecg(1:ceil(length(F_filt_ecg)/2)));
figure, plot(f,20*log10(magF_filt_ecg))
xlabel('Frequency (Hz)'), ylabel('Mag ECG (dB)');

%make 2nd butterworth bandpass filter from 0.1 Hz to 10 Hz to 
[b,a] = butter(2,[(.1/Fs),(10/Fs)],'bandpass');
filt_ecg = filter(b,a,ECG1);
figure, plot(t,filt_ecg)

%calc & plot fft of filtered signal
F_filt_ecg = fft(filt_ecg);
magF_filt_ecg = abs(F_filt_ecg(1:ceil(length(F_filt_ecg)/2)));
figure, plot(f,20*log10(magF_filt_ecg))
xlabel('Frequency (Hz)'), ylabel('Mag ECG (dB)');


