

global_data = importdata('Quiz7.mat');

%Init global structs

soleus_emg = global_data.soleus;

ta_emg = global_data.tibialis_anterior;

ta_burst_time = global_data.ta_burst_time;

sol_burst_time = global_data.sol_burst_time;

%Init bandpass filter

[B,A] = butter(6, [0.01, 0.6]); %double check this
%Soleus initial EMG Filter
filt_soleus_emg = filtfilt(B, A, soleus_emg);
rect_soleus_emg = abs(filt_soleus_emg);
%TA initial EMG Filter
filt_ta_emg = filtfilt(B, A, ta_emg);
rect_ta_emg = abs(filt_ta_emg);

%Init new 4th order LP butterworth filter
[B,A] = butter(4, 0.01, 'low');

%Filter the rect data
soleus_emg_env = filtfilt(B, A, rect_soleus_emg);
ta_emg_env = filtfilt(B, A, rect_ta_emg);

%Find Max and normalize

%first get them positive

norm_soleus_emg = abs(soleus_emg_env);




%then set max values to 1




%Plot data WRT time
figure
plot(sol_burst_time,norm_soleus_emg,'g',ta_burst_time,norm_ta_emg,'r')


%Add in labels
xlabel('Normalized Step Cycle (0 to 1)')
ylabel('Normalized EMG Level')
title('Normalized Soleus EMGs During a Step Cycle')
legend('Soleus','Tibialis Anterior')









