clear all
clc

tic
a1 = 34.8;
a2 = 28.4;
load pF
x = pF(1);
y = pF(2);

% x=30;
% y=28;

for i=1:2
    teta2 = (-1).^i.*acosd((x.^2 + y.^2 - a1.^2 - a2.^2)./(2.*a1.*a2));
    c2 = cosd(teta2);
    s2 = sind(teta2);
    teta1 = atan2d((y.*(a1+a2.*c2) - x.*a2.*s2),(x.*(a1+a2.*c2) + y.*a2.*s2));
    s(i,:) = [teta1 teta2];
end

toc
% s = vertcat(s,s);
% s(3,1) = s(3,1) + 360;
% s(4,1) = s(4,1) + 360;

save('s','s')