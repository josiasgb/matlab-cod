v = [0 1 0 1 1 1 0 0 1 0 1];
l = length(v);
sig = [];
 for n = 1:l
     if v(n)==1
         s = ones(1, 10);
     else 
         s = -ones(1, 10);
     end
     sig=[sig s];
 end
 plot(sig, 'LineWidth', 2)
 ylim([-5 5]);
 xlim([0 100]);
 grid on
 rx=double([(0:length(sig)-1)' , sig'])
      