% 0% MVC Trials Force

T1_00 = importdata('Lab8_MVC00T1.lvm', '\t', 23);
T2_00 = importdata('Lab8_MVC00T2.lvm', '\t', 23);
T3_00 = importdata('Lab8_MVC00T3.lvm', '\t', 23);

%Variable Assignment for all trials

T1_00_Force = T1_00.data(:,2);
T2_00_Force = T2_00.data(:,2);
T3_00_Force = T3_00.data(:,2);

T1_00_EMG = T1_00.data(:,3);
T2_00_EMG = T2_00.data(:,3);
T3_00_EMG = T3_00.data(:,3);

T1_00_Time = T1_00.data(:,1);
T2_00_Time = T2_00.data(:,1);
T3_00_Time = T3_00.data(:,1);

%Process Force and EMG of 0% MVC Trials

% 0% MVC T1 Force

T1_00_zeroforce = mean(T1_00_Force(1:250));
T1_00_Force = T1_00_Force - T1_00_zeroforce;
T1_00_Force = T1_00_Force*(2*9.8)/(0.68+0.49);

% 0% MVC T2 Force 

T2_00_zeroforce = mean(T2_00_Force(1:500));
T2_00_Force = T2_00_Force - T2_00_zeroforce;
T2_00_Force = T2_00_Force*(2*9.8)/(0.68+0.49);

% 0% MVC T3 Force

T3_00_zeroforce = mean(T3_00_Force(1:2000));
T3_00_Force = T3_00_Force - T3_00_zeroforce;
T3_00_Force = T3_00_Force*(2*9.8)/(0.68+0.49);

%Final filtering Force
[B,A] = butter(2, 0.0006, 'low');
T1_00_Force = filtfilt(B,A, T1_00_Force);
T2_00_Force = filtfilt(B,A, T2_00_Force);
T3_00_Force = filtfilt(B,A, T3_00_Force);

% 0% MVC EMG Data
[D,C]= butter(2,[.03 .5]);
%T1 Init Filter
T1_00_EMG_Filtered = filtfilt(D,C,T1_00_EMG);
T1_00_EMG_Rect = abs(T1_00_EMG_Filtered);
%T1 Init second filter
[F,E] = butter(2,0.01,'low');
T1_00_EMG_Envelope=filtfilt(F,E,T1_00_EMG_Rect);


%T2 Init Filter
T2_00_EMG_Filtered = filtfilt(D,C,T2_00_EMG);
T2_00_EMG_Rect = abs(T2_00_EMG_Filtered);
%T2 Init second filter
[F,E] = butter(2,0.01,'low');
T2_00_EMG_Envelope=filtfilt(F,E,T2_00_EMG_Rect);

%T3 Init Filter
T3_00_EMG_Filtered = filtfilt(D,C,T3_00_EMG);
T3_00_EMG_Rect = abs(T3_00_EMG_Filtered);
%T3 Init second filter
[F,E] = butter(2,0.01,'low');
T3_00_EMG_Envelope=filtfilt(F,E,T3_00_EMG_Rect);

%Plot and Save
figure

plot(T1_00_Force)
title('T1 MVC 0% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T1 MVC 0% Filtered Force.jpg');

figure

plot(T2_00_Force)
title('T2 MVC 0% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T2 MVC 0% Filtered Force.jpg');

figure

plot(T3_00_Force)
title('T3 MVC 0% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T3 MVC 0% Filtered Force.jpg');

figure

plot(T1_00_EMG_Envelope)
title('T1 MVC 0% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T1 MVC 0% EMG.jpg');

figure

plot(T2_00_EMG_Envelope)
title('T2 MVC 0% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T2 MVC 0% EMG.jpg');

figure

plot(T3_00_EMG_Envelope)
title('T3 MVC 0% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T3 MVC 0% EMG.jpg');

%Grab Max, Mean, and Integral Values
%T1 max
[T1_00_Force_Max,index]=max(T1_00_Force);
T1_00_EMG_Max=T1_00_EMG_Envelope(index);
%T1 mean
T1_00_Force_Mean=mean(T1_00_Force(7500:9000));
T1_00_EMG_Mean=mean(T1_00_EMG_Envelope(7500:9000));
%T1 integral
T1_00_Force_Integral=trapz(T1_00_Time(7500:9000),T1_00_Force(7500:9000));
T1_00_EMG_Integral=trapz(T1_00_Time(7500:9000),T1_00_EMG_Envelope(7500:9000));
   
%T2 max
[T2_00_Force_Max,index]=max(T2_00_Force);
T2_00_EMG_Max=T2_00_EMG_Envelope(index);
%T2 mean
T2_00_Force_Mean=mean(T2_00_Force(3000:5000));
T2_00_EMG_Mean=mean(T2_00_EMG_Envelope(3000:7000));
%T2 integral
T2_00_Force_Integral=trapz(T2_00_Time(3000:5000),T2_00_Force(3000:5000));
T2_00_EMG_Integral=trapz(T2_00_Time(3000:5000),T2_00_EMG_Envelope(3000:5000));

%T3 max
[T3_00_Force_Max,index]=max(T3_00_Force);
T3_00_EMG_Max=T3_00_EMG_Envelope(index);
%T3 mean
T3_00_Force_Mean=mean(T3_00_Force(7000:8200));
T3_00_EMG_Mean=mean(T3_00_EMG_Envelope(7000:8200));
%T3 integral
T3_00_Force_Integral=trapz(T3_00_Time(7000:8200),T2_00_Force(7000:8200));
T3_00_EMG_Integral=trapz(T3_00_Time(7000:8200),T2_00_EMG_Envelope(7000:8200));




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 10% MVC Trials Force

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

% 10% MVC T1 Force

T1_10_zeroforce = mean(T1_10_Force(1:1000));
T1_10_Force = T1_10_Force - T1_10_zeroforce;
T1_10_Force = T1_10_Force*(2*9.8)/(0.68+0.49);

% 10% MVC T2 Force 

T2_10_zeroforce = mean(T2_10_Force(1:2000));
T2_10_Force = T2_10_Force - T2_10_zeroforce;
T2_10_Force = T2_10_Force*(2*9.8)/(0.68+0.49);

% 10% MVC T3 Force

T3_10_zeroforce = mean(T3_10_Force(1:2250));
T3_10_Force = T3_10_Force - T3_10_zeroforce;
T3_10_Force = T3_10_Force*(2*9.8)/(0.68+0.49);

%Final filtering Force
[B,A] = butter(2, 0.0006, 'low');
T1_10_Force = filtfilt(B,A, T1_10_Force);
T2_10_Force = filtfilt(B,A, T2_10_Force);
T3_10_Force = filtfilt(B,A, T3_10_Force);

% 10% MVC EMG Data
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
title('T1 MVC 10% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T1 MVC 10% Filtered Force.jpg');

figure

plot(T2_10_Force)
title('T2 MVC 10% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T2 MVC 10% Filtered Force.jpg');

figure

plot(T3_10_Force)
title('T3 MVC 10% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T3 MVC 10% Filtered Force.jpg');

figure

plot(T1_10_EMG_Envelope)
title('T1 MVC 10% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T1 MVC 10% EMG.jpg');
figure

plot(T2_10_EMG_Envelope)
title('T2 MVC 10% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T2 MVC 10% EMG.jpg');
figure

plot(T3_10_EMG_Envelope)
title('T3 MVC 10% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T3 MVC 10% EMG.jpg');

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
[T3_10_Force_Max,index]=max(T3_10_Force);
T3_10_EMG_Max=T3_10_EMG_Envelope(index);
%T3 mean
T3_10_Force_Mean=mean(T3_10_Force(8200:9600));
T3_10_EMG_Mean=mean(T3_10_EMG_Envelope(8200:9600));
%T3 integral
T3_10_Force_Integral=trapz(T3_10_Time(8200:9600),T2_10_Force(8200:9600));
T3_10_EMG_Integral=trapz(T3_10_Time(8200:9600),T2_10_EMG_Envelope(8200:9600));




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
saveas(gcf,'T1 MVC 25% Filtered Force.jpg');

figure

plot(T2_25_Force)
title('T2 MVC 25% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T2 MVC 25% Filtered Force.jpg');

figure

plot(T3_25_Force)
title('T3 MVC 25% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T3 MVC 25% Filtered Force.jpg');

figure

plot(T1_25_EMG_Envelope)
title('T1 25% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T1 25% EMG.jpg');
figure

plot(T2_25_EMG_Envelope)
title('T2 MVC 25% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T2 MVC 25% EMG.jpg');
figure

plot(T3_25_EMG_Envelope)
title('T3 MVC 25% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T3 MVC 25% EMG.jpg');

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
[T3_25_Force_Max,index]=max(T3_25_Force);
T3_25_EMG_Max=T3_25_EMG_Envelope(index);
%T3 mean
T3_25_Force_Mean=mean(T3_25_Force(7200:8600));
T3_25_EMG_Mean=mean(T3_25_EMG_Envelope(7200:8600));
%T3 integral
T3_25_Force_Integral=trapz(T3_25_Time(7200:8600),T2_25_Force(7200:8600));
T3_25_EMG_Integral=trapz(T3_25_Time(7200:8600),T2_25_EMG_Envelope(7200:8600));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%100 MVC
T1_100 = importdata('Lab8_MVC100T1.lvm','\t',23);
T2_100 = importdata('Lab8_MVC100T2.lvm','\t',23);
T3_100 = importdata('Lab8_MVC100T3.lvm','\t',23);

T1_100_Force = T1_100.data(:,2);
T1_100_EMG =T1_100.data(:,3);
T1_100_Time = T1_100.data(:,1);

T2_100_Force = T2_100.data(:,2);
T2_100_EMG =T2_100.data(:,3);
T2_100_Time = T2_100.data(:,1);

T3_100_Force = T3_100.data(:,2);
T3_100_EMG =T3_100.data(:,3);
T3_100_Time = T3_100.data(:,1);

    %T1 Force
T1_100_Zero_Force = mean(T1_100_Force(1:200));  
T1_100_Force=T1_100_Force - T1_100_Zero_Force;
T1_100_Force= T1_100_Force*(2*9.8)/(0.68+0.49);
[B,A] = butter(2, 0.01, 'low');
T1_100_Force=filtfilt(B,A,T1_100_Force);


figure

plot(T1_100_Force)
title('T1 MVC 100% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T1 100 Filtered Force.jpg');

    %T1 EMG
[D,C]= butter(2,[.03 .5]);
T1_100_EMG_Filtered = filtfilt(D,C,T1_100_EMG);
T1_100_EMG_Rect = abs(T1_100_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T1_100_EMG_Envelope=filtfilt(F,E,T1_100_EMG_Rect);

figure

plot(T1_100_EMG_Envelope)
title('T1 MVC 100% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T1 100 EMG.jpg');

    %T1 max
[T1_100_Force_Max,index]=max(T1_100_Force);
T1_100_EMG_Max=T1_100_EMG_Envelope(index);
    %T1 mean
T1_100_Force_Mean=mean(T1_100_Force(6000:7000));
T1_100_EMG_Mean=mean(T1_100_EMG_Envelope(6000:7000));
    %T1 integral
T1_100_Force_Integral=trapz(T1_100_Time(6000:7000),T1_100_Force(6000:7000));
T1_100_EMG_Integral=trapz(T1_100_Time(6000:7000),T1_100_EMG_Envelope(6000:7000));

    %T2 Force
T2_100_Zero_Force = mean(T2_100_Force(1:1100));  
T2_100_Force=T2_100_Force - T2_100_Zero_Force;
T2_100_Force= T2_100_Force*(2*9.8)/(0.68+0.49);
[B,A] = butter(2, 0.01, 'low');
T2_100_Force=filtfilt(B,A,T2_100_Force);

figure

plot(T2_100_Force)
title('T2 MVC 100% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T2 100 Filtered Force.jpg');

    %T2 EMG
[D,C]= butter(2,[.03 .5]);
T2_100_EMG_Filtered = filtfilt(D,C,T2_100_EMG);
T2_100_EMG_Rect = abs(T2_100_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T2_100_EMG_Envelope=filtfilt(F,E,T2_100_EMG_Rect);

figure

plot(T2_100_EMG_Envelope)
title('T2 MVC 100% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T2 100 EMG.jpg');

    %T2 max
[T2_100_Force_Max,index]=max(T2_100_Force);
T2_100_EMG_Max=T2_100_EMG_Envelope(index);
    %T2 mean
T2_100_Force_Mean=mean(T2_100_Force(4500:5500));
T2_100_EMG_Mean=mean(T2_100_EMG_Envelope(4500:5500));
    %T2 integral
T2_100_Force_Integral=trapz(T2_100_Time(4500:5500),T2_100_Force(4500:5500));
T2_100_EMG_Integral=trapz(T2_100_Time(4500:5500),T2_100_EMG_Envelope(4500:5500));

    %T3 Force
T3_100_Zero_Force = mean(T3_100_Force(1:900));  
T3_100_Force=T3_100_Force - T3_100_Zero_Force;
T3_100_Force= T3_100_Force*(2*9.8)/(0.68+0.49);
[B,A] = butter(2, 0.01, 'low');
T3_100_Force=filtfilt(B,A,T3_100_Force);

figure

plot(T3_100_Force)
title('T3 MVC 100% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T3 100 Filtered Force.jpg');

    %T3 EMG
[D,C]= butter(2,[.03 .5]);
T3_100_EMG_Filtered = filtfilt(D,C,T2_100_EMG);
T3_100_EMG_Rect = abs(T3_100_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T3_100_EMG_Envelope=filtfilt(F,E,T3_100_EMG_Rect);

figure

plot(T3_100_EMG_Envelope)
title('T3 MVC 100% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T3 100 EMG.jpg');

    %T3 max
[T3_100_Force_Max,index]=max(T3_100_Force);
T3_100_EMG_Max=T3_100_EMG_Envelope(index);
    %T3 mean
T3_100_Force_Mean=mean(T3_100_Force(5000:6000));
T3_100_EMG_Mean=mean(T3_100_EMG_Envelope(5000:6000));
    %T3 integral
T3_100_Force_Integral=trapz(T3_100_Time(5000:6000),T3_100_Force(5000:6000));
T3_100_EMG_Integral=trapz(T3_100_Time(5000:6000),T3_100_EMG_Envelope(5000:6000));

%75 MVC
T1_75 = importdata('Lab8_MVC75T1.lvm','\t',23);
T2_75 = importdata('Lab8_MVC75T2.lvm','\t',23);
T3_75 = importdata('Lab8_MVC75T3.lvm','\t',23);

T1_75_Force = T1_75.data(:,2);
T1_75_EMG =T1_75.data(:,3);
T1_75_Time = T1_75.data(:,1);

T2_75_Force = T2_75.data(:,2);
T2_75_EMG =T2_75.data(:,3);
T2_75_Time = T2_75.data(:,1);

T3_75_Force = T3_75.data(:,2);
T3_75_EMG =T3_75.data(:,3);
T3_75_Time = T3_75.data(:,1);

    %T1 Force
T1_75_Zero_Force = mean(T1_75_Force(1:1200));  
T1_75_Force=T1_75_Force - T1_75_Zero_Force;
T1_75_Force= T1_75_Force*(2*9.8)/(0.68+0.49);
[B,A] = butter(2, 0.01, 'low');
T1_75_Force=filtfilt(B,A,T1_75_Force);

figure

plot(T1_75_Force)
title('T1 MVC 75% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T1 75 Filtered Force.jpg');

    %T1 EMG
[D,C]= butter(2,[.03 .5]);
T1_75_EMG_Filtered = filtfilt(D,C,T1_75_EMG);
T1_75_EMG_Rect = abs(T1_75_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T1_75_EMG_Envelope=filtfilt(F,E,T1_75_EMG_Rect);

figure

plot(T1_75_EMG_Envelope)
title('T1 MVC 75% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T1 75 EMG.jpg');
    %T1 max
[T1_75_Force_Max,index]=max(T1_75_Force);
T1_75_EMG_Max=T1_75_EMG_Envelope(index);
    %T1 mean
T1_75_Force_Mean=mean(T1_75_Force(6400:6700));
T1_75_EMG_Mean=mean(T1_75_EMG_Envelope(6400:6700));
    %T1 integral
T1_75_Force_Integral=trapz(T1_75_Time(6400:6700),T1_75_Force(6400:6700));
T1_75_EMG_Integral=trapz(T1_75_Time(6400:6700),T1_75_EMG_Envelope(6400:6700));

    %T2 Force
T2_75_Zero_Force = mean(T2_75_Force(1:800));  
T2_75_Force=T2_75_Force - T2_75_Zero_Force;
T2_75_Force= T2_75_Force*(2*9.8)/(0.68+0.49);
[B,A] = butter(2, 0.01, 'low');
T2_75_Force=filtfilt(B,A,T2_75_Force);

figure

plot(T2_75_Force)
title('T2 MVC 75% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T2 75 Filtered Force.jpg');

    %T2 EMG
[D,C]= butter(2,[.03 .5]);
T2_75_EMG_Filtered = filtfilt(D,C,T2_75_EMG);
T2_75_EMG_Rect = abs(T2_75_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T2_75_EMG_Envelope=filtfilt(F,E,T2_75_EMG_Rect);

figure

plot(T2_75_EMG_Envelope)
title('T2 MVC 75% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T2 75 EMG.jpg');

    %T2 max
[T2_75_Force_Max,index]=max(T2_75_Force);
T2_75_EMG_Max=T2_75_EMG_Envelope(index);
    %T2 mean
T2_75_Force_Mean=mean(T2_75_Force(4250:5000));
T2_75_EMG_Mean=mean(T2_75_EMG_Envelope(4250:5000));
    %T2 integral
T2_75_Force_Integral=trapz(T2_75_Time(4250:5000),T2_75_Force(4250:5000));
T2_75_EMG_Integral=trapz(T2_75_Time(4250:5000),T2_75_EMG_Envelope(4250:5000));

    %T3 Force
T3_75_Zero_Force = mean(T3_75_Force(1:1500));  
T3_75_Force=T3_75_Force - T3_75_Zero_Force;
T3_75_Force= T3_75_Force*(2*9.8)/(0.68+0.49);
[B,A] = butter(2, 0.01, 'low');
T3_75_Force=filtfilt(B,A,T3_75_Force);

figure

plot(T3_75_Force)
title('T3 75 Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T3 75 Filtered Force.jpg');

    %T3 EMG
[D,C]= butter(2,[.03 .5]);
T3_75_EMG_Filtered = filtfilt(D,C,T2_75_EMG);
T3_75_EMG_Rect = abs(T3_75_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T3_75_EMG_Envelope=filtfilt(F,E,T3_75_EMG_Rect);

figure

plot(T3_75_EMG_Envelope)
title('T3 75 EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T3 75 EMG.jpg');

    %T3 max
[T3_75_Force_Max,index]=max(T3_75_Force);
T3_75_EMG_Max=T3_75_EMG_Envelope(index);
    %T3 mean
T3_75_Force_Mean=mean(T3_75_Force(5000:6000));
T3_75_EMG_Mean=mean(T3_75_EMG_Envelope(5000:6000));
    %T3 integral
T3_75_Force_Integral=trapz(T3_75_Time(5000:6000),T3_75_Force(5000:6000));
T3_75_EMG_Integral=trapz(T3_75_Time(5000:6000),T3_75_EMG_Envelope(5000:6000));

%50 MVC
T1_50 = importdata('Lab8_MVC50T1.lvm','\t',23);
T2_50 = importdata('Lab8_MVC50T2.lvm','\t',23);
T3_50 = importdata('Lab8_MVC50T3.lvm','\t',23);

T1_50_Force = T1_50.data(:,2);
T1_50_EMG =T1_50.data(:,3);
T1_50_Time = T1_50.data(:,1);

T2_50_Force = T2_50.data(:,2);
T2_50_EMG =T2_50.data(:,3);
T2_50_Time = T2_50.data(:,1);

T3_50_Force = T3_50.data(:,2);
T3_50_EMG =T3_50.data(:,3);
T3_50_Time = T3_50.data(:,1);

    %T1 Force
T1_50_Zero_Force = mean(T1_50_Force(1:1500));  
T1_50_Force=T1_50_Force - T1_50_Zero_Force;
T1_50_Force= T1_50_Force*(2*9.8)/(0.68+0.49);
[B,A] = butter(2, 0.01, 'low');
T1_50_Force=filtfilt(B,A,T1_50_Force);

figure

plot(T1_50_Force)
title('T1 MVC 50% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T1 50 Filtered Force.jpg');

    %T1 EMG
[D,C]= butter(2,[.03 .5]);
T1_50_EMG_Filtered = filtfilt(D,C,T1_75_EMG);
T1_50_EMG_Rect = abs(T1_50_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T1_50_EMG_Envelope=filtfilt(F,E,T1_50_EMG_Rect);

figure

plot(T1_50_EMG_Envelope)
title('T1 MVC 50% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T1 50 EMG.jpg');

    %T1 max
[T1_50_Force_Max,index]=max(T1_50_Force);
T1_50_EMG_Max=T1_50_EMG_Envelope(index);
    %T1 mean
T1_50_Force_Mean=mean(T1_50_Force(5000:6000));
T1_50_EMG_Mean=mean(T1_50_EMG_Envelope(5000:6000));
    %T1 integral
T1_50_Force_Integral=trapz(T1_50_Time(5000:6000),T1_50_Force(5000:6000));
T1_50_EMG_Integral=trapz(T1_50_Time(5000:6000),T1_50_EMG_Envelope(5000:6000));

    %T2 Force
T2_50_Zero_Force = mean(T2_50_Force(1:1000));  
T2_50_Force=T2_50_Force - T2_50_Zero_Force;
T2_50_Force= T2_50_Force*(2*9.8)/(0.68+0.49);
[B,A] = butter(2, 0.01, 'low');
T2_50_Force=filtfilt(B,A,T2_50_Force);

figure

plot(T2_50_Force)
title('T2 MVC 50% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T2 50 Filtered Force.jpg');

    %T2 EMG
[D,C]= butter(2,[.03 .5]);
T2_50_EMG_Filtered = filtfilt(D,C,T2_50_EMG);
T2_50_EMG_Rect = abs(T2_50_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T2_50_EMG_Envelope=filtfilt(F,E,T2_50_EMG_Rect);

figure

plot(T2_50_EMG_Envelope)
title('T2 MVC 50% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T2 50 EMG.jpg');
%T2 max
[T2_50_Force_Max,index]=max(T2_50_Force);
T2_50_EMG_Max=T2_50_EMG_Envelope(index);
%T2 mean
T2_50_Force_Mean=mean(T2_50_Force(7000:8000));
T2_50_EMG_Mean=mean(T2_50_EMG_Envelope(7000:8000));
%T2 integral
T2_50_Force_Integral=trapz(T2_50_Time(7000:8000),T2_50_Force(7000:8000));
T2_50_EMG_Integral=trapz(T2_50_Time(7000:8000),T2_50_EMG_Envelope(7000:8000));

%T3 Force
T3_50_Zero_Force = mean(T3_50_Force(1:600));  
T3_50_Force=T3_50_Force - T3_50_Zero_Force;
T3_50_Force= T3_50_Force*(2*9.8)/(0.68+0.49);
[B,A] = butter(2, 0.01, 'low');
T3_50_Force=filtfilt(B,A,T3_50_Force);

figure

plot(T3_50_Force)
title('T3 MVC 50% Filtered Force');
ylabel('Force (N)');
xlabel('Index');
saveas(gcf,'T3 50 Filtered Force.jpg');

%T3 EMG
[D,C]= butter(2,[.03 .5]);
T3_50_EMG_Filtered = filtfilt(D,C,T2_50_EMG);
T3_50_EMG_Rect = abs(T3_50_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T3_50_EMG_Envelope=filtfilt(F,E,T3_50_EMG_Rect);


figure

plot(T3_50_EMG_Envelope)
title('T3 MVC 50% EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');
saveas(gcf,'T3 50 EMG.jpg');

    %T3 max
[T3_50_Force_Max,index]=max(T3_50_Force);
T3_50_EMG_Max=T3_50_EMG_Envelope(index);
    %T3 mean
T3_50_Force_Mean=mean(T3_50_Force(5000:6000));
T3_50_EMG_Mean=mean(T3_50_EMG_Envelope(5000:6000));
    %T3 integral
T3_50_Force_Integral=trapz(T3_50_Time(5000:6000),T3_50_Force(5000:6000));
T3_50_EMG_Integral=trapz(T3_50_Time(5000:6000),T3_50_EMG_Envelope(5000:6000));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Curve Fitting Step

%Force Max vs. EMG Max
%Init Macro vector
Force_maxvalues = [T1_00_Force_Max;T2_00_Force_Max;T3_00_Force_Max;T1_10_Force_Max; T2_10_Force_Max;T3_10_Force_Max;T1_25_Force_Max;T2_25_Force_Max;T3_25_Force_Max;T1_50_Force_Max;T2_50_Force_Max;T3_50_Force_Max;T1_75_Force_Max;T2_75_Force_Max;T3_75_Force_Max;T1_100_Force_Max;T2_100_Force_Max;T3_100_Force_Max];
    

EMG_maxvalues =  [T1_00_EMG_Max;T2_00_EMG_Max;T3_00_EMG_Max;T1_10_EMG_Max; T2_10_EMG_Max;T3_10_EMG_Max;T1_25_EMG_Max;T2_25_EMG_Max;T3_25_EMG_Max;T1_50_EMG_Max;T2_50_EMG_Max;T3_50_EMG_Max;T1_75_EMG_Max;T2_75_EMG_Max;T3_75_EMG_Max;T1_100_EMG_Max;T2_100_EMG_Max;T3_100_EMG_Max];




%Manually running cftool so we can label figure more freely/save data
%output for better reference. Make it easier.

%3rd Degree poly Fit
[xData, yData] = prepareCurveData( EMG_maxvalues, Force_maxvalues );
fft = fittype( 'poly3' );
[fitresult, Max_Poly3_Data] = fit( xData, yData, fft );
figure

h = plot( fitresult, xData, yData );
legend( h, 'Force_maxvalues vs. EMG_maxvalues', '3rd degree poly fit of Max Force (N) v. Max EMG (V)', 'Location', 'NorthEast' );
xlabel ('Max EMG (V)')
ylabel ('Max Force (N)')
title('3rd Degree Polynomial Fit of Max Force (N) v. Max EMG (V)');
%uitable([Max_Poly3_Data.sse;Max_Poly3_Data.rsquare;Max_Poly3_Data.dfe;Max_Poly3_Data.adjrsquare;Max_Poly3_Data.rmse])
Max_Poly3 = {'SSE',Max_Poly3_Data.sse;'Rsquare',Max_Poly3_Data.rsquare;'RMSE',Max_Poly3_Data.rmse;'Adjsquare',Max_Poly3_Data.adjrsquare;'dfe',Max_Poly3_Data.dfe};
z = uitable
z.Data = Max_Poly3;
saveas(gcf,'MaxPoly3.jpg');

%2nd Degree poly Fit
[xData, yData] = prepareCurveData( EMG_maxvalues, Force_maxvalues );
fft = fittype( 'poly2' );
[fitresult, Max_Poly2_Data] = fit( xData, yData, fft );
figure

h = plot( fitresult, xData, yData );
legend( h, 'Force_maxvalues vs. EMG_maxvalues', '2nd degree poly fit of Max Force (N) v. Max EMG (V)', 'Location', 'NorthEast' );
xlabel ('Max EMG (V)')
ylabel ('Max Force (N)')
title('2nd Degree Polynomial Fit of Max Force (N) v. Max EMG (V)');
Max_Poly2 = {'SSE',Max_Poly2_Data.sse;'Rsquare',Max_Poly2_Data.rsquare;'RMSE',Max_Poly2_Data.rmse;'Adjsquare',Max_Poly2_Data.adjrsquare;'dfe',Max_Poly2_Data.dfe};
x = uitable
x.Data = Max_Poly2;
saveas(gcf,'MaxPoly2.jpg');


%Linear Fit poly Fit
[xData, yData] = prepareCurveData( EMG_maxvalues, Force_maxvalues );
fft = fittype( 'poly1' );
[fitresult, Max_Poly1_Data] = fit( xData, yData, fft );
figure

h = plot( fitresult, xData, yData );
legend( h, 'Force_maxvalues vs. EMG_maxvalues', 'Linear Fit of Max Force (N) v. Max EMG (V)', 'Location', 'NorthEast' );
xlabel ('Max EMG (V)')
ylabel ('Max Force (N)')
title('Linear Fit of Max Force (N) v. Max EMG (V)');
%uitable([Max_Poly1_Data.sse;Max_Poly1_Data.rsquare;Max_Poly1_Data.dfe;Max_Poly1_Data.adjrsquare;Max_Poly1_Data.rmse])
Max_Poly1 = {'SSE',Max_Poly1_Data.sse;'Rsquare',Max_Poly1_Data.rsquare;'RMSE',Max_Poly1_Data.rmse;'Adjsquare',Max_Poly1_Data.adjrsquare;'dfe',Max_Poly1_Data.dfe};
m = uitable 
m.Data = Max_Poly1;
saveas(gcf,'MaxPoly1.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Mean Force vs Mean EMG

%Init Macro vector
Force_meanvalues = [T1_00_Force_Mean;T2_00_Force_Mean;T3_00_Force_Mean;T1_10_Force_Mean; T2_10_Force_Mean;T3_10_Force_Mean;T1_25_Force_Mean;T2_25_Force_Mean;T3_25_Force_Mean;T1_50_Force_Mean;T2_50_Force_Mean;T3_50_Force_Mean;T1_75_Force_Mean;T2_75_Force_Mean;T3_75_Force_Mean;T1_100_Force_Mean;T2_100_Force_Mean;T3_100_Force_Mean];
    

EMG_meanvalues =  [T1_00_EMG_Mean;T2_00_EMG_Mean;T3_00_EMG_Mean;T1_10_EMG_Mean; T2_10_EMG_Mean;T3_10_EMG_Mean;T1_25_EMG_Mean;T2_25_EMG_Mean;T3_25_EMG_Mean;T1_50_EMG_Mean;T2_50_EMG_Mean;T3_50_EMG_Mean;T1_75_EMG_Mean;T2_75_EMG_Mean;T3_75_EMG_Mean;T1_100_EMG_Mean;T2_100_EMG_Mean;T3_100_EMG_Mean];


%3rd Degree poly Fit
[xData, yData] = prepareCurveData( EMG_meanvalues, Force_meanvalues );
fft = fittype( 'poly3' );
[fitresult, Mean_Poly3_Data] = fit( xData, yData, fft );
figure

h = plot( fitresult, xData, yData );
legend( h, 'Force_meanvalues vs. EMG_meanvalues', '3rd degree poly fit of Mean Force (N) v. Mean EMG (V)', 'Location', 'NorthEast' );
xlabel ('Mean EMG (V)')
ylabel ('Mean Force (N)')
title('3rd Degree Polynomial Fit of Mean Force (N) v. Mean EMG (V)');
%uitable([Mean_Poly3_Data.sse;Mean_Poly3_Data.rsquare;Mean_Poly3_Data.dfe;Mean_Poly3_Data.adjrsquare;Mean_Poly3_Data.rmse])
Mean_Poly3 = {'SSE',Mean_Poly3_Data.sse;'Rsquare',Mean_Poly3_Data.rsquare;'RMSE',Mean_Poly3_Data.rmse;'Adjsquare',Mean_Poly3_Data.adjrsquare;'dfe',Mean_Poly3_Data.dfe};
q = uitable
q.Data = Mean_Poly3;
saveas(gcf,'MeanPoly3.jpg');

%2nd Degree poly Fit
[xData, yData] = prepareCurveData( EMG_meanvalues, Force_meanvalues );
fft = fittype( 'poly2' );
[fitresult, Mean_Poly2_Data] = fit( xData, yData, fft );
figure

h = plot( fitresult, xData, yData );
legend( h, 'Force_meanvalues vs. EMG_meanvalues', '2nd degree poly fit of Mean Force (N) v. Mean EMG (V)', 'Location', 'NorthEast' );
xlabel ('Mean EMG (V)')
ylabel ('Mean Force (N)')
title('2nd Degree Polynomial Fit of Mean Force (N) v. Mean EMG (V)');
Mean_Poly2 = {'SSE',Mean_Poly2_Data.sse;'Rsquare',Mean_Poly2_Data.rsquare;'RMSE',Mean_Poly2_Data.rmse;'Adjsquare',Mean_Poly2_Data.adjrsquare;'dfe',Mean_Poly2_Data.dfe};
w = uitable
w.Data = Mean_Poly2;
saveas(gcf,'MeanPoly2.jpg');


%Linear Fit poly Fit
[xData, yData] = prepareCurveData( EMG_meanvalues, Force_meanvalues );
fft = fittype( 'poly1' );
[fitresult, Mean_Poly1_Data] = fit( xData, yData, fft );
figure

h = plot( fitresult, xData, yData );
legend( h, 'Force_meanvalues vs. EMG_meanvalues', 'Linear Fit of Mean Force (N) v. Mean EMG (V)', 'Location', 'NorthEast' );
xlabel ('Mean EMG (V)')
ylabel ('Mean Force (N)')
title('Linear Fit of Mean Force (N) v. Mean EMG (V)');
%uitable([Mean_Poly1_Data.sse;Mean_Poly1_Data.rsquare;Mean_Poly1_Data.dfe;Mean_Poly1_Data.adjrsquare;Mean_Poly1_Data.rmse])
Mean_Poly1 = {'SSE',Mean_Poly1_Data.sse;'Rsquare',Mean_Poly1_Data.rsquare;'RMSE',Mean_Poly1_Data.rmse;'Adjsquare',Mean_Poly1_Data.adjrsquare;'dfe',Mean_Poly1_Data.dfe};
i = uitable 
i.Data = Mean_Poly1;
saveas(gcf,'MeanPoly1.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Integral Force vs Integral EMG

%Init Macro vector
Force_intvalues = [T1_00_Force_Integral;T2_00_Force_Integral;T3_00_Force_Integral;T1_10_Force_Integral; T2_10_Force_Integral;T3_10_Force_Integral;T1_25_Force_Integral;T2_25_Force_Integral;T3_25_Force_Integral;T1_50_Force_Integral;T2_50_Force_Integral;T3_50_Force_Integral;T1_75_Force_Integral;T2_75_Force_Integral;T3_75_Force_Integral;T1_100_Force_Integral;T2_100_Force_Integral;T3_100_Force_Integral];
    

EMG_intvalues =  [T1_00_EMG_Integral;T2_00_EMG_Integral;T3_00_EMG_Integral;T1_10_EMG_Integral; T2_10_EMG_Integral;T3_10_EMG_Integral;T1_25_EMG_Integral;T2_25_EMG_Integral;T3_25_EMG_Integral;T1_50_EMG_Integral;T2_50_EMG_Integral;T3_50_EMG_Integral;T1_75_EMG_Integral;T2_75_EMG_Integral;T3_75_EMG_Integral;T1_100_EMG_Integral;T2_100_EMG_Integral;T3_100_EMG_Integral];




%Manually running cftool so we can label figure more freely/save data
%output for better reference. Make it easier.

%3rd Degree poly Fit
[xData, yData] = prepareCurveData( EMG_intvalues, Force_intvalues );
fft = fittype( 'poly3' );
[fitresult, Int_Poly3_Data] = fit( xData, yData, fft );
figure

h = plot( fitresult, xData, yData );
legend( h, 'Force_intvalues vs. EMG_intvalues', '3rd degree poly fit of Integral Force (N) v. Integral EMG (V)', 'Location', 'NorthEast' );
xlabel ('Integral EMG (V)')
ylabel ('Integral Force (N)')
title('3rd Degree Polynomial Fit of Integral Force (N) v. Integral EMG (V)');
%uitable([Int_Poly3_Data.sse;Mean_Poly3_Data.rsquare;Mean_Poly3_Data.dfe;Mean_Poly3_Data.adjrsquare;Mean_Poly3_Data.rmse])
Int_Poly3 = {'SSE',Int_Poly3_Data.sse;'Rsquare',Int_Poly3_Data.rsquare;'RMSE',Int_Poly3_Data.rmse;'Adjsquare',Int_Poly3_Data.adjrsquare;'dfe',Int_Poly3_Data.dfe};
p = uitable
p.Data = Int_Poly3;
saveas(gcf,'IntPoly3.jpg');

%2nd Degree poly Fit
[xData, yData] = prepareCurveData( EMG_meanvalues, Force_meanvalues );
fft = fittype( 'poly2' );
[fitresult, Int_Poly2_Data] = fit( xData, yData, fft );
figure

h = plot( fitresult, xData, yData );
legend( h, 'Force_meanvalues vs. EMG_meanvalues', '2nd degree poly fit of Mean Force (N) v. Mean EMG (V)', 'Location', 'NorthEast' );
xlabel ('Integral EMG (V)')
ylabel ('Integral Force (N)')
title('2nd Degree Polynomial Fit of Integral Force (N) v. Integral EMG (V)');
Int_Poly2 = {'SSE',Int_Poly2_Data.sse;'Rsquare',Int_Poly2_Data.rsquare;'RMSE',Int_Poly2_Data.rmse;'Adjsquare',Int_Poly2_Data.adjrsquare;'dfe',Int_Poly2_Data.dfe};
o = uitable
o.Data = Int_Poly2;
saveas(gcf,'IntPoly2.jpg');


%Linear Fit poly Fit
[xData, yData] = prepareCurveData( EMG_meanvalues, Force_meanvalues );
fft = fittype( 'poly1' );
[fitresult, Int_Poly1_Data] = fit( xData, yData, fft );
figure

h = plot( fitresult, xData, yData );
legend( h, 'Force_intvalues vs. EMG_intvalues', 'Linear Fit of Integral Force (N) v. Integral EMG (V)', 'Location', 'NorthEast' );
xlabel ('Integral EMG (V)')
ylabel ('Integral Force (N)')
title('Linear Fit of Integral Force (N) v. Integral EMG (V)');
%uitable([Mean_Poly1_Data.sse;Mean_Poly1_Data.rsquare;Mean_Poly1_Data.dfe;Mean_Poly1_Data.adjrsquare;Mean_Poly1_Data.rmse])
Int_Poly1 = {'SSE',Int_Poly1_Data.sse;'Rsquare',Int_Poly1_Data.rsquare;'RMSE',Int_Poly1_Data.rmse;'Adjsquare',Int_Poly1_Data.adjrsquare;'dfe',Int_Poly1_Data.dfe};
g = uitable 
g.Data = Int_Poly1;
saveas(gcf,'IntPoly1.jpg');
          























































































































































































