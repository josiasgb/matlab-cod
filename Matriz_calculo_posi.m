%Transformação do frame do sensor para o frame da base do robô
load xc
load yc
%==================================================================
%Enviar dados para opc
%Configurações do servidor OPC
hostinfo = opcserverinfo('localhost');
allServers = hostinfo.ServerID';
da = opcda('localhost','ElipseSCADA.OPCSvr.1');
connect(da);
grp = addgroup(da);

%Declaração das tags
itmsp1 = additem(grp, 'Tags.setpoint_teta_1');
itmsp2 = additem(grp, 'Tags.setpoint_teta_2');
itmpos1 = additem(grp, 'Tags.Posição1');
itmpos2 = additem(grp, 'Tags.Posição2');
itmsinal1 = additem(grp, 'Tags.sinal_junta_1');
itmsinal2 = additem(grp, 'Tags.sinal_junta_2');
itmerr1 = additem(grp, 'Tags.Erro_J1');
itmerr2 = additem(grp, 'Tags.Erro_J2');

%Carrega os pontos do caminho gerado pelo CPA
load path_disc
%  rx1 = [0 1686]
%  rx2 = [0 1097]
% pause (5)
%Manipulador
l1=35;
l2=30;

%Pontos do centro do obstáculo
%  Xc = xc{2};
%  Yc = yc{2};

%Pega o segundo ponto do caminho gerado pelo Algoritmo do CPA
% P1(1) = path_disc(50,1)
% P1(2) = path_disc(50,2)
% P1(1) = -42;
% P1(2) = -43;%*pi/180;
% %cinemática direta
% % x=0.35*cos(teta1)+0.30*cos(teta1+teta2);
% % y=0.35*sin(teta1)+0.30*sin(teta1+teta2);
% %Cinemática direta dos pontos do caminho do CPA
% xcp=35*cosd(P1(1))+30*cosd(P1(1)+P1(2));
% ycp=35*sind(P1(1))+30*sind(P1(1)+P1(2));
% 
% %Transformação para o frame da base do manipulador com os pontos do cpa
% % xb = xc*(-1)+0.12;
% % yb = yc*(1)+0.2;
%  xbcp = xcp*(-1) +28;
%  ybcp = ycp*(1);
% 
% %Cinemática inversa para encontrar os thetas do CPA em relação a base do
% %manipulador
% c2=((xbcp.^2 + ybcp.^2 - l2^2-l1^2)/(2*l1*l2));
% s2=sqrt(abs(1-c2.^2));
% %Thetas
% theta2 = atan2d(s2,c2);
% theta1 = atan2d(ybcp,xbcp)-atan2d((l2*sin(theta2*pi/180)),(l1+l2*cos(theta2*pi/180)));

%Pega o ponto do caminho gerado pelo Algoritmo do CPA

theta1 = path_disc(1,1) %-42
theta2 = path_disc(1,2) %-43

% graus para radiano 
theta_1 = theta1 * pi / 180;
theta_2 = theta2 * pi / 180;
theta_ = [theta_1 theta_2];
  
%valores para enviar pro controlador
sp1=4095*((theta_1/(2*pi))+0.25);
sp2=4095*((theta_2/(2*pi))+0.25);
%global sp;
 sp = [sp1; sp2]; %setpoints

%Envia set-point para o elipse
 write(itmsp1, sp(1))
 write(itmsp2, sp(2))
 
pause (1.0)

%Pega o ponto do caminho gerado pelo Algoritmo do CPA
theta1 = path_disc(5,1) 
theta2 = path_disc(5,2)

% graus para radiano 
theta_1 = theta1 * pi / 180;
theta_2 = theta2 * pi / 180;
theta_ = [theta_1 theta_2];
  
%valores para enviar pro controlador
sp1=4095*((theta_1/(2*pi))+0.25);
sp2=4095*((theta_2/(2*pi))+0.25);
%global sp;
 sp = [sp1; sp2]; %setpoints

%Envia set-point para o elipse
 write(itmsp1, sp(1))
 write(itmsp2, sp(2))
 
 pause (1.0)
 
 %Pega o ponto do caminho gerado pelo Algoritmo do CPA
theta1 = path_disc(10,1) 
theta2 = path_disc(10,2)

% graus para radiano 
theta_1 = theta1 * pi / 180;
theta_2 = theta2 * pi / 180;
theta_ = [theta_1 theta_2];
  
%valores para enviar pro controlador
sp1=4095*((theta_1/(2*pi))+0.25);
sp2=4095*((theta_2/(2*pi))+0.25);
%global sp;
 sp = [sp1; sp2]; %setpoints

%Envia set-point para o elipse
 write(itmsp1, sp(1))
 write(itmsp2, sp(2))
 pause (1.0)
 
 %Pega o ponto do caminho gerado pelo Algoritmo do CPA
theta1 = path_disc(15,1) 
theta2 = path_disc(15,2) 

% graus para radiano 
theta_1 = theta1 * pi / 180;
theta_2 = theta2 * pi / 180;
theta_ = [theta_1 theta_2];
  
%valores para enviar pro controlador
sp1=4095*((theta_1/(2*pi))+0.25);
sp2=4095*((theta_2/(2*pi))+0.25);
%global sp;
 sp = [sp1; sp2]; %setpoints

%Envia set-point para o elipse
 write(itmsp1, sp(1))
 write(itmsp2, sp(2))
 
 pause(1.0)
 
  %Pega o ponto do caminho gerado pelo Algoritmo do CPA
theta1 = path_disc(20,1) %-42
theta2 = path_disc(20,2) %-43

% graus para radiano 
theta_1 = theta1 * pi / 180;
theta_2 = theta2 * pi / 180;
theta_ = [theta_1 theta_2];
  
%valores para enviar pro controlador
sp1=4095*((theta_1/(2*pi))+0.25);
sp2=4095*((theta_2/(2*pi))+0.25);
%global sp;
 sp = [sp1; sp2]; %setpoints

%Envia set-point para o elipse
 write(itmsp1, sp(1))
 write(itmsp2, sp(2))
 pause (1.0)
 
 %Pega o ponto do caminho gerado pelo Algoritmo do CPA
theta1 = path_disc(25,1) %-42
theta2 = path_disc(25,2) %-43

% graus para radiano 
theta_1 = theta1 * pi / 180;
theta_2 = theta2 * pi / 180;
theta_ = [theta_1 theta_2];
  
%valores para enviar pro controlador
sp1=4095*((theta_1/(2*pi))+0.25);
sp2=4095*((theta_2/(2*pi))+0.25);
%global sp;
 sp = [sp1; sp2]; %setpoints

%Envia set-point para o elipse
 write(itmsp1, sp(1))
 write(itmsp2, sp(2))
 pause (1.0)
 
  %Pega o ponto do caminho gerado pelo Algoritmo do CPA
theta1 = path_disc(30,1) %-42
theta2 = path_disc(30,2) %-43

% graus para radiano 
theta_1 = theta1 * pi / 180;
theta_2 = theta2 * pi / 180;
theta_ = [theta_1 theta_2];
  
%valores para enviar pro controlador
sp1=4095*((theta_1/(2*pi))+0.25);
sp2=4095*((theta_2/(2*pi))+0.25);
%global sp;
 sp = [sp1; sp2]; %setpoints

%Envia set-point para o elipse
 write(itmsp1, sp(1))
 write(itmsp2, sp(2))
 pause (1.5)
 
%  %Pega o ponto do caminho gerado pelo Algoritmo do CPA
% theta1 = path_disc(35,1) %-42
% theta2 = path_disc(35,2) %-43
% 
% % graus para radiano 
% theta_1 = theta1 * pi / 180;
% theta_2 = theta2 * pi / 180;
% theta_ = [theta_1 theta_2];
%   
% %valores para enviar pro controlador
% sp1=4095*((theta_1/(2*pi))+0.25);
% sp2=4095*((theta_2/(2*pi))+0.25);
% %global sp;
%  sp = [sp1; sp2]; %setpoints
% 
% %Envia set-point para o elipse
%  write(itmsp1, sp(1))
%  write(itmsp2, sp(2))
%  pause (1.5)
%  
%  %Pega o ponto do caminho gerado pelo Algoritmo do CPA
% theta1 = path_disc(40,1) %-42
% theta2 = path_disc(40,2) %-43
% 
% % graus para radiano 
% theta_1 = theta1 * pi / 180;
% theta_2 = theta2 * pi / 180;
% theta_ = [theta_1 theta_2];
%   
% %valores para enviar pro controlador
% sp1=4095*((theta_1/(2*pi))+0.25);
% sp2=4095*((theta_2/(2*pi))+0.25);
% %global sp;
%  sp = [sp1; sp2]; %setpoints
% 
% %Envia set-point para o elipse
%  write(itmsp1, sp(1))
%  write(itmsp2, sp(2))
%  pause (1.5)
 
%  %Pega o ponto do caminho gerado pelo Algoritmo do CPA
% theta1 = path_disc(45,1) %-42
% theta2 = path_disc(45,2) %-43
% 
% % graus para radiano 
% theta_1 = theta1 * pi / 180;
% theta_2 = theta2 * pi / 180;
% theta_ = [theta_1 theta_2];
%   
% %valores para enviar pro controlador
% sp1=4095*((theta_1/(2*pi))+0.25);
% sp2=4095*((theta_2/(2*pi))+0.25);
% %global sp;
%  sp = [sp1; sp2]; %setpoints
% 
% %Envia set-point para o elipse
%  write(itmsp1, sp(1))
%  write(itmsp2, sp(2))
%  pause (1.5)
  
%  %Pega o ponto do caminho gerado pelo Algoritmo do CPA
% theta1 = path_disc(50,1) %-42
% theta2 = path_disc(50,2) %-43
% 
% % graus para radiano 
% theta_1 = theta1 * pi / 180;
% theta_2 = theta2 * pi / 180;
% theta_ = [theta_1 theta_2];
%   
% %valores para enviar pro controlador
% sp1=4095*((theta_1/(2*pi))+0.25);
% sp2=4095*((theta_2/(2*pi))+0.25);
% %global sp;
%  sp = [sp1; sp2]; %setpoints
% 
% %Envia set-point para o elipse
%  write(itmsp1, sp(1))
%  write(itmsp2, sp(2))
%  pause (1.5)
%  
 
  %Pega o ponto do caminho gerado pelo Algoritmo do CPA
theta1 = path_disc(1,1) %-42
theta2 = path_disc(1,2) %-43

% graus para radiano 
theta_1 = theta1 * pi / 180;
theta_2 = theta2 * pi / 180;
theta_ = [theta_1 theta_2];
  
%valores para enviar pro controlador
sp1=4095*((theta_1/(2*pi))+0.25);
sp2=4095*((theta_2/(2*pi))+0.25);
%global sp;
 sp = [sp1; sp2]; %setpoints

%Envia set-point para o elipse
 write(itmsp1, sp(1))
 write(itmsp2, sp(2))
 pause (4.5)
 
 
 %Ler as posições do elipse
a=read(itmpos1);
b=read(itmpos2);

teta1d=pi*(((2*a.Value)/4095)-0.5)*(180/pi)
teta2d=pi*(((2*b.Value)/4095)-0.5)*(180/pi)


%Ler os sinais das juntas
read(itmsinal1);
read(itmsinal2);

%Ler os erros
read(itmerr1);
read(itmerr2);

%plot(theta1)
%hold on
%plot (theta2)



%  %===========================================================
%  %Etapa para enviar valores para o Simulink
% v = [1 1 1];
% l = length(v);
% sig = [];
%  for n = 1:l
%      if v(n)==1
%          s = [sp1];
%      else 
%          s = [sp1];
%      end
%      sig=[sig s];
%  end
% rx1=double([(0:length(sig)-1)' , sig']); %Valor do SP1
% 
% v = [1 1 1];
% l = length(v);
% sig = [];
%  for n = 1:l
%      if v(n)==1
%          s = [sp2];
%      else 
%          s = [sp2];
%      end
%      sig=[sig s];
%  end
% rx2=double([(0:length(sig)-1)' , sig']); %Valor do SP2

%==================================================================

