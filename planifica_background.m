function [count, count_max, m2] = planifica_background(im)
[lin col] = size(im);

k=1;
kk = 1;

level = graythresh(im); %obtendo thresold baseado na variância

%Laço separa os valores de distâcia que estão acima/abaixo do thresold
for i=1:lin
    for j=1:col
        if(im(i,j)<level)
            count(k) = im(i,j);
            k=k+1;
        else
            count_max(kk) = im(i,j);
            kk=kk+1;
        end
    end
end

%Laço cria imagem onde as distâncias abaixo do thresold são substituídas
%pelo valor da MODA de todos os valores abaixo do thresold
for i=1:lin
    for j=1:col
        if(im(i,j)<level)
            m2(i,j) = mode(count);
        else
            m2(i,j) = im(i,j); 
        end
    end
end