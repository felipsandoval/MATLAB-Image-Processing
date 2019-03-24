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
%% Adding noises
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
subplot(2,4,7), imhist(Img_SpeckleNoise), title('Con Ruido Speckle'), axis auto;
subplot(2,4,8), imhist(Img_SaltnPepperNoise), title('Con Ruido Salt n Pepper'), axis auto;


%% 2. FILTRADO ESPACIAL SUAVIZADOR - Filtrado lineal. RUIDO GAUSSIANO
Mascara_Lineal1 = (1/25)*ones(5,5);
Mascara_Lineal2 = (1/1225)*ones(35,35); %1/mxn

%SE USA POR DEFECTO 'ZERO PADDING'.
Img_RuidoGaussiano_Filtro1 = imfilter(Img_GaussianNoise, Mascara_Lineal1);
Img_RuidoGaussiano_Filtro2 = imfilter(Img_GaussianNoise, Mascara_Lineal2);

figure, 
subplot(2,2,1), imshow(Img_RuidoGaussiano_Filtro1), title('Filtro GAUSS 5x5');
subplot(2,2,2), imhist(Img_RuidoGaussiano_Filtro1), title('Histograma con filtro GAUSS'), axis auto;
subplot(2,2,3), imshow(Img_RuidoGaussiano_Filtro2), title('Filtro GAUSS 35x35');
subplot(2,2,4), imhist(Img_RuidoGaussiano_Filtro2), title('Histograma con filtro GAUSS 35x35'), axis auto;

% CON MIRROR PADDING.
Img_RuidoGaussiano_Filtro3 = imfilter(Img_GaussianNoise, Mascara_Lineal1, 'symmetric');
Img_RuidoGaussiano_Filtro4 = imfilter(Img_GaussianNoise, Mascara_Lineal2, 'symmetric');

figure, 
subplot(2,2,1), imshow(Img_RuidoGaussiano_Filtro3), title('Filtro GAUSS 5x5');
subplot(2,2,2), imhist(Img_RuidoGaussiano_Filtro3), title('Histograma con filtro GAUSS - MIRROR PADDING'), axis auto;
subplot(2,2,3), imshow(Img_RuidoGaussiano_Filtro4), title('Filtro GAUSS 35x35');
subplot(2,2,4), imhist(Img_RuidoGaussiano_Filtro4), title('Histograma con filtro GAUSS 35x35 - MIRROR PADDING'), axis auto;

%NOTA: LAS MASCARAS SON DE TIPO DOUBLE, y las IMAGENES de UINT8.
% Como el contorno es mas oscuro se crean valores fuera de la campana.
% Con MIRROR PADDING, no ocurre.
%% RUIDO SPECKLE

% CON'ZERO PADDING'.
Img_RuidoSpeckle_Filtro1 = imfilter(Img_SpeckleNoise, Mascara_Lineal1);
Img_RuidoSpeckle_Filtro2 = imfilter(Img_SpeckleNoise, Mascara_Lineal2);
% CON'MIRROR PADDING'.
Img_RuidoSpeckle_Filtro3 = imfilter(Img_SpeckleNoise, Mascara_Lineal1, 'symmetric');
Img_RuidoSpeckle_Filtro4 = imfilter(Img_SpeckleNoise, Mascara_Lineal2, 'symmetric');

% CON'ZERO PADDING'.
figure, 
subplot(2,2,1), imshow(Img_RuidoSpeckle_Filtro1), title('Filtro SPECKLE 5x5');
subplot(2,2,2), imhist(Img_RuidoSpeckle_Filtro1), title('Histograma con filtro SPECKLE'), axis auto;
subplot(2,2,3), imshow(Img_RuidoSpeckle_Filtro2), title('Filtro SPECKLE 35x35');
subplot(2,2,4), imhist(Img_RuidoSpeckle_Filtro2), title('Histograma con filtro SPECKLE 35x35'), axis auto;

% CON'MIRROR PADDING'.
figure, 
subplot(2,2,1), imshow(Img_RuidoSpeckle_Filtro3), title('Filtro SPECKLE 5x5');
subplot(2,2,2), imhist(Img_RuidoSpeckle_Filtro3), title('Histograma con filtro SPECKLE - MIRROR PADDING'), axis auto;
subplot(2,2,3), imshow(Img_RuidoSpeckle_Filtro4), title('Filtro SPECKLE 35x35');
subplot(2,2,4), imhist(Img_RuidoSpeckle_Filtro4), title('Histograma con filtro SPECKLE 35x35 - MIRROR PADDING'), axis auto;

%% RUIDO SALT N PEPPER

% CON'ZERO PADDING'.
Img_RuidoSaltnPepper_Filtro1 = imfilter(Img_SaltnPepperNoise, Mascara_Lineal1);
Img_RuidoSaltnPepper_Filtro2 = imfilter(Img_SaltnPepperNoise, Mascara_Lineal2);
% CON'MIRROR PADDING'.
Img_RuidoSaltnPepper_Filtro3 = imfilter(Img_SaltnPepperNoise, Mascara_Lineal1, 'symmetric');
Img_RuidoSaltnPepper_Filtro4 = imfilter(Img_SaltnPepperNoise, Mascara_Lineal2, 'symmetric');

% CON'ZERO PADDING'.
figure, 
subplot(2,2,1), imshow(Img_RuidoSaltnPepper_Filtro1), title('Filtro SaltnPepper 5x5');
subplot(2,2,2), imhist(Img_RuidoSaltnPepper_Filtro1), title('Histograma con filtro SaltnPepper'), axis auto;
subplot(2,2,3), imshow(Img_RuidoSaltnPepper_Filtro2), title('Filtro SaltnPepper 35x35');
subplot(2,2,4), imhist(Img_RuidoSaltnPepper_Filtro2), title('Histograma con filtro SaltnPepper 35x35'), axis auto;

% CON'MIRROR PADDING'.
figure, 
subplot(2,2,1), imshow(Img_RuidoSaltnPepper_Filtro3), title('Filtro SaltnPepper 5x5');
subplot(2,2,2), imhist(Img_RuidoSaltnPepper_Filtro3), title('Histograma con filtro SaltnPepper - MIRROR PADDING'), axis auto;
subplot(2,2,3), imshow(Img_RuidoSaltnPepper_Filtro4), title('Filtro SaltnPepper 35x35');
subplot(2,2,4), imhist(Img_RuidoSaltnPepper_Filtro4), title('Histograma con filtro SaltnPepper 35x35 - MIRROR PADDING'), axis auto;
%% 2.FILTRADO NO LINEAL - FILTRO DE MEDIANA - RUIDO GAUSSIANO
close all;
%CON'ZERO PADDING'.
Img_RuidoGaussiano_Median1 = medfilt2(Img_GaussianNoise, [5,5]);
Img_RuidoGaussiano_Median2 = medfilt2(Img_GaussianNoise, [35,35]);

figure, 
subplot(2,2,1), imshow(Img_RuidoGaussiano_Median1), title('Filtro mediana a GAUSS 5x5');
subplot(2,2,2), imhist(Img_RuidoGaussiano_Median1), title('Histograma con filtro mediana GAUSS 5x5'), axis auto;
subplot(2,2,3), imshow(Img_RuidoGaussiano_Median2), title('Filtro mediana a GAUSS35x35');
subplot(2,2,4), imhist(Img_RuidoGaussiano_Median2), title('Histograma con filtro mediana GAUSS 35x35'), axis auto;

%CON'MIRROR PADDING'.
Img_RuidoGaussiano_Median3 = medfilt2(Img_GaussianNoise, [5,5], 'symmetric');
Img_RuidoGaussiano_Median4 = medfilt2(Img_GaussianNoise, [35,35], 'symmetric');

figure, 
subplot(2,2,1), imshow(Img_RuidoGaussiano_Median3), title('Filtro mediana a GAUSS 5x5 - MIRROR P.');
subplot(2,2,2), imhist(Img_RuidoGaussiano_Median3), title('Histograma con filtro mediana GAUSS 5x5 - MIRROR P.'), axis auto;
subplot(2,2,3), imshow(Img_RuidoGaussiano_Median4), title('Filtro mediana a GAUSS35x35 - MIRROR P.');
subplot(2,2,4), imhist(Img_RuidoGaussiano_Median4), title('Histograma con filtro mediana GAUSS 35x35 - MIRROR P.'), axis auto;

%% FILTRADO NO LINEAL - FILTRO DE MEDIANA - RUIDO SPECKLE
close all;
%CON'ZERO PADDING'.
Img_RuidoSpeckle_Median1 = medfilt2(Img_SpeckleNoise, [5,5]);
Img_RuidoSpeckle_Median2 = medfilt2(Img_SpeckleNoise, [35,35]);

figure, 
subplot(2,2,1), imshow(Img_RuidoSpeckle_Median1), title('Filtro mediana a SPECKLE 5x5');
subplot(2,2,2), imhist(Img_RuidoSpeckle_Median1), title('Histograma con filtro mediana SPECKLE 5x5'), axis auto;
subplot(2,2,3), imshow(Img_RuidoSpeckle_Median2), title('Filtro mediana a SPECKLE 35x35');
subplot(2,2,4), imhist(Img_RuidoSpeckle_Median2), title('Histograma con filtro mediana SPECKLE 35x35'), axis auto;

%CON'MIRROR PADDING'.
Img_RuidoSpeckle_Median3 = medfilt2(Img_SpeckleNoise, [5,5], 'symmetric');
Img_RuidoSpeckle_Median4 = medfilt2(Img_SpeckleNoise, [35,35], 'symmetric');

figure, 
subplot(2,2,1), imshow(Img_RuidoSpeckle_Median3), title('Filtro mediana a SPECKLE 5x5 - MIRROR P.');
subplot(2,2,2), imhist(Img_RuidoSpeckle_Median3), title('Histograma con filtro mediana SPECKLE 5x5 - MIRROR P.'), axis auto;
subplot(2,2,3), imshow(Img_RuidoSpeckle_Median4), title('Filtro mediana a SPECKLE 35x35 - MIRROR P.');
subplot(2,2,4), imhist(Img_RuidoSpeckle_Median4), title('Histograma con filtro mediana SPECKLE 35x35 - MIRROR P.'), axis auto;
%% FILTRADO NO LINEAL - FILTRO DE MEDIANA - RUIDO SALT N PEPPER
close all;
%CON'ZERO PADDING'.
Img_RuidoSnP_Median1 = medfilt2(Img_SaltnPepperNoise, [5,5]);
Img_RuidoSnP_Median2 = medfilt2(Img_SaltnPepperNoise, [35,35]);

figure, 
subplot(2,2,1), imshow(Img_RuidoSnP_Median1), title('Filtro mediana a SaltnPepper 5x5');
subplot(2,2,2), imhist(Img_RuidoSnP_Median1), title('Histograma con filtro mediana SaltnPepper 5x5'), axis auto;
subplot(2,2,3), imshow(Img_RuidoSnP_Median2), title('Filtro mediana a SaltnPepper 35x35');
subplot(2,2,4), imhist(Img_RuidoSnP_Median2), title('Histograma con filtro mediana SaltnPepper 35x35'), axis auto;

%CON'MIRROR PADDING'.
Img_RuidoSnP_Median3 = medfilt2(Img_SaltnPepperNoise, [5,5], 'symmetric');
Img_RuidoSnP_Median4 = medfilt2(Img_SaltnPepperNoise, [35,35], 'symmetric');

figure, 
subplot(2,2,1), imshow(Img_RuidoSnP_Median3), title('Filtro mediana a SaltnPepper 5x5 - MIRROR P.');
subplot(2,2,2), imhist(Img_RuidoSnP_Median3), title('Histograma con filtro mediana SaltnPepper 5x5 - MIRROR P.'), axis auto;
subplot(2,2,3), imshow(Img_RuidoSnP_Median4), title('Filtro mediana a SaltnPepper 35x35 - MIRROR P.');
subplot(2,2,4), imhist(Img_RuidoSnP_Median4), title('Histograma con filtro mediana SaltnPepper 35x35 - MIRROR P.'), axis auto;
%% 3. FILTROS ESPACIALES DE REALCE DE CONTORNO
clc, close all, clear all;

[Monedas, MAP_monedas] = imread('coins.png');
figure,
subplot(1,2,1), imshow(Monedas), title('Imagen monedas');
subplot(1,2,2), mesh(double(Monedas)), title('Representación en 3D');

H = fspecial('prewitt'); % OJO EN ESTE EJEMPLO NO USO EL TIPO DE DATOS DOUBLE.
Moneda_Filtrada = imfilter(Monedas, H,'symmetric'); % CON MIRROR PADDING PARA NO TENER CONTORNO NEGRO

figure, 
subplot(1,2,1), mesh(Moneda_Filtrada), title('Representación en 3D Filtrada');
subplot(1,2,2), imshow(Moneda_Filtrada), title('Imagen Filtrada');
clc, close all, clear all;

%% 3. FILTROS ESPACIALES DE REALCE DE CONTORNO USANDO DOUBLE
[Monedas, MAP_monedas] = imread('coins.png');
figure,
subplot(1,2,1), imshow(Monedas), title('Imagen monedas');
subplot(1,2,2), mesh(double(Monedas)), title('Representación en 3D');

H = fspecial('prewitt'); % OJO EN ESTE EJEMPLO SI USO EL TIPO DE DATOS DOUBLE.
Moneda_Filtrada = imfilter(Double(Monedas), H, 'symmetric'); % CON MIRROR PADDING PARA NO TENER CONTORNO NEGRO

figure, 
subplot(1,2,1), mesh(Moneda_Filtrada), title('Representación en 3D Filtrada');
subplot(1,2,2), imshow(Moneda_Filtrada), title('Imagen Filtrada');
%%
H = fspecial('prewitt');
Moneda_Filtrada = imfilter(double(I),H,'symmetric'); figure, mesh(Moneda_Filtrada)
H = fspecial('prewitt');
Moneda_Filtrada = imfilter(double(I),H,'symmetric'); figure, mesh(abs(Moneda_Filtrada))
figure, imshow(uint8(abs(Moneda_Filtrada)))
H = fspecial('prewitt')
Moneda_Filtrada = imfilter(I,H,'symmetric'); H_prew2 = H';
I_Hprew2 = imfilter(I,H_prew2, 'symmetric'); I_grad_Prewitt = uint8(0.5*(double(Moneda_Filtrada) +double(I_Hprew2)));
figure, imshow(I_grad_Prewitt)
Moneda_Filtrada = imfilter(double(I),H,'symmetric');
I_Hprew2 =
imfilter(double(I),H_prew2 ,'symmetric');
I_grad_Prewitt = uint8(0.5*(abs(Moneda_Filtrada) +abs(I_Hprew2)));
figure, imshow(I_grad_Prewitt)