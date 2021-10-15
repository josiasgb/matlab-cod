function [] = qobs()
% clear all
% clc

load xc
load yc
load zc

x = xc;
y = yc;
z = zc;

% Para o elo do end effector

% tic
for k=1:length(xc)
    qo{k} = [ 0 0 0];
    q{k} = [ 0 0 0];
end


a1 = 34.8;
a2 = 28.4;
d1 = 40.5;
d3 = 7;

for k=1:length(x)
    for j=1:length(x{k})
        for i=1:2
        teta2 = (-1).^i.*acosd((x{k}(j).^2 + y{k}(j).^2 - a1.^2 - a2.^2)./(2.*a1.*a2));
        if(isreal(teta2))
            c2 = cosd(teta2);
            s2 = sind(teta2);
            teta1 = atan2d((y{k}(j).*(a1+a2.*c2) - x{k}(j).*a2.*s2),(x{k}(j).*(a1+a2.*c2) + y{k}(j).*a2.*s2));
            d4 = d1-z{k}(j)-d3;
            q{k}(2*(j-1)+i,1) = teta1;
            q{k}(2*(j-1)+i,2) = teta2;
            q{k}(2*(j-1)+i,3) = d4;
        end
        end
    end
    qo{k} = vertcat(qo{k},q{k});
end


% toc


% figure(2)
% hold on
% for k=1:length(qo)
%     h1 = plot3(qo{k}(:,1),qo{k}(:,2),qo{k}(:,3),'.');  
% end
% grid on
% 
% plot(0,0,'w.')
% 
% %Ponto de partida
% h3=plot3(90,0,30,'bo');
% 
% %Ponto objetivo
% load s
% for i=1:size(s,1)
%     h4 = plot3(s(i,1),s(i,2),s(i,3),'r*');
% end
% 
% xtext = 'Angulo $$\theta_1$$';
% ytext = 'Angulo $$\theta_2$$';
% xlabel(xtext,'Interpreter','Latex','FontSize',15,'Color','k')
% ylabel(ytext,'Interpreter','Latex','FontSize',15,'Color','k')
% zlabel('Eixo Z')
% % xlabel('Ângulo Q1')
% % ylabel('Ângulo Q2')
% title('Espaço de configurações')
% axis([-50 150 -180 180 0 35])
% % axis([-180 180 -180 180])
% 
% legend([h1 h3 h4],{'QO','Configuração inicial','Configurações objetivo'})

save('qo','qo')
% 
% qo{k}(2*(j-1)+i,1) = teta1;
% segue tabela verdade do indice
% j | i | indice
% 1 | 1 | 1
% 1 | 2 | 2
% 2 | 1 | 3
% 2 | 2 | 4
% 3 | 1 | 5
% 3 | 2 | 6
% e assim por diante
