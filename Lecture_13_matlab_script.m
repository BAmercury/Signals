A = imread('Fourier.png'); %note that the image file must be in either the working directory or the filepath of Matlab
figure(1),imshow(A); %displays the picture
figure(2), plot(A(:,100,2));xlabel('pixel no.'),ylabel('Green Color Value'); %plots one row profile across the image

S  = fspecial('average', [15 15]); %creates an averaging filter (i.e. integration, low-pass filter)
A_lowfilt = imfilter(A,S,'replicate'); %applies filter
figure(3), imshow(A_lowfilt);
figure(2),hold on,plot(A_lowfilt(:,100,2),'r');xlabel('pixel no.'),ylabel('Green Color Value'); %plots smooted line trace in red

E  = fspecial('sobel'); %creates a sobel edge filter (i.e. differentiation, high pass filter) 
A_efilt = imfilter(A,E,'replicate'); % apply filter
figure(4), imshow(A_efilt);
figure(2), hold on, plot(A_efilt(:,100,2),'k'),xlabel('pixel no.'),ylabel('Green Color Value'); %plots filtered line trace in 