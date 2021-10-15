function [otsu, b_otsu, num, c, v, cc] = segmentacao(im)

level = graythresh(im); %obtendo thresold baseado na variância

otsu = im2bw(im,level); %realizando segmentação

% Extraindo contorno
es = strel('arbitrary',[0 1 0 ; 1 1 1 ; 0 1 0]);
b_otsu = imerode(otsu,es);
b_otsu = otsu - b_otsu;

% Obtendo componentes conectados
cc = bwconncomp(b_otsu);
num = cc.NumObjects; %Numero de obstaculos

for k=1:num
    
    v{k} = list2coord(cc.PixelIdxList{k},b_otsu);
    i = floor(sum(v{k}(:,1))./size(cc.PixelIdxList{k},1));
    j = floor(sum(v{k}(:,2))./size(cc.PixelIdxList{k},1));
    
    c(k,1) = i;
    c(k,2) = j;   
end