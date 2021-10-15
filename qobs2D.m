function [] = qobs2D()
% clear all
% clc
% Entradas: xc,yc,a1,a2
% Saídas: qo
%
% tic
load xc
load yc

aux = xc;
auy = yc;

% clear xc
% clear yc

xc{1} = aux;%Pega o cículo do obstáculo
yc{1} = auy;

% xc{2} = aux;%Pega o centro do obstáculo
% yc{2} = auy;

x = xc;%para contorno
y = yc;

%  x = xc{2};%para centro
%  y = yc{2};

% Pelo laço
for k=1:length(xc)
    qo{k} = [ 0 0];
    q{k} = [ 0 0];
end
% qo{2} = [ 0 0];
q1{1} = [ 0 0];
q1{2} = [ 0 0];

num=1; %número de discretizaações do robô
for m=1:num

a1 = 34.8; %34,8
a2 = ((1./num)*m)*28.4; %28,4
% for k=1:length(xc)
k=1;
    %for j=1:length(xc{k}{k})%length(xc{k})
        for j=1:length(xc{k})%length(xc{k})
        for i=1:2
        %  keyboard
        %teta2 = (-1).^i.*acosd((x{k}(j).^2 + y{k}(j).^2 - a1.^2 - a2.^2)./(2.*a1.*a2));
        teta2 = (-1).^i.*acosd((x{k}{k}(j).^2 + y{k}{k}(j).^2 - a1.^2 - a2.^2)./(2.*a1.*a2));
        if(isreal(teta2))
            c2 = cosd(teta2);
            s2 = sind(teta2);
            teta1 = atan2d((y{k}(j).*(a1+a2.*c2) - x{k}(j).*a2.*s2),(x{k}(j).*(a1+a2.*c2) + y{k}(j).*a2.*s2));
%             qo{k} = vertcat(qo{k},[teta1 teta2]);
            q{k}(2*(j-1)+i,1) = teta1;
            q{k}(2*(j-1)+i,2) = teta2;
        end
        end
    end
    qo{k} = vertcat(qo{k},q{k});
% end
end

%% Para o elo inicial

for k=1:length(xc)
    qo2_{k} = [ 0];
    q2{k} = [ 0];
end

num=0;%igual a zero tira o primeiro elo
for m=1:1:num
a1 = (m/num)*34.8;

    for k=1:length(xc)
%     k=1;
        for j=1:length(xc{k}{k})%para contorno
             
%         for j=1:length(xc{k})%para ponto central
    %         teta1 = asind(y{k}(j)./a1);
    %keyboard
            %teta1 = atan2d(y{k},x{k}); %Para ponto central
           teta1 = atan2d(y{k}{k}(j),x{k}{k}(j)); %para contorno
            %dist = sqrt((x{k}(j)).^2 + (y{k}(j)).^2);
           dist = sqrt((x{k}{k}(j)).^2 + (y{k}{k}(j)).^2);%para contorno
            %dist = sqrt((x{k}).^2 + (y{k}).^2);%para ponto
            if(isreal(teta1) && dist<=34.8)
                q2{k}(j,1) = teta1;
            end
        end
        qo2_{k} = vertcat(qo2_{k},q2{k});
    end
end
for k=1:length(xc)
% k=1;
    qo2_{k} = double(int32(qo2_{k}*10))/10;
    qo2_{k} = unique(qo2_{k});
    qo2_{k} = qo2_{k}(2:size(qo2_{k},1),:);
    qo2{k} = [0 0];
end



for k=1:length(xc)
    n = size(qo2_{k});
    n_lin=150;
    lin = linspace(-175,175,n_lin)';
    
    for i=1:n
        if(~isempty(qo2_{k}(i)))
            out{i} = horzcat(qo2_{k}(i)*ones(n_lin,1),lin);
        end
    end
    
    if(~isempty(qo2_{k}(i)))
        o = out{1};
        for i=2:n
            o = vertcat(o,out{i});
        end    
        qo2{k} = o;
    end
end



for k=1:length(xc)
    if(~isempty(qo2{k}))
        qo{k} = vertcat(qo{k},qo2{k});
    end
end



% toc
% % figure()
% % hold on
% % for k=1:length(qo)
% %     for m=1:length(qo{k})
% %         if(qo{k}(m,1)~=0)
% %         h1 = plot(qo{k}(m,1),qo{k}(m,2),'.');
% %         end
% %     end
% % end
% 

% for k=1:length(qo)
%     h1 = plot(qo{k}(:,1),qo{k}(:,2),'.'); hold on;
% end
% plot(0,0,'w.')
% title('Mapeamento de QO')
% 
% xtext = 'Angulo $$\theta_1$$';
% ytext = 'Angulo $$\theta_2$$';
% xlabel(xtext,'Interpreter','Latex','FontSize',15,'Color','k')
% ylabel(ytext,'Interpreter','Latex','FontSize',15,'Color','k')
% 
% 

save('qo','qo')
clear q2
clear q
load q0
load s
% 
% h3=plot(q0(1),q0(2),'bo');hold on
% h4=plot(s(1,1),s(1,2),'r*');
% plot(s(2,1),s(2,2),'r*')


% legend([h3 h4],{'Configuração inicial','Configurações objetivo'},'Location','NorthOutside')
% 
% % 
% % qo{k}(2*(j-1)+i,1) = teta1;
% % segue tabela verdade do indice
% % j | i | indice
% % 1 | 1 | 1
% % 1 | 2 | 2
% % 2 | 1 | 3
% % 2 | 2 | 4
% % 3 | 1 | 5
% % 3 | 2 | 6
% % e assim por diante