clear all
% Entradas: qo, s, q0, dmin, kmax, n
% Saídas: path, path_disc
%
tic
%planar RR

load qo
load s

%configuracao inicial
q0 = [90 0];

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
kmax = 5000;

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


%Início do laço
bool = 1;
k = 1;
con = 0;

Fres = 0;
angulo = 0;
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
           

% Circulando o obstaculo
for i=1:num
    if(poi(i)<po/2 && da>=20)
%     Força virtual adicional temporária
        ang = 150;
        teta = [cosd(ang) -sind(ang);
                sind(ang)  cosd(ang)];
        
%         for i=1:num
%             if(poi(i)<=po)
                Fa = Fr{i}*teta;
%             end
%         end
        Fres = Fres+Fa;
    else
        Fres = Fa;
    end
end
    
    for i=1:num
       Fres = Fres + Fr{i};
    end   
    
    
    modulo = sqrt(Fres(1).^2 + Fres(2).^2);
    next = Fres./(modulo*10);
%   next = Fres./max(abs(Fres))./10;%Passo no qual o manipulador vai mudar 
                                %de ponto (andar) no espaço bidimensional
                                
    q1_at(k+1) = q1_at(k) + next(1);
    q2_at(k+1) = q2_at(k) + next(2);
            
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

%Entrada
n = 20; %Quantidade de pontos que se deseja obter para descrever o 
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

save('path','path')
save('path_disc','path_disc')
toc