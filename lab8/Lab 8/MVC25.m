% 25% MVC Trials Force

T1_25 = importdata('Lab8_MVC25T1.lvm', '\t', 23);
T2_25 = importdata('Lab8_MVC25T2.lvm', '\t', 23);
T3_25 = importdata('Lab8_MVC25T3.lvm', '\t', 23);

%Variable Assignment for all trials

T1_25_Force = T1_25.data(:,2);
T2_25_Force = T2_25.data(:,2);
T3_25_Force = T3_25.data(:,2);

T1_25_EMG = T1_25.data(:,3);
T2_25_EMG = T2_25.data(:,3);
T3_25_EMG = T3_25.data(:,3);

T1_25_Time = T1_25.data(:,1);
T2_25_Time = T2_25.data(:,1);
T3_25_Time = T3_25.data(:,1);

%Process Force and EMG of 0% MVC Trials

% 25% MVC T1 Force

T1_25_zeroforce = mean(T1_25_Force(1:1200));
T1_25_Force = T1_25_Force - T1_25_zeroforce;
T1_25_Force = T1_25_Force*(2*9.8)/(0.68+0.49);

% 25% MVC T2 Force 

T2_25_zeroforce = mean(T2_25_Force(1:1850));
T2_25_Force = T2_25_Force - T2_25_zeroforce;
T2_25_Force = T2_25_Force*(2*9.8)/(0.68+0.49);

% 25% MVC T3 Force

T3_25_zeroforce = mean(T3_25_Force(1:2250));
T3_25_Force = T3_25_Force - T3_25_zeroforce;
T3_25_Force = T3_25_Force*(2*9.8)/(0.68+0.49);

%Final filtering Force
[B,A] = butter(2, 0.0006, 'low');
T1_25_Force = filtfilt(B,A, T1_25_Force);
T2_25_Force = filtfilt(B,A, T2_25_Force);
T3_25_Force = filtfilt(B,A, T3_25_Force);

% 25% MVC EMG Data
[D,C]= butter(2,[.03 .5]);
%T1 Init Filter
T1_25_EMG_Filtered = filtfilt(D,C,T1_25_EMG);
T1_25_EMG_Rect = abs(T1_25_EMG_Filtered);
%T1 Init second filter
[F,E] = butter(2,0.01,'low');
T1_25_EMG_Envelope=filtfilt(F,E,T1_25_EMG_Rect);


%T2 Init Filter
T2_25_EMG_Filtered = filtfilt(D,C,T2_25_EMG);
T2_25_EMG_Rect = abs(T2_25_EMG_Filtered);
%T2 Init second filter
[F,E] = butter(2,0.01,'low');
T2_25_EMG_Envelope=filtfilt(F,E,T2_25_EMG_Rect);

%T3 Init Filter
T3_25_EMG_Filtered = filtfilt(D,C,T3_25_EMG);
T3_25_EMG_Rect = abs(T3_25_EMG_Filtered);
%T3 Init second filter
[F,E] = butter(2,0.01,'low');
T3_25_EMG_Envelope=filtfilt(F,E,T3_25_EMG_Rect);

%Plot and Save
figure

plot(T1_25_Force)
title('T1 MVC 25% Filtered Force');
ylabel('Force (N)');
xlabel('Index');

figure

plot(T2_25_Force)
title('T2 MVC 25% Filtered Force');
ylabel('Force (N)');
xlabel('Index');

figure

plot(T3_25_Force)
title('T3 MVC 25% Filtered Force');
ylabel('Force (N)');
xlabel('Index');

figure

plot(T1_25_EMG_Envelope)
title('T1 25% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');

figure

plot(T2_25_EMG_Envelope)
title('T2 MVC 25% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');

figure

plot(T3_25_EMG_Envelope)
title('T3 MVC 25% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');

%Grab Max, Mean, and Integral Values
%T1 max
[T1_25_Force_Max,index]=max(T1_25_Force);
T1_25_EMG_Max=T1_25_EMG_Envelope(index);
%T1 mean
T1_25_Force_Mean=mean(T1_25_Force(4000:8500));
T1_25_EMG_Mean=mean(T1_25_EMG_Envelope(4000:8500));
%T1 integral
T1_25_Force_Integral=trapz(T1_25_Time(4000:8500),T1_25_Force(4000:8500));
T1_25_EMG_Integral=trapz(T1_25_Time(4000:8500),T1_25_EMG_Envelope(4000:8500));
   
%T2 max
[T2_25_Force_Max,index]=max(T2_25_Force);
T2_25_EMG_Max=T2_25_EMG_Envelope(index);
%T2 mean
T2_25_Force_Mean=mean(T2_25_Force(7500:9500));
T2_25_EMG_Mean=mean(T2_25_EMG_Envelope(7500:9500));
%T2 integral
T2_25_Force_Integral=trapz(T2_25_Time(7500:9500),T2_25_Force(7500:9500));
T2_25_EMG_Integral=trapz(T2_25_Time(7500:9500),T2_25_EMG_Envelope(7500:9500));

%T3 max
[T3_25_Force_Max,index]=max(T3_25_Force)
T3_25_EMG_Max=T3_25_EMG_Envelope(index)
%T3 mean
T3_25_Force_Mean=mean(T3_25_Force(7200:8600))
T3_25_EMG_Mean=mean(T3_25_EMG_Envelope(7200:8600))
%T3 integral
T3_25_Force_Integral=trapz(T3_25_Time(7200:8600),T2_25_Force(7200:8600))
T3_25_EMG_Integral=trapz(T3_25_Time(7200:8600),T2_25_EMG_Envelope(7200:8600))




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





























































