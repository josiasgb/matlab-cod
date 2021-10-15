function [] = plot_qo2D()
load qo

%%
% figure(100)
% hold on
% for k=1:length(qo)
%     h1 = plot(qo{k}(:,1),qo{k}(:,2),'.');
% end
% 
% load q_
% h2 = plot(q_(:,1),q_(:,2),'ko');
% 
% plot(0,0,'wo')
% plot(1,1,'wo')
% plot(1,0,'wo')
% plot(0,1,'wo')
% plot(-1,-1,'wo')
% plot(-1,1,'wo')
% plot(1,-1,'wo')
% plot(-1,0,'wo')
% plot(0,-1,'w.')
% 
% xtext = 'Angulo $$\theta_1$$';
% ytext = 'Angulo $$\theta_2$$';
% xlabel(xtext,'Interpreter','Latex','FontSize',15,'Color','k')
% ylabel(ytext,'Interpreter','Latex','FontSize',15,'Color','k')
% legend([h1 h2], {'QO','Resultado do método'})
%%
% close all

% figure()
% disp('Ola')




load q_
h1 = plot(q_(:,1),q_(:,2),'.');
hold on
plot(0,0,'w*')
plot(1,1,'w*')
plot(1,0,'w*')
plot(0,1,'w*')
plot(-1,-1,'w*')
plot(-1,1,'w*')
plot(1,-1,'w*')
plot(-1,0,'w*')
plot(0,-1,'w*')

%origem 
%x = 0  y = 65
%
%cin. inversa
%teta1 = 90     teta2 = 0
%[90 0]
q0 = [58 6];%[90 0];
h2 = plot(q0(1),q0(2),'bo');

%destino 
%x = 35 y = 25
load s

qf(:,1) = s(:,1);
qf(:,2) = s(:,2);

h3 = plot(qf(:,1),qf(:,2),'r*');

legend([h2 h3],{'Configuração inicial','Configurações objetivo'})

load path_disc
h4 = plot(path_disc(:,1), path_disc(:,2), 'k.-');

xtext = 'Angulo $$\theta_1$$';
ytext = 'Angulo $$\theta_2$$';
xlabel(xtext,'Interpreter','Latex','FontSize',15,'Color','k')
ylabel(ytext,'Interpreter','Latex','FontSize',15,'Color','k')
axis square
hold off

% legend([h1 h2 h3 h4], {'QO','Configuração inicial','Configurações desejadas','Caminho por campos de potencial'})
% %% Plotando no espaco cartesiano
% figure(4)
% load xc
% load yc
% load p0
% load pF
% 
% 
% %origem
% % axis square
% axis([-60 60 0 50])
% 
% hold on
% h1 = plot(p0(1),p0(2),'bo');
% 
% %destino
% h2 = plot(pF(1),pF(2),'r*');
% for i=1:length(xc)
%    h3 = plot(xc{i},yc{i},'.');
% end
% 
% for i=1:1:length(path_disc)
%     [p13,h4,] = direta(path_disc(i,1),path_disc(i,2));    
% end
% 
% % legend([h1 h2],{'Configuração inicial','Configurações objetivo'})
% % for i=1:10:length(path)
% %     [p13,h4] = direta(path(i,1),path(i,2));
% % end
% % legend([h1 h2 h3 h4], {'Ponto inicial','Ponto objetivo','Obstáculo','Atuador'},'Location','NorthEastOutside')
% % xlabel('Eixo x')
% % ylabel('Eixo y')
% 
% % toc

%%
% movie(F,1,30)