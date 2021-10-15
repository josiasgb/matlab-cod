clear all
clc

A = imread('lena.jpg');
level = graythresh(A);
im = im2bw(A,level);


figure(1)
imshow(A)

figure(2)
imshow(im)

figure(3)
hold on
imhist(A)
a = level*255;
num = 3500;
y = linspace(0,num,num);
x = repmat(a,1,num);
plot(x,y,'k');

xlabel('Níveis de tom de cinza');
ylabel('Número de repetições');