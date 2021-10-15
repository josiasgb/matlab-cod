% Movimentação com campo potencial articial
% GEORGE THÉ, 21.10.2013

%Obstáculo
load xc
load yc

%definição das posições inicial e final
x0=[-3;7]; %%
xT=[4;-4]; %%
%coordinates of the centre of the obstacles

%Pontos do centro do obstáculo
 Xc = xc{2};
 Yc = yc{2};
 
%Definição da força de repulsão
Kr=50;
%Constante que defini a intensidade da repulsão
Vr=Kr./sqrt((X-x0(1)).^2+(Y-x0(2)).^2+(Z-x0(3)).^2); 
%--------
[fxr,fyr,fzr]=gradient(Vr,dh,dh,dh); %gradiente que define campo de repulsão
%Definição da força de atração
Ka=20;
%Constante que define a intensidade da atração
Va=.5.*Ka.*((X-xT(1)).^2 + (Y-xT(2)).^2 + (Z-xT(3)).^2);%%

%----------
[fxa,fya,fza]=gradient(Va,dh,dh,dh); %gradiente que defini campo de atração

%definição dos obstáculos
cx1=xc(1);%%-2;
cy1=yc(1);%%-5;
cz1=zc(1);%%
cx2=xc(2);%%4;
cy2=yc(2);%%-3;
cz2=zc(2);%%
cx3=xc(3);%%0;
cy3=yc(3);%2;
cz3=zc(3);%%
%----------
% rad=2+.1;
% %-----------
 th=(0:.1*dh:2).*pi;
% %--------
%xo=rad.*cos(th);
%yo=rad.*sin(th);
% %--------
% xo1=xo-cx1;
% yo1=yo-cy1;
% xo2=xo-cx2;
% yo2=yo-cy2;
% xo3=xo-cx3;
% yo3=yo-cy3;
%--------
Vo1=[];
Vo2=[];
Vo3=[];
Vo=zeros(size(Vr));
%Constante que defini a largura da superficie
Ko=5;
%%%%%%%%%%%%%CONTINUAR COM ELABORAÇÃO DE V02 E VO3
for aux1=1:size(x,2),
for aux2=1:size(x,2),
Vo1=Ko./sqrt((X-obs{1}.x(aux1,aux2)).^2+(Y-obs{1}.y(aux1,aux2)).^2+(Z-obs{3}.z(aux1,aux2)).^2);
%Vo2=Ko./sqrt((X-xo2(i)).^2+(Y-yo2(i)).^2);
%Vo3=Ko./sqrt((X-xo3(i)).^2+(Y-yo3(i)).^2);
%Somatório das forças de atração
%Vo=Vo+Vo1+Vo2+Vo3;
%--------
end
end
%%%%%%%%%%%%%
%Somatório das forças de repulsão 
%% VERIFICAR PRESENÇA DE FY0 E FZ0 NA EXPRESSAO DE FX
[fxo,fyo,fzo]=gradient(Vo,dh,dh,dh);
fX=-fxr-fxa-fxo-fyo-fzo;
fY=-fyr-fya-fyo-fxo-fzo;
fZ=-fzr-fza-fyo-fxo-fzo;

%% NÃO CONSEGUI VER O GRAFICO DO QUIVER 3
% quiver3(X,Y,Z,fX,fY,fZ,'k')
% title('3D Artificial Field');
% xlabel('Eixo X')
% ylabel('Eixo Y')
% zlabel('Eixo Z');
% hold on
% plot(x0(1),x0(2),'ro',xT(1),xT(2),'ro')
%visualiazação do campo e da trajetória
% fill(xo1,yo1,'b',xo2,yo2,'b',xo3,yo3,'b')
% plot(xo1,yo1,'b',xo2,yo2,'b',xo3,yo3,'b')
% hold off
%------------
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
%---------
fxx=0;
fyy=0;
%----------
% while ss
% %-------
% Pw=sqrt(((X-xp(k)).^2)+((Y-yp(k)).^2));
% xw(k)=min(min(Pw));
%--------
% [iix,iiy]=find(Pw==xw(k));
%---------
% ix(k)=iix(1);
% iy(k)=iiy(1);
%--------
% fx1=fX(ix(k),iy(k));
% fy1=fY(ix(k),iy(k));
%--------
% fxx(k)=fx1./norm(fX);
% fyy(k)=fy1./norm(fY);
%---------
% ff(k,:)=[fX(ix(k),iy(k)),fY(ix(k),iy(k))];
%---------
% xp(k+1)=xp(k)+dh*(fxx(k));
% yp(k+1)=yp(k)+dh*(fyy(k));
%---------
% if (sqrt((xp(k+1)-xT(1)).^2+(yp(k+1)-xT(2)).^2)<=0.4)
% ss=0;
% end
%----------
k=k+1;
% end
%-------
% hold
% plot([xp],[yp],'r')
%----------
% figure
% surf(X,Y,(Vr)+(Va)+(Vo))
%gera superficie resultante do campo potencial
% title('Superficie Potential')
