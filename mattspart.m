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
title('T1 100 Filtered Force');
ylabel('Force (N)');
xlabel('Index');

    %T1 EMG
[D,C]= butter(2,[.03 .5]);
T1_100_EMG_Filtered = filtfilt(D,C,T1_100_EMG);
T1_100_EMG_Rect = abs(T1_100_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T1_100_EMG_Envelope=filtfilt(F,E,T1_100_EMG_Rect);

figure

plot(T1_100_EMG_Envelope)
title('T1 100 EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');

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
title('T2 100 Filtered Force');
ylabel('Force (N)');
xlabel('Index');

    %T2 EMG
[D,C]= butter(2,[.03 .5]);
T2_100_EMG_Filtered = filtfilt(D,C,T2_100_EMG);
T2_100_EMG_Rect = abs(T2_100_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T2_100_EMG_Envelope=filtfilt(F,E,T2_100_EMG_Rect);

figure

plot(T2_100_EMG_Envelope)
title('T2 100 EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');

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
title('T3 100 Filtered Force');
ylabel('Force (N)');
xlabel('Index');

    %T3 EMG
[D,C]= butter(2,[.03 .5]);
T3_100_EMG_Filtered = filtfilt(D,C,T2_100_EMG);
T3_100_EMG_Rect = abs(T3_100_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T3_100_EMG_Envelope=filtfilt(F,E,T3_100_EMG_Rect);

figure

plot(T3_100_EMG_Envelope)
title('T3 100 EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');

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
title('T1 75 Filtered Force');
ylabel('Force (N)');
xlabel('Index');

    %T1 EMG
[D,C]= butter(2,[.03 .5]);
T1_75_EMG_Filtered = filtfilt(D,C,T1_75_EMG);
T1_75_EMG_Rect = abs(T1_75_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T1_75_EMG_Envelope=filtfilt(F,E,T1_75_EMG_Rect);

figure

plot(T1_75_EMG_Envelope)
title('T1 75 EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');

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
title('T2 75 Filtered Force');
ylabel('Force (N)');
xlabel('Index');

    %T2 EMG
[D,C]= butter(2,[.03 .5]);
T2_75_EMG_Filtered = filtfilt(D,C,T2_75_EMG);
T2_75_EMG_Rect = abs(T2_75_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T2_75_EMG_Envelope=filtfilt(F,E,T2_75_EMG_Rect);

figure

plot(T2_75_EMG_Envelope)
title('T2 75 EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');

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
title('T1 50 Filtered Force');
ylabel('Force (N)');
xlabel('Index');

    %T1 EMG
[D,C]= butter(2,[.03 .5]);
T1_50_EMG_Filtered = filtfilt(D,C,T1_75_EMG);
T1_50_EMG_Rect = abs(T1_50_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T1_50_EMG_Envelope=filtfilt(F,E,T1_50_EMG_Rect);

figure

plot(T1_50_EMG_Envelope)
title('T1 50 EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');

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
title('T2 50 Filtered Force');
ylabel('Force (N)');
xlabel('Index');

    %T2 EMG
[D,C]= butter(2,[.03 .5]);
T2_50_EMG_Filtered = filtfilt(D,C,T2_50_EMG);
T2_50_EMG_Rect = abs(T2_50_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T2_50_EMG_Envelope=filtfilt(F,E,T2_50_EMG_Rect);

figure

plot(T2_50_EMG_Envelope)
title('T2 50 EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');

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
title('T3 50 Filtered Force');
ylabel('Force (N)');
xlabel('Index');

    %T3 EMG
[D,C]= butter(2,[.03 .5]);
T3_50_EMG_Filtered = filtfilt(D,C,T2_50_EMG);
T3_50_EMG_Rect = abs(T3_50_EMG_Filtered);
[F,E] = butter(2,0.01,'low');
T3_50_EMG_Envelope=filtfilt(F,E,T3_50_EMG_Rect);

figure

plot(T3_50_EMG_Envelope)
title('T3 50 EMG (Filtered/Rectified/Envelope)');
ylabel('EMG (Volts)');
xlabel('Index');

    %T3 max
[T3_50_Force_Max,index]=max(T3_50_Force);
T3_50_EMG_Max=T3_50_EMG_Envelope(index);
    %T3 mean
T3_50_Force_Mean=mean(T3_50_Force(5000:6000));
T3_50_EMG_Mean=mean(T3_50_EMG_Envelope(5000:6000));
    %T3 integral
T3_50_Force_Integral=trapz(T3_50_Time(5000:6000),T3_50_Force(5000:6000));
T3_50_EMG_Integral=trapz(T3_50_Time(5000:6000),T3_50_EMG_Envelope(5000:6000));