clear all
clc

tic

load im4
m = im4;
im = m;
[lin col] = size(im);
if(lin<col)
    im = im';
    [lin col] = size(im);
end


% Aplicando otsu
im = 1-im;%inversao de cor (objeto branco, fundo preto)
level = graythresh(im); %obtendo thresold baseado na variância

%% Para analise 3D

[count, count_max, m2] = planifica_background(im);

%% Processo de segmentação

[otsu, b_otsu, num, c, v, cc] = segmentacao(im);


% Calcula raios
r = calcula_r(c,v,2);

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

%% Calculo de altura dos obstaculos
%count_max = vetor com valores de alturas dos obstáculos

if(num<2)
    a = sort(count_max,'descend');
    alt = a(1) - min(min(m2));
    alt = 100*alt;
else   
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
    a = sort(o{i},'descend');
    alt(i) = a(1) - min(min(m2));
end
alt = 100*alt;
alt = sort(alt,'ascend');
end




%Cálculo do raio tridimensional


%% Etapa de desenho de caminho

% Adaptação da escala devido a distancia do sensor e da posiçao devido a
% mudança de imagem para plot
for i=1:size(c,1)
    c2(i,1) = c(i,2);
    c2(i,2) = 64-c(i,1);
end
c = c2;
 
% for i=1:size(c,1)
%     c(i,2) = (54.6./60)*c(i,2);
%     c(i,1) = (37.7./54)*c(i,1);
%     r(i) = (54.6./60)*r(i);
% end
 
for i=1:num
    R(i) = sqrt(alt(i).^2+(2.*r(i)).^2)./2;
end

%Desenhando esferas


%Calculando circulos
dh=.1;
% th=(0:.1*dh:2).*pi;
th=0:pi/4:pi;
fi=(0:.1*dh:2).*pi;

alt2=alt/2;

for i=1:num
    rr{i} = alt2(i):(r(i)-alt2(i))./8:r(i);
end

for i=1:num
    rr{i} = horzcat(rr{i},sort(rr{i},'descend'));
end

ind=1;
for th=0:pi/17:pi
    for k=1:num        
        xo{k} = r(k).*sin(th).*cos(fi) + c(k,1);
        yo{k} = r(k).*sin(th).*sin(fi) + c(k,2);
        zo{k} = r(k).*cos(th) + alt(k)/2;
%         zo{k} = rr{k}(ind).*cos(th) + alt(k)/2;
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

figure(5)
hold on

m2 = imrotate(m2,-90);
m2=m2';
surf(100*(m2-min(min(m2))))

for i=1:num
    plot3(xc{i},yc{i},zc{i},'.')
end
axis equal
grid on

% figure(3)
% hold on
% for k=1:num
%     for i=1:size(v{k},1)
%         v2{k}(i,1) = v{k}(i,2);
%         v2{k}(i,2) = 64-v{k}(i,1);
%     end
% end
% v = v2;
% 
% for i=1:num
%     plot(xc{i},yc{i},'.')
%     plot(v{i}(:,1),v{i}(:,2),'k.')
%     plot(c(i,1),c(i,2),'r*')
% end
% axis equal
% axis([0 50 0 65])
% grid on


save('xc','xc')
save('yc','yc')
save('zc','zc')