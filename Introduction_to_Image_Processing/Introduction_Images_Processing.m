%% 1st TASK - made x Felipe E. Sandoval Sibada.
%  1. Reading, visualization and storing images.

clear all, close all, clc;
[Peppers, MAP_Peppers]=imread('peppers.png');
[Coins, MAP_Coins]=imread('coins.png');
[Face, MAP_Face]=imread('cara.tif');

%% 1. VISUALIZATION OF IMAGES. IMSHOW + FIGURE for not overwriting.

figure, imshow(Face); % BINARY IMAGE
figure, imshow(Peppers); % TRUE COLOR IMAGE
figure, imshow(Coins); % INTENSITY IMAGE (GRAY SCALE)
%% With IMTOOL I can watch each pixel information
imtool(Face); % BINARY IMAGE
imtool(Peppers); % TRUE COLOR
imtool(Coins); % INTENSITY IMAGE (GRAY SCALE)
%% Transformation process (BINARY TO RGB)
MAP_Face_RGB = [255,255,0; 0,255,0];
FaceRGB = ind2rgb(Face, MAP_Face_RGB);
figure, imshow(FaceRGB);
%% Transformation process (RGB TO BINARY)
PeppersBW = im2bw(Peppers);
figure, imshow(PeppersBW);
%% Transformation process (RGB TO GRAYSCALE)
PeppersGRAY = rgb2gray(Peppers);
figure, imshow(PeppersGRAY);
%% Transformation process (RGB TO INDEXED OF 255 LEVELS)
[Peppers255, MAP_Peppers255] = rgb2ind(Peppers, 255);
imtool(Peppers255, MAP_Peppers255);
imwrite(Peppers255, MAP_Peppers255, 'Peppers255levels.jpeg');
%% Transformation process (RGB TO INDEXED OF 5 LEVELS)
[Peppers5, MAP_Peppers5] = rgb2ind(Peppers, 5);
imtool(Peppers5, MAP_Peppers5);
imwrite(Peppers5, MAP_Peppers5, 'Peppers5levels.jpeg');
%% Transformation process (GRAYSCALE TO INDEXED OF 5 LEVELS)
[Coins5, MAP_Coins5] = gray2ind(Coins, 5);
imtool(Coins5, MAP_Coins5);
%% Transformation process  (GREYSCALE TO BINARY)
CoinsBW = im2bw(Coins);
figure, imshow(CoinsBW);
% figure, imhist(MonedasBW) displays histogram from image
imwrite(CoinsBW, 'CoinsBw.jpeg');

%% 2. CHANGES IN SPATIAL RESOLUTION AND INTENSITY.

clc, clear all, close all;
[Lena_512, MAP_Lena_512] = imread('Lena_512.tif');
Lena_256 = imresize(Lena_512,0.5);
imwrite(Lena_256, 'Lena_256.tif');
Lena_128 = imresize(Lena_512, 0.25);
imwrite(Lena_128, 'Lena_128.tif');
%% Selecting the smaller resolution and interpolating.
Lena_128a = imresize(Lena_128, 4);
imwrite(Lena_128a, 'Lena_128a.tif');
figure, imshow(Lena_128a)

%% NEAREST AND BILINEAR DIFF.
Lena_512a = imresize(Lena_128,4,'nearest'); 
Lena_512b = imresize(Lena_128,4,'bilinear'); 
figure, 
subplot(1,2,1), imshow(Lena_512a), title('Nearest');
subplot(1,2,2), imshow(Lena_512b), title('Bilinear');
%% Changing intensity levels

[Lena_512_16, MAP_16] = gray2ind(Lena_512, 16);
[Lena_512_4, MAP_4] = gray2ind(Lena_512, 4);
[Lena_512_2, MAP_2] = gray2ind(Lena_512, 2);

subplot(1,3,1), imshow(Lena_512_16,MAP_16), title('16 levels');
subplot(1,3,2), imshow(Lena_512_4,MAP_4), title('4 levels');
subplot(1,3,3), imshow(Lena_512_2,MAP_2), title('2 levels');

%% 3. HISTOGRAM Y CONTRAST STRETCHING.
close all;

figure
subplot(4,1,1), imhist(Lena_512), title('Original Histogram');
subplot(4,1,2), imhist(Lena_512_16, MAP_16), title('Histogram 16 levels');
subplot(4,1,3), imhist(Lena_512_4, MAP_4), title('Histogram 4 levels');
subplot(4,1,4), imhist(Lena_512_2, MAP_2), title('Histogram 2 levels');

% figure, imhist(Lena_512_2, 256), axis auto;
%% HISTOGRAM EQUALIZATION
clc, close all;

I = imread('pout.tif'); 
I_eq = histeq(I);
figure,
subplot(2,1,1), imshow(I), title('Original');
subplot(2,1,2), imshow(I_eq), title('Equalized');

figure 
subplot(2,1,1), imhist(I), title('Original histogram');
subplot(2,1,2), imhist(I_eq), title('Histogram Equalization');

%% 3. COLOR INTERPRETATION AND POINT TRANSFORMATIONS

clear all, close all, clc;

[Peppers, MAP_Peppers]=imread('peppers.png');
Peppers_Gray = rgb2gray(Peppers);
Peppers_Red = Peppers(:,:,1);

figure,
subplot(2,1,1), imshow(Peppers_Gray), title('Grayscale');
subplot(2,1,2), imshow(Peppers_Red), title('Red Component');
%% ALL HISTOGRAMS
close all;

Peppers_Green = Peppers(:, :, 2);
Peppers_Blue = Peppers(:, :, 3);

figure,
subplot(2, 3, 1), imshow(Peppers_Red), title('R component');
subplot(2, 3, 2), imshow(Peppers_Green), title('G component');
subplot(2, 3, 3), imshow(Peppers_Blue), title('B component');
subplot(2, 3, 4), imhist(Peppers_Red), title('Histogram R');
subplot(2, 3, 5), imhist(Peppers_Green), title('Histogram G');
subplot(2, 3, 6), imhist(Peppers_Blue), title('Histogram B');

%% Negative and recomposition
close all;
%Peppers_Negative_Red = -Peppers_Red + 255; Bad!!!
Peppers_Operated_Red = 255-Peppers_Red; % Good!!!
% 
% Trying to recreate de original image keeping G and B components and
% negative R component.

% x(:,:,1) = NI_roja;
 
Peppers_Negative_Red = Peppers;
Peppers_Negative_Red(:,:,1) = Peppers_Operated_Red;

Peppers_Operated_Blue = 255-Peppers_Blue;
Peppers_Blue_Negative = Peppers;
Peppers_Blue_Negative(:,:,3) = Peppers_Operated_Blue;

Peppers_Operated_Green = 255-Peppers_Green;
Peppers_Green_Negative = Peppers;
Peppers_Green_Negative(:,:,2) = Peppers_Operated_Green;


figure 
subplot(1, 3, 1), imshow(Peppers_Negative_Red);
subplot(1, 3, 2), imshow(Peppers_Blue_Negative);
subplot(1, 3, 3), imshow(Peppers_Green_Negative);
% imtool(x);

%% Red component representation

close all;
Y = zeros(size(Peppers));
Y_red = uint8(Y); % uint8 convertion!
Y_blue = uint8(Y); % uint8 convertion!
Y_green = uint8(Y); % uint8 convertion!
Y_red(:,:,1) = Peppers_Red;
Y_green(:,:,2) = Peppers_Green;
Y_blue(:,:,3) = Peppers_Blue;

figure,
subplot(2, 3, 1), imshow(Y_red), title('Red');
subplot(2, 3, 3), imshow(Y_green), title('Green');
subplot(2, 3, 2), imshow(Y_blue), title('Blue');
subplot(2, 3, 4), imhist(Y_red), title('R Histogram');
subplot(2, 3, 5), imhist(Y_green), title('G Histogram');
subplot(2, 3, 6), imhist(Y_blue), title('B Histogram');
