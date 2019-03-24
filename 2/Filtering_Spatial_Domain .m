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

%% RUIDO SALT N PEPPER

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
%% 2.FILTRADO NO LINEAL - FILTRO DE MEDIANA - RUIDO GAUSSIANO
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