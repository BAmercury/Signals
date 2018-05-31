MVC_50_1=importdata('MVC50Trial1.lvm','\t',23)
% data=xlsread('100% (1).xlsx'); % load your data
force=MVC_50_1.data(:,2);
EMG=MVC_50_1.data(:,3);
time=MVC_50_1.data(:,1);
plot(EMG);
figure
plot(force)
zero_force=mean(force(1:1000))
force=force-zero_force
force=force*(0.5*9.8)/(0.1334-.1281); % adjust for your calibration
plot(force)
force=(force*-1);
plot(force)
[B,A] = butter(2,0.01,'low');
force=filtfilt(B,A,force);
plot(force)

[B,A]=butter(2,[0.01 0.5]);  %bandpass filter 10Hz-500Hz for 2000Hz Fs
filtered_EMG=filtfilt(B,A,EMG);
rect_EMG=abs(filtered_EMG);
hold on
plot(filtered_EMG)
figure
plot(rect_EMG)
[B,A] = butter(2,0.01,'low'); %10Hz low-pass filter for 5,000Hz sampling
EMG_10Hz_envelope=filtfilt(B,A,rect_EMG);
hold on
plot(EMG_10Hz_envelope)
% finding the max force
[max_force_50_1,index]=max(force);
max_EMG_50_1=EMG_10Hz_envelope(index);
% find the mean EMG during the period of steady force
mean_EMG_50_1=mean(EMG_10Hz_envelope(5000:7000));
mean_force_50_1=mean(force(5000:7000));
% get the integral during the period of steady force
integral_force_50_1=trapz(time(5000:7000),force(5000:7000));
integral_EMG_50_1=trapz(time(5000:7000),EMG_10Hz_envelope(5000:7000));

% copy the preceding section for each of your trials and adjust the file
% loaded, the period of steady force, and the variables where you save your
% max, mean and integral.

% at the end you should have the max force and emg, mean force and emg and
% integral force and emg

% Then group the variables into a single vector of max force, max EMG, mean
% force, mean emg, integral EMG, integral force
% e.g. max_force=[max_force_0_1 max_force_0_2 max_force_0_3 ...
% max_force_100_3]
% perform cftool on those vectors


