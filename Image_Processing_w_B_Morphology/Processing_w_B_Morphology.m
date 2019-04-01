%% 7 - made x Felipe E. Sandoval Sibada.
% I. Preprocessing w/ diff. alternative secuential filters
clc, clear all, close all;
[Cells, MAP_Cells] = imread('I_celulas.bmp');
figure, imshow(Cells);

% W RADIO 1
EE_1 = strel('disk', 1); %% EE with different radios
Cells_open = imopen(Cells, EE_1);
Celss_ASF1 = imclose(Cells_open, EE_1);
%imwrite(Celss_ASF1, 'Celss_ASF1.bmp');
% W RADIO 2
EE_2 = strel('disk', 2);
Cells_open = imopen(Celss_ASF1, EE_2); %% USING THE RECONSTRUCTED IMAGE
Celss_ASF2 = imclose(Cells_open, EE_2);
%imwrite(Celss_ASF2, 'Celss_ASF2.bmp');
% W RADIO 3
EE_3 = strel('disk', 3);
Cells_open = imopen(Celss_ASF2, EE_3);
Celss_ASF3 = imclose(Cells_open, EE_3);
%imwrite(Celss_ASF3, 'Celss_ASF3.bmp');

figure, 
subplot(1,3,1), imshow(Celss_ASF1), title('Disk w Radio=1');
subplot(1,3,2), imshow(Celss_ASF2), title('Disk w Radio=2');
subplot(1,3,3), imshow(Celss_ASF3), title('Disk w Radio=3');
