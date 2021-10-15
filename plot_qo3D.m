function [] = plot_qo3D()
load qo

close all

load path_disc
h4 = plot3(path_disc(:,1), path_disc(:,2), path_disc(:,3), 'k-.','LineWidth',2);
hold on
grid on

axis square

for k=1:length(qo)
    h1 = plot3(qo{k}(:,1),qo{k}(:,2),qo{k}(:,3),'.');
end
plot(0,0,'w.')

%origem
load q0
h2 = plot3(q0(1),q0(2),q0(3),'bo');

%destino 
load s

qf(:,1) = s(:,1);
qf(:,2) = s(:,2);
qf(:,3) = s(:,3);

h3 = plot3(qf(:,1),qf(:,2),qf(:,3),'r*');


xtext = 'Angulo $$\theta_1$$';
ytext = 'Angulo $$\theta_2$$';
xlabel(xtext,'Interpreter','Latex','FontSize',15,'Color','k')
ylabel(ytext,'Interpreter','Latex','FontSize',15,'Color','k')
zlabel('Eixo Z')


legend([h2 h3], {'Configuração inicial','Configurações objetivo'},'Location','NorthOutside')

% %% Plotando no espaco cartesiano
% figure(4)
% load xc
% load yc
% load zc
% load p0
% load pF
% 
% axis square
% axis([-30 40 -20 70 0 60])
% 
% hold on
% 
% for i=1:length(xc)
%    h1 = plot3(xc{i},yc{i},zc{i},'.');
% end
% 
% %origem
% h3 = plot3(p0(1),p0(2),p0(3),'bo');
% %destino
% h4 = plot3(pF(1),pF(2),pF(3),'r*');
% 
% % legend([h1 h3 h4], {'Obstáculo','Ponto inicial','Ponto objetivo'},'Location','North')
% % xlabel('Eixo X')
% % ylabel('Eixo Y')
% % zlabel('Eixo Z')
% 
% for i=1:1:length(path_disc)
%     [p13,h2] = direta3D(path_disc(i,1),path_disc(i,2),path_disc(i,3));
% end
% 
% 
% % grid on
% % axis equal tight
% % axis([-20 40 0 70 0 50])
