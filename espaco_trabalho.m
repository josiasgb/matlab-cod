clear all
clc

teta1 = linspace(-20,150, 200);
teta2 = linspace(-175,175,200);

n = size(teta1,2);

v = [0 0];

tic
for i=1:n
    for j=1:n
        p = direta_sem_plot(teta1(i),teta2(j));
        v = vertcat(v,p);
    end
    
    clc
    disp('Carregando...');
    disp(floor((i/n)*100));
    
end
toc

num = size(v,1);
et = v(2:num,:);

h3 = plot(et(:,1),et(:,2),'.','Color',[.5,.5,.5])
% xtext = 'Angulo $$\theta_1$$';
% ytext = 'Angulo $$\theta_2$$';
% xlabel(xtext,'Interpreter','Latex','FontSize',15,'Color','k')
% ylabel(ytext,'Interpreter','Latex','FontSize',15,'Color','k')

xlabel('Eixo x')
ylabel('Eixo y')
title('Espaço de trabalho do manipulador')


% Area Monitorada
x = linspace(0,37,150);
y = linspace(0,54,150);

hold on
h1 = plot(x,0*y,'k-.');
plot(x,0*y+54,'k-.')
plot(0*x,y,'k-.')
plot(0*x+37,y,'k-.')

% % Area de obstaculos
% x = linspace(2,35,150);
% y = linspace(2,52,150);
% 
% hold on
% h2 = plot(x,0*y+2,'r');
% plot(x,0*y+52,'r')
% plot(0*x+2,y,'r')
% plot(0*x+35,y,'r')

legend([h1 h3],{'Espaço Monitorado','Espaço de trabalho'})