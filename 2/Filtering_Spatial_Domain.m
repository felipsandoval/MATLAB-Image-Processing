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
%% NOT LINEAR FILTERS - MEDIAN FILTER - SALT N PEPPER NOISE.
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
Filtered_Coins = imfilter(double(Coins), H,'symmetric'); % WITH MIRROR PADDING

figure, 
subplot(1,2,1), mesh(Filtered_Coins), title('Filtered 3D Graph');
subplot(1,2,2), imshow(Filtered_Coins), title('Filtered image');
%% 3. SPATIAL FILTERS - EDGE ENHANCEMENT WITHOUT TRANSPOSE H AND WITH DOUBLE
clc, close all, clear all;

[Coins, MAP_coins] = imread('coins.png');

figure,
subplot(1,2,1), imshow(Coins), title('Coins');
subplot(1,2,2), mesh(double(Coins)), title('3D Graph');

H = fspecial('prewitt');
H = H';
Filtered_Coins = imfilter(double(Coins), H, 'symmetric'); % WITH MIRROR PADDING

figure,
subplot(1,2,1), mesh(abs(Filtered_Coins)), title('Filtered 3D Graph');
subplot(1,2,2), imshow(uint8(abs(Filtered_Coins))), title('Filtered image');
%% 3. SPATIAL FILTERS - EDGE ENHANCEMENT WITH TRANSPOSE H AND DOUBLE
clc, close all, clear all;

[Coins, MAP_coins] = imread('coins.png');

figure,
subplot(1,2,1), imshow(Coins), title('Coins');
subplot(1,2,2), mesh(double(Coins)), title('3D Graph');

H = fspecial('prewitt');
H_2 = H';
Filtered_Coins = imfilter(double(Coins), H, 'symmetric'); % WITH MIRROR PADDING 
Filtered_Coins_2 = imfilter(double(Coins), H_2, 'symmetric'); % WITH MIRROR PADDING (transpose)

figure,
subplot(1,2,1), mesh(abs(Filtered_Coins)), title('Filtered 3D Graph');
subplot(1,2,2), imshow(uint8(abs(Filtered_Coins))), title('Filtered image');
%% CONTINUE WITH JUST ONE STEP FROM LAST EXECUTION.

Coins_grad_Prewitt = uint8(0.5*(abs(Filtered_Coins) + abs(Filtered_Coins_2))); %Using absolute not double
figure,
subplot(1,2,1), mesh(Coins_grad_Prewitt), title('Gradient graph');
subplot(1,2,2), imshow(Coins_grad_Prewitt), title('Gradient');

Coins_grad_Binary = im2bw(Coins_grad_Prewitt, 0.2);
figure,
subplot(1,2,1), mesh(Coins_grad_Binary), title('Gradient binary graph');
subplot(1,2,2), imshow(Coins_grad_Binary), title('Gradient binary');
 
% Then triying with an isotropic filter.
%% ISOTROPIC FILTER - EDGE ENHANCEMENT
H_ISO = [-1 -1 -1
         -1  8 -1
         -1 -1 -1];
       
H_ISO_TRANSPOSED = H_ISO';
Filtered_Coins_ISO = imfilter(double(Coins), H_ISO, 'symmetric'); % WITH MIRROR PADDING 
Filtered_Coins_2_ISO = imfilter(double(Coins), H_ISO_TRANSPOSED, 'symmetric'); % WITH MIRROR PADDING (transpose)

figure,
subplot(1,2,1), mesh(abs(Filtered_Coins_ISO)), title('Filtered 3D Graph');
subplot(1,2,2), imshow(uint8(abs(Filtered_Coins_2_ISO))), title('Filtered image');

Coins_grad_Prewitt_ISO = uint8(0.5*(abs(Filtered_Coins_ISO) + abs(Filtered_Coins_2_ISO))); %Using absolute not double
figure,
subplot(1,2,1), mesh(Coins_grad_Prewitt_ISO), title('Gradient graph ISO');
subplot(1,2,2), imshow(Coins_grad_Prewitt_ISO), title('Gradient ISO');

Coins_grad_Binary_ISO = im2bw(Coins_grad_Prewitt_ISO, 0.2);
figure,
subplot(1,2,1), mesh(Coins_grad_Binary_ISO), title('Gradient binary graph ISO');
subplot(1,2,2), imshow(Coins_grad_Binary_ISO), title('Gradient binary ISO');
 
% Then triying with an isotropic filter.
%% Filtering with preprocessing

Coins_soft = medfilt2(Coins, [11 11], 'symmetric');
Coins_soft_BW = im2bw(Coins_soft, 0.4);

figure, 
subplot(1,3,1), imshow(Coins_soft);
subplot(1,3,2), imhist(Coins_soft);
subplot(1,3,3), imshow(Coins_soft_BW);

%% 

I_mordor = imread('mordor2.jpg');
figure, subplot(1,2,1);
imhist(I_suav);
%ylim('auto');
subplot(1,2,2);
imshow(I_mordor);
%title('mordor');
%% 4. IMAGE COMPOSITION
