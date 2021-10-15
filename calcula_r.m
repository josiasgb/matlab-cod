function [max] = calcula_r(c,v)
%c = matriz de coordenadas dos centroides
%v = estrutura de matrizes com coordenadas das bordas
%max = maior distancia do centroide de cada objeto ate a extremidade deste

n = size(c,1);
max = zeros(1,n);

for i=1:n
    k = size(v{i},1);
    for j=1:k
        val = sqrt( (c(i,1)-v{i}(j,1)).^2 + (c(i,2)-v{i}(j,2)).^2 );
        if(max(i)<val)
            max(i) = val;
        end
    end
end