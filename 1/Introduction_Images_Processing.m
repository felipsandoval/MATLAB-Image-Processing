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
CaraRGB = ind2rgb(Face, MAP_Face_RGB);
figure, imshow(CaraRGB);
%% Transformation process (RGB TO BINARY)
PimientosBW = im2bw(Peppers);
figure, imshow(PimientosBW);
%% %% Transformation process (RFB TO GRAYSCALE)
PimientosGRAY = rgb2gray(Peppers);
figure, imshow(PimientosGRAY);
%% CONVIRTIENDO ALGUNAS IMAGENES (IMAGEN RGB A INDEXADA DE 255 NIVELES)
[Pimientos255, MAP_Pimientos255] = rgb2ind(Peppers, 255);
imtool(Pimientos255, MAP_Pimientos255);
imwrite(Pimientos255, MAP_Pimientos255, 'Pimientos255.jpeg');
%% CONVIRTIENDO ALGUNAS IMAGENES (IMAGEN RGB A INDEXADA DE 5 NIVELES)
[Pimientos5, MAP_Pimientos5] = rgb2ind(Peppers, 5);
imtool(Pimientos5, MAP_Pimientos5);
imwrite(Pimientos5, MAP_Pimientos5, 'Pimientos5.jpeg');
%% CONVIRTIENDO ALGUNAS IMAGENES (IMAGEN GRIS A INDEXADA DE 5 NIVELES)
[Monedas5, MAP_Monedas5] = gray2ind(Coins, 5);
imtool(Monedas5, MAP_Monedas5);
%% CONVIRTIENDO ALGUNAS IMAGENES (IMAGEN DE GRISES A BINARIA)
MonedasBW = im2bw(Coins);
figure, imshow(MonedasBW);
% figure, imhist(MonedasBW) para poder ver su Histograma
imwrite(MonedasBW, 'MonedasBw.jpeg');

%% 2. MODIFICACION DE RESOLUCION ESPACIAL Y DE LA INTENSIDAD.
clc, clear all, close all;
[Lena_512, MAP_Lena_512] = imread('Lena_512.tif');
Lena_256 = imresize(Lena_512,0.5);
imwrite(Lena_256, 'Lena_256.tif');
Lena_128 = imresize(Lena_512, 0.25);
imwrite(Lena_128, 'Lena_128.tif');
%% Selecciono la imagen de menor resolucion espacial y la interpolo
Lena_128a = imresize(Lena_128, 4);
imwrite(Lena_128a, 'Lena_128a.tif');
figure, imshow(Lena_128a)

%% EXPLICAR QUE HACE ESTO DE NEAREST Y BILINEAR
Lena_512a = imresize(Lena_128,4,'nearest'); 
figure, imshow(Lena_512a)
Lena_512b = imresize(Lena_128,4,'bilinear'); 
figure, imshow(Lena_512b)
%% REDIMENSIONANDO LOS NIVELES DE INTENSIDAD

[Lena_512_16, MAP_16] = gray2ind(Lena_512, 16);
figure, imshow(Lena_512_16,MAP_16), title('16 niveles');

[Lena_512_4, MAP_4] = gray2ind(Lena_512, 4);
figure, imshow(Lena_512_4,MAP_4), title('4 niveles');

[Lena_512_2, MAP_2] = gray2ind(Lena_512, 2);
figure, imshow(Lena_512_2,MAP_2), title('2 niveles');
imtool(Lena_512_2,MAP_2);

%% 3. HISTOGRAMA Y MEJORA DE CONTRASTE.
close all;

figure
subplot(4,1,1), imhist(Lena_512), title('Histograma Original');
subplot(4,1,2), imhist(Lena_512_16, MAP_16), title('Histograma 16');
subplot(4,1,3), imhist(Lena_512_4, MAP_4), title('Histograma 4');
subplot(4,1,4), imhist(Lena_512_2, MAP_2), title('Histograma 2');

% figure, imhist(Lena_512_2, 256), axis auto;
%% ECUALIZANDO EL CONTRASTE

clc, close all;
I = imread('pout.tif'); 
I_eq = histeq(I);
figure 
subplot(2,1,1), imshow(I), title('Imagen Original');
subplot(2,1,2), imshow(I_eq), title('Imagen Ecualizada');

figure 
subplot(2,1,1), imhist(I), title('Histograma Imagen Original');
subplot(2,1,2), imhist(I_eq), title('Histograma Imagen Ecualizada');

%% 3. INTERPRETACION DEL COLOR Y TRANSFORMACIONES PUNTUALES.
clear all, close all, clc;
[Peppers, MAP_Peppers]=imread('peppers.png');
Pimientos_Gray = rgb2gray(Peppers);
Pimientos_Red = Peppers(:,:,1);
figure
subplot(2,1,1), imshow(Pimientos_Gray), title('Original en escala de grises');
subplot(2,1,2), imshow(Pimientos_Red), title('Componente roja');
%% HISTOGRAMA DE TODOS LOS COMPONENTES
close all;
figure
Pimientos_Green = Peppers(:, :, 2);
Pimientos_Blue = Peppers(:, :, 3);
subplot(2, 3, 1), imshow(Pimientos_Red), title('Comp. R');
subplot(2, 3, 2), imshow(Pimientos_Green), title('Comp. G');
subplot(2, 3, 3), imshow(Pimientos_Blue), title('Comp. B');
subplot(2, 3, 4), imhist(Pimientos_Red), title('Histograma R');
subplot(2, 3, 5), imhist(Pimientos_Green), title('Histograma G');
subplot(2, 3, 6), imhist(Pimientos_Blue), title('Histograma B');

%% Negativo y recomposicion
close all;
%Pimientos_Operados_Red = -Pimientos_Red + 255; Mal!!!
Pimientos_Operados_Red = 255-Pimientos_Red; % Bien!
% 
% Volver a construir la imagen original, conservando G y B pero a�adiendo
% el negativo de la componente roja.
% 1) Copia de la imagen original
% x = I_peppers;
% x(:,:,1) = NI_roja;
% 
Pimientos_Red_Negativo = Peppers;
Pimientos_Red_Negativo(:,:,1) = Pimientos_Operados_Red;

Pimientos_Operados_Blue = 255-Pimientos_Blue;
Pimientos_Blue_Negativo = Peppers;
Pimientos_Blue_Negativo(:,:,3) = Pimientos_Operados_Blue;

Pimientos_Operados_Green = 255-Pimientos_Green;
Pimientos_Green_Negativo = Peppers;
Pimientos_Green_Negativo(:,:,2) = Pimientos_Operados_Green;


figure 
subplot(3, 1, 1), imshow(Pimientos_Red_Negativo);
subplot(3, 1, 2), imshow(Pimientos_Blue_Negativo);
subplot(3, 1, 3), imshow(Pimientos_Green_Negativo);
% imtool(x);
% Para comprobar que sale bien, el ajo deber�a ser m�s o menos color cyan

%% Representacion de la componente roja (y demas)
close all;
Y = zeros(size(Peppers));
Y_red = uint8(Y); % Conversion a uint8 necesaria!
Y_blue = uint8(Y); % Conversion a uint8 necesaria!
Y_green = uint8(Y); % Conversion a uint8 necesaria!
Y_red(:,:,1) = Pimientos_Red;
Y_blue(:,:,3) = Pimientos_Blue;
Y_green(:,:,2) = Pimientos_Green;

figure,
subplot(2, 3, 1), imshow(Y_red), title('Red');
subplot(2, 3, 2), imshow(Y_blue), title('Blue');
subplot(2, 3, 3), imshow(Y_green), title('Green');
subplot(2, 3, 4), imhist(Y_red), title('Histograma R');
subplot(2, 3, 5), imhist(Y_blue), title('Histograma B');
subplot(2, 3, 6), imhist(Y_green), title('Histograma G');
