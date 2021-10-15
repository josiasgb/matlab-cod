clear all
close all
clc
load imagem-5;%load imagem-1;
 %path = 'imagens/imagem-1.mat';
% load(path)
load('img_X1.mat');
load('img_Y1.mat');

%Transforma a matriz de profundidade em matriz de intensidade
I = mat2gray(imagem-1);

figure;
imshow(I)

%Inverte a imagem. Preto vira branco e branco vira preto
I2 = 1-I;

%Faz a segmentação da imagem utilizando o método de Otsu
level = graythresh(I2);
BW = im2bw(I, level);
BW = ~BW;

%Remove pixels pequenos
BW = bwareaopen(BW, 20);
figure;
imshow(BW);

%Identificado objeto pela forma
%bwconncomp identifica os objetos
CC = bwconncomp(BW);

%ver quantos objetos tem na cena
n_objects = CC.NumObjects;

%essa variavel ajuda na hora de transformar os indices lineares em indicies
%normais
s = size(I);

%extrai informações dos objetos na cena
stats = regionprops(CC, 'area', 'perimeter');

%Analisa a circularidade dos objetos na cena
for l = 1:n_objects
    idx = CC.PixelIdxList{l};
    
    area = stats(l).Area;
    perimeter = stats(l).Perimeter;
    
    %indicador de circularidade
    %fonte: http://angeljohnsy.blogspot.com/2012/05/find-area-perimeter-centroid.html
    roundness = (4*area*pi)/(perimeter^2);
    
    if roundness < 0.90
        [R, C] = ind2sub(s, idx);
        BW(R,C) = 0;
    end
end

figure;
imshow(BW)


%Desenhar um circulo involta do desenho
stats = regionprops(BW,'Centroid','MajorAxisLength','MinorAxisLength');
centers = stats.Centroid;
diameters = stats.MajorAxisLength;
radii = diameters/2;
% hold on
% viscircles(centers,radii);
% hold off

circle = MidpointCircle(zeros(64,50), radii, centers(2), centers(1), 1 );
figure;
imshow(circle)

[xp, yp] = find(circle);
xc = zeros(1,length(xp));
yc = zeros(1,length(yp));

for i=1:length(xc)
    xc(i) = X(xp(i), yp(i));
    yc(i) = Y(xp(i), yp(i));
    
end
  
xcc = X(round(centers(2)), round(centers(1)));
ycc = Y(round(centers(2)), round(centers(1)));

save('xc', 'xc');
save('yc', 'yc');