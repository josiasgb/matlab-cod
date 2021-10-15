clear all
clc

tic

% feature('UseGenericOpenGL',1)

% load im4;
% m = im4;
% im = m;
load imagem
m = imagem;
im = m;
[lin col] = size(im);
if(lin<col)
    im = im';
    [lin col] = size(im);
end

% figure(1)
% imshow(im);

% Aplicando otsu
im = 1-im;%inversao de cor (objeto branco, fundo preto)
level = graythresh(im); %obtendo thresold baseado na variância

%% Para analise 3D
k=1;
kk = 1;
max = 0;
for i=1:lin
    for j=1:col
        if(im(i,j)<level)
            count(k) = im(i,j);
            k=k+1;
        else
            count_max(kk) = im(i,j);
            kk=kk+1;
%             if(max<im(i,j))
%                 max = im(i,j);
%             end
        end
    end
end

figure(10)
imhist(im);
title('Completo')
axis([0 1 0 100])

figure(11)
imhist(count);
title('Background')
axis([0 1 0 100])

figure(12)
imhist(count_max);
title('Obstáculos')
axis([0 1 0 100])

for i=1:lin
    for j=1:col
        if(im(i,j)<level)
            m2(i,j) = mode(count);
        else
            m2(i,j) = im(i,j); 
%             m2(i,j) = max; 
        end
    end
end


%%

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

% figure(2)
% imshow(imout);


%% Calculo de altura dos obstaculos
%count_max = vetor com alturas para os obstáculos

level2 = graythresh(count_max);
k=1;
kk=1;
for i=1:num-1
    for j=1:length(count_max)
        if(count_max(j)<level2)
            o{i}(k) = count_max(j);
            k=k+1;
        else
            o{i+1}(kk) = count_max(j);
            kk=kk+1;
        end
    end
end

for i=1:num
%     alt(i) = mode(o{i});
    a = sort(o{i},'descend');
    alt(i) = a(1);
end

% figure(30)
% hold on
% imhist(o{1});
% plot(alt(1),0,'r*')
% title('Obstaculo 1')
% axis([0 1 0 100])
% hold off
% 
% figure(31)
% hold on
% imhist(o{2});
% plot(alt(2),0,'r*')
% title('Obstaculo 2')
% axis([0 1 0 100])
% hold off


%Cálculo do raio tridimensional


% %% Etapa de desenho de caminho
% 
% % Adaptação da escala devido a distancia do sensor e da posiçao devido a
% % mudança de imagem para plot
% for i=1:size(c,1)
%     c2(i,1) = c(i,2);
%     c2(i,2) = 60-c(i,1);
% end
% c = c2;
% 
% for i=1:size(c,1)
%     c(i,2) = (54.6./60)*c(i,2);
%     c(i,1) = (37.7./54)*c(i,1);
%     r(i) = (54.6./60)*r(i);
% end
% 
% dmin = 0.2;
% kmax = 5000;
% 
% % Criando espaço
% dh=.1;
% 
% % %Posições inicial e final
% p0=[0 63.2];
% pF = [13 25];
% 
% save('p0','p0')
% save('pF','pF')
% 
% %Calculando circulos
% th=(0:.1*dh:2).*pi;
% 
% for k=1:num
%     xo{k} = c(k,1);
%     yo{k} = c(k,2);
% end
% 
% 
% for k=1:num
%         xo{k} = r(k).*cos(th);
%         yo{k} = r(k).*sin(th);
% end
% 
% for k=1:num
%     xc{k} = xo{k} + c(k,1);
%     yc{k} = yo{k} + c(k,2);
% end
% toc
% 
% 
% figure(3)
% hold on
% for i=1:num
%    plot(xc{i},yc{i},'.r') 
% end
% 
% h1 = plot(p0(1),p0(2),'bo');
% h2 = plot(pF(1),pF(2),'r*');
% axis equal tight
% % axis([-1 52 -1 66])
% axis([-1 38 -1 70])
% 
% % xtext = 'Angulo $$\theta_1$$';
% % ytext = 'Angulo $$\theta_2$$';
% % xlabel(xtext,'Interpreter','Latex','FontSize',15,'Color','k')
% % ylabel(ytext,'Interpreter','Latex','FontSize',15,'Color','k')
% xlabel('Eixo x')
% ylabel('Eixo y')
% title('Espaço cartesiano')
% 
% % Area Monitorada
% x = linspace(0,37,150);
% y = linspace(0,54,150);
% 
% hold on
% h3 = plot(x,0*y);
% plot(x,0*y+54)
% plot(0*x,y)
% plot(0*x+37,y)
% 
% legend([h1 h2 h3],{'Ponto de partida','Ponto objetivo','Área monitorada'})
% 
% save('xc','xc')
% save('yc','yc')
% save('c','c')
% save('r','r')