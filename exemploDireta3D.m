clear all
clc

t1 = linspace(0,45,50);
t2 = linspace(0,45,50);
d  = linspace(0,20,50);

for i=1:50
    direta3D(t1(i),t2(i),d(i));
end

axis equal tight