function [] = Map3D(imagem)
% clear all
% clc

%ponto inicial
q0 = [90 0 0];
[p0] = direta3D_semplot(q0(1),q0(2),q0(3));
save('q0','q0')
save('p0','p0')

%ponto final
pF = [5 10 0];
save('pF','pF')

% tic

% load im1
% m = im1;

im = imagem;
[lin col] = size(im);
if(lin<col)
    im = im';
    [lin col] = size(im);
end

% Aplicando otsu
im = .72.*(1-im);%inversao de cor (objeto branco, fundo preto)
level = graythresh(im); %obtendo thresold baseado na variância

%% Processo de segmentação
otsu = im2bw(im,level); %realizando segmentação

% Extraindo contorno
es = strel('arbitrary',[0 1 0 ; 1 1 1 ; 0 1 0]);
b_otsu = imerode(otsu,es);
b_otsu = otsu - b_otsu;

% Obtendo componentes conectados
cc = bwconncomp(otsu);
num = cc.NumObjects; %Numero de obstaculos

for k=1:num
    
    v{k} = list2coord(cc.PixelIdxList{k},b_otsu);
    i = floor(sum(v{k}(:,1))./size(cc.PixelIdxList{k},1));
    j = floor(sum(v{k}(:,2))./size(cc.PixelIdxList{k},1));
    
    c(k,1) = i;
    c(k,2) = j;   
end

% Calcula raios
r = calcula_r(c,v);

% Somente para plot
circ = zeros(lin,col);

for i=1:num
    circ(c(i,1),c(i,2)) = 1;    
    
    for k=1:360
        x = round(c(i,1) + r(i).*cos(k*pi./180));
        y = round(c(i,2) + r(i).*sin(k*pi./180));
                
        if(x<1)
            x = 1;
        end
        if(x>lin)
            x=lin;
        end
        
        if(y<1)
            y = 1;
        end
        if(y>col)
            y=col;
        end
        circ(x,y) = 1;
    end
end


for k=1:cc.NumObjects
    b_otsu(c(k,1),c(k,2)) = 1;
end
imout = b_otsu+circ;

%% Calculo da altura relativa ao background

count=1;
for i=1:size(im,1)
    for j=1:size(im,2)
        if(im(i,j)<level)
            im2(count)=im(i,j);
            count=count+1;
        end
    end
end

base = mean(im2);

%% Calculo de altura dos obstaculos
for k=1:length(v)
    [lin col] = size(v{k});
    for i=1:lin
        obst{k}(i)=im(v{k}(i,1),v{k}(i,2));
    end
    h(k) = (max(obst{k})-base)*100; %ficar em centrimetros
end
%% Calculo raio do obstaculo 3D
for i=1:length(h)
    R(i)=sqrt(h(i).^2 + (2*r(i)).^2);
end
%% Etapa de desenho de caminho
% Adaptação da escala devido a distancia do sensor e da posiçao devido a
% mudança de imagem para plot
for i=1:size(c,1)
    c2(i,1) = c(i,2);
    c2(i,2) = 64-c(i,1);
end
c = c2;

for k=1:length(v)
    for i=1:size(v{k},1)
        v2(i,1) = v{k}(i,2);
        v2(i,2) = 64-v{k}(i,1);
    end
    v{k} = v2;
end

for k=1:length(v)
    for i=1:size(v{k},1)
        v{k}(i,2) = (54.6./64)*v{k}(i,2);
        v{k}(i,1) = (37.7./50)*v{k}(i,1);
    end
end

for i=1:size(c,1)
    c(i,2) = (54.6./64)*c(i,2);
    c(i,1) = (37.7./50)*c(i,1);
    r(i) = (54.6./64)*r(i);
    R(i) = (54.6./64)*R(i);
end


%%Calculando esferas
dh=.1;
th=0:pi/4:pi;
fi=(0:.15*dh:2).*pi;

ind=1;
for th=0:.1:1
    for k=1:num        
        xo{k} = r(k).*cos(fi) + c(k,1);
        yo{k} = r(k).*sin(fi) + c(k,2);
        zo{k} = (th*h(k));
    end
    ind=ind+1;
    
    tam = size(xo{1},2);
    for i=1:num
        zo{i} = repmat(zo{i},1,tam);
    end
    
    if(th==0)
       xc = xo;
       yc = yo;
       zc = zo;
    end
    
    for i=1:num
       xc{i} = horzcat(xc{i},xo{i});
       yc{i} = horzcat(yc{i},yo{i});
       zc{i} = horzcat(zc{i},zo{i});
    end

end
    

clear ctrl
for k=1:length(r)
    ctrl{k} = [0 0 0];
end

for k=1:length(r)
    rr = 0:.8:r(k);
    for i=1:length(rr)
        ctrlx = rr(i)*cos(fi) + c(k,1);
        ctrly = rr(i)*sin(fi) + c(k,2);
        ctrl{k} = vertcat(ctrl{k},[ctrlx' ctrly' repmat(h(k),length(ctrlx),1)]); 
    end
end

for i=1:num
       xc{i} = horzcat(xc{i},ctrl{i}(:,1)');
       yc{i} = horzcat(yc{i},ctrl{i}(:,2)');
       zc{i} = horzcat(zc{i},ctrl{i}(:,3)');
end

% toc

% figure(5)
% hold on
% 
% h5=plot3(p0(1),p0(2),p0(3),'bo');
% h3=plot3(pF(1),pF(2),pF(3),'r*');
% 
% 
% for i=1:num
%     h1=plot3(xc{i},yc{i},zc{i},'.');
%     h2=plot(v{i}(:,1),v{i}(:,2),'.');
% %     plot3(ctrl{i}(:,1),ctrl{i}(:,2),ctrl{i}(:,3),'k.')
% end
% xlabel('Eixo X')
% ylabel('Eixo Y')
% zlabel('Altura (cm)')
% legend([h5 h3 h1],{'Ponto inicial','Pontos objetivo','Representação do obstáculo'},'Location','NorthOutside')
% grid on
% axis equal tight
% axis([0 37 0 54 0 65])

save('xc','xc')
save('yc','yc')
save('zc','zc')