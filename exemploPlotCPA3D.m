tic
load qo

hold on
for k=1:length(qo)
    h1 = plot3(qo{k}(:,1),qo{k}(:,2),qo{k}(:,3),'.');
end

load q0
h2 = plot3(q0(1),q0(2),q0(3),'bo');

load qf
h3 = plot3(qf(:,1),qf(:,2),qf(:,3),'r*');

load path_disc
h4 = plot3(path_disc(:,1), path_disc(:,2), path_disc(:,3),'k-.');

axis equal tight
grid on

% legend([h2 h3 h4], {'Ponto inicial','Ponto final','Caminho por campos de potencial'})
toc

%%
% figure(2)

num = length(path_disc);

hold on
p = path_disc;
for i=1:num
    direta3D(p(i,1),p(i,2),p(i,3));
end