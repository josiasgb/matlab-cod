%Ler valores do excel para pegar valores thetas das juntas
clear all;
close all;
clc;

%%------------------Dados sem obstáculo---------------
% filename = 'Ensaio_sem_obstaculo_para_pegar os thetas';
% SO = xlsread(filename);
% so1 = SO(:,5);  %Theta 1 dos set points 
% so2 = SO(:,3); %Theta 2 dos set points
% so3 = SO(:,2);  %Theta 1 dos set points 
% so4 = SO(:,4); %Theta 2 dos set points

% %Valores de theta em graus das entradas
% theta1 =pi*(((2*so1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*so2)/4095)-0.5)*(180/pi);
% %Valores de thetas reais
% theta1r =pi*(((2*so3)/4095)-0.5)*(180/pi);
% theta2r =pi*(((2*so4)/4095)-0.5)*(180/pi);
% 
% Err1 = (sum((theta1 - theta2r).^1))/length(theta1);%Junta 1
% Err2 = (sum((theta2 - theta1r).^1))/length(theta2);%Junta 2

%-------------------------------------------------
filename = 'Ensaio corpo_extenso-corpo extenso missão ponto para pegar os thetas';
BB = xlsread(filename);
bb1 = BB(:,5);  %Theta 1 dos set points 
bb2 = BB(:,3); %Theta 2 dos set points
bb3 = BB(:,2);  %Theta 1 real 
bb4 = BB(:,4); %Theta 2 real

%%%%%Valores de theta em graus das entradas
% theta1 =pi*(((2*bb1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*bb2)/4095)-0.5)*(180/pi);
% 
% %%%Valores de thetas reais
% theta1r =pi*(((2*bb3)/4095)-0.5)*(180/pi);
% theta2r =pi*(((2*bb4)/4095)-0.5)*(180/pi);


% figure;
% plot (theta1);
% hold on;
% plot (theta1r, 'r');

% figure;
% plot (theta2);
% hold on;
% plot (theta2r, 'r');
% % 
% Err1_1 = (sum(theta1(65:100) - theta1r(65:100)))/length(theta1(65:100));%length(theta1);%Junta 1
% Err1_2 = (sum(theta1(230:260) - theta1r(230:260)))/length(theta1(230:260));
% Err1_3 = (sum(theta1(270:305) - theta1r(270:305)))/length(theta1(270:305));
% Err1_4 = (sum(theta1(366:410) - theta1r(366:410)))/length(theta1(366:410));
% Err1_5 = (sum(theta1(410:444) - theta1r(410:444)))/length(theta1(410:444));
% Err1_6 = (sum(theta1(507:540) - theta1r(507:540)))/length(theta1(507:540));
% Err1_7 = (sum(theta1(550:584) - theta1r(550:584)))/length(theta1(550:584));
% Err1_8 = (sum(theta1(648:681) - theta1r(648:681)))/length(theta1(648:681));
% Err1_9 = (sum(theta1(691:725) - theta1r(691:725)))/length(theta1(691:725));
% Err1_10 = (sum(theta1(799:833) - theta1r(799:833)))/length(theta1(799:833));
% Err1_11 = (sum(theta1(845:879) - theta1r(845:879)))/length(theta1(845:879));
% Err1_12 = (sum(theta1(928:962) - theta1r(928:962)))/length(theta1(928:962));
% Err1_13 = (sum(theta1(974:1008) - theta1r(974:1008)))/length(theta1(974:1008));
% Err1_14 = (sum(theta1(1072:1105) - theta1r(1072:1105)))/length(theta1(1072:1105));
% Err1_15 = (sum(theta1(1118:1151) - theta1r(1118:1151)))/length(theta1(1118:1151));
% Err1_16 = (sum(theta1(1204:1239) - theta1r(1204:1239)))/length(theta1(1204:1239));
% Err1_17 = (sum(theta1(1550:1588) - theta1r(1550:1588)))/length(theta1(1550:1588));
% Err1_18 = (sum(theta1(1597:1634) - theta1r(1597:1634)))/length(theta1(1597:1634));
% Err1_19 = (sum(theta1(1695:1741) - theta1r(1695:1741)))/length(theta1(1695:1741));
% Err1_20 = (sum(theta1(1820:1868) - theta1r(1820:1868)))/length(theta1(1820:1868));
% 
% Vec_Err1 = [Err1_1; Err1_2; Err1_3; Err1_4; Err1_5; Err1_6; Err1_7; Err1_8; Err1_9; Err1_10; Err1_11; Err1_12; Err1_13; Err1_14; Err1_15; Err1_16; Err1_17; Err1_18; Err1_19; Err1_20];
% Err1_Med = mean(Vec_Err1);%média dos erros
% DP_Err1 = std(Vec_Err1);%desvio padrão
% 
% % Err2 = (sum((theta2 - theta2r)))/length(theta2);%Junta 2
% 
% Err2_1 = (sum(theta2(66:100) - theta2r(66:100)))/length(theta2(66:100));%length(theta1);%Junta 1
% Err2_2 = (sum(theta2(112:232) - theta2r(112:232)))/length(theta2(112:232));
% Err2_3 = (sum(theta2(232:265) - theta2r(232:265)))/length(theta2(232:265));
% Err2_4 = (sum(theta2(276:312) - theta2r(276:312)))/length(theta2(276:312));
% Err2_5 = (sum(theta2(367:401) - theta2r(367:401)))/length(theta2(367:401));
% Err2_6 = (sum(theta2(411:446) - theta2r(411:446)))/length(theta2(411:446));
% Err2_7 = (sum(theta2(505:554) - theta2r(505:554)))/length(theta2(505:554));
% Err2_8 = (sum(theta2(554:598) - theta2r(554:598)))/length(theta2(554:598));
% Err2_9 = (sum(theta2(646:693) - theta2r(646:693)))/length(theta2(646:693));
% Err2_10 = (sum(theta2(800:844) - theta2r(800:844)))/length(theta2(800:844));
% Err2_11 = (sum(theta2(844:883) - theta2r(844:883)))/length(theta2(844:883));
% Err2_12 = (sum(theta2(928:962) - theta2r(928:962)))/length(theta2(928:962));
% Err2_13 = (sum(theta2(974:1008) - theta2r(974:1008)))/length(theta2(974:1008));
% Err2_14 = (sum(theta2(1072:1105) - theta2r(1072:1105)))/length(theta2(1072:1105));
% Err2_15 = (sum(theta2(1118:1151) - theta2r(1118:1151)))/length(theta2(1118:1151));
% Err2_16 = (sum(theta2(1204:1239) - theta2r(1204:1239)))/length(theta2(1204:1239));
% Err2_17 = (sum(theta2(1402:1436) - theta2r(1402:1436)))/length(theta2(1402:1436));
% Err2_18 = (sum(theta2(1445:1480) - theta2r(1445:1480)))/length(theta2(1445:1480));
% Err2_19 = (sum(theta2(1551:1584) - theta2r(1551:1584)))/length(theta2(1551:1584));
% Err2_20 = (sum(theta2(1596:1630) - theta2r(1596:1630)))/length(theta2(1596:1630));
% 
% Vec_Err2 = [Err2_1; Err2_2; Err2_3; Err2_4; Err2_5; Err2_6; Err2_7; Err2_8; Err2_9; Err2_10; Err2_11; Err2_12; Err2_13; Err2_14; Err2_15; Err2_16; Err2_17; Err2_18; Err2_19; Err2_20];
% Err2_Med = mean(Vec_Err2);%média dos erros
% DP_Err2 = std(Vec_Err2);%desvio padrão


% %cinemática direta
% x=0.35.*cosd(theta1)+0.30.*cosd(theta1+theta2);
% y=0.35.*sind(theta1)+0.30.*sind(theta1+theta2);
% 
% xr=0.35.*cosd(theta1r)+0.30.*cosd(theta1r+theta2r);
% yr=0.35.*sind(theta1r)+0.30.*sind(theta1r+theta2r);


% for ct=1:2166, 
% plot (x(ct),  y(ct), 'r.'); hold on;
% pause(.1);
% end

% plot (x(500:700),  y(500:700), 'r'); 
% hold on;
% plot (xr(500:700),  yr(500:700), 'k')


% hold on;
% plot (y, 'r');

% figure;
% plot (theta2);
% hold on;
% plot (theta2r, 'r');

% figure;
% plot (theta1);
% hold on;
% plot (theta1r, 'r');


% figure;
% plot (theta2);
% hold on;
% plot (theta1r, 'r');


%-----------------------------------------------------------
%Dados do ensaio dois corpos extensos_missão zona
filename = 'Ensaio corpo_extenso-corpo extenso missão zona para pegar os thetas';
CC = xlsread(filename);
% cc1 = CC(:,5);  %Theta 1 dos set points 
% cc2 = CC(:,3); %Theta 2 dos set points
% cc3 = CC(:,2);  %Theta 1 real
% cc4 = CC(:,4); %Theta 2 real
% 
% %%%%%Valores de theta em graus das entradas
% theta1 =pi*(((2*cc1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*cc2)/4095)-0.5)*(180/pi);
% 
% %Valores de thetas reais
% theta1r =pi*(((2*cc3)/4095)-0.5)*(180/pi);
% theta2r =pi*(((2*cc4)/4095)-0.5)*(180/pi);

% Err1_1 = (sum(theta1(8:42) - theta1r(8:42)))/length(theta1(8:42));%length(theta1);%Junta 1
% Err1_2 = (sum(theta1(53:86) - theta1r(53:86)))/length(theta1(53:86));
% Err1_3 = (sum(theta1(143:179) - theta1r(143:179)))/length(theta1(143:179));
% Err1_4 = (sum(theta1(191:225) - theta1r(191:225)))/length(theta1(191:225));
% Err1_5 = (sum(theta1(279:314) - theta1r(279:314)))/length(theta1(279:314));
% Err1_6 = (sum(theta1(324:360) - theta1r(324:360)))/length(theta1(324:360));
% Err1_7 = (sum(theta1(415:450) - theta1r(415:450)))/length(theta1(415:450));
% Err1_8 = (sum(theta1(464:498) - theta1r(464:498)))/length(theta1(464:498));
% Err1_9 = (sum(theta1(562:596) - theta1r(562:596)))/length(theta1(562:596));
% Err1_10 = (sum(theta1(608:641) - theta1r(608:641)))/length(theta1(608:641));
% Err1_11 = (sum(theta1(688:724) - theta1r(688:724)))/length(theta1(688:724));
% Err1_12 = (sum(theta1(737:771) - theta1r(737:771)))/length(theta1(737:771));
% Err1_13 = (sum(theta1(848:882) - theta1r(848:882)))/length(theta1(848:882));
% Err1_14 = (sum(theta1(891:926) - theta1r(891:926)))/length(theta1(891:926));
% Err1_15 = (sum(theta1(997:1032) - theta1r(997:1032)))/length(theta1(997:1032));
% Err1_16 = (sum(theta1(1041:1074) - theta1r(1041:1074)))/length(theta1(1041:1074));
% Err1_17 = (sum(theta1(1145:1180) - theta1r(1145:1180)))/length(theta1(1145:1180));
% Err1_18 = (sum(theta1(1189:1227) - theta1r(1189:1227)))/length(theta1(1189:1227));
% % Err1_19 = (sum(theta1(1695:1741) - theta1r(1695:1741)))/length(theta1(1695:1741));
% % Err1_20 = (sum(theta1(1820:1868) - theta1r(1820:1868)))/length(theta1(1820:1868));
% 
% Vec_Err1 = [Err1_1; Err1_2; Err1_3; Err1_4; Err1_5; Err1_6; Err1_7; Err1_8; Err1_9; Err1_10; Err1_11; Err1_12; Err1_13; Err1_14; Err1_15; Err1_16; Err1_17; Err1_18];% Err1_19; Err1_20];
% Err1_Med = mean(Vec_Err1);%média dos erros
% DP_Err1 = std(Vec_Err1);%desvio padrão
% 
% % Err2 = (sum((theta2 - theta2r)))/length(theta2);%Junta 2
% 
% Err2_1 = (sum(theta2(8:45) - theta2r(8:45)))/length(theta2(8:45));%length(theta1);%Junta 1
% Err2_2 = (sum(theta2(53:90) - theta2r(53:90)))/length(theta2(53:90));
% Err2_3 = (sum(theta2(143:181) - theta2r(143:181)))/length(theta2(143:181));
% Err2_4 = (sum(theta2(191:228) - theta2r(191:228)))/length(theta2(191:228));
% Err2_5 = (sum(theta2(279:316) - theta2r(279:316)))/length(theta2(279:316));
% Err2_6 = (sum(theta2(326:362) - theta2r(326:362)))/length(theta2(326:362));
% Err2_7 = (sum(theta2(416:448) - theta2r(416:448)))/length(theta2(416:448));
% Err2_8 = (sum(theta2(465:502) - theta2r(465:502)))/length(theta2(465:502));
% Err2_9 = (sum(theta2(561:596) - theta2r(561:596)))/length(theta2(561:596));
% Err2_10 = (sum(theta2(608:642) - theta2r(608:642)))/length(theta2(608:642));
% Err2_11 = (sum(theta2(686:725) - theta2r(686:725)))/length(theta2(686:725));
% Err2_12 = (sum(theta2(736:772) - theta2r(736:772)))/length(theta2(736:772));
% Err2_13 = (sum(theta2(849:885) - theta2r(849:885)))/length(theta2(849:885));
% Err2_14 = (sum(theta2(892:939) - theta2r(892:939)))/length(theta2(892:939));
% Err2_15 = (sum(theta2(1290:1324) - theta2r(1290:1324)))/length(theta2(1290:1324));
% Err2_16 = (sum(theta2(1336:1371) - theta2r(1336:1371)))/length(theta2(1336:1371));
% Err2_17 = (sum(theta2(1451:1486) - theta2r(1451:1486)))/length(theta2(1451:1486));
% Err2_18 = (sum(theta2(1451:1486) - theta2r(1451:1486)))/length(theta2(1451:1486));
% % Err2_19 = (sum(theta2(1551:1584) - theta2r(1551:1584)))/length(theta2(1551:1584));
% % Err2_20 = (sum(theta2(1596:1630) - theta2r(1596:1630)))/length(theta2(1596:1630));
% 
% Vec_Err2 = [Err2_1; Err2_2; Err2_3; Err2_4; Err2_5; Err2_6; Err2_7; Err2_8; Err2_9; Err2_10; Err2_11; Err2_12; Err2_13; Err2_14; Err2_15; Err2_16; Err2_17; Err2_18];%; Err2_19; Err2_20];
% Err2_Med = mean(Vec_Err2);%média dos erros
% DP_Err2 = std(Vec_Err2);%desvio padrão
% 
% 
% % figure;
% % plot (theta1);
% % hold on;
% % plot (theta1r, 'r');
% 
% figure;
% plot (theta2);
% hold on;
% plot (theta2r, 'r');

% % 
% % Err1 = (sum((theta1 - theta1r)))/length(theta1);%Junta 1
% % Err2 = (sum((theta2 - theta2r)))/length(theta2);%Junta 2
% 
% %cinemática direta
% x=0.35.*cosd(theta1)+0.30.*cosd(theta1+theta2);
% y=0.35.*sind(theta1)+0.30.*sind(theta1+theta2);
% 
% xr=0.35.*cosd(theta1r)+0.30.*cosd(theta1r+theta2r);
% yr=0.35.*sind(theta1r)+0.30.*sind(theta1r+theta2r);
% 
% subplot(2, 2, 1);
% plot (x(1:30),  y(1:30), 'r-*'); 
% hold on;
% plot (xr(1:30),  yr(1:30), 'b-*');
% title('Intervalo de tempo de 1 a 30');
% xlabel('Eixo X');
% ylabel('Eixo Y');
% legend('Caminho real','Caminho CP');% inserir legenda, na ordem
% 
% subplot(2, 2, 2);
% plot (x(464:477),  y(464:477), 'r-*'); 
% hold on;
% plot (xr(464:477),  yr(464:477), 'b-*');
% title('Intervalo de tempo de 464 a 477');
% xlabel('Eixo X');
% ylabel('Eixo Y');
% legend('Caminho real','Caminho CP');% inserir legenda, na ordem
% 
% subplot(2, 2, 3);
% plot (x(886:910),  y(886:910), 'r-*'); 
% hold on;
% plot (xr(886:910),  yr(886:910),'b-*')
% title('Intervalo de tempo de 886 a 910');
% xlabel('Eixo X');
% ylabel('Eixo Y');
% legend('Caminho real','Caminho CP');% inserir legenda, na ordem
% 
% subplot(2, 2, 4);
% plot (x(2020:2040),  y(2020:2040), 'r-*'); 
% hold on;
% plot (xr(2020:2040),  yr(2020:2040), 'b-*');
% title('Intervalo de tempo de 2020 a 2040');
% xlabel('Eixo X');
% ylabel('Eixo Y');
% legend('Caminho real','Caminho CP');% inserir legenda, na ordem

% figure;
% plot (theta1);
% hold on;
% plot (theta1r, 'r');

% figure;
% plot (theta2);
% hold on;
% plot (theta2r, 'r');


%---------------------------------------------------------
%Dados do ensaio corpo extenso_ponto_missão ponto

filename = 'Ensaio corpo_extenso-ponto missão ponto para pegar os thetas';
DD = xlsread(filename);
% dd1 = DD(:,5);  %Theta 1 dos set points 
% dd2 = DD(:,3); %Theta 2 dos set points
% dd3 = DD(:,2);  %Theta 1 dos set points 
% dd4 = DD(:,4); %Theta 2 dos set points
% 
% %%%%%Valores de theta em graus das entradas
% theta1 =pi*(((2*dd1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*dd2)/4095)-0.5)*(180/pi);
% 
% %Valores de thetas reais
% theta1r =pi*(((2*dd3)/4095)-0.5)*(180/pi);
% theta2r =pi*(((2*dd4)/4095)-0.5)*(180/pi);

% Err1_1 = (sum(theta1(8:42) - theta1r(8:42)))/length(theta1(8:42));%length(theta1);%Junta 1
% Err1_2 = (sum(theta1(53:86) - theta1r(53:86)))/length(theta1(53:86));
% Err1_3 = (sum(theta1(143:179) - theta1r(143:179)))/length(theta1(143:179));
% Err1_4 = (sum(theta1(191:225) - theta1r(191:225)))/length(theta1(191:225));
% Err1_5 = (sum(theta1(279:314) - theta1r(279:314)))/length(theta1(279:314));
% Err1_6 = (sum(theta1(324:360) - theta1r(324:360)))/length(theta1(324:360));
% Err1_7 = (sum(theta1(415:450) - theta1r(415:450)))/length(theta1(415:450));
% Err1_8 = (sum(theta1(464:498) - theta1r(464:498)))/length(theta1(464:498));
% Err1_9 = (sum(theta1(562:596) - theta1r(562:596)))/length(theta1(562:596));
% Err1_10 = (sum(theta1(608:641) - theta1r(608:641)))/length(theta1(608:641));
% Err1_11 = (sum(theta1(688:724) - theta1r(688:724)))/length(theta1(688:724));
% Err1_12 = (sum(theta1(737:771) - theta1r(737:771)))/length(theta1(737:771));
% Err1_13 = (sum(theta1(848:882) - theta1r(848:882)))/length(theta1(848:882));
% Err1_14 = (sum(theta1(891:926) - theta1r(891:926)))/length(theta1(891:926));
% Err1_15 = (sum(theta1(997:1032) - theta1r(997:1032)))/length(theta1(997:1032));
% Err1_16 = (sum(theta1(1041:1074) - theta1r(1041:1074)))/length(theta1(1041:1074));
% Err1_17 = (sum(theta1(1145:1180) - theta1r(1145:1180)))/length(theta1(1145:1180));
% Err1_18 = (sum(theta1(1189:1227) - theta1r(1189:1227)))/length(theta1(1189:1227));
% % Err1_19 = (sum(theta1(1695:1741) - theta1r(1695:1741)))/length(theta1(1695:1741));
% % Err1_20 = (sum(theta1(1820:1868) - theta1r(1820:1868)))/length(theta1(1820:1868));
% 
% Vec_Err1 = [Err1_1; Err1_2; Err1_3; Err1_4; Err1_5; Err1_6; Err1_7; Err1_8; Err1_9; Err1_10; Err1_11; Err1_12; Err1_13; Err1_14; Err1_15; Err1_16; Err1_17; Err1_18];% Err1_19; Err1_20];
% Err1_Med = mean(Vec_Err1);%média dos erros
% DP_Err1 = std(Vec_Err1);%desvio padrão
% 
% % Err2 = (sum((theta2 - theta2r)))/length(theta2);%Junta 2
% 
% Err2_1 = (sum(theta2(184:223) - theta2r(184:223)))/length(theta2(184:223));%length(theta1);%Junta 1
% Err2_2 = (sum(theta2(228:265) - theta2r(228:265)))/length(theta2(228:265));
% Err2_3 = (sum(theta2(269:306) - theta2r(269:306)))/length(theta2(269:306));
% Err2_4 = (sum(theta2(370:400) - theta2r(370:400)))/length(theta2(370:400));
% Err2_5 = (sum(theta2(411:441) - theta2r(411:441)))/length(theta2(411:441));
% Err2_6 = (sum(theta2(520:552) - theta2r(520:552)))/length(theta2(520:552));
% Err2_7 = (sum(theta2(561:590) - theta2r(561:590)))/length(theta2(561:590));
% Err2_8 = (sum(theta2(643:675) - theta2r(643:675)))/length(theta2(643:675));
% Err2_9 = (sum(theta2(684:713) - theta2r(684:713)))/length(theta2(684:713));
% Err2_10 = (sum(theta2(791:830) - theta2r(791:830)))/length(theta2(791:830));
% Err2_11 = (sum(theta2(836:875) - theta2r(836:875)))/length(theta2(836:875));
% Err2_12 = (sum(theta2(736:772) - theta2r(736:772)))/length(theta2(736:772));
% Err2_13 = (sum(theta2(952:991) - theta2r(952:991)))/length(theta2(952:991));
% Err2_14 = (sum(theta2(998:1038) - theta2r(998:1038)))/length(theta2(998:1038));
% Err2_15 = (sum(theta2(1220:1258) - theta2r(1220:1258)))/length(theta2(1220:1258));
% Err2_16 = (sum(theta2(1262:1299) - theta2r(1262:1299)))/length(theta2(1262:1299));
% Err2_17 = (sum(theta2(1366:1403) - theta2r(1366:1403)))/length(theta2(1366:1403));
% Err2_18 = (sum(theta2(1403:1443) - theta2r(1403:1443)))/length(theta2(1403:1443));
% % Err2_19 = (sum(theta2(1551:1584) - theta2r(1551:1584)))/length(theta2(1551:1584));
% % Err2_20 = (sum(theta2(1596:1630) - theta2r(1596:1630)))/length(theta2(1596:1630));
% 
% Vec_Err2 = [Err2_1; Err2_2; Err2_3; Err2_4; Err2_5; Err2_6; Err2_7; Err2_8; Err2_9; Err2_10; Err2_11; Err2_12; Err2_13; Err2_14; Err2_15; Err2_16; Err2_17; Err2_18];%; Err2_19; Err2_20];
% Err2_Med = mean(Vec_Err2);%média dos erros
% DP_Err2 = std(Vec_Err2);%desvio padrão


% % figure;
% % plot (theta1);
% % hold on;
% % plot (theta1r, 'r');
% 
% figure;
% plot (theta2);
% hold on;
% plot (theta2r, 'r');

% 
% Err1 = (sum((theta1 - theta1r)))/length(theta1);%Junta 1
% Err2 = (sum((theta2 - theta2r)))/length(theta2);%Junta 2

%----------------------------------------------
%Dados do ensaio corpo extenso_ponto_missão zona
filename = 'Ensaio corpo_extenso-ponto missão zona para pegar os thetas';
EE = xlsread(filename);

ee1 = EE(:,5);  %Theta 1 dos set points 
ee2 = EE(:,3); %Theta 2 dos set points
ee3 = EE(:,2);  %Theta 1 dos set points 
ee4 = EE(:,4); %Theta 2 dos set points

%%%%%Valores de theta em graus das entradas
theta1 =pi*(((2*ee1)/4095)-0.5)*(180/pi);
theta2 =pi*(((2*ee2)/4095)-0.5)*(180/pi);

%Valores de thetas reais
theta1r =pi*(((2*ee3)/4095)-0.5)*(180/pi);
theta2r =pi*(((2*ee4)/4095)-0.5)*(180/pi);

% %cinemática direta
x=0.35.*cosd(theta1)+0.30.*cosd(theta1+theta2);
y=0.35.*sind(theta1)+0.30.*sind(theta1+theta2);

xr=(theta1r)+0.30.*cosd(theta1r+theta2r);
yr=0.35.*sind(theta1r)+0.30.*sind(theta1r+theta2r);

subplot(2, 2, 1);
plot (x(66:76),  y(66:76), 'r-*'); 
hold on;
plot (xr(66:78),  yr(66:78), 'b-*');
title('Intervalo de tempo de 66 a 78');
xlabel('Eixor=0.35.*cosd X');
ylabel('Eixo Y');
legend('Caminho real','Caminho CP');% inserir legenda, na ordem

subplot(2, 2, 2);
plot (x(408:430),  y(408:430), 'r-*'); 
hold on;
plot (xr(408:431),  yr(408:431), 'b-*');
title('Intervalo de tempo de 408 a 430');
xlabel('Eixo X');
ylabel('Eixo Y');
legend('Caminho real','Caminho CP');% inserir legenda, na ordem

subplot(2, 2, 3);
plot (x(886:905),  y(886:905), 'r-*'); 
hold on;
plot (xr(886:907),  yr(886:907),'b-*')
title('Intervalo de tempo de 886 a 910');
xlabel('Eixo X');
ylabel('Eixo Y');
legend('Caminho real','Caminho CP');% inserir legenda, na ordem

subplot(2, 2, 4);
plot (x(1770:1776),  y(1770:1776), 'r-*'); 
hold on;
plot (xr(1770:1780),  yr(1770:1780), 'b-*');
title('Intervalo de tempo de 1770 a 1780');
xlabel('Eixo X');
ylabel('Eixo Y');
legend('Caminho real','Caminho CP');% inserir legenda, na ordem

% 
% figure;
% plot (theta1);
% hold on;
% plot (theta1r, 'r');
% 
% % figure;
% % plot (theta2);
% % hold on;
% % plot (theta2r, 'r');



% Err1_1 = (sum(theta1(8:42) - theta1r(8:42)))/length(theta1(8:42));%length(theta1);%Junta 1
% Err1_2 = (sum(theta1(53:86) - theta1r(53:86)))/length(theta1(53:86));
% Err1_3 = (sum(theta1(143:179) - theta1r(143:179)))/length(theta1(143:179));
% Err1_4 = (sum(theta1(191:225) - theta1r(191:225)))/length(theta1(191:225));
% Err1_5 = (sum(theta1(279:314) - theta1r(279:314)))/length(theta1(279:314));
% Err1_6 = (sum(theta1(324:360) - theta1r(324:360)))/length(theta1(324:360));
% Err1_7 = (sum(theta1(415:450) - theta1r(415:450)))/length(theta1(415:450));
% Err1_8 = (sum(theta1(464:498) - theta1r(464:498)))/length(theta1(464:498));
% Err1_9 = (sum(theta1(562:596) - theta1r(562:596)))/length(theta1(562:596));
% Err1_10 = (sum(theta1(608:641) - theta1r(608:641)))/length(theta1(608:641));
% Err1_11 = (sum(theta1(688:724) - theta1r(688:724)))/length(theta1(688:724));
% Err1_12 = (sum(theta1(737:771) - theta1r(737:771)))/length(theta1(737:771));
% Err1_13 = (sum(theta1(848:882) - theta1r(848:882)))/length(theta1(848:882));
% Err1_14 = (sum(theta1(891:926) - theta1r(891:926)))/length(theta1(891:926));
% Err1_15 = (sum(theta1(997:1032) - theta1r(997:1032)))/length(theta1(997:1032));
% Err1_16 = (sum(theta1(1041:1074) - theta1r(1041:1074)))/length(theta1(1041:1074));
% Err1_17 = (sum(theta1(1145:1180) - theta1r(1145:1180)))/length(theta1(1145:1180));
% Err1_18 = (sum(theta1(1189:1227) - theta1r(1189:1227)))/length(theta1(1189:1227));
% % Err1_19 = (sum(theta1(1695:1741) - theta1r(1695:1741)))/length(theta1(1695:1741));
% % Err1_20 = (sum(theta1(1820:1868) - theta1r(1820:1868)))/length(theta1(1820:1868));
% 
% Vec_Err1 = [Err1_1; Err1_2; Err1_3; Err1_4; Err1_5; Err1_6; Err1_7; Err1_8; Err1_9; Err1_10; Err1_11; Err1_12; Err1_13; Err1_14; Err1_15; Err1_16; Err1_17; Err1_18];% Err1_19; Err1_20];
% Err1_Med = mean(Vec_Err1);%média dos erros
% DP_Err1 = std(Vec_Err1);%desvio padrão
% 
% % Err2 = (sum((theta2 - theta2r)))/length(theta2);%Junta 2
% 
% Err2_1 = (sum(theta2(184:223) - theta2r(184:223)))/length(theta2(184:223));%length(theta1);%Junta 1
% Err2_2 = (sum(theta2(228:265) - theta2r(228:265)))/length(theta2(228:265));
% Err2_3 = (sum(theta2(269:306) - theta2r(269:306)))/length(theta2(269:306));
% Err2_4 = (sum(theta2(370:400) - theta2r(370:400)))/length(theta2(370:400));
% Err2_5 = (sum(theta2(411:441) - theta2r(411:441)))/length(theta2(411:441));
% Err2_6 = (sum(theta2(520:552) - theta2r(520:552)))/length(theta2(520:552));
% Err2_7 = (sum(theta2(561:590) - theta2r(561:590)))/length(theta2(561:590));
% Err2_8 = (sum(theta2(643:675) - theta2r(643:675)))/length(theta2(643:675));
% Err2_9 = (sum(theta2(684:713) - theta2r(684:713)))/length(theta2(684:713));
% Err2_10 = (sum(theta2(791:830) - theta2r(791:830)))/length(theta2(791:830));
% Err2_11 = (sum(theta2(836:875) - theta2r(836:875)))/length(theta2(836:875));
% Err2_12 = (sum(theta2(736:772) - theta2r(736:772)))/length(theta2(736:772));
% Err2_13 = (sum(theta2(952:991) - theta2r(952:991)))/length(theta2(952:991));
% Err2_14 = (sum(theta2(998:1038) - theta2r(998:1038)))/length(theta2(998:1038));
% Err2_15 = (sum(theta2(1220:1258) - theta2r(1220:1258)))/length(theta2(1220:1258));
% Err2_16 = (sum(theta2(1262:1299) - theta2r(1262:1299)))/length(theta2(1262:1299));
% Err2_17 = (sum(theta2(1366:1403) - theta2r(1366:1403)))/length(theta2(1366:1403));
% Err2_18 = (sum(theta2(1403:1443) - theta2r(1403:1443)))/length(theta2(1403:1443));
% % Err2_19 = (sum(theta2(1551:1584) - theta2r(1551:1584)))/length(theta2(1551:1584));
% % Err2_20 = (sum(theta2(1596:1630) - theta2r(1596:1630)))/length(theta2(1596:1630));
% 
% Vec_Err2 = [Err2_1; Err2_2; Err2_3; Err2_4; Err2_5; Err2_6; Err2_7; Err2_8; Err2_9; Err2_10; Err2_11; Err2_12; Err2_13; Err2_14; Err2_15; Err2_16; Err2_17; Err2_18];%; Err2_19; Err2_20];
% Err2_Med = mean(Vec_Err2);%média dos erros
% DP_Err2 = std(Vec_Err2);%desvio padrão



% Err1 = (sum((theta1 - theta1r)))/length(theta1);%Junta 1
% Err2 = (sum((theta2 - theta2r)))/length(theta2);%Junta 2


% figure;
% plot (theta1);
% hold on;
% plot (theta1r, 'r');

% figure;
% plot (theta2);
% hold on;
% plot (theta2r, 'r');


%------------------------------------------------------
%Dados do ensaio ponto-corpo extenso_missão:ponto
filename = 'Ensaio ponto-corpo extenso missão ponto para pegar os thetas';
FF = xlsread(filename);

% ff1 = FF(:,5);  %Theta 1 dos set points 
% ff2 = FF(:,3); %Theta 2 dos set points
% ff3 = FF(:,2);  %Theta 1 dos set points 
% ff4 = FF(:,4); %Theta 2 dos set points
% 
% %%%%%Valores de theta em graus das entradas
% theta1 =pi*(((2*ff1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*ff2)/4095)-0.5)*(180/pi);
% 
% %Valores de thetas reais
% theta1r =pi*(((2*ff3)/4095)-0.5)*(180/pi);
% theta2r =pi*(((2*ff4)/4095)-0.5)*(180/pi);
% 
% % %cinemática direta
% x=0.35.*cosd(theta1)+0.30.*cosd(theta1+theta2);
% y=0.35.*sind(theta1)+0.30.*sind(theta1+theta2);
% 
% xr=0.35.*cosd(theta1r)+0.30.*cosd(theta1r+theta2r);
% yr=0.35.*sind(theta1r)+0.30.*sind(theta1r+theta2r);
% 
% subplot(2, 2, 1);
% plot (x(110:128),  y(110:128), 'r-*'); 
% hold on;
% plot (xr(110:130),  yr(110:130), 'b-*');
% title('Intervalo de tempo de 110 a 130');
% xlabel('Eixo X');
% ylabel('Eixo Y');
% legend('Caminho real','Caminho CP');% inserir legenda, na ordem
% 
% subplot(2, 2, 2);
% plot (x(245:264),  y(245:264), 'r-*'); 
% hold on;
% plot (xr(245:267),  yr(245:267), 'b-*');
% title('Intervalo de tempo de 245 a 264');
% xlabel('Eixo X');
% ylabel('Eixo Y');
% legend('Caminho real','Caminho CP');% inserir legenda, na ordem
% 
% subplot(2, 2, 3);
% plot (x(770:795),  y(770:795), 'r-*'); 
% hold on;
% plot (xr(778:797),  yr(778:797),'b-*')
% title('Intervalo de tempo de 778 a 797');
% xlabel('Eixo X');
% ylabel('Eixo Y');
% legend('Caminho real','Caminho CP');% inserir legenda, na ordem
% 
% subplot(2, 2, 4);
% plot (x(1507:1525),  y(1507:1525), 'r-*'); 
% hold on;
% plot (xr(1507:1527),  yr(1507:1527), 'b-*');
% title('Intervalo de tempo de 1507 a 1525');
% xlabel('Eixo X');
% ylabel('Eixo Y');
% legend('Caminho real','Caminho CP');% inserir legenda, na ordem

% 
% figure;
% plot (theta1);
% hold on;
% plot (theta1r, 'r');

% figure;
% plot (theta2);
% hold on;
% plot (theta2r, 'r');


% Err1_1 = (sum(theta1(8:42) - theta1r(8:42)))/length(theta1(8:42));%length(theta1);%Junta 1
% Err1_2 = (sum(theta1(53:86) - theta1r(53:86)))/length(theta1(53:86));
% Err1_3 = (sum(theta1(143:179) - theta1r(143:179)))/length(theta1(143:179));
% Err1_4 = (sum(theta1(191:225) - theta1r(191:225)))/length(theta1(191:225));
% Err1_5 = (sum(theta1(279:314) - theta1r(279:314)))/length(theta1(279:314));
% Err1_6 = (sum(theta1(324:360) - theta1r(324:360)))/length(theta1(324:360));
% Err1_7 = (sum(theta1(415:450) - theta1r(415:450)))/length(theta1(415:450));
% Err1_8 = (sum(theta1(464:498) - theta1r(464:498)))/length(theta1(464:498));
% Err1_9 = (sum(theta1(562:596) - theta1r(562:596)))/length(theta1(562:596));
% Err1_10 = (sum(theta1(608:641) - theta1r(608:641)))/length(theta1(608:641));
% Err1_11 = (sum(theta1(688:724) - theta1r(688:724)))/length(theta1(688:724));
% Err1_12 = (sum(theta1(737:771) - theta1r(737:771)))/length(theta1(737:771));
% Err1_13 = (sum(theta1(848:882) - theta1r(848:882)))/length(theta1(848:882));
% Err1_14 = (sum(theta1(891:926) - theta1r(891:926)))/length(theta1(891:926));
% Err1_15 = (sum(theta1(997:1032) - theta1r(997:1032)))/length(theta1(997:1032));
% Err1_16 = (sum(theta1(1041:1074) - theta1r(1041:1074)))/length(theta1(1041:1074));
% Err1_17 = (sum(theta1(1145:1180) - theta1r(1145:1180)))/length(theta1(1145:1180));
% Err1_18 = (sum(theta1(1189:1227) - theta1r(1189:1227)))/length(theta1(1189:1227));
% % Err1_19 = (sum(theta1(1695:1741) - theta1r(1695:1741)))/length(theta1(1695:1741));
% % Err1_20 = (sum(theta1(1820:1868) - theta1r(1820:1868)))/length(theta1(1820:1868));
% 
% Vec_Err1 = [Err1_1; Err1_2; Err1_3; Err1_4; Err1_5; Err1_6; Err1_7; Err1_8; Err1_9; Err1_10; Err1_11; Err1_12; Err1_13; Err1_14; Err1_15; Err1_16; Err1_17; Err1_18];% Err1_19; Err1_20];
% Err1_Med = mean(Vec_Err1);%média dos erros
% DP_Err1 = std(Vec_Err1);%desvio padrão
% 
% % Err2 = (sum((theta2 - theta2r)))/length(theta2);%Junta 2
% 
% Err2_1 = (sum(theta2(184:223) - theta2r(184:223)))/length(theta2(184:223));%length(theta1);%Junta 1
% Err2_2 = (sum(theta2(228:265) - theta2r(228:265)))/length(theta2(228:265));
% Err2_3 = (sum(theta2(269:306) - theta2r(269:306)))/length(theta2(269:306));
% Err2_4 = (sum(theta2(370:400) - theta2r(370:400)))/length(theta2(370:400));
% Err2_5 = (sum(theta2(411:441) - theta2r(411:441)))/length(theta2(411:441));
% Err2_6 = (sum(theta2(520:552) - theta2r(520:552)))/length(theta2(520:552));
% Err2_7 = (sum(theta2(561:590) - theta2r(561:590)))/length(theta2(561:590));
% Err2_8 = (sum(theta2(643:675) - theta2r(643:675)))/length(theta2(643:675));
% Err2_9 = (sum(theta2(684:713) - theta2r(684:713)))/length(theta2(684:713));
% Err2_10 = (sum(theta2(791:830) - theta2r(791:830)))/length(theta2(791:830));
% Err2_11 = (sum(theta2(836:875) - theta2r(836:875)))/length(theta2(836:875));
% Err2_12 = (sum(theta2(736:772) - theta2r(736:772)))/length(theta2(736:772));
% Err2_13 = (sum(theta2(952:991) - theta2r(952:991)))/length(theta2(952:991));
% Err2_14 = (sum(theta2(998:1038) - theta2r(998:1038)))/length(theta2(998:1038));
% Err2_15 = (sum(theta2(1220:1258) - theta2r(1220:1258)))/length(theta2(1220:1258));
% Err2_16 = (sum(theta2(1262:1299) - theta2r(1262:1299)))/length(theta2(1262:1299));
% Err2_17 = (sum(theta2(1366:1403) - theta2r(1366:1403)))/length(theta2(1366:1403));
% Err2_18 = (sum(theta2(1403:1443) - theta2r(1403:1443)))/length(theta2(1403:1443));
% % Err2_19 = (sum(theta2(1551:1584) - theta2r(1551:1584)))/length(theta2(1551:1584));
% % Err2_20 = (sum(theta2(1596:1630) - theta2r(1596:1630)))/length(theta2(1596:1630));
% 
% Vec_Err2 = [Err2_1; Err2_2; Err2_3; Err2_4; Err2_5; Err2_6; Err2_7; Err2_8; Err2_9; Err2_10; Err2_11; Err2_12; Err2_13; Err2_14; Err2_15; Err2_16; Err2_17; Err2_18];%; Err2_19; Err2_20];
% Err2_Med = mean(Vec_Err2);%média dos erros
% DP_Err2 = std(Vec_Err2);%desvio padrão
% 
% Err1 = (sum((theta1 - theta1r)))/length(theta1);%Junta 1
% Err2 = (sum((theta2 - theta2r)))/length(theta2);%Junta 2


%%-------------------------------------------------------
%Dados do ensaio ponto-corpo extenso_missão:zona
filename = 'Ensaio ponto-corpo extenso missão zona para pegar os thetas';
GG = xlsread(filename);

% gg1 = GG(:,5);  %Theta 1 dos set points 
% gg2 = GG(:,3); %Theta 2 dos set points
% gg3 = GG(:,2);  %Theta 1 dos set points 
% gg4 = GG(:,4); %Theta 2 dos set points
% 
% %%%%Valores de theta em graus das entradas
% theta1 =pi*(((2*gg1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*gg2)/4095)-0.5)*(180/pi);
% 
% %Valores de thetas reais
% theta1r =pi*(((2*gg3)/4095)-0.5)*(180/pi);
% theta2r =pi*(((2*gg4)/4095)-0.5)*(180/pi);
% % 
% Err1_1 = (sum(theta1(8:42) - theta1r(8:42)))/length(theta1(8:42));%length(theta1);%Junta 1
% Err1_2 = (sum(theta1(53:86) - theta1r(53:86)))/length(theta1(53:86));
% Err1_3 = (sum(theta1(143:179) - theta1r(143:179)))/length(theta1(143:179));
% Err1_4 = (sum(theta1(191:225) - theta1r(191:225)))/length(theta1(191:225));
% Err1_5 = (sum(theta1(279:314) - theta1r(279:314)))/length(theta1(279:314));
% Err1_6 = (sum(theta1(324:360) - theta1r(324:360)))/length(theta1(324:360));
% Err1_7 = (sum(theta1(415:450) - theta1r(415:450)))/length(theta1(415:450));
% Err1_8 = (sum(theta1(464:498) - theta1r(464:498)))/length(theta1(464:498));
% Err1_9 = (sum(theta1(562:596) - theta1r(562:596)))/length(theta1(562:596));
% Err1_10 = (sum(theta1(608:641) - theta1r(608:641)))/length(theta1(608:641));
% Err1_11 = (sum(theta1(688:724) - theta1r(688:724)))/length(theta1(688:724));
% Err1_12 = (sum(theta1(737:771) - theta1r(737:771)))/length(theta1(737:771));
% Err1_13 = (sum(theta1(848:882) - theta1r(848:882)))/length(theta1(848:882));
% Err1_14 = (sum(theta1(891:926) - theta1r(891:926)))/length(theta1(891:926));
% Err1_15 = (sum(theta1(997:1032) - theta1r(997:1032)))/length(theta1(997:1032));
% Err1_16 = (sum(theta1(1041:1074) - theta1r(1041:1074)))/length(theta1(1041:1074));
% Err1_17 = (sum(theta1(1145:1180) - theta1r(1145:1180)))/length(theta1(1145:1180));
% Err1_18 = (sum(theta1(1189:1227) - theta1r(1189:1227)))/length(theta1(1189:1227));
% % Err1_19 = (sum(theta1(1695:1741) - theta1r(1695:1741)))/length(theta1(1695:1741));
% % Err1_20 = (sum(theta1(1820:1868) - theta1r(1820:1868)))/length(theta1(1820:1868));
% 
% Vec_Err1 = [Err1_1; Err1_2; Err1_3; Err1_4; Err1_5; Err1_6; Err1_7; Err1_8; Err1_9; Err1_10; Err1_11; Err1_12; Err1_13; Err1_14; Err1_15; Err1_16; Err1_17; Err1_18];% Err1_19; Err1_20];
% Err1_Med = mean(Vec_Err1);%média dos erros
% DP_Err1 = std(Vec_Err1);%desvio padrão
% 
% % Err2 = (sum((theta2 - theta2r)))/length(theta2);%Junta 2
% 
% Err2_1 = (sum(theta2(184:223) - theta2r(184:223)))/length(theta2(184:223));%length(theta1);%Junta 1
% Err2_2 = (sum(theta2(228:265) - theta2r(228:265)))/length(theta2(228:265));
% Err2_3 = (sum(theta2(269:306) - theta2r(269:306)))/length(theta2(269:306));
% Err2_4 = (sum(theta2(370:400) - theta2r(370:400)))/length(theta2(370:400));
% Err2_5 = (sum(theta2(411:441) - theta2r(411:441)))/length(theta2(411:441));
% Err2_6 = (sum(theta2(520:552) - theta2r(520:552)))/length(theta2(520:552));
% Err2_7 = (sum(theta2(561:590) - theta2r(561:590)))/length(theta2(561:590));
% Err2_8 = (sum(theta2(643:675) - theta2r(643:675)))/length(theta2(643:675));
% Err2_9 = (sum(theta2(684:713) - theta2r(684:713)))/length(theta2(684:713));
% Err2_10 = (sum(theta2(791:830) - theta2r(791:830)))/length(theta2(791:830));
% Err2_11 = (sum(theta2(836:875) - theta2r(836:875)))/length(theta2(836:875));
% Err2_12 = (sum(theta2(736:772) - theta2r(736:772)))/length(theta2(736:772));
% Err2_13 = (sum(theta2(952:991) - theta2r(952:991)))/length(theta2(952:991));
% Err2_14 = (sum(theta2(998:1038) - theta2r(998:1038)))/length(theta2(998:1038));
% Err2_15 = (sum(theta2(1220:1258) - theta2r(1220:1258)))/length(theta2(1220:1258));
% Err2_16 = (sum(theta2(1262:1299) - theta2r(1262:1299)))/length(theta2(1262:1299));
% Err2_17 = (sum(theta2(1366:1403) - theta2r(1366:1403)))/length(theta2(1366:1403));
% Err2_18 = (sum(theta2(1403:1443) - theta2r(1403:1443)))/length(theta2(1403:1443));
% % Err2_19 = (sum(theta2(1551:1584) - theta2r(1551:1584)))/length(theta2(1551:1584));
% % Err2_20 = (sum(theta2(1596:1630) - theta2r(1596:1630)))/length(theta2(1596:1630));
% 
% Vec_Err2 = [Err2_1; Err2_2; Err2_3; Err2_4; Err2_5; Err2_6; Err2_7; Err2_8; Err2_9; Err2_10; Err2_11; Err2_12; Err2_13; Err2_14; Err2_15; Err2_16; Err2_17; Err2_18];%; Err2_19; Err2_20];
% Err2_Med = mean(Vec_Err2);%média dos erros
% DP_Err2 = std(Vec_Err2);%desvio padrão




% Err1 = (sum((theta1 - theta1r)))/length(theta1);%Junta 1
% Err2 = (sum((theta2 - theta2r)))/length(theta2);%Junta 2

% % %cinemática direta
% x=0.35.*cosd(theta1)+0.30.*cosd(theta1+theta2);
% y=0.35.*sind(theta1)+0.30.*sind(theta1+theta2);
% 
% xr=0.35.*cosd(theta1r)+0.30.*cosd(theta1r+theta2r);
% yr=0.35.*sind(theta1r)+0.30.*sind(theta1r+theta2r);

% subplot(2, 2, 1);
% plot (x(1:30),  y(1:30), 'r-*'); 
% hold on;
% plot (xr(1:30),  yr(1:30), 'b-*');
% title('Intervalo de tempo de 1 a 30');
% xlabel('Eixo X');
% ylabel('Eixo Y');
% legend('Trajetória real','Trajória CP');% inserir legenda, na ordem
% 
% subplot(2, 2, 2);
% plot (x(464:477),  y(464:477), 'r-*'); 
% hold on;
% plot (xr(464:477),  yr(464:477), 'b-*');
% title('Intervalo de tempo de 464 a 477');
% xlabel('Eixo X');
% ylabel('Eixo Y');
% legend('Trajetória real','Trajória CP');% inserir legenda, na ordem
% 
% subplot(2, 2, 3)
% plot (x(890:920),  y(890:920), 'r-*'); 
% hold on;
% plot (xr(890:920),  yr(890:920), 'b-*');
% title('Intervalo de tempo de 886 a 910');
% xlabel('Eixo X');
% ylabel('Eixo Y');
% legend('Trajetória real','Trajória CP');% inserir legenda, na ordem
% 
% subplot(2, 2, 4);
% plot (x(1872:1894),  y(1872:1894), 'r-*'); 
% hold on;
% plot (xr(1872:1894),  yr(1872:1894), 'b-*');
% title('Intervalo de tempo de 2020 a 2040');
% xlabel('Eixo X');
% ylabel('Eixo Y');
% legend('Trajetória real','Trajória CP');% inserir legenda, na ordem

% figure;
% plot (theta1);
% hold on;
% plot (theta1r, 'r');

% figure;
% plot (theta2);
% hold on;
% plot (theta2r, 'r');

%%-----------------------------------------------------
%Dados do ensaio ponto-ponto_missão:ponto
filename = 'Ensaio ponto-ponto missao ponto para pegar os thetas';
HH = xlsread(filename);

% hh1 = HH(:,5);  %Theta 1 dos set points 
% hh2 = HH(:,3); %Theta 2 dos set points
% hh3 = HH(:,2);  %Theta 1 dos set points 
% hh4 = HH(:,4); %Theta 2 dos set points
% 
% %%%%%Valores de theta em graus das entradas
% theta1 =pi*(((2*hh1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*hh2)/4095)-0.5)*(180/pi);
% 
% %Valores de thetas reais
% theta1r =pi*(((2*hh3)/4095)-0.5)*(180/pi);
% theta2r =pi*(((2*hh4)/4095)-0.5)*(180/pi);


% Err1_1 = (sum(theta1(8:42) - theta1r(8:42)))/length(theta1(8:42));%length(theta1);%Junta 1
% Err1_2 = (sum(theta1(53:86) - theta1r(53:86)))/length(theta1(53:86));
% Err1_3 = (sum(theta1(143:179) - theta1r(143:179)))/length(theta1(143:179));
% Err1_4 = (sum(theta1(191:225) - theta1r(191:225)))/length(theta1(191:225));
% Err1_5 = (sum(theta1(279:314) - theta1r(279:314)))/length(theta1(279:314));
% Err1_6 = (sum(theta1(324:360) - theta1r(324:360)))/length(theta1(324:360));
% Err1_7 = (sum(theta1(415:450) - theta1r(415:450)))/length(theta1(415:450));
% Err1_8 = (sum(theta1(464:498) - theta1r(464:498)))/length(theta1(464:498));
% Err1_9 = (sum(theta1(562:596) - theta1r(562:596)))/length(theta1(562:596));
% Err1_10 = (sum(theta1(608:641) - theta1r(608:641)))/length(theta1(608:641));
% Err1_11 = (sum(theta1(688:724) - theta1r(688:724)))/length(theta1(688:724));
% Err1_12 = (sum(theta1(737:771) - theta1r(737:771)))/length(theta1(737:771));
% Err1_13 = (sum(theta1(848:882) - theta1r(848:882)))/length(theta1(848:882));
% Err1_14 = (sum(theta1(891:926) - theta1r(891:926)))/length(theta1(891:926));
% Err1_15 = (sum(theta1(997:1032) - theta1r(997:1032)))/length(theta1(997:1032));
% Err1_16 = (sum(theta1(1041:1074) - theta1r(1041:1074)))/length(theta1(1041:1074));
% Err1_17 = (sum(theta1(1145:1180) - theta1r(1145:1180)))/length(theta1(1145:1180));
% Err1_18 = (sum(theta1(1189:1227) - theta1r(1189:1227)))/length(theta1(1189:1227));
% % Err1_19 = (sum(theta1(1695:1741) - theta1r(1695:1741)))/length(theta1(1695:1741));
% % Err1_20 = (sum(theta1(1820:1868) - theta1r(1820:1868)))/length(theta1(1820:1868));
% 
% Vec_Err1 = [Err1_1; Err1_2; Err1_3; Err1_4; Err1_5; Err1_6; Err1_7; Err1_8; Err1_9; Err1_10; Err1_11; Err1_12; Err1_13; Err1_14; Err1_15; Err1_16; Err1_17; Err1_18];% Err1_19; Err1_20];
% Err1_Med = mean(Vec_Err1);%média dos erros
% DP_Err1 = std(Vec_Err1);%desvio padrão
% 
% % Err2 = (sum((theta2 - theta2r)))/length(theta2);%Junta 2
% 
% Err2_1 = (sum(theta2(184:223) - theta2r(184:223)))/length(theta2(184:223));%length(theta1);%Junta 1
% Err2_2 = (sum(theta2(228:265) - theta2r(228:265)))/length(theta2(228:265));
% Err2_3 = (sum(theta2(269:306) - theta2r(269:306)))/length(theta2(269:306));
% Err2_4 = (sum(theta2(370:400) - theta2r(370:400)))/length(theta2(370:400));
% Err2_5 = (sum(theta2(411:441) - theta2r(411:441)))/length(theta2(411:441));
% Err2_6 = (sum(theta2(520:552) - theta2r(520:552)))/length(theta2(520:552));
% Err2_7 = (sum(theta2(561:590) - theta2r(561:590)))/length(theta2(561:590));
% Err2_8 = (sum(theta2(643:675) - theta2r(643:675)))/length(theta2(643:675));
% Err2_9 = (sum(theta2(684:713) - theta2r(684:713)))/length(theta2(684:713));
% Err2_10 = (sum(theta2(791:830) - theta2r(791:830)))/length(theta2(791:830));
% Err2_11 = (sum(theta2(836:875) - theta2r(836:875)))/length(theta2(836:875));
% Err2_12 = (sum(theta2(736:772) - theta2r(736:772)))/length(theta2(736:772));
% Err2_13 = (sum(theta2(952:991) - theta2r(952:991)))/length(theta2(952:991));
% Err2_14 = (sum(theta2(998:1038) - theta2r(998:1038)))/length(theta2(998:1038));
% Err2_15 = (sum(theta2(1220:1258) - theta2r(1220:1258)))/length(theta2(1220:1258));
% Err2_16 = (sum(theta2(1262:1299) - theta2r(1262:1299)))/length(theta2(1262:1299));
% Err2_17 = (sum(theta2(1366:1403) - theta2r(1366:1403)))/length(theta2(1366:1403));
% Err2_18 = (sum(theta2(1403:1443) - theta2r(1403:1443)))/length(theta2(1403:1443));
% % Err2_19 = (sum(theta2(1551:1584) - theta2r(1551:1584)))/length(theta2(1551:1584));
% % Err2_20 = (sum(theta2(1596:1630) - theta2r(1596:1630)))/length(theta2(1596:1630));
% 
% Vec_Err2 = [Err2_1; Err2_2; Err2_3; Err2_4; Err2_5; Err2_6; Err2_7; Err2_8; Err2_9; Err2_10; Err2_11; Err2_12; Err2_13; Err2_14; Err2_15; Err2_16; Err2_17; Err2_18];%; Err2_19; Err2_20];
% Err2_Med = mean(Vec_Err2);%média dos erros
% DP_Err2 = std(Vec_Err2);%desvio padrão




% Err1 = (sum((theta1 - theta1r)))/length(theta1);%Junta 1
% Err2 = (sum((theta2 - theta2r)))/length(theta2);%Junta 2

%------------------------------------------
%Dados do ensaio ponto-ponto, missão:zona
filename = 'Ensaio ponto-ponto missao zona para pegar os thetas';
II = xlsread(filename);

% ii1 = II(:,5);  %Theta 1 dos set points 
% ii2 = II(:,3); %Theta 2 dos set points
% ii3 = II(:,2);  %Theta 1 dos set points 
% ii4 = II(:,4); %Theta 2 dos set points
% 
% %%%%%Valores de theta em graus das entradas
% theta1 =pi*(((2*ii1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*ii2)/4095)-0.5)*(180/pi);
% 
% %Valores de thetas reais
% theta1r =pi*(((2*ii3)/4095)-0.5)*(180/pi);
% theta2r =pi*(((2*ii4)/4095)-0.5)*(180/pi);
% % 
% Err1_1 = (sum(theta1(8:42) - theta1r(8:42)))/length(theta1(8:42));%length(theta1);%Junta 1
% Err1_2 = (sum(theta1(53:86) - theta1r(53:86)))/length(theta1(53:86));
% Err1_3 = (sum(theta1(143:179) - theta1r(143:179)))/length(theta1(143:179));
% Err1_4 = (sum(theta1(191:225) - theta1r(191:225)))/length(theta1(191:225));
% Err1_5 = (sum(theta1(279:314) - theta1r(279:314)))/length(theta1(279:314));
% Err1_6 = (sum(theta1(324:360) - theta1r(324:360)))/length(theta1(324:360));
% Err1_7 = (sum(theta1(415:450) - theta1r(415:450)))/length(theta1(415:450));
% Err1_8 = (sum(theta1(464:498) - theta1r(464:498)))/length(theta1(464:498));
% Err1_9 = (sum(theta1(562:596) - theta1r(562:596)))/length(theta1(562:596));
% Err1_10 = (sum(theta1(608:641) - theta1r(608:641)))/length(theta1(608:641));
% Err1_11 = (sum(theta1(688:724) - theta1r(688:724)))/length(theta1(688:724));
% Err1_12 = (sum(theta1(737:771) - theta1r(737:771)))/length(theta1(737:771));
% Err1_13 = (sum(theta1(848:882) - theta1r(848:882)))/length(theta1(848:882));
% Err1_14 = (sum(theta1(891:926) - theta1r(891:926)))/length(theta1(891:926));
% Err1_15 = (sum(theta1(997:1032) - theta1r(997:1032)))/length(theta1(997:1032));
% Err1_16 = (sum(theta1(1041:1074) - theta1r(1041:1074)))/length(theta1(1041:1074));
% Err1_17 = (sum(theta1(1145:1180) - theta1r(1145:1180)))/length(theta1(1145:1180));
% Err1_18 = (sum(theta1(1189:1227) - theta1r(1189:1227)))/length(theta1(1189:1227));
% % Err1_19 = (sum(theta1(1695:1741) - theta1r(1695:1741)))/length(theta1(1695:1741));
% % Err1_20 = (sum(theta1(1820:1868) - theta1r(1820:1868)))/length(theta1(1820:1868));
% 
% Vec_Err1 = [Err1_1; Err1_2; Err1_3; Err1_4; Err1_5; Err1_6; Err1_7; Err1_8; Err1_9; Err1_10; Err1_11; Err1_12; Err1_13; Err1_14; Err1_15; Err1_16; Err1_17; Err1_18];% Err1_19; Err1_20];
% Err1_Med = mean(Vec_Err1);%média dos erros
% DP_Err1 = std(Vec_Err1);%desvio padrão
% 
% % Err2 = (sum((theta2 - theta2r)))/length(theta2);%Junta 2
% 
% Err2_1 = (sum(theta2(184:223) - theta2r(184:223)))/length(theta2(184:223));%length(theta1);%Junta 1
% Err2_2 = (sum(theta2(228:265) - theta2r(228:265)))/length(theta2(228:265));
% Err2_3 = (sum(theta2(269:306) - theta2r(269:306)))/length(theta2(269:306));
% Err2_4 = (sum(theta2(370:400) - theta2r(370:400)))/length(theta2(370:400));
% Err2_5 = (sum(theta2(411:441) - theta2r(411:441)))/length(theta2(411:441));
% Err2_6 = (sum(theta2(520:552) - theta2r(520:552)))/length(theta2(520:552));
% Err2_7 = (sum(theta2(561:590) - theta2r(561:590)))/length(theta2(561:590));
% Err2_8 = (sum(theta2(643:675) - theta2r(643:675)))/length(theta2(643:675));
% Err2_9 = (sum(theta2(684:713) - theta2r(684:713)))/length(theta2(684:713));
% Err2_10 = (sum(theta2(791:830) - theta2r(791:830)))/length(theta2(791:830));
% Err2_11 = (sum(theta2(836:875) - theta2r(836:875)))/length(theta2(836:875));
% Err2_12 = (sum(theta2(736:772) - theta2r(736:772)))/length(theta2(736:772));
% Err2_13 = (sum(theta2(952:991) - theta2r(952:991)))/length(theta2(952:991));
% Err2_14 = (sum(theta2(998:1038) - theta2r(998:1038)))/length(theta2(998:1038));
% Err2_15 = (sum(theta2(1220:1258) - theta2r(1220:1258)))/length(theta2(1220:1258));
% Err2_16 = (sum(theta2(1262:1299) - theta2r(1262:1299)))/length(theta2(1262:1299));
% Err2_17 = (sum(theta2(1366:1403) - theta2r(1366:1403)))/length(theta2(1366:1403));
% Err2_18 = (sum(theta2(1403:1443) - theta2r(1403:1443)))/length(theta2(1403:1443));
% % Err2_19 = (sum(theta2(1551:1584) - theta2r(1551:1584)))/length(theta2(1551:1584));
% % Err2_20 = (sum(theta2(1596:1630) - theta2r(1596:1630)))/length(theta2(1596:1630));
% 
% Vec_Err2 = [Err2_1; Err2_2; Err2_3; Err2_4; Err2_5; Err2_6; Err2_7; Err2_8; Err2_9; Err2_10; Err2_11; Err2_12; Err2_13; Err2_14; Err2_15; Err2_16; Err2_17; Err2_18];%; Err2_19; Err2_20];
% Err2_Med = mean(Vec_Err2);%média dos erros
% DP_Err2 = std(Vec_Err2);%desvio padrão




% Err1 = (sum((theta1 - theta1r)))/length(theta1);%Junta 1
% Err2 = (sum((theta2 - theta2r)))/length(theta2);%Junta 2






%Valores de theta em graus das entradas
% theta1 =pi*(((2*ii1)/4095)-0.5)*(180/pi);
% theta2 =pi*(((2*ii2)/4095)-0.5)*(180/pi);

