%Ler valores do excel para pegar valores dos torques dos motores
clear all;
close all;
clc;
%-------------------------------------------------
%Dados do ensaio dois corpos extensos_missão ponto
filename = 'Ensaio dois corpos extensos_missão ponto_V2';
B = xlsread(filename);
b1 = B(:,5);  % Extrair as colunas 5 e 6
b2 = B(:,6);

filename = 'Ensaio corpo_extenso-corpo extenso missão ponto para pegar os thetas';
BB = xlsread(filename);
bb1 = BB(:,3);  %Theta 1 dos set points 
bb2 = BB(:,5); %Theta 2 dos set points

% %Valores de theta em graus das entradas
% theta1 =pi*(((2*bb1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*bb2)/4095)-0.5)*(180/pi);
% %Torques com valores das entradas
% dt = 0.5;
% %Derivadas primeira de theta 1 e theta 2
% derivada1 = [0; diff(theta1)/dt];
% derivada2 = [0; diff(theta2)/dt];
% %energia para o motor 1
% %P = (g1'*derivada1')./9549,29658548;
% Vm1 = derivada1.*80.1*0.1666666667; %velocidade do motor
% P1 = ((abs(b1').*abs(Vm1'))./9549.29658548);%Potencia(KW) = T*V 
% E1 = (sum(P1.*0.5))/3600;%kWh
% 
% %energia para o motor 2
% Vm2 = derivada2.*51.6; %velocidade do motor
% P2 = ((abs(b2').*abs(Vm2'))./9549.29658548);%Potencia KW
% E2 = (sum(P2.*0.5))/3600;%kWh

%-----------------------------------------------------------
%Dados do ensaio dois corpos extensos_missão zona
filename = 'Ensaio dois corpos extensos_missão zona_V2';
C = xlsread(filename);
c1 = C(:,5);  % Extrair as colunas 5 e 6
c2 = C(:,6);

filename = 'Ensaio corpo_extenso-corpo extenso missão zona para pegar os thetas';
CC = xlsread(filename);
cc1 = CC(:,3);  %Theta 1 dos set points 
cc2 = CC(:,5); %Theta 2 dos set points

% %Valores de theta em graus das entradas
% theta1 =pi*(((2*cc1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*cc2)/4095)-0.5)*(180/pi);
% %Torques com valores das entradas
% dt = 0.5;
% %Derivadas primeira de theta 1 e theta 2
% derivada1 = [0; diff(theta1)/dt];
% derivada2 = [0; diff(theta2)/dt];
% %energia para o motor 1
% %P = (g1'*derivada1')./9549,29658548;
% Vm1 = derivada1.*80.1*0.1666666667; %velocidade do motor
% P1 = ((abs(c1').*abs(Vm1'))./9549.29658548);%Potencia KW
% E1 = (sum(P1.*0.5))/3600;%kWh
% 
% %energia para o motor 2
% Vm2 = derivada2.*51.6; %velocidade do motor
% P2 = ((abs(c2').*abs(Vm2'))./9549.29658548);%Potencia KW
% E2 = (sum(P2.*0.5))/3600;%kWh

%---------------------------------------------------------
%Dados do ensaio corpo extenso_ponto_missão ponto
filename = 'Ensaio corpo extenso_ponto_missão ponto_V2';
D = xlsread(filename);
d1 = D(:,5);  % Extrair as colunas 5 e 6
d2 = D(:,6);

filename = 'Ensaio corpo_extenso-ponto missão ponto para pegar os thetas';
DD = xlsread(filename);
dd1 = DD(:,3);  %Theta 1 dos set points 
dd2 = DD(:,5); %Theta 2 dos set points

% %Valores de theta em graus das entradas
% theta1 =pi*(((2*dd1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*dd2)/4095)-0.5)*(180/pi);
% %Torques com valores das entradas
% dt = 0.5;
% %Derivadas primeira de theta 1 e theta 2
% derivada1 = [0; diff(theta1)/dt];
% derivada2 = [0; diff(theta2)/dt];
% %energia para o motor 1
% %P = (g1'*derivada1')./9549,29658548;
% Vm1 = derivada1.*80.1*0.1666666667; %velocidade do motor
% P1 = ((abs(d1').*abs(Vm1'))./9549.29658548);%Potencia KW
% E1 = (sum(P1.*0.5))/3600;%kWh
% 
% %energia para o motor 2
% Vm2 = derivada2.*51.6; %velocidade do motor
% P2 = ((abs(d2').*abs(Vm2'))./9549.29658548);%Potencia KW
% E2 = (sum(P2.*0.5))/3600;%kWh


%----------------------------------------------
%Dados do ensaio corpo extenso_ponto_missão zona
filename = 'Ensaio corpo extenso_ponto_missão zona_V2';
E = xlsread(filename);
e1 = E(:,5);  % Extrair as colunas 5 e 6
e2 = E(:,6);

filename = 'Ensaio corpo_extenso-ponto missão zona para pegar os thetas';
EE = xlsread(filename);
ee1 = EE(:,3);  %Theta 1 dos set points 
ee2 = EE(:,5); %Theta 2 dos set points

%Valores de theta em graus das entradas
theta1 =pi*(((2*ee1)/4095)-0.5)*(180/pi);
theta2 =pi*(((2*ee2)/4095)-0.5)*(180/pi);
%Torques com valores das entradas
dt = 0.5;
%Derivadas primeira de theta 1 e theta 2
derivada1 = [0; diff(theta1)/dt];
derivada2 = [0; diff(theta2)/dt];
%energia para o motor 1
%P = (g1'*derivada1')./9549,29658548;
Vm1 = derivada1.*80.1*0.1666666667; %velocidade do motor
P1 = ((abs(e1').*abs(Vm1'))./9549.29658548);%Potencia KW
E1 = (sum(P1.*0.5))/3600;%kWh
% 
% % %energia para o motor 2
% Vm2 = derivada2.*51.6; %velocidade do motor
% P2 = ((abs(e2').*abs(Vm2'))./9549.29658548);%Potencia KW
% E2 = (sum(P2.*0.5))/3600;%kWh

%------------------------------------------------------
%Dados do ensaio ponto-corpo extenso_missão:ponto
filename = 'Ensaio ponto-corpo extenso missão ponto_V2';
F = xlsread(filename);
f1 = F(:,5);  % Extrair as colunas 5 e 6
f2 = F(:,6);

filename = 'Ensaio ponto-corpo extenso missão ponto para pegar os thetas';
FF = xlsread(filename);
ff1 = FF(:,3);  %Theta 1 dos set points 
ff2 = FF(:,5); %Theta 2 dos set points

% %Valores de theta em graus das entradas
% theta1 =pi*(((2*ff1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*ff2)/4095)-0.5)*(180/pi);
% %Torques com valores das entradas
% dt = 0.5;
% %Derivadas primeira de theta 1 e theta 2
% derivada1 = [0; diff(theta1)/dt];
% derivada2 = [0; diff(theta2)/dt];
% %energia para o motor 1
% %P = (g1'*derivada1')./9549,29658548;
% Vm1 = derivada1.*80.1*0.1666666667; %velocidade do motor
% P1 = ((abs(f1').*abs(Vm1'))./9549.29658548);%Potencia KW
% E1 = (sum(P1.*0.5))/3600;%kWh
% 
% % %energia para o motor 2
% Vm2 = derivada2.*51.6; %velocidade do motor
% P2 = ((abs(f2').*abs(Vm2'))./9549.29658548);%Potencia KW
% E2 = (sum(P2.*0.5))/3600;%kWh




%%-------------------------------------------------------
%Dados do ensaio ponto-corpo extenso_missão:zona
filename = 'Ensaio ponto-corpo extenso missão zona_V2';
G = xlsread(filename);
g1 = G(:,5);  % Extrair as colunas 5 e 6
g2 = G(:,6);

filename = 'Ensaio ponto-corpo extenso missão zona para pegar os thetas';
GG = xlsread(filename);
gg1 = GG(:,3);  %Theta 1 dos set points 
gg2 = GG(:,5); %Theta 2 dos set points

% %Valores de theta em graus das entradas
% theta1 =pi*(((2*gg1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*gg2)/4095)-0.5)*(180/pi);
% %Torques com valores das entradas
% dt = 0.5;
% %Derivadas primeira de theta 1 e theta 2
% derivada1 = [0; diff(theta1)/dt];
% derivada2 = [0; diff(theta2)/dt];
% %energia para o motor 1
% %P = (g1'*derivada1')./9549,29658548;
% Vm1 = derivada1.*80.1*0.1666666667; %velocidade do motor
% P1 = ((abs(g1').*abs(Vm1'))./9549.29658548);%Potencia KW
% E1 = (sum(P1.*0.5))/3600;%kWh
% 
% % %energia para o motor 2
% Vm2 = derivada2.*51.6; %velocidade do motor
% P2 = ((abs(g2').*abs(Vm2'))./9549.29658548);%Potencia KW
% E2 = (sum(P2.*0.5))/3600;%kWh





%Dados do ensaio ponto-ponto_missão:ponto
filename = 'Ensaio_ponto-ponto_missão_ponto_V2';
H = xlsread(filename);
h1 = H(:,5);  % Extrair as colunas 5 e 6
h2 = H(:,6);

filename = 'Ensaio ponto-ponto missao ponto para pegar os thetas';
HH = xlsread(filename);
hh1 = HH(:,3);  %Theta 1 dos set points 
hh2 = HH(:,5); %Theta 2 dos set points

% %Valores de theta em graus das entradas
% theta1 =pi*(((2*hh1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*hh2)/4095)-0.5)*(180/pi);
% %Torques com valores das entradas
% dt = 0.5;
% %Derivadas primeira de theta 1 e theta 2
% derivada1 = [0; diff(theta1)/dt];
% derivada2 = [0; diff(theta2)/dt];
% %energia para o motor 1
% %P = (g1'*derivada1')./9549,29658548;
% Vm1 = derivada1.*80.1*0.1666666667; %velocidade do motor
% P1 = ((abs(h1').*abs(Vm1'))./9549.29658548);%Potencia KW
% E1 = (sum(P1.*0.5))/3600;%kWh

% % %energia para o motor 2
% Vm2 = derivada2.*51.6; %velocidade do motor
% P2 = ((abs(h2').*abs(Vm2'))./9549.29658548);%Potencia KW
% E2 = (sum(P2.*0.5))/3600;%kWh



%Dados do ensaio ponto-ponto, missão:zona
filename = 'Ensaio_ponto-ponto_missão_zona_V2';
I = xlsread(filename);
i1 = I(:,5);  % Extrair as colunas 5 e 6

i2 = I(:,6);


filename = 'Ensaio ponto-ponto missao zona para pegar os thetas';
II = xlsread(filename);
ii1 = II(:,3);  %Theta 1 dos set points 
ii2 = II(:,5); %Theta 2 dos set points

% %Valores de theta em graus das entradas
% theta1 =pi*(((2*ii1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*ii2)/4095)-0.5)*(180/pi);
% %Torques com valores das entradas
% dt = 0.5;
% %Derivadas primeira de theta 1 e theta 2
% derivada1 = [0; diff(theta1)/dt];
% derivada2 = [0; diff(theta2)/dt];
% %energia para o motor 1
% %P = (g1'*derivada1')./9549,29658548;
% Vm1 = derivada1.*80.1*0.1666666667; %velocidade do motor em rpm
% P1 = ((abs(i1').*abs(Vm1'))./9549.29658548);%Potencia KW
% E1 = (sum(P1.*0.5))/3600;%kWh
% 
% % %energia para o motor 2
% Vm2 = derivada2.*51.6*0.1666666667; %velocidade do motor
% P2 = ((abs(i2').*abs(Vm2'))./9549.29658548);%Potencia KW
% E2 = (sum(P2.*0.5))/3600;%kWh
% 



