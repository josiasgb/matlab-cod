clc

r{1} = 10;
r{2} = 15;

c{1} = [1 1];
c{2} = [2 2];

a = [0 0];
for k=1:2
    
    rr = 0:.5:r{k};
    
    dh=.1;
    fi=(0:.1*dh:2).*pi;
    
    
    for i=1:length(rr)
        x = rr(i)*cos(fi) + c{k}(1,1);
        y = rr(i)*sin(fi) + c{k}(1,2);;
        a = vertcat(a,[x' y']);
    end

end
plot(a(:,1),a(:,2),'.')
