load qo

figure(3)
hold on
for k=1:length(qo)
%     for i=1:length(qo{k})
%         if(qo{k}(i,1)~=0)
%         h1 = plot(qo{k}(i,1),qo{k}(i,2),'g.');
            h1 = plot(qo{k}(:,1),qo{k}(:,2),'.');
%         end
%     end
end

% Espaço de trabalho
x = linspace(-20,150,150);
y = linspace(-175,175,150);

hold on
h1 = plot(x,0*y-175,'k');
plot(x,0*y+175,'k')
plot(0*x-20,y,'k')
plot(0*x+150,y,'k')

axis([-50 180 -200 200])
%origem 
%x = 0  y = 65
%
%cin. inversa
%teta1 = 90     teta2 = 0
%[90 0]
q0 = [0 0 ];
h2 = plot(q0(1),q0(2),'bo');

%destino 
%x = 35 y = 25
load s

qf(:,1) = s(:,1);
qf(:,2) = s(:,2);

h3 = plot(qf(:,1),qf(:,2),'r*');

load path_disc
h4 = plot(path_disc(:,1), path_disc(:,2), 'k-.');
xlabel('Ângulo Q1')
ylabel('Ângulo Q2')

plot(0,0,'w.')
% axis([-40 130 -195 195])
legend([h2 h3 h4], {'Configuração inicial','Configurações desejadas','Caminho por campos de potencial'})
% %% Plotando no espaco cartesiano
figure(4)
load xc
load yc
load p0
load pF

hold on

for i=1:length(xc)
   h1 = plot(xc{i},yc{i},'-.r');
end

for i=1:1:length(path_disc)
    [p13,h2] = direta(path_disc(i,1),path_disc(i,2));
    pause(0.1)
end

%origem
h3 = plot(p0(1),p0(2),'bo');
%destino
h4 = plot(pF(1),pF(2),'r*');

% for i=1:10:length(path)
%     [p13,h4] = direta(path(i,1),path(i,2));
% end



% Area Monitorada
x = linspace(0,37,150);
y = linspace(0,54,150);

hold on
h5 = plot(x,0*y);
plot(x,0*y+54)
plot(0*x,y)
plot(0*x+37,y)


legend([h1 h2 h3 h4 h5], {'Obstáculo','Atuador','Ponto inicial','Ponto objetivo','Área Monitorada'})

% % Area de obstaculos
% x = linspace(2,35,150);
% y = linspace(2,52,150);
% 
% %Área de obstaculos
% hold on
% plot(x,0*y+2,'r');
% plot(x,0*y+52,'r')
% plot(0*x+2,y,'r')
% plot(0*x+35,y,'r')
% xlabel('Eixo x')
% ylabel('Eixo y')


axis([0 70 -30 30])

% toc