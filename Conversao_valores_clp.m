%Calcular posições inicial e final
%Posição inicial
% sp1 = 1686;
% sp2 = 1097;

teta1d=pi*(((2*1000)/4095)-0.5)*(180/pi)
teta2d=pi*(((2*1000)/4095)-0.5)*(180/pi)


%Posição final
% theta1 = 542
% theta2 = 529
teta1d1 =pi*(((2*542)/4095)-0.5)*(180/pi);
teta2d2 =pi*(((2*529)/4095)-0.5)*(180/pi);

theta1 = 58; %path_disc(35,1) %-42
theta2 = 6; %path_disc(35,2) %-43

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
