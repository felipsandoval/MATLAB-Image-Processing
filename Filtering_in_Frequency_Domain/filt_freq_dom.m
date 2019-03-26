%% 3rd TASK - made x Felipe E. Sandoval Sibada.
%  1. Frequency representation
clc, close all, clear all;
[Triangle, MAP_Triangle] = imread('triangulo.bmp');
Triangle_FFT = fftshift(fft2(double(Triangle), 256, 256)); 
FFT_Module = abs(Triangle_FFT);
FFT_Phase = angle(Triangle_FFT);

% FFT uses complex numbers. To plot them I will need to get the module
% and the phase

figure,
subplot(2,3,1), imshow(Triangle), title('Original');
subplot(2,3,2), imshow(FFT_Module, []), title('FFT MODULE'); %% [] To adjust DR
subplot(2,3,3), imshow(FFT_Phase, []), title('FFT PHASE');
subplot(2,3,4), mesh(Triangle), title('Original graph'), axis auto;
subplot(2,3,5), mesh(FFT_Module), title('FFT MODULE graph'), axis auto;
subplot(2,3,6), mesh(FFT_Phase), title('FFT PHASE graph'), axis auto;
suptitle('Graph of triangle image in frequency domain');

% Energy is concentrated in 0 axis value. The module have 3 orientations.

Delta = max(FFT_Module(:)); 
% Delta Component Value in continue domain (at 0,0,0 axis)

%%  Frequency representation for the triangle displaced
clc, close all, clear all;
[Triangle_desp, MAP_Triangle] = imread('triangulodesp.bmp');
Triangle_FFT = fftshift(fft2(double(Triangle_desp), 256, 256)); 
FFT_Module = abs(Triangle_FFT);
FFT_Phase = angle(Triangle_FFT);

% FFT uses complex numbers. To plot them I will need to get the module
% and the phase

figure,
subplot(2,3,1), imshow(Triangle_desp), title('Original');
subplot(2,3,2), imshow(FFT_Module, []), title('FFT MODULE'); %% [] To adjust DR
subplot(2,3,3), imshow(FFT_Phase, []), title('FFT PHASE');
subplot(2,3,4), mesh(Triangle_desp), title('Original graph'), axis auto;
subplot(2,3,5), mesh(FFT_Module), title('FFT MODULE graph'), axis auto;
subplot(2,3,6), mesh(FFT_Phase), title('FFT PHASE graph'), axis auto;
suptitle('Graph of triangle image in frequency domain');

% Energy is concentrated in 0 axis value. The module have 3 orientations.
Delta = max(FFT_Module(:)); 
% Delta Component Value in continue domain (at 0,0,0 axis)

%%  Frequency representation for the triangle rotated
clc, close all, clear all;
[Triangle_rotated, MAP_Triangle] = imread('triangulogirado.bmp');
Triangle_FFT = fftshift(fft2(double(Triangle_rotated), 256, 256)); 
FFT_Module = abs(Triangle_FFT);
FFT_Phase = angle(Triangle_FFT);

% FFT uses complex numbers. To plot them I will need to get the module
% and the phase

figure,
subplot(2,3,1), imshow(Triangle_rotated), title('Original');
subplot(2,3,2), imshow(FFT_Module, []), title('FFT MODULE'); %% [] To adjust DR
subplot(2,3,3), imshow(FFT_Phase, []), title('FFT PHASE');
subplot(2,3,4), mesh(Triangle_rotated), title('Original graph'), axis auto;
subplot(2,3,5), mesh(FFT_Module), title('FFT MODULE graph'), axis auto;
subplot(2,3,6), mesh(FFT_Phase), title('FFT PHASE graph'), axis auto;
suptitle('Graph of triangle image in frequency domain');

% Energy is concentrated in 0 axis value. The module have 3 orientations.
Delta = max(FFT_Module(:)); 
% Delta Component Value in continue domain (at 0,0,0 axis)
%%  Frequency representation for the triangle zoomed out
clc, close all, clear all;
[Triangle_zoom, MAP_Triangle] = imread('triangulozoom.bmp');
Triangle_FFT = fftshift(fft2(double(Triangle_zoom), 256, 256)); 
FFT_Module = abs(Triangle_FFT);
FFT_Phase = angle(Triangle_FFT);

% FFT uses complex numbers. To plot them I will need to get the module
% and the phase

figure,
subplot(2,3,1), imshow(Triangle_zoom), title('Original');
subplot(2,3,2), imshow(FFT_Module, []), title('FFT MODULE'); %% [] To adjust DR
subplot(2,3,3), imshow(FFT_Phase, []), title('FFT PHASE');
subplot(2,3,4), mesh(Triangle_zoom), title('Original graph'), axis auto;
subplot(2,3,5), mesh(FFT_Module), title('FFT MODULE graph'), axis auto;
subplot(2,3,6), mesh(FFT_Phase), title('FFT PHASE graph'), axis auto;
suptitle('Graph of triangle image in frequency domain');

% Energy is concentrated in 0 axis value. The module have 3 orientations.
Delta = max(FFT_Module(:)); 
% Delta Component Value in continue domain (at 0,0,0 axis)
