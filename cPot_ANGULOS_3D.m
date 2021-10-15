function [] = cPot_ANGULOS3D()
% clear all
% clc

% tic


load s
load qo
load q0

%configuracoes finais
qf(:,1) = s(:,1);
qf(:,2) = s(:,2);
qf(:,3) = s(:,3);

%Calcula configuração final adequada mais proxima do ponto inicial
min = 10000;
num = 1;
for k=1:size(s,1)
    dist = sqrt( (s(k,1) - q0(1)).^2 + (s(k,2)-q0(2)).^2 + (s(k,3)-q0(3)).^2);
    if(dist<min)
        min=dist;
        num = k;
    end
end

pAtr = s(num,:);

%%
% min = sqrt( (qf(1)-q0(1)).^2 + (qf(2)-q0(2)).^2 + (qf(3)-q0(3)).^2 );
% pAtr = qf;

% load xc
% load yc
% load zc
% 
% var = horzcat(xc{1}',yc{1}');
% var = horzcat(var,zc{1}');
% qo{1}=var;
% save('qo','qo');
%% Algoritmo de campos de potencial

d_total = min;
num = length(qo);
dmin = 0.1;
kmax = 3000;

%Constante de atração do ponto final
Ka = 1;
d = floor(d_total/5);
Fa = zeros(1,2);

%Constante de repulsão dos obstáculos
Kr = 1000;
po = 5;
for i=1:num
    Fr{i} = zeros(1,2);
end

%Valores correspondentes a x e y atuais
q1_at(1) = q0(1);
q2_at(1) = q0(2);
q3_at(1) = q0(3);


%Início do laço
bool = 1;
k = 1;
con = 0;

Fres = 0;
angulo = 0;
while bool
    %Atração
    da = sqrt((q1_at(k)-pAtr(1)).^2 + (q2_at(k)-pAtr(2)).^2 + (q3_at(k)-pAtr(3)).^2);
    
    if(da<=d)
        Fa(1) = -Ka.*(q1_at(k)-pAtr(1));
        Fa(2) = -Ka.*(q2_at(k)-pAtr(2));
        Fa(3) = -Ka.*(q3_at(k)-pAtr(3));
    else
        Fa(1) = -d.*Ka.*(q1_at(k)-pAtr(1))./da;
        Fa(2) = -d.*Ka.*(q2_at(k)-pAtr(2))./da;
        Fa(3) = -d.*Ka.*(q3_at(k)-pAtr(3))./da;
    end
    
    %Repulsão
    for i=1:num
%         dr{i} = sqrt((q1_at(k)-qo{i}(:,1)).^2 + (q2_at(k)-qo{i}(:,2)).^2);
        dr{i} = sqrt((q1_at(k)-qo{i}(:,1)).^2 + (q2_at(k)-qo{i}(:,2)).^2 + (q3_at(k)-qo{i}(:,3)).^2);
        aux2 = sort(dr{i},'ascend');
        poi(i) = aux2(1);
    end
       
    for i=1:num
        if(poi(i)<=po)
            aux2 = sort(dr{i},'ascend');
            b{i}(1) = qo{i}(find(dr{i} == aux2(1),1),1);
            b{i}(2) = qo{i}(find(dr{i} == aux2(1),1),2);
            b{i}(3) = qo{i}(find(dr{i} == aux2(1),1),3);
        
            db(i) = sqrt((q1_at(k)-b{i}(1)).^2 + (q2_at(k)-b{i}(2)).^2 + (q3_at(k)-b{i}(3)).^2 );
        
            Fr{i}(1) = Kr.*((1./(poi(i))) - (1./(po))).*(1./(poi(i).^2)).*((q1_at(k)-b{i}(1))./(db(i)));
            Fr{i}(2) = Kr.*((1./(poi(i))) - (1./(po))).*(1./(poi(i).^2)).*((q2_at(k)-b{i}(2))./(db(i)));
            Fr{i}(3) = Kr.*((1./(poi(i))) - (1./(po))).*(1./(poi(i).^2)).*((q3_at(k)-b{i}(3))./(db(i)));
        else
            Fr{i}(1) = 0;
            Fr{i}(2) = 0;
            Fr{i}(3) = 0;
        end    
    end
           

% Circulando o obstaculo
for i=1:num
    if(poi(i)<po/2 && da>=20)
%     Força virtual adicional temporária
        ang = 150;
        teta = [cosd(ang) -sind(ang) 0;
                sind(ang)  cosd(ang) 0;
                0          0         1];
        
        Fa = Fr{i}*teta;
        Fres = Fres+Fa;
    else
        Fres = Fa;
    end
end
    
    for i=1:num
       Fres = Fres + Fr{i};
    end   
    
    
    modulo = sqrt(Fres(1).^2 + Fres(2).^2 + Fres(3).^2);
    next = Fres./(modulo*10);
                                
    q1_at(k+1) = q1_at(k) + next(1);
    q2_at(k+1) = q2_at(k) + next(2);
    q3_at(k+1) = q3_at(k) + next(3);
            
    if(da<=dmin)
        bool = 0;
    end
        
    if(k>kmax)
        bool=0;
    end    
    k = k+1;
end


%% Descriminando pontos do caminho
path(:,1) = q1_at;
path(:,2) = q2_at;
path(:,3) = q3_at;

%Entrada
n = 50; %Quantidade de pontos que se deseja obter para descrever o 
        %caminho.

%Variáveis de manipulação
l = length(q1_at);
q = l./(n-1);

path_disc(1,1) = q1_at(1);
path_disc(1,2) = q2_at(1);
path_disc(1,3) = q3_at(1);
path_disc(n,1) = q1_at(l);
path_disc(n,2) = q2_at(l);
path_disc(n,3) = q3_at(l);

for i=2:n-1
    path_disc(i,1) = q1_at(floor((i-1)*q));
    path_disc(i,2) = q2_at(floor((i-1)*q));
    path_disc(i,3) = q3_at(floor((i-1)*q));
end

save('path','path')
save('path_disc','path_disc')
% toc