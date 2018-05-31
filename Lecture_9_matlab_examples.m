%this is an example from lecture 9 of a fourier series approximation of a
%square wave symmetric about t=0. The analytical equations for a_k were
%derived on the whiteboard.

t = -5:.01:5; %define time vector
T1 = 0.5; %set T1, see lecture notes
T0 = 2; %set T0
w0 = 2.*pi./T0; %set w0
ak (1) = 2.*T1./T0; %calculate a_k, k=0 series term
x = ones(1,length(t)); %initialize x approximation
x = x*ak; %zeroth order fourier series approx of x
figure, plot(t,x); %plot
title(['k=',num2str(0)]); %the rest of this is formatting figure
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off';

%this loop calculates a_k for k 1 to 50, and then updates the fourier
%series approximation and plots with pause. Hit any button to move through
%pause.
for k_i = 1:50
ak(k_i+1) = (sin(2.*pi.*k_i.*T1./T0))./(pi.*k_i);
C_x = ak(k_i+1).*exp(j.*k_i.*w0.*t);
x = x + real(C_x);
plot(t,x);
title(['k=',num2str(k_i)]);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.Box = 'off';
pause;
end