%this is an example from lecture 9 of a fourier series approximation of a
%square wave symmetric about t=0. The analytical equations for a_k were
%derived on the whiteboard.

%Original Signal Defn
%--------------------
T1 = 0.5; %set T1, see lecture notes
T0 = 16; %set T0
samp_per_T = 1000;
num_T = 5; %make odd for even functions

t = 0:T0/2/samp_per_T:T0/2; %define time vector for half period

for i=1:length(t) %define x(t)
    if t(i) < T1
        x_t(i) = 1;
    else
        x_t(i) = 0;
    end
end

x_t = [flipdim(x_t(2:end),2),x_t]; %x(t) for one period
t = [flipdim(-1*t(2:end),2),t]; %adjust t vector for period

x_t = repmat(x_t,1,num_T); %repeat x(t)
t = linspace(-1*T0/2*(num_T),T0/2*(num_T),length(x_t)); %now adjust t

%plot original signal
figure, subplot(311),handle_x_t = plot(t,x_t,'r');
title('Original Function');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off';
xlabel('t'),

%Fourier Series defs and criteria
w0 = 2.*pi./T0; %set w0
MaxOrd = 100; %highest order in fourier series

ak = complex(zeros(1,2*MaxOrd+1),zeros(1,2*MaxOrd+1));%initialize complex a_k
ak_n = -1*MaxOrd:MaxOrd;

%calculate a_k, k=0 series term
ak (MaxOrd+1) = 2.*T1./T0; 

x = ones(1,length(t)); %initialize x approximation
x = real(x.*ak(MaxOrd+1)); %zeroth order fourier series approx of x

error = zeros(1,length(t));
error = abs(x_t - x).^2;

%plot 1st order aprox
subplot(311),hold on, handle_x_0 = plot(t,x); %plot
title(['k=',num2str(0)]); %the rest of this is formatting figure
subplot(312),handle_ak_0 = stem(ak_n,real(ak));
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off';
ylabel('real(a_k)'),xlabel('k');

subplot(313),handle_e_0 = plot(t,error); %plot
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off';
ylabel('Error Power'),xlabel('t');
pause;

set(handle_x_0,'Visible','off');%closes all figures
set(handle_ak_0,'Visible','off');
set(handle_e_0,'Visible','off');

%this loop calculates a_k for k -MaxOrd to MaxOrd, and then updates the fourier
%series approximation and plots with pause. Hit any button to move through
%pause.

for k_i = 1:MaxOrd

    %first calculate +k
    ak(k_i+MaxOrd+1) = (sin(2.*pi.*k_i.*T1./T0))./(pi.*k_i);
    ak(-1*k_i+MaxOrd+1) = (sin(2.*pi.*-1*k_i.*T1./T0))./(pi.*-1*k_i);
C_xp = ak(k_i+MaxOrd+1).*exp(j.*k_i.*w0.*t);
C_xn = ak(-1*k_i+MaxOrd+1).*exp(j.*-1*k_i.*w0.*t);
x = x + real(C_xp)+ real(C_xn);

error = abs(x_t - x).^2;

subplot(311),
handle_x_n = plot(t,x);
title(['k = +/-',num2str(k_i)]);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off';

subplot(312),
handle_ak_n = stem(ak_n,real(ak));
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off';
ylabel('real(a_k)'),xlabel('k');

subplot(313),
handle_e_n = plot(t,error);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off';
ylabel('Error Power'),xlabel('t');
pause(.5);

set(handle_x_n,'Visible','off');
set(handle_ak_n,'Visible','off');
set(handle_e_n,'Visible','off');
end