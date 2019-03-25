%% 6º TASK - made x Felipe E. Sandoval Sibada.
% Opening image
clc, clear all, close all;
[Chip, MAP_Chip] =  imread('Board_Recorte.tif');

figure,imshow(Chip), title('Chip');

Chip_R = Chip(:,:,1); 
Chip_G = Chip(:,:,2);
Chip_B = Chip(:,:,3);

figure, 
subplot(1, 3, 1), imshow(Chip_R), title('Red Component');
subplot(1, 3, 2), imshow(Chip_G), title('Green Component');
subplot(1, 3, 3), imshow(Chip_B), title('Blue Component');

% From RGB to HSI
[Chip_HSI_H, Chip_HSI_S, Chip_HSI_I] = rgb2hsi(Chip);
figure, 
subplot(2, 3, 1), imshow(Chip_HSI_H), title('Hue Component');
subplot(2, 3, 2), imshow(Chip_HSI_S), title('Saturation Component');
subplot(2, 3, 3), imshow(Chip_HSI_I), title('Intensity Component');

subplot(2, 3, 4), imhist(Chip_HSI_H), title('Hue Histogram');
subplot(2, 3, 5), imhist(Chip_HSI_S), title('Saturation Histogram');
subplot(2, 3, 6), imhist(Chip_HSI_I), title('Intensity Histogram');
% Saturation is the most useful component in this case.
%% II. Umbralization and filtering
figure, imhist(Chip_HSI_S), title('Saturation Histogram');

% Scalar value for umbralization
Level = graythresh(Chip_HSI_S);
% OTSU METHOD: Computes a global threshold (LEVEL) that can be
% used to convert an intensity image to a binary image with IMBINARIZE.
% LEVEL is a normalized intensity value that lies in the range [0, 1].
% graythresh uses Otsu's method, which chooses the threshold to minimize
% the intraclass variance of the thresholded black and white pixels.

Chip_Umbral_Binary = im2bw(Chip_HSI_S, Level);

Chip_Umbral_Binary = uint8(255 * Chip_Umbral_Binary);
figure, 
subplot(1,2,1), imshow(Chip_Umbral_Binary), title('Chip Umbralization Binary');
subplot(1,2,2), imhist(Chip_Umbral_Binary), title('Chip Umbralization Histogram');
% From logical to uint8. DR = [0, 255]

% Applying a median filter for better umbralization
Chip_Umbral_Filtered = medfilt2(Chip_Umbral_Binary, [5 5]);
% I might try with with a 3x3 mask

figure, 
subplot(1,2,1), imshow(Chip_Umbral_Filtered), title('Chip Filtered Umbralization');
subplot(1,2,2), imhist(Chip_Umbral_Filtered), title('Chip Filtered Umbralization Histogram');

figure,
subplot(1,3,1), imshow(Chip_HSI_S), title('Chip Saturation Component');
subplot(1,3,2), imshow(Chip_Umbral_Binary), title('Chip Umbralization');
subplot(1,3,3), imshow(Chip_Umbral_Filtered), title('Chip Umbralization Filtered');

%% III. Applying Morfologic Operators
%% EXPLANATION OF HOW RGB2HSI
%function [h,s,i] = rgb2hsi(rgb)
% Transformaci�n del espacio de color RGB al espacio HSI
% Sintaxis: [h,s,i] = rgb2hsi(rgb)
% donde
% h: componente de tono
% s: componente de saturaci�n
% i: componente de intensidad

% Asignamos variables.
%rgb = im2double(rgb);
%r = rgb(:,:,1);
%g = rgb(:,:,2);
%b = rgb(:,:,3);

% Calculamos la componente h.
%theta = acos(((1/2).*((r-g)+(r-b)))./(sqrt((r-g).^2+(r-b).*(g-b))+eps));
%h = theta;
%h(b>g) = 2*pi - theta(b>g);
%h = h/(2*pi);

% Calculamos la componente s.
%s = 1 - 3.*min(min(r,g),b)./(r+g+b+eps);

% Calculamos la componente i.
%i = (r+g+b)/3;