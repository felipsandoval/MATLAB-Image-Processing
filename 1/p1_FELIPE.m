%% PRACTICA 1 - abriendo archivos y guardando sus mapas de color.
clear all, close all, clc;
[Pimientos, MAP_Pimientos]=imread('peppers.png');
[Monedas, MAP_Monedas]=imread('coins.png'); %% AQUI EL MAPA ES 0X0
[Cara, MAP_Cara]=imread('cara.tif');
%% 1. MOSTRAR IMAGENES. IMSHOW + FIGURE PARA QUE NO ME SOBRE ESCRIBA
figure, imshow(Cara); % BINARIA
figure, imshow(Pimientos); % TRUE COLOR
figure, imshow(Monedas); % INTENSITY IMAGE (GRAY SCALE)
%% CON EL COMANDO IMTOOL MUESTRO ADEMAS EL VALOR DE CADA PIXEL
imtool(Cara); % BINARIA
imtool(Pimientos); % TRUE COLOR
imtool(Monedas); % INTENSITY IMAGE (GRAY SCALE)
%% CONVIRTIENDO ALGUNAS IMAGENES (IMAGEN BINARIA A RGB)
MAP_Cara_RGB = [255,255,0 ; 255,0,0]
CaraRGB = ind2rgb(Cara, MAP_Cara_RGB);
figure, imshow(CaraRGB);
%% CONVIRTIENDO ALGUNAS IMAGENES (IMAGEN RGB A BINARIA)
PimientosBW = im2bw(Pimientos);
figure, imshow(PimientosBW);
%% CONVIRTIENDO ALGUNAS IMAGENES (IMAGEN RGB A ESCALA DE GRISES)
PimientosGRAY = rgb2gray(Pimientos);
figure, imshow(PimientosGRAY);
%% CONVIRTIENDO ALGUNAS IMAGENES (IMAGEN RGB A INDEXADA DE 255 NIVELES)
[Pimientos255, MAP_Pimientos255] = rgb2ind(Pimientos, 255);
imtool(Pimientos255, MAP_Pimientos255);
imwrite(Pimientos255, MAP_Pimientos255, 'Pimientos255.jpeg');
%% CONVIRTIENDO ALGUNAS IMAGENES (IMAGEN RGB A INDEXADA DE 5 NIVELES)
[Pimientos5, MAP_Pimientos5] = rgb2ind(Pimientos, 5);
imtool(Pimientos5, MAP_Pimientos5);
imwrite(Pimientos5, MAP_Pimientos5, 'Pimientos5.jpeg');
%% CONVIRTIENDO ALGUNAS IMAGENES (IMAGEN GRIS A INDEXADA DE 5 NIVELES)
[Monedas5, MAP_Monedas5] = gray2ind(Monedas, 5);
imtool(Monedas5, MAP_Monedas5);
%% CONVIRTIENDO ALGUNAS IMAGENES (IMAGEN DE GRISES A BINARIA)
MonedasBW = im2bw(Monedas);
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
[Pimientos, MAP_Pimientos]=imread('peppers.png');
Pimientos_Gray = rgb2gray(Pimientos);
Pimientos_Red = Pimientos(:,:,1);
figure
subplot(2,1,1), imshow(Pimientos_Gray), title('Original en escala de grises');
subplot(2,1,2), imshow(Pimientos_Red), title('Componente roja');
%% HISTOGRAMA DE TODOS LOS COMPONENTES
close all;
figure
Pimientos_Green = Pimientos(:, :, 2);
Pimientos_Blue = Pimientos(:, :, 3);
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
Pimientos_Red_Negativo = Pimientos;
Pimientos_Red_Negativo(:,:,1) = Pimientos_Operados_Red;

Pimientos_Operados_Blue = 255-Pimientos_Blue;
Pimientos_Blue_Negativo = Pimientos;
Pimientos_Blue_Negativo(:,:,3) = Pimientos_Operados_Blue;

Pimientos_Operados_Green = 255-Pimientos_Green;
Pimientos_Green_Negativo = Pimientos;
Pimientos_Green_Negativo(:,:,2) = Pimientos_Operados_Green;


figure 
subplot(3, 1, 1), imshow(Pimientos_Red_Negativo);
subplot(3, 1, 2), imshow(Pimientos_Blue_Negativo);
subplot(3, 1, 3), imshow(Pimientos_Green_Negativo);
% imtool(x);
% Para comprobar que sale bien, el ajo deber�a ser m�s o menos color cyan

%% Representacion de la componente roja (y demas)
close all;
Y = zeros(size(Pimientos));
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
