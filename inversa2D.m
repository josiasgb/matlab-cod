function [] = inversa2D()
% clear all
% Entradas: c,r,a1,a2,pF
% Saídas: s
%
% clc
% tic


%load c
%load r

a1 = 35;
a2 = 30;

% a1 = 0.35;
% a2 = 0.30;

load pF

x = pF(1);
y = pF(2);

% c22=((x.^2 + y.^2 - a2^2-a1^2)/(2*a1*a2));
% s22=sqrt(abs(1-c22.^2));
% 
% teta2 = atan2(s22,c22);
% teta1 = atan2(y,x)-atan2((a2*sin(teta2)),(a1+a2*cos(teta2)));
% 
% s =[teta1 teta2];
    
%    teta2 = (-1).^i.*acosd((x.^2 + y.^2 - a1.^2 - a2.^2)./(2.*a1.*a2));
%     c2 = cosd(teta2);
%     s2 = sind(teta2);
%     teta1 = atan2d((y.*(a1+a2.*c2) - x.*a2.*s2),(x.*(a1+a2.*c2) + y.*a2.*s2));
%     s(i,:) = [teta1 teta2];


for i=1:2
    
    teta2 = (-1).^i.*acosd((x.^2 + y.^2 - a1.^2 - a2.^2)./(2.*a1.*a2));
    c2 = cosd(teta2);
    s2 = sind(teta2);
    teta1 = atan2d((y.*(a1+a2.*c2) - x.*a2.*s2),(x.*(a1+a2.*c2) + y.*a2.*s2));
    s(i,:) = [teta1 teta2];
end


save ('s', 's')

% toc