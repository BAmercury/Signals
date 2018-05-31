MVC25_T1=importdata('MVC25_T1.lvm','\t',23)
% data=xlsread('100% (1).xlsx'); % load your data
force=MVC25_T1.data(:,2);
EMG=MVC25_T1.data(:,3);
time=MVC25_T1.data(:,1);
plot(EMG);
title('EMG');
figure
plot(force)
title('force');
zero_force=mean(force(1:1000))
force=force-zero_force
force=force*9.8/0.56; % adjust for your calibration
plot(force)
title('force');
% Have force data converted to Newtons, compensated for zero force
[B,A] = butter(2,0.01,'low');
filtered_force=filtfilt(B,A,force);
plot(filtered_force)
title('filtered_force');

[B,A]=butter(2,[0.01 0.5]);  %bandpass filter 10Hz-500Hz for 2000Hz Fs
filtered_EMG=filtfilt(B,A,EMG);
rect_EMG=abs(filtered_EMG);
hold on
figure 
plot(filtered_EMG)
title('Filtered EMG');
figure
plot(rect_EMG)
title('RECT EMG');
[B,A] = butter(2,0.01,'low'); %10Hz low-pass filter for 5,000Hz sampling
EMG_10Hz_envelope=filtfilt(B,A,rect_EMG);
hold on
plot(EMG_10Hz_envelope)
% finding the max force
[max_force_50_1,index]=max(force);
max_EMG_50_1=EMG_10Hz_envelope(index);
% find the mean EMG during the period of steady force
mean_EMG_50_1=mean(EMG_10Hz_envelope(3800:5200));
mean_force_50_1=mean(force(3800:5200));
% get the integral during the period of steady force
integral_force_50_1=trapz(time(3800:5200),force(3800:5200));
integral_EMG_50_1=trapz(time(3800:5200),EMG_10Hz_envelope(3800:5200));

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

save('50_MVC1.mat','integral_EMG_50_1','integral_force_50_1','max_EMG_50_1','max_force_50_1','mean_EMG_50_1','mean_force_50_1');
