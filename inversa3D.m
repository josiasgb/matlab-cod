function [] = inversa3D()
% clear all
% clc

% tic
a1 = 34;
a2 = 28;
d1 = 40.5;
d3 = 7;

load pF
x = pF(1);
y = pF(2);
z = pF(3);

d4 = d1-z-d3;

for i=1:2
    teta2 = (-1).^i.*acosd((x.^2 + y.^2 - a1.^2 - a2.^2)./(2.*a1.*a2));
    c2 = cosd(teta2);
    s2 = sind(teta2);
    teta1 = atan2d((y.*(a1+a2.*c2) - x.*a2.*s2),(x.*(a1+a2.*c2) + y.*a2.*s2));
    s(i,:) = [teta1 teta2 d4];
end

% toc
save('s','s')