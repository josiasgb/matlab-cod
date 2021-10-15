%Ler valores do excel para pegar valores dos torques dos motores
clear all;
close all;
clc;
% %Dados do ensaio sem obstáculo
% filename = 'Ensaio sem obstaculo_V2';
% A = xlsread(filename);
% a1 = A(:,5);  % Extrair as colunas 5 e 6
% a2 = A(:,6);
% 
% filename = 'Ensaio_sem_obstaculo_para_calcular_o_torque_pela_dinamica';
% SO = xlsread(filename);
% so1 = SO(:,3);  %Theta 1 dos set points 
% so2 = SO(:,5); %Theta 2 dos set points
% 
% %Valores de theta em graus das entradas
% teta1d1 =pi*(((2*so2)/4095)-0.5)*(180/pi);
% teta1d2 =pi*(((2*so1)/4095)-0.5)*(180/pi);

%-----------------------------------------------------------------
%Torques com valores das entradas

% dt = 0.5;
% 
% %Derivadas primeira de theta 1 e theta 2
% derivada1 = [0; diff(teta1d1)/dt];
% derivada2 = [0; diff(teta1d2)/dt];
% 
% %Derivadas segunda de theta 1 e theta 2
% derivada2_1 = [0; diff(derivada1)/dt];
% derivada2_2 = [0; diff(derivada2)/dt];
% 
% T1 = [1.873+0.898.*(cosd(teta1d2))].*(derivada2_1)+[0.384+0.449.*(cosd(teta1d2))].*(derivada2_2)-0.769.*(sind(teta1d2)).*(derivada1).*(derivada2)-0.384.*(sind(teta1d2)).*((derivada2).^2)+12.574.*cosd((teta1d1)+(teta1d2))+41.671.*cosd(teta1d1);
% T1_ = T1/300;

% save Torque_teorico_thetasdeentrada_motor1_semobstaculo.dat T1_ -ascii;
% 
% T2 = [0.384+0449.*(cosd(teta1d2))].*(derivada2_1)+0.384.*(derivada2_2)+0.449.*(sind(teta1d2)).*(derivada1).^2+12.574.*(cosd((teta1d1) + (teta1d2)));
% T2_ = T2/60000;
% % 
% save Torque_teorico_thetasdeentrada_motor2_semobstaculo.dat T2_ -ascii;
% 
%Motor 1
% t=0:0.5:915;
% subplot (2, 1, 1)
% plot(t,a1)
% title('Torque do Motor 1 Experimental')
% xlabel('Tempo (s)')
% ylabel('T(Nm)')
% 
% subplot (2, 1, 2)
% plot(t, T1_)
% title('Torque do Motor 1 - Teórico')
% xlabel('Tempo (s)')
% ylabel('T(Nm)')

%motor 2
% t=0:0.5:915;
% subplot (2, 1, 1)
% plot(t, a2)
% title('Torque do Motor 2 - Experimental')
% xlabel('Tempo (s)')
% ylabel('T(Nm)')
% 
% subplot (2, 1, 2)
% plot(t, T2_)
% title('Torque do Motor 2 - Teórico')
% xlabel('Tempo (s)')
% ylabel('T(Nm)')

% figure
% ax1 = subplot(2,1,1); % top subplot
% ax2 = subplot(2,1,2); % bottom subplot

%Dados do ensaio dois corpos extensos_missão ponto
filename = 'Ensaio dois corpos extensos_missão ponto_V2';
B = xlsread(filename);
b1 = B(:,5);  % Extrair as colunas 5 e 6
b2 = B(:,6);

% t=0.5:0.5:1083;
% subplot (2, 1, 1);
% plot(t, b1);
% title('Torque do Motor 1');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');
% 
% subplot (2, 1, 2);
% plot(t,b2);
% title('Torque do Motor 2');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');

%Dados do ensaio dois corpos extensos_missão zona
filename = 'Ensaio dois corpos extensos_missão zona_V2';
C = xlsread(filename);
c1 = C(:,5);  % Extrair as colunas 5 e 6
c2 = C(:,6);

% t=0.5:0.5:1200;
% subplot (2, 1, 1);
% plot(t,c1)
% title('Torque do Motor 1')
% xlabel('Tempo (s)')
% ylabel('T(Nm)')
% 
% subplot (2, 1, 2);
% plot(t,c2)
% title('Torque do Motor 2')
% xlabel('Tempo (s)')
% ylabel('T(Nm)')

%Dados do ensaio corpo extenso_ponto_missão ponto
filename = 'Ensaio corpo extenso_ponto_missão ponto_V2';
D = xlsread(filename);
d1 = D(:,5);  % Extrair as colunas 5 e 6
d2 = D(:,6);

t=0.5:0.5:1163;
% subplot (2, 1, 1);
% plot(t,d1)
% title('Torque do Motor 1 (Corpo extenso - ponto; missão: ponto')
% xlabel('Tempo (s)')
% ylabel('T(Nm)')
% 
% subplot (2, 1, 2);
% plot(t,d2)
% title('Torque do Motor 2')
% xlabel('Tempo (s)')
% ylabel('T(Nm)')

%Dados do ensaio corpo extenso_ponto_missão zona
filename = 'Ensaio corpo extenso_ponto_missão zona_V3';
E = xlsread(filename);
e1 = E(:,5);  % Extrair as colunas 5 e 6
e2 = E(:,6);

t=0.5:0.5:1000;
% subplot (2, 1, 1);
plot(t,e1);
title('Torque do Motor 1 (Abordagem corpo extenso - ponto; missão: zona)');
xlabel('Tempo (s)');
ylabel('T(Nm)');
% 
% subplot (2, 1, 2);
% plot(t,e2);
% title('Torque do Motor 2');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');

%Dados do ensaio ponto-corpo extenso_missão:ponto
filename = 'Ensaio ponto-corpo extenso missão ponto_V2';
F = xlsread(filename);
f1 = F(:,5);  % Extrair as colunas 5 e 6
f2 = F(:,6);

% t=0.5:0.5:1027;
% subplot (2, 1, 1)
% plot(t,f1)
% title('Torque do Motor 1')
% xlabel('Tempo (s)')
% ylabel('T(Nm)')
% 
% subplot (2, 1, 2)
% plot(t,f2)
% title('Torque do Motor 2')
% xlabel('Tempo (s)')
% ylabel('T(Nm)')

%Dados do ensaio ponto-corpo extenso_missão:zona
filename = 'Ensaio ponto-corpo extenso missão zona_V2';
G = xlsread(filename);
g1 = G(:,5);  % Extrair as colunas 5 e 6
g2 = G(:,6);

 t=0.5:0.5:1000;
%subplot (2, 1, 1);
% plot(t,g1);
% title('Torque do Motor 1 (Abordagem ponto - corpo extenso; missão: zona)');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');
% 
% subplot (2, 1, 2);
% plot(t,g2);
% title('Torque do Motor 2');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');

%Dados do ensaio ponto-ponto_missão:ponto
filename = 'Ensaio_ponto-ponto_missão_ponto_V2';
H = xlsread(filename);
h1 = H(:,5);  % Extrair as colunas 5 e 6
h2 = H(:,6);

% t=0.5:0.5:1120;
% subplot (2, 1, 1);
% plot(t,h1);
% title('Torque do Motor 1');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');
% 
% subplot (2, 1, 2);
% plot(t,h2);
% title('Torque do Motor 2');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');

%Dados do ensaio ponto-ponto, missão:zona
filename = 'Ensaio_ponto-ponto_missão_zona_V2';
I = xlsread(filename);
i1 = I(:,5);  % Extrair as colunas 5 e 6
i2 = I(:,6);

% t=0.5:0.5:1023;
% subplot (2, 1, 1);
% plot(t,i1);
% title('Torque do Motor 1');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');
% 
% subplot (2, 1, 2);
% plot(t,i2);
% title('Torque do Motor 2');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');
