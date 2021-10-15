% Movimentação com campo potencial articial
% Autor: Leonardo Nunes
% Adaptação: Josias Guimarães
% Data: 07/08/2017
clear all
close all
clc

%Criando espaço 
% unidade mm
dh=12;
X=-200:dh:200;
Y=-200:dh:200;
% X=-700:dh:700;
% Y=-700:dh:700;
%grafico tridimensional do espaço
[X,Y]=meshgrid(X,Y);
%definição das posições inicial e final
x0=[150;-100]; %inicial
xT=[-60;75];
% x0=[250;0]; %inicial cena 2
% xT=[200;350];
%Definição da força de repulsão
% Kr=5000000;%500 cena2
Kr=20;%500 2
%Constante que defini a intensidade da repulsão
Vr=Kr./sqrt((X-x0(1)).^2+(Y-x0(2)).^2); 
%--------
[fxr,fyr]=gradient(Vr,dh,dh); %gradiente que defini campo de repulsão
%Definição da força de atração
% Ka=10;%100 cena2
Ka=1.5;% 1
%Constante que defini a intensidade da atração
Va=.5.*Ka.*((X-xT(1)).^2+(Y-xT(2)).^2);
%----------
[fxa,fya]=gradient(Va,dh,dh); %gradiente que defini campo de atração
%%
%definição dos obstáculos
cx=-13; % -13
cy=-13; % -13

% cx=300;
% cy=200;
rad=30;
th=(0:.04:6).*pi;
xo=rad.*cos(th);
yo=rad.*sin(th);
%--------
xo=xo+cx;
yo=yo+cy;
%--------
Vo1=[];
Vo=zeros(size(Vr));
%Constante que defini a largura da superficie
Ko=1600;%2000 20
%--------
for i=1:length(th)
Vo1=Ko./sqrt((X-xo(i)).^2+(Y-yo(i)).^2);
%Somatório das forças de atração
Vo=Vo+Vo1;
%--------
end
%%
%Somatório das forças de repulsão
[fxo,fyo]=gradient(Vo,dh,dh);
fX=-fxr-fxa-fxo-fyo;
fY=-fyr-fya-fyo+fxo;
quiver(X,Y,fX,fY,'k')
title('Area do Campo Potencial')
xlabel('Eixo X')
ylabel('Eixo Y')
hold on
plot(x0(1),x0(2),'bo',xT(1),xT(2),'r*')
%visualiazação do campo e da trajetória
fill(xo,yo,'b')
plot(xo,yo,'b')
hold off
%%
ss=1;
k=1;
xp=[];
yp=[];
xp(1)=x0(1);
yp(1)=x0(2);
ix=[];
iy=[];
jx=[];
jy=[];
fxx=0;
fyy=0;
while ss
Pw=sqrt(((X-xp(k)).^2)+((Y-yp(k)).^2));
xw(k)=min(min(Pw));
[iix,iiy]=find(Pw==xw(k));
ix(k)=iix(1);
iy(k)=iiy(1);
fx1=fX(ix(k),iy(k));
fy1=fY(ix(k),iy(k));
fxx(k)=fx1./norm(fX);
fyy(k)=fy1./norm(fY);
ff(k,:)=[fX(ix(k),iy(k)),fY(ix(k),iy(k))];
xp(k+1)=xp(k)+dh*(fxx(k));
yp(k+1)=yp(k)+dh*(fyy(k));
if (sqrt((xp(k+1)-xT(1)).^2+(yp(k+1)-xT(2)).^2) <= 20)
ss=0;
end
k=k+1;
end
%-------
hold
plot([xp],[yp],'r')
%----------
figure
mesh(X,Y,(Vr)+(Va)+(Vo))
%gera superficie resultante do campo potencial
title('Superficie Potential')
