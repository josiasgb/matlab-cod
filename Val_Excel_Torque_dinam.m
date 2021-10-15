%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------Torques para ponto corpo extenso; missão: zona----------------
%*************************************************************************
%Dados do ensaio ponto corpo extenso; missão zona: valores dos SP
clear all;
close all;
clc;

filename = 'Ensaio ponto-corpo extenso missão zona para calcular o torque pela dinamica';
B = xlsread(filename);
b1 = B(:,3);  %Theta 1 dos set points 
b2 = B(:,5); %Theta 2 dos set points


%Valores de theta em graus das entradas
% teta1d1 =pi*(((2*b2)/4095)-0.5)*(180/pi);
% teta1d2 =pi*(((2*b1)/4095)-0.5)*(180/pi);
% 
% %-----------------------------------------------------------------
% %Torques com valores das entradas
% 
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
% T1_ = T1/6000;
% %T1_ = T1/300;
% 
% save Pseudotorque_teorico_thetasdeentrada_motor1_pontocorpoextenso_missao_zona.dat T1_ -ascii;

% % 
% % plot (T1_)
% % hold on

% %  
% % title('Torque do Motor 1')
% % xlabel('Tempo (s)')
% % ylabel('T(Nm)')
% 
% T2 = [0.384+0449.*(cosd(teta1d2))].*(derivada2_1)+0.384.*(derivada2_2)+0.449.*(sind(teta1d2)).*(derivada1).^2+12.574.*(cosd((teta1d1) + (teta1d2)));
% T2_ = T2/30000;
% %T2_ = T2/60000;
% % 
% save Pseudotorque_teorico_thetasdeentrada_motor2_pontocorpoextenso_missao_zona.dat T2_ -ascii;
% % 
% 
% t=0.5:0.5:1027;
% subplot (2, 1, 1);
% plot(t, T1_)
% title('Torque do Motor 1')
% xlabel('Tempo (s)')
% ylabel('T(Nm)')
% 
% subplot (2, 1, 2);
% plot(t, T2_)
% title('Torque do Motor 2')
% xlabel('Tempo (s)')
% ylabel('T(Nm)')


% % t=0.5:0.5:1027;
% % plot(t, T2_)
% % title('Torque do Motor 2')
% % xlabel('Tempo (s)')
% % ylabel('T(Nm)')
% 
% %-----------------------------------------------------------------
% %---------------------Torques com valores das saídas------------
% %****************************************************************
% b3 = B(:,2); %Theta 1 das saídas
% b4 = B(:,4); %Theta 2 das saídas
% 
% % %Valores de theta em graus das saídas
% teta1d1out =pi*(((2*b3)/4095)-0.5)*(180/pi);
% teta1d2out =pi*(((2*b4)/4095)-0.5)*(180/pi);
% 
% %-----------------------------------------------------------------
% %Torques com valores das saídas
% dt = 0.5;
% 
% %Derivadas primeira de theta 1 e theta 2
% derivada1out = [0; diff(teta1d1out)/dt];
% derivada2out = [0; diff(teta1d2out)/dt];
% 
% %Derivadas segunda de theta 1 e theta 2
% derivada2_1out = [0; diff(derivada1out)/dt];
% derivada2_2out = [0; diff(derivada2out)/dt];
% 
% T1out = [1.873+0.898.*(cosd(teta1d2out))].*(derivada2_1out)+[0.384+0.449.*(cosd(teta1d2out))].*(derivada2_2out)-0.769.*(sind(teta1d2out)).*(derivada1out).*(derivada2out)-0.384.*(sind(teta1d2out)).*((derivada2out).^2)+12.574.*cosd((teta1d1out)+(teta1d2out))+41.671.*cosd(teta1d1out);
% T1_out = T1out/80;
% save torque_teorico_thetasdesaida_motor1_pontocorpoextenso_missao_zona.dat T1_out -ascii;
% % 
% % % t=0.5:0.5:1027;
% % % plot(t, T1_out)
% % % title('Torque do Motor 1')
% % % xlabel('Tempo (s)')
% % % ylabel('T(Nm)')
% % 
% T2out = [0.384+0449.*(cosd(teta1d2out))].*(derivada2_1out)+0.384.*(derivada2_2out)+0.449.*(sind(teta1d2out)).*(derivada1out).^2+12.574.*(cosd((teta1d1out) + (teta1d2out)));
% T2_out = T2out/3900;
% save torque_teorico_thetasdesaida_motor2_pontocorpoextenso_missao_zona.dat T2_out -ascii;
% 
% % t=0.5:0.5:1027;
% % plot(t, T2_out)
% % title('Torque do Motor 2')
% % xlabel('Tempo (s)')
% % ylabel('T(Nm)')
% 
% %-------------------------------------//---------------------------
% %Dados do ensaio ponto-corpo extenso_missão:zona. Valores das saidas
% %analogicas
% %*******************************************************************
% 
% filename = 'Ensaio ponto-corpo extenso missão zona_V2';
% G = xlsread(filename);
% g1 = G(:,5);  % Extrair as colunas 5 e 6
% g2 = G(:,6);
% 
% save torque_experimetal_motor1_pontocorpoextenso_missao_zona.dat g1 -ascii;
% save torque_experimetal_motor2_pontocorpoextenso_missao_zona.dat g2 -ascii;

% %plot (g1)
% %  t=0.5:0.5:1027;
% %  plot(t,g1)
% % title('Torque do Motor 1')
% % xlabel('Tempo (s)')
% % ylabel('T(Nm)')
% 
% % t=0.5:0.5:1027;
% % plot(t,g2)
% % title('Torque do Motor 2')
% % xlabel('Tempo (s)')
% % ylabel('T(Nm)')
% 
% 
% %plotar os torques com os valores dos thetas das entradas
% %------------------------------------------------------------------
% 
% Er1 = g1 - T1_ ;%ponto-corpo extenso-zona
% Er2 = g2 - T2_;
% 
% % %----------------Gráficos pra o motor 1--------------
% % t=0.5:0.5:1027;
% % subplot (2, 2, 1);
% % plot (t,g1);
% % title('Torque do Motor 1 - Experimental');
% % xlabel('Tempo (s)');
% % ylabel('T(Nm)');
% % 
% % subplot (2, 2, 2);
% % plot(t, T1_);
% % title('Torque do Motor 1 - Teórico (entrada)');
% % xlabel('Tempo (s)');
% % ylabel('T(Nm)');
% % 
% % subplot (2, 2, 3);
% % plot (t, Er1);
% % title('Torque do Motor 1 - Erro');
% % xlabel('Tempo (s)');
% % ylabel('T(Nm)');
% 
% % %-------------Gráficos para o motor 2-------------------
% % t=0.5:0.5:1027;
% % subplot (2, 2, 1);
% % plot (t,g2);
% % title('Torque do Motor 2 - Experimental');
% % xlabel('Tempo (s)');
% % ylabel('T(Nm)');
% % 
% % subplot (2, 2, 2);
% % plot(t, T2_);
% % title('Torque do Motor 2 - Teórico (entrada)');
% % xlabel('Tempo (s)');
% % ylabel('T(Nm)');
% % 
% % subplot (2, 2, 3);
% % plot (t, Er2);
% % title('Torque do Motor 2 - Erro');
% % xlabel('Tempo (s)');
% % ylabel('T(Nm)');
% 
% 
% %plotar os torques com os valores dos thetas das saídas
% %------------------------------------------------------------------
% %=================================================================
% Er1out = g1 - T1_out;%ponto-corpo extenso-zona
% Er2out = g2 - T2_out;
% 
% %%----------gráficos para o motor 1---------------
% % t=0.5:0.5:1027;
% % subplot (2, 2, 1);
% % plot (t,g1);
% % title('Torque do Motor 1 - Experimental');
% % xlabel('Tempo (s)');
% % ylabel('T(Nm)');
% % 
% % subplot (2, 2, 2);
% % plot(t, T1_out);
% % title('Torque do Motor 1 - Teórico (saída)');
% % xlabel('Tempo (s)');
% % ylabel('T(Nm)');
% % 
% % subplot (2, 2, 3);
% % plot (t, Er1out);
% % title('Torque do Motor 1 - Erro');
% % xlabel('Tempo (s)');
% % ylabel('T(Nm)');
% 
% % %-------------Gráficos para o motor 2-------------------
% % t=0.5:0.5:1027;
% % subplot (2, 2, 1);
% % plot (t,g2);
% % title('Torque do Motor 2 - Experimental');
% % xlabel('Tempo (s)');
% % ylabel('T(Nm)');
% % 
% % subplot (2, 2, 2);
% % plot(t, T2_out);
% % title('Torque do Motor 2 - Teórico (saída)');
% % xlabel('Tempo (s)');
% % ylabel('T(Nm)');
% % 
% % subplot (2, 2, 3);
% % plot (t, Er2out);
% % title('Torque do Motor 2 - Erro');
% % xlabel('Tempo (s)');
% % ylabel('T(Nm)');




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------Torque para ponto corpo extenso; missão: ponto----------------
%*************************************************************************

%Dados do ensaio ponto corpo extenso; missão ponto valores dos SP
% filename = 'Ensaio ponto-corpo extenso missão ponto para calcular o torque pela dinamica';
% D = xlsread(filename);
% d1 = D(:,3);  % Extrair as colunas - thetas de entrada
% d2 = D(:,5);

%%%------------torques dos valores de entrada--------------------
% teta1d1 =pi*(((2*d1)/4095)-0.5)*(180/pi);
% teta1d2 =pi*(((2*d2)/4095)-0.5)*(180/pi);
% 
% %Derivadas primeira de theta 1 e theta 2
% dt = 0.5;
% derivada1 = [0; diff(teta1d1)/dt];
% derivada2 = [0; diff(teta1d2)/dt];
% 
% %%Derivadas segunda de theta 1 e theta 2
% derivada2_1 = [0; diff(derivada1)/dt];
% derivada2_2 = [0; diff(derivada2)/dt];
% 
% T1 = [1.873+0.898.*(cosd(teta1d2))].*(derivada2_1)+[0.384+0.449.*(cosd(teta1d2))].*(derivada2_2)-0.769.*(sind(teta1d2)).*(derivada1).*(derivada2)-0.384.*(sind(teta1d2)).*((derivada2).^2)+12.574.*cosd((teta1d1)+(teta1d2))+41.671.*cosd(teta1d1);
% T1_ = T1/300;
% save torque_torico_thetasdeentrada_motor1_pontocorpoextenso_missao_ponto.dat T1_ -ascii;

% 
% t=0.5:0.5:1027;
% Torque1 = [T1_, t'];
% save test.dat Torque1 -ascii;
% %load test.dat
% 
% 
% % t=0.5:0.5:1027;
% % plot(t, T1_)
% % title('Torque do Motor 1')
% % xlabel('Tempo (s)')
% % ylabel('T(Nm)')
% 
% T2 = [0.384+0449.*(cosd(teta1d2))].*(derivada2_1)+0.384.*(derivada2_2)+0.449.*(sind(teta1d2)).*(derivada1).^2+12.574.*(cosd((teta1d1) + (teta1d2)));
% T2_ = T2/60000;
% save torque_torico_thetasdeentrada_motor2_pontocorpoextenso_missao_ponto.dat T2_ -ascii;
% 
% % t=0.5:0.5:1027;
% % plot(t, T2_)
% % title('Torque do Motor 2')
% % xlabel('Tempo (s)')
% % ylabel('T(Nm)')
% 
% %---------------------------------------------------------------------------
% %Dados do ensaio ponto-corpo extenso_missão:ponto
% filename = 'Ensaio ponto-corpo extenso missão ponto_V2';
% F = xlsread(filename);
% f1 = F(:,5);  % Extrair as colunas 5 e 6
% f2 = F(:,6);
% 
% save torque_experimetal_motor1_pontocorpoextenso_missao_ponto.dat f1 -ascii;
% save torque_experimetal_motor2_pontocorpoextenso_missao_ponto.dat f2 -ascii;

% t=0.5:0.5:1027;
% plot(t,f1)
% title('Torque do Motor 1')
% xlabel('Tempo (s)')
% ylabel('T(Nm)')
% 
% t=0.5:0.5:1027;
% plot(t,f2)
% title('Torque do Motor 2')
% xlabel('Tempo (s)')
% ylabel('T(Nm)')

%%------------------------------------------------------------------------
%%----------------------------------Erros
% Er1 = f1 - T1_ ;%ponto-corpo extenso-ponto
% Er2 = f2 - T2_;

%%%--------------gráficos das entradas-------------------------
% %--------------------Gráficos pra o motor 1----------
% t=0.5:0.5:1027;
% subplot (2, 2, 1);
% plot (t,f1);
% title('Torque do Motor 1 - Experimental');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');
% 
% subplot (2, 2, 2);
% plot(t, T1_);
% title('Torque do Motor 1 - Teórico (entrada)');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');
% 
% subplot (2, 2, 3);
% plot (t, Er1);
% title('Torque do Motor 1 - Erro');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');

% %%%---------------------Gráficos para o motor 2----------------------
% t=0.5:0.5:1027;
% subplot (2, 2, 1);
% plot (t,f2);
% title('Torque do Motor 2 - Experimental');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');
% 
% subplot (2, 2, 2);
% plot(t, T2_);
% title('Torque do Motor 2 - Teórico (entrada)');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');
% 
% subplot (2, 2, 3);
% plot (t, Er2);
% title('Torque do Motor 2 - Erro');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');

% %-----------------------------------------------------------------
% %---------------------Torques com valores das saídas------------
% %****************************************************************

%%%------------torques dos valores de saida--------------------
% d3 = D(:,2);  % Extrair as colunas 2 e 4 - thetas saída
% d4 = D(:,4);
% 
% teta1d1out =pi*(((2*d3)/4095)-0.5)*(180/pi);
% teta1d2out =pi*(((2*d4)/4095)-0.5)*(180/pi);
% 
% %Derivadas primeira de theta 1 e theta 2
% dt = 0.5;
% derivada1out = [0; diff(teta1d1out)/dt];
% derivada2out = [0; diff(teta1d2out)/dt];
% 
% %%Derivadas segunda de theta 1 e theta 2
% derivada2_1out = [0; diff(derivada1out)/dt];
% derivada2_2out = [0; diff(derivada2out)/dt];
% 
% T1out = [1.873+0.898.*(cosd(teta1d2out))].*(derivada2_1out)+[0.384+0.449.*(cosd(teta1d2out))].*(derivada2_2out)-0.769.*(sind(teta1d2out)).*(derivada1out).*(derivada2out)-0.384.*(sind(teta1d2out)).*((derivada2out).^2)+12.574.*cosd((teta1d1out)+(teta1d2out))+41.671.*cosd(teta1d1out);
% T1_out = T1/300;
% save torque_torico_thetasdesaida_motor1_pontocorpoextenso_missao_ponto.dat T1_out -ascii;
% % t=0.5:0.5:1027;
% % plot(t, T1_out)
% % title('Torque do Motor 1')
% % xlabel('Tempo (s)')
% % ylabel('T(Nm)')
% 
% T2out = [0.384+0449.*(cosd(teta1d2out))].*(derivada2_1out)+0.384.*(derivada2_2out)+0.449.*(sind(teta1d2out)).*(derivada1out).^2+12.574.*(cosd((teta1d1out) + (teta1d2out)));
% T2_out = T2/60000;
% 
% save torque_torico_thetasdesaida_motor2_pontocorpoextenso_missao_ponto.dat T2_out -ascii;
% t=0.5:0.5:1027;
% plot(t, T2_out)
% title('Torque do Motor 2')
% xlabel('Tempo (s)')
% ylabel('T(Nm)')

%%------------------------------------------------------------------------
%%----------------------------------Erros
% Er1out = f1 - T1_out;%ponto-corpo extenso-ponto
% Er2out = f2 - T2_out;

%%%---------------------Gráficos para as saídas----------------

% %-------------Gráficos pra o motor 1----------------------

% t=0.5:0.5:1027;
% subplot (2, 2, 1);
% plot (t,f1);
% title('Torque do Motor 1 - Experimental');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');
% 
% subplot (2, 2, 2);
% plot(t, T1_out);
% title('Torque do Motor 1 - Teórico (saída)');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');
% 
% subplot (2, 2, 3);
% plot (t, Er1out);
% title('Torque do Motor 1 - Erro');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');

% %%%------------------Gráficos para o motor 2--------------------------
% t=0.5:0.5:1027;
% subplot (2, 2, 1);
% plot (t,f2);
% title('Torque do Motor 2 - Experimental');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');
% 
% subplot (2, 2, 2);
% plot(t, T2_out);
% title('Torque do Motor 2 - Teórico (saída)');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');
% 
% subplot (2, 2, 3);
% plot (t, Er2out);
% title('Torque do Motor 2 - Erro');
% xlabel('Tempo (s)');
% ylabel('T(Nm)');
