% 0% MVC Trials Force

T1_10 = importdata('Lab8_MVC10T1.lvm', '\t', 23);
T2_10 = importdata('Lab8_MVC10T2.lvm', '\t', 23);
T3_10 = importdata('Lab8_MVC10T3.lvm', '\t', 23);

%Variable Assignment for all trials

T1_10_Force = T1_10.data(:,2);
T2_10_Force = T2_10.data(:,2);
T3_10_Force = T3_10.data(:,2);

T1_10_EMG = T1_10.data(:,3);
T2_10_EMG = T2_10.data(:,3);
T3_10_EMG = T3_10.data(:,3);

T1_10_Time = T1_10.data(:,1);
T2_10_Time = T2_10.data(:,1);
T3_10_Time = T3_10.data(:,1);

%Process Force and EMG of 0% MVC Trials

% 0% MVC T1 Force

T1_10_zeroforce = mean(T1_10_Force(1:1000));
T1_10_Force = T1_10_Force - T1_10_zeroforce;
T1_10_Force = T1_10_Force*(2*9.8)/(0.68+0.49);

% 0% MVC T2 Force 

T2_10_zeroforce = mean(T2_10_Force(1:2000));
T2_10_Force = T2_10_Force - T2_10_zeroforce;
T2_10_Force = T2_10_Force*(2*9.8)/(0.68+0.49);

% 0% MVC T3 Force

T3_10_zeroforce = mean(T3_10_Force(1:2250));
T3_10_Force = T3_10_Force - T3_10_zeroforce;
T3_10_Force = T3_10_Force*(2*9.8)/(0.68+0.49);

%Final filtering Force
[B,A] = butter(2, 0.0006, 'low');
T1_10_Force = filtfilt(B,A, T1_10_Force);
T2_10_Force = filtfilt(B,A, T2_10_Force);
T3_10_Force = filtfilt(B,A, T3_10_Force);

% 0% MVC EMG Data
[D,C]= butter(2,[.03 .5]);
%T1 Init Filter
T1_10_EMG_Filtered = filtfilt(D,C,T1_10_EMG);
T1_10_EMG_Rect = abs(T1_10_EMG_Filtered);
%T1 Init second filter
[F,E] = butter(2,0.01,'low');
T1_10_EMG_Envelope=filtfilt(F,E,T1_10_EMG_Rect);


%T2 Init Filter
T2_10_EMG_Filtered = filtfilt(D,C,T2_10_EMG);
T2_10_EMG_Rect = abs(T2_10_EMG_Filtered);
%T2 Init second filter
[F,E] = butter(2,0.01,'low');
T2_10_EMG_Envelope=filtfilt(F,E,T2_10_EMG_Rect);

%T3 Init Filter
T3_10_EMG_Filtered = filtfilt(D,C,T3_10_EMG);
T3_10_EMG_Rect = abs(T3_10_EMG_Filtered);
%T3 Init second filter
[F,E] = butter(2,0.01,'low');
T3_10_EMG_Envelope=filtfilt(F,E,T3_10_EMG_Rect);

%Plot and Save
figure

plot(T1_10_Force)
title('T1 10 Filtered Force');
ylabel('Force (N)');
xlabel('Index');

figure

plot(T2_10_Force)
title('T2 10 Filtered Force');
ylabel('Force (N)');
xlabel('Index');

figure

plot(T3_10_Force)
title('T3 10 Filtered Force');
ylabel('Force (N)');
xlabel('Index');

figure

plot(T1_10_EMG_Envelope)
title('T1 10 EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');

figure

plot(T2_10_EMG_Envelope)
title('T2 10 EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');

figure

plot(T3_10_EMG_Envelope)
title('T3 10 EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');

%Grab Max, Mean, and Integral Values
%T1 max
[T1_10_Force_Max,index]=max(T1_10_Force);
T1_10_EMG_Max=T1_10_EMG_Envelope(index);
%T1 mean
T1_10_Force_Mean=mean(T1_10_Force(8700:9200));
T1_10_EMG_Mean=mean(T1_10_EMG_Envelope(8700:9200));
%T1 integral
T1_10_Force_Integral=trapz(T1_10_Time(8700:9200),T1_10_Force(8700:9200));
T1_10_EMG_Integral=trapz(T1_10_Time(8700:9200),T1_10_EMG_Envelope(8700:9200));
   
%T2 max
[T2_10_Force_Max,index]=max(T2_10_Force);
T2_10_EMG_Max=T2_10_EMG_Envelope(index);
%T2 mean
T2_10_Force_Mean=mean(T2_10_Force(5000:7000));
T2_10_EMG_Mean=mean(T2_10_EMG_Envelope(5000:7000));
%T2 integral
T2_10_Force_Integral=trapz(T2_10_Time(5000:7000),T2_10_Force(5000:7000));
T2_10_EMG_Integral=trapz(T2_10_Time(5000:7000),T2_10_EMG_Envelope(5000:7000));

%T3 max
[T3_00_Force_Max,index]=max(T3_10_Force)
T3_00_EMG_Max=T3_10_EMG_Envelope(index)
%T3 mean
T3_00_Force_Mean=mean(T3_10_Force(8200:9600))
T3_00_EMG_Mean=mean(T3_10_EMG_Envelope(8200:9600))
%T3 integral
T3_00_Force_Integral=trapz(T3_10_Time(8200:9600),T2_10_Force(8200:9600))
T3_00_EMG_Integral=trapz(T3_10_Time(8200:9600),T2_10_EMG_Envelope(8200:9600))




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





























































