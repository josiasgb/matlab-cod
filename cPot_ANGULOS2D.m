function [] = cPot_ANGULOS2D()
% clear all
% Entradas: qo, s, q0, dmin, kmax, n
% Saídas: path, path_disc
%
% tic
%planar RR

% load qo
load q_
load s

qo{1}=q_;
%configuracao inicial
q0 = [58 6];%[90 0];

%configuracoes finais
qf(:,1) = s(:,1);
qf(:,2) = s(:,2);

%Calcula configuração final adequada mais proxima do ponto inicial
min = 10000;
num = 1;
for k=1:size(s,1)
    dist = sqrt( (s(k,1) - q0(1)).^2 + (s(k,2)-q0(2)).^2 );
    if(dist<min)
        min=dist;
        num = k;
    end
end

pAtr = s(num,:);


%% Algoritmo de campos de potencial

d_total = min;
num = length(qo);
dmin = 0.2;
kmax = 3000;

%Constante de atração do ponto final
Ka = 1;%1
d = floor(d_total/5);
Fa = zeros(1,2);

%Constante de repulsão dos obstáculos
Kr = 500000; %5000;
po = 10;
for i=1:num
    Fr{i} = zeros(1,2);
end

%Valores correspondentes a x e y atuais
q1_at(1) = q0(1);
q2_at(1) = q0(2);


%Início do laço
bool = 1;
k = 1;
con = 0;

Fres = 0;

while bool
    %Atração
    da = sqrt((q1_at(k)-pAtr(1)).^2 + (q2_at(k)-pAtr(2)).^2);
    
    if(da<=d)
        Fa(1) = -Ka.*(q1_at(k)-pAtr(1));
        Fa(2) = -Ka.*(q2_at(k)-pAtr(2));
    else
        Fa(1) = -d.*Ka.*(q1_at(k)-pAtr(1))./da;
        Fa(2) = -d.*Ka.*(q2_at(k)-pAtr(2))./da;
    end
    
    %Repulsão
    for i=1:num
        dr{i} = sqrt((q1_at(k)-qo{i}(:,1)).^2 + (q2_at(k)-qo{i}(:,2)).^2);
%         for j=1:length(qo_teta1{i})
%             dr{i}{j} = sqrt((q1_at(k)-qo_teta1{i}{j}).^2 + (q2_at(k)-qo_teta2{i}{j}).^2 + (q3_at(k)-qo_teta3{i}{j}).^2);
%         end
        
%         for j=1:length(qo_teta1{i})
%             aux = sort(dr{i}{j},'ascend');
%             drep{i} = aux(1);
%         end
%         poi(i) = min(dr{i}  );
        %%outra forma de pegar o minimo
        aux2 = sort(dr{i},'ascend');
        poi(i) = aux2(1);
    end
    
    
    for i=1:num
        if(poi(i)<=po)
            aux2 = sort(dr{i},'ascend');
            b{i}(1) = qo{i}(find(dr{i} == aux2(1),1),1);
            b{i}(2) = qo{i}(find(dr{i} == aux2(1),1),2);
        
            db(i) = sqrt((q1_at(k)-b{i}(1)).^2 + (q2_at(k)-b{i}(2)).^2 );
        
            Fr{i}(1) = Kr.*((1./(poi(i))) - (1./(po))).*(1./(poi(i).^2)).*((q1_at(k)-b{i}(1))./(db(i)));
            Fr{i}(2) = Kr.*((1./(poi(i))) - (1./(po))).*(1./(poi(i).^2)).*((q2_at(k)-b{i}(2))./(db(i)));
        else
            Fr{i}(1) = 0;
            Fr{i}(2) = 0;
        end    
    end
    
    
%     if(con>10)
% %     Força virtual adicional temporária
%         Kf = 30*Kr;
%         xff = q1_at(k-1);
%         yff = q2_at(k-1);
%     
%         drf = sqrt((q1_at(k)-xff).^2 + (q2_at(k)-yff).^2);        
% %         poif = min(drf);
%         aux3 = sort(drf,'ascend');
%         poif = aux3(1);
%         
%         bf(1) = xff(find(drf == poif,1));
%         bf(2) = yff(find(drf == poif,1));
%             
%         dbf = sqrt((q1_at(k)-bf(1)).^2 + (q2_at(k)-bf(2)).^2);
%     
%         Ff(1) = Kf.*((1./(poif)) - (1./(po))).*(1./(poif.^2)).*((q1_at(k)-bf(1))./(dbf));
%         Ff(2) = Kf.*((1./(poif)) - (1./(po))).*(1./(poif.^2)).*((q2_at(k)-bf(2))./(dbf));
%         
%         Fres = Ff + Fa;
%         
%         con = 0;
%     else
        Fres = Fa;
%     end
    
    
    for i=1:num
       Fres = Fres + Fr{i};
    end
    
    next = Fres./max(abs(Fres))./10; %Passo no qual o manipulador vai mudar 
                                %de ponto (andar) no espaço bidimensional
                                
    q1_at(k+1) = q1_at(k) + next(1);
    q2_at(k+1) = q2_at(k) + next(2);
    
    
    pda = sqrt((q1_at(k+1)-pAtr(1)).^2 + (q2_at(k+1)-pAtr(2)).^2 );
    
%     if(pda>da)
%         con=con+1
%     end
        
    if(da<=dmin)
        bool = 0;
    end
        
    if(k>kmax)
        bool=0;
    end
    
    k = k+1;
    
%     figure(1)
%     plot(horzcat(x0(1),q1_at),horzcat(x0(2),q2_at))
%     pause(0.01)
end


%% Descriminando pontos do caminho
path(:,1) = q1_at;
path(:,2) = q2_at;

%Entrada
n = 50; %Quantidade de pontos que se deseja obter para descrever o 
        %caminho.

%Variáveis de manipulação
l = length(q1_at);
q = l./(n-1);

path_disc(1,1) = q1_at(1);
path_disc(1,2) = q2_at(1);
path_disc(n,1) = q1_at(l);
path_disc(n,2) = q2_at(l);

for i=2:n-1
    path_disc(i,1) = q1_at(floor((i-1)*q));
    path_disc(i,2) = q2_at(floor((i-1)*q));
end
% plot(Fres)
save('path','path')
% P1(1) = path_disc(2,1);
% P1(2) = path_disc(2,2);
save('path_disc','path_disc')
save path_disc.mat
%path_disc1 = ('path_disc');
%save ('path_disc1.mat','path_disc','path_disc')

% toc