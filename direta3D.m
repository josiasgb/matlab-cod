function [p5,h] = direta(teta1,teta2,d4)
% clear all
% clc

%planar RR

% teta1 = 30;
% teta2 = 30;
% d4 = 20;

a1 = 34.8;
a2 = 28.4;
% teta1 = 79.2850;
% teta2 = -97.5246;


c1 = cosd(teta1);
c2 = cosd(teta2);
s1 = sind(teta1);
s2 = sind(teta2);

d1 = 40.5;
d3 = 7;

T12 = [ c1   -s1  0   a1*c1;
        s1   c1   0   a1*s1;
        0    0    1   0;
        0    0    0   1];
    
T01 = [ 1    0    0   0;
        0    1    0   0;
        0    0    1   d1;
        0    0    0   1];    
    
T23 = [ c2  s2     0   a2*c2;
        s2  -c2    0   a2*s2;
        0    0    -1   0;
        0    0     0   1];    

T34 = [ 1    0    0   0;
        0    1    0   0;
        0    0    1   d3;
        0    0    0   1];    
    
T45 = [ 1    0    0   0;
        0    1    0   0;
        0    0    1   d4;
        0    0    0   1];
    
T02 = T01*T12;
T03 = T02*T23;
T04 = T03*T34;
T05 = T04*T45;

p0 = [0 0 0 1]';
p1 = T01*p0;
p2 = T02*p0;
p3 = T03*p0;
p4 = T04*p0;
p5 = T05*p0;

% %Para o espaço de trabalho
% p(1,1) = p3(1);
% p(1,2) = p3(2);

%
p12 = [linspace(p1(1),p2(1),2) ; linspace(p1(2),p2(2),2) ; linspace(p1(3),p2(3),2)]';
p23 = [linspace(p2(1),p3(1),2) ; linspace(p2(2),p3(2),2) ; linspace(p2(3),p3(3),2)]';
p34 = [linspace(p3(1),p4(1),2) ; linspace(p3(2),p4(2),2) ; linspace(p1(3),p4(3),2)]';
p45 = [linspace(p4(1),p5(1),2) ; linspace(p4(2),p5(2),2) ; linspace(p4(3),p5(3),2)]';
% p13 = [linspace(p1(1),p3(1),3) ; linspace(p1(2),p3(2),3)]';

p13 = vertcat(p12,p23(2:size(p23,1),:));

p14 = vertcat(p12,p23(2:size(p23,1),:));
p14 = vertcat(p14,p34(2:size(p34,1),:));

p15 = vertcat(p12,p23(2:size(p23,1),:));
p15 = vertcat(p15,p34(2:size(p34,1),:));
p15 = vertcat(p15,p45(2:size(p45,1),:));

x = [p0(1) p1(1) p2(1) p3(1) p4(1) p5(1)];
y = [p0(2) p1(2) p2(2) p3(2) p4(2) p5(2)];
z = [p0(3) p1(3) p2(3) p3(3) p4(3) p5(3)];
h=plot3(x,y,z,'k');

hold on
plot3(p0(1),p0(2),p0(3),'k.')
plot3(p1(1),p1(2),p1(3),'k.')
plot3(p2(1),p2(2),p2(3),'k.')
plot3(p3(1),p3(2),p3(3),'k.')
plot3(p4(1),p4(2),p4(3),'k.')
h = plot3(p5(1),p5(2),p5(3),'k.');


% axis equal
axis([-30 40 -20 70 0 60])

% F = getframe;


% axis equal tight
% axis([-15 52 -2 66])