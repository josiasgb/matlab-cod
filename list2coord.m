function [out] = list2coord(in,im)

[lin col] = size(im);
n = size(in,1);

for i=1:n
    x = floor(in(i)./lin);
    if(x==0)
        out(i,1) = lin;
        out(i,2) = x;
    else
        out(i,1) = in(i)-x.*lin;
        out(i,2) = x + 1;        
    end    
end