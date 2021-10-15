function [p] = direta_sem_plot(teta1,teta2)
% clear all
% clc

%planar RR

a1 = 34.8;
a2 = 28.4;
% teta1 = 79.2850;
% teta2 = -97.5246;

c1 = cosd(teta1);
c2 = cosd(teta2);
s1 = sind(teta1);
s2 = sind(teta2);


T01 = [ c1  -s1   0   0;
        s1  c1    0   0;
        0    0    1   0;
        0    0    0   1];
    
T12 = [ c2  -s2   0   a1;
        s2  c2    0   0;
        0    0    1   0;
        0    0    0   1];    

T23 = [ 0    0    0   a2;
        0    0    0   0;
        0    0    1   0;
        0    0    0   1];    
    
T02 = T01*T12;
T03 = T02*T23;

p0 = [0 0 0 1]';
p1 = T01*p0;
p2 = T02*p0;
p3 = T03*p0;

%Para o espaço de trabalho
p(1,1) = p3(1);
p(1,2) = p3(2);

% %
% p12 = [linspace(p1(1),p2(1),2) ; linspace(p1(2),p2(2),2)]';
% p23 = [linspace(p2(1),p3(1),2) ; linspace(p2(2),p3(2),2)]';
% % p13 = [linspace(p1(1),p3(1),3) ; linspace(p1(2),p3(2),3)]';
% 
% p13 = vertcat(p12,p23(2:size(p23,1),:));
% % p13 = vertcat(p12,p23);