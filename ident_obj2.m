function [] = ident_obj2(imagem)

%configurações dos pontos final e inicial
%ponto inicial
%q0 = [-10 50 0];
% q0 = [-70 185 0];
q0 = [58 6 0];

[p0] = direta3D_semplot(q0(1),q0(2),q0(3));
%[p0] = direta3D_semplot(q0(1),q0(2));
save('q0','q0')
save('p0','p0')

%ponto final
pF = [-42 -43];%[10 0]; %[10 -11]; %[-10, -11];[10, -11] [-42 -43]

save('pF','pF')

load('img_X.mat');
load('img_Y.mat');

% %Transforma a matriz de profundidade em matriz de intensidade
% I = mat2gray(imagem);
% 
%figure;
%imshow(I)
% 
% %Inverte a imagem. Preto vira branco e branco vira preto
% I2 = 1-I;

%Filtra o objeto na cena baseado na altura
altura_teto = 0.24;
altura_piso = 0.14;

%Cria uma matriz com o tamanho dos objetos na cena.
aux = max(max(imagem)) - imagem;
%Filtra pixels maior que o teto
aux(aux > altura_teto) = 1;
%Filtra pixels menor que o piso
aux(aux < altura_piso) = 1;
%Cria uma matriz lógica de 0 e 1
aux(aux ~= 1) = 0;


% %Faz a segmentação da imagem utilizando o método de Otsu
% level = graythresh(I2);
% BW = im2bw(I, level);
% BW = ~BW;

%Remove pixels pequenos
% BW = bwareaopen(BW, 20);
BW = bwareaopen(~aux, 15);
 %figure;
 %imshow(BW);

BW = imfill(BW, 'holes');
% figure;
% imshow(BW);

%Identificado objeto pela forma
%bwconncomp identifica os objetos
CC = bwconncomp(BW);

%ver quantos objetos tem na cena
n_objects = CC.NumObjects;

%essa variavel ajuda na hora de transformar os indices lineares em indicies
%normais
%s = size(I);
s = size(BW);

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

%  figure;
% imshow(BW)


%Desenhar um circulo involta do desenho
stats = regionprops(BW,'Centroid','MajorAxisLength','MinorAxisLength');
centers = stats.Centroid;
diameters = stats.MajorAxisLength;
radii = diameters/2;

% hold on
% viscircles(centers,radii);
% hold off

circle = MidpointCircle(zeros(64,50), radii, centers(2), centers(1), 1 );

[xp, yp] = find(circle);
xcc = zeros(1,length(xp));
ycc = zeros(1,length(yp));

l=1;
for i=1:length(xcc)
    try
        xcc(l) = X(xp(i), yp(i));
        ycc(l) = Y(xp(i), yp(i));
        l = l+1;
    catch
    end
end

xc{1} = xcc
yc{1} = ycc

%Ponto do Centro
xc{2} = X(round(centers(2)), round(centers(1)));
yc{2} = Y(round(centers(2)), round(centers(1)));

save('xc', 'xc');
save('yc', 'yc');

