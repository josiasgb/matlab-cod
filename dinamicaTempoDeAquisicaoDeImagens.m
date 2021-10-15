
x = [1 10 100 200 300 400 500 600 700 800 900 1000];
y=[.071706 .290444 1.711288 3.380945 5.006507 6.886144 ...
    8.544501 10.320155 12.049769 13.914953 15.821133 17.892474];

plot(log(x),y,'.-')
axis equal tight
xlabel('Logaritmo do número de discretizações')
ylabel('Tempo de execução')
