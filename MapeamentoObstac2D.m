function [] = MapeamentoObstac2D(imagem)
% clear all
% clc
% Entradas: imagem, pF
% Saidas: xc,yc,c,r
%
% tic

% feature('UseGenericOpenGL',1)
%ponto inicial
q0 = [90 0 0];
[p0] = direta3D_semplot(q0(1),q0(2),q0(3));
save('q0','q0')
save('p0','p0')

%ponto final
pF = [5 10];
save('pF','pF')
% tic
% load im4
% im = im4;

% load im7
% im = im7;

im = imagem;

[lin col] = size(im);
if(lin<col)
    im = im';
    [lin col] = size(im);
end

% Aplicando otsu
im = 1-im;%inversao de cor (objeto branco, fundo preto)
level = graythresh(im); %obtendo thresold baseado na variância
otsu = im2bw(im,level); %realizando segmentação



% Extraindo contorno
es = strel('arbitrary',[0 1 0 ; 1 1 1 ; 0 1 0]);
b_otsu = imerode(otsu,es);
b_otsu = otsu - b_otsu;
% imshow(b_otsu);

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

% Calcula raios
r = calcula_r(c,v);

% Desenha circulos

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


imout = imrotate(imout,180);
imshow(imout);

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
end

% Criando espaço
dh=.1;



d_total = sqrt((p0(1)-pF(1)).^2 + (p0(2)-pF(2)).^2);

%Calculando circulos
th=(0:.1*dh:2).*pi;

for k=1:num
    xo{k} = c(k,1);
    yo{k} = c(k,2);
end


for k=1:num
%     for i=1:2:floor(r(k))5
        xo{k} = r(k).*cos(th);
        yo{k} = r(k).*sin(th);
%         xo{k} = horzcat(xo{k},i.*cos(th));
%         yo{k} = horzcat(yo{k},i.*sin(th));
%     end
end

% c2(1,:) = c(2,:);
% c2(2,:) = c(1,:);
% c = c2;

% c(1,1) = c(1,1) - 10;
% c(2,1) = c(2,1) - 10;
for k=1:num
    xc{k} = xo{k} + c(k,1);
    yc{k} = yo{k} + c(k,2);
%     xc{k} = v{k}(:,2);
%     yc{k} = v{k}(:,1);
end

% toc

figure()
hold on
for i=1:num
   h1=plot(xc{i},yc{i},'.');
   plot(v{i}(:,1),v{i}(:,2),'k.')
end

h5=plot(p0(1),p0(2),'bo');
h3=plot(pF(1),pF(2),'r*');

xlabel('Eixo X')
ylabel('Eixo Y')
zlabel('Altura (cm)')
legend([h5 h3 h1],{'Ponto inicial','Ponto objetivo','Representação do obstáculo'},'Location','NorthOutside')
grid on
axis equal tight
axis([0 37 0 54 0 65])
% xtext = 'Angulo $$\theta_1$$';
% ytext = 'Angulo $$\theta_2$$';
% xlabel(xtext,'Interpreter','Latex','FontSize',15,'Color','k')
% ylabel(ytext,'Interpreter','Latex','FontSize',15,'Color','k')
% xlabel('Eixo x')
% ylabel('Eixo y')
% % toc



save('xc','xc')
save('yc','yc')
save('c','c')
save('r','r')
