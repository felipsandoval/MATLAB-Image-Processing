%% 2nd TASK - made x Felipe E. Sandoval Sibada.
%  1. Creating images and adding diff. types of noises.

clc, clear all, close all;
%8 Bits image, Grayscale, 256x256 (MXN), luminance 128
Artificial_Image = 128 * ones(256,256);

Artificial_Image = uint8(Artificial_Image);
%other way - Artificial_Image = 128 + zeros(256,256);

figure,
subplot(2,1,1), imshow(Artificial_Image), title('8 Bits image');
subplot(2,1,2), imhist(Artificial_Image), title('Histogram');
%% Adding noise

Img_GaussianNoise = imnoise(Artificial_Image, 'gaussian', 0, 0.02);
Img_SaltnPepperNoise = imnoise(Artificial_Image, 'speckle', 0.02);
Img_SpeckleNoise = imnoise(Artificial_Image, 'salt & pepper', 0.02);

figure,
subplot(2,4,1), imshow(Artificial_Image), title('Original');
subplot(2,4,2), imshow(Img_GaussianNoise), title('+ Gaussian Noise');
subplot(2,4,3), imshow(Img_SpeckleNoise), title('+ Speckle Noise');
subplot(2,4,4), imshow(Img_SaltnPepperNoise), title('+ Salt n Pepper Noise');
subplot(2,4,5), imhist(Artificial_Image), title('Original - Histogram'), axis auto;
subplot(2,4,6), imhist(Img_GaussianNoise), title('Gaussian Noise - Histogram'), axis auto;
subplot(2,4,7), imhist(Img_SpeckleNoise), title('Speckle Noise - Histogram'), axis auto;
subplot(2,4,8), imhist(Img_SaltnPepperNoise), title('Salt n Pepper Noise - Histogram'), axis auto;

%% 2. Spatial Softener Filters - LSI. GAUSSIAN NOISE.

Mask1 = (1/25)*ones(5,5);     % 1/(mxn)
Mask2 = (1/1225)*ones(35,35); % 1/(mxn)

% ZERO PADDING is used by default.
GaussianFilter_1 = imfilter(Img_GaussianNoise, Mask1);
GaussianFilter_2 = imfilter(Img_GaussianNoise, Mask2);

figure, 
subplot(2,2,1), imshow(GaussianFilter_1), title('GAUSS filter 5x5');
subplot(2,2,2), imhist(GaussianFilter_1), title('GAUSS filter 5x5 histogram'), axis auto;
subplot(2,2,3), imshow(GaussianFilter_2), title('GAUSS filter 35x35');
subplot(2,2,4), imhist(GaussianFilter_2), title('GAUSS filter 35x35 histogram'), axis auto;

% with MIRROR PADDING.
GaussianFilter_3 = imfilter(Img_GaussianNoise, Mask1, 'symmetric');
GaussianFilter_4 = imfilter(Img_GaussianNoise, Mask2, 'symmetric');

figure, 
subplot(2,2,1), imshow(GaussianFilter_3), title('GAUSS filter 5x5');
subplot(2,2,2), imhist(GaussianFilter_3), title('GAUSS filter 5x5 histogram'), axis auto;
subplot(2,2,3), imshow(GaussianFilter_4), title('GAUSS filter 35x35');
subplot(2,2,4), imhist(GaussianFilter_4), title('GAUSS filter 35x35 histogram'), axis auto;

%NOTE: Masks are double type and the images uint8.
%% SPECKLE NOISE

% ZERO PADDING is used by default.
SpeckleNoiseFilter_1 = imfilter(Img_SpeckleNoise, Mask1);
SpeckleNoiseFilter_2 = imfilter(Img_SpeckleNoise, Mask2);

% WITH MIRROR PADDING.
SpeckleNoiseFilter_3 = imfilter(Img_SpeckleNoise, Mask1, 'symmetric');
SpeckleNoiseFilter_4 = imfilter(Img_SpeckleNoise, Mask2, 'symmetric');

% with ZERO PADDING.
figure, 
subplot(2,2,1), imshow(SpeckleNoiseFilter_1), title('SPECKLE filter 5x5');
subplot(2,2,2), imhist(SpeckleNoiseFilter_1), title('SPECKLE filter 5x5 histogram'), axis auto;
subplot(2,2,3), imshow(SpeckleNoiseFilter_2), title('SPECKLE filter 35x35');
subplot(2,2,4), imhist(SpeckleNoiseFilter_2), title('SPECKLE filter 35x35 histogram'), axis auto;

% WITH MIRROR PADDING.
figure, 
subplot(2,2,1), imshow(SpeckleNoiseFilter_3), title('SPECKLE filter 5x5');
subplot(2,2,2), imhist(SpeckleNoiseFilter_3), title('SPECKLE filter 5x5 histogram'), axis auto;
subplot(2,2,3), imshow(SpeckleNoiseFilter_4), title('SPECKLE filter 35x35');
subplot(2,2,4), imhist(SpeckleNoiseFilter_4), title('SPECKLE filter 35x35 histogram'), axis auto;

%% SALT N PEPPER NOISE

% ZERO PADDING is used by default.
SaltnPepperNoiseFilter_1 = imfilter(Img_SaltnPepperNoise, Mask1);
SaltnPepperNoiseFilter_2 = imfilter(Img_SaltnPepperNoise, Mask2);

% WITH MIRROR PADDING.
SaltnPepperNoiseFilter_3 = imfilter(Img_SaltnPepperNoise, Mask1, 'symmetric');
SaltnPepperNoiseFilter_4 = imfilter(Img_SaltnPepperNoise, Mask2, 'symmetric');

% WITH ZERO PADDING.
figure, 
subplot(2,2,1), imshow(SaltnPepperNoiseFilter_1), title('SaltnPepper filter 5x5');
subplot(2,2,2), imhist(SaltnPepperNoiseFilter_1), title('SaltnPepper filter 5x5 histogram'), axis auto;
subplot(2,2,3), imshow(SaltnPepperNoiseFilter_2), title('SaltnPepper filter 35x35');
subplot(2,2,4), imhist(SaltnPepperNoiseFilter_2), title('SaltnPepper filter 35x35 histogram'), axis auto;

% WITH MIRROR PADDING.
figure, 
subplot(2,2,1), imshow(SaltnPepperNoiseFilter_3), title('SaltnPepper filter 5x5');
subplot(2,2,2), imhist(SaltnPepperNoiseFilter_3), title('SaltnPepper filter 5x5 histogram'), axis auto;
subplot(2,2,3), imshow(SaltnPepperNoiseFilter_4), title('SaltnPepper filter 35x35');
subplot(2,2,4), imhist(SaltnPepperNoiseFilter_4), title('SaltnPepper filter 35x35 histogram'), axis auto;
%% 2.NO LINEAR FILTERS - MEDIAN FILTER - GAUSSIAN NOISE.
close all;

% WITH ZERO PADDING.
GaussianFilter_Median1 = medfilt2(Img_GaussianNoise, [5,5]);
GaussianFilter_Median2 = medfilt2(Img_GaussianNoise, [35,35]);

figure, 
subplot(2,2,1), imshow(GaussianFilter_Median1), title('Median GAUSS filter 5x5');
subplot(2,2,2), imhist(GaussianFilter_Median1), title('Median GAUSS filter 5x5 histogram'), axis auto;
subplot(2,2,3), imshow(GaussianFilter_Median2), title('Median GAUSS filter 35x35');
subplot(2,2,4), imhist(GaussianFilter_Median2), title('Median GAUSS filter 35x35 histogram'), axis auto;

%CON'MIRROR PADDING'.
GaussianFilter_Median3 = medfilt2(Img_GaussianNoise, [5,5], 'symmetric');
GaussianFilter_Median4 = medfilt2(Img_GaussianNoise, [35,35], 'symmetric');

figure, 
subplot(2,2,1), imshow(GaussianFilter_Median3), title('Median GAUSS filter 5x5');
subplot(2,2,2), imhist(GaussianFilter_Median3), title('Median GAUSS filter 5x5 histogram'), axis auto;
subplot(2,2,3), imshow(GaussianFilter_Median4), title('Median GAUSS filter 35x35');
subplot(2,2,4), imhist(GaussianFilter_Median4), title('Median GAUSS filter 35x35 histogram'), axis auto;

%% NO LINEAR FILTERS - MEDIAN FILTER - SPECKLE NOISE.
close all;

% WITH ZERO PADDING.
SpeckleFilter_Median1 = medfilt2(Img_SpeckleNoise, [5,5]);
SpeckleFilter_Median2 = medfilt2(Img_SpeckleNoise, [35,35]);

figure, 
subplot(2,2,1), imshow(SpeckleFilter_Median1), title('Median SPECKLE filter 5x5');
subplot(2,2,2), imhist(SpeckleFilter_Median1), title('Median SPECKLE filter 5x5 histogram'), axis auto;
subplot(2,2,3), imshow(SpeckleFilter_Median2), title('Median SPECKLE filter 35x35');
subplot(2,2,4), imhist(SpeckleFilter_Median2), title('Median SPECKLE filter 35x35 histogram'), axis auto;

% WITH MIRROR PADDING.
SpeckleFilter_Median3 = medfilt2(Img_SpeckleNoise, [5,5], 'symmetric');
SpeckleFilter_Median4 = medfilt2(Img_SpeckleNoise, [35,35], 'symmetric');

figure, 
subplot(2,2,1), imshow(SpeckleFilter_Median3), title('Median SPECKLE filter 5x5');
subplot(2,2,2), imhist(SpeckleFilter_Median3), title('Median SPECKLE filter 5x5 histogram'), axis auto;
subplot(2,2,3), imshow(SpeckleFilter_Median4), title('Median SPECKLE filter 35x35');
subplot(2,2,4), imhist(SpeckleFilter_Median4), title('Median SPECKLE filter 35x35 histogram'), axis auto;
%% NO LINEAR FILTERS - MEDIAN FILTER - SALT N PEPPER NOISE.
close all;

% WITH ZERO PADDING.
SnP_Median1 = medfilt2(Img_SaltnPepperNoise, [5,5]);
SnP_Median2 = medfilt2(Img_SaltnPepperNoise, [35,35]);

figure, 
subplot(2,2,1), imshow(SnP_Median1), title('Median SALT N PEPPER filter 5x5');
subplot(2,2,2), imhist(SnP_Median1), title('Median SALT N PEPPER filter 5x5 histogram'), axis auto;
subplot(2,2,3), imshow(SnP_Median2), title('Median SALT N PEPPER filter 35x35');
subplot(2,2,4), imhist(SnP_Median2), title('Median SALT N PEPPER filter 35x35 histogram'), axis auto;

%CON'MIRROR PADDING'.
SnP_Median3 = medfilt2(Img_SaltnPepperNoise, [5,5], 'symmetric');
SnP_Median4 = medfilt2(Img_SaltnPepperNoise, [35,35], 'symmetric');

figure, 
subplot(2,2,1), imshow(SnP_Median3), title('Median SALT N PEPPER filter 5x5');
subplot(2,2,2), imhist(SnP_Median3), title('Median SALT N PEPPER filter 5x5 histogram'), axis auto;
subplot(2,2,3), imshow(SnP_Median4), title('Median SALT N PEPPER filter 35x35');
subplot(2,2,4), imhist(SnP_Median4), title('Median SALT N PEPPER filter 35x35 histogram'), axis auto;
%% 3. SPATIAL FILTERS - EDGE ENHANCEMENT
clc, close all, clear all;

[Coins, MAP_coins] = imread('coins.png');
figure,
subplot(1,2,1), imshow(Coins), title('Coins');
subplot(1,2,2), mesh(double(Coins)), title('3D Graph');

H = fspecial('prewitt'); % NOT USING DOUBLE TYPE IN THIS CASE
Filtered_Coins = imfilter(Coins, H,'symmetric'); % WITH MIRROR PADDING

figure, 
subplot(1,2,1), mesh(Filtered_Coins), title('Filtered 3D Graph');
subplot(1,2,2), imshow(Filtered_Coins), title('Filtered image');
clc, close all, clear all;

%% 3. SPATIAL FILTERS - EDGE ENHANCEMENT USING DOUBLE TYPE
[Coins, MAP_coins] = imread('coins.png');
figure,
subplot(1,2,1), imshow(Coins), title('Coins');
subplot(1,2,2), mesh(double(Coins)), title('3D Graph');

H = fspecial('prewitt'); % IM USING DOUBLE TYPE IN THIS CASE
Filtered_Coins = imfilter(Double(Coins), H, 'symmetric'); % CON MIRROR PADDING PARA NO TENER CONTORNO NEGRO

figure, 
subplot(1,2,1), mesh(Filtered_Coins), title('Filtered 3D Graph');
subplot(1,2,2), imshow(Filtered_Coins), title('Filtered image');
%%
H = fspecial('prewitt');
Filtered_Coins = imfilter(double(I),H,'symmetric'); figure, mesh(Filtered_Coins)
H = fspecial('prewitt');
Filtered_Coins = imfilter(double(I),H,'symmetric'); figure, mesh(abs(Filtered_Coins))
figure, imshow(uint8(abs(Filtered_Coins)))
H = fspecial('prewitt')
Filtered_Coins = imfilter(I,H,'symmetric'); H_prew2 = H';
I_Hprew2 = imfilter(I,H_prew2, 'symmetric'); I_grad_Prewitt = uint8(0.5*(double(Filtered_Coins) +double(I_Hprew2)));
figure, imshow(I_grad_Prewitt)
Filtered_Coins = imfilter(double(I),H,'symmetric');
I_Hprew2 =
imfilter(double(I),H_prew2 ,'symmetric');
I_grad_Prewitt = uint8(0.5*(abs(Filtered_Coins) +abs(I_Hprew2)));
figure, imshow(I_grad_Prewitt)