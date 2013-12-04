%Skrypt realizuje liniowe modele wzrostu populacji (czas dyskretny i
%ci¹g³y)
clear;
clc;
subplot(1,2,1);%podzia³ okna rysowania na dwa wykresy

x = 250; %populacja pocz¹tkowa

%PRZEBIEG LINIOWY Z CZASEM DYSKRETNYM

wspolczynnikStalyDyskretny = 1;%wspó³czynniki okreœlaj¹ce tempo wzrostu populacji
wspolczynnikMalejacyDyskretny = 0.5;
wspolczynnikRosnacyDyskretny = 1.1;
k = 0:1:20; %%dyskretne chwile czasu

%stworzenie macie¿y liczebnosci populacji w zadanym dyskretnie czasie
modelStaly = wspolczynnikStalyDyskretny.^k * x;
modelMalejacy = wspolczynnikMalejacyDyskretny.^k * x;
modelRosnacy = wspolczynnikRosnacyDyskretny.^k * x;

%wykresy liczebnoœci populacji z czasem dyskretnym
plot(k,modelRosnacy,'g^');
hold on;
plot(k,modelStaly,'b.');
hold on;
plot(k,modelMalejacy,'rs');
%KONIEC PRZEBIEGU Z CZASEM DYSKRETNYM

%PRZEBIEG LINIOWY Z CZASEM CI¥G£YM

subplot(1,2,2) %%przeniesienie nastêpnego wykresu do drugiej kolumny

t = 0:0.01:20; %macie¿ czasu
wspolczynnikStalyCiagly = 0;%wspó³czynniki okreœlaj¹ce tempo wzrostu populacji
wspolczynnikMalejacyCiagly = -0.5;
wspolczynnikRosnacyCiagly = 0.1;

%stworzenie macie¿y liczebnosci populacji w danym czasie
modelStalyLiniowy = x*exp(wspolczynnikStalyCiagly*t);
modelMalejacyLiniowy = x*exp(wspolczynnikMalejacyCiagly*t);
modelRosnacyLiniowy = x*exp(wspolczynnikRosnacyCiagly*t);

%wykresy liczebnoœci populacji z czasem ci¹g³ym
plot(t,modelRosnacyLiniowy,'g');
hold on;
plot(t,modelStalyLiniowy,'b');
hold on;
plot(t,modelMalejacyLiniowy,'r');
%KONIEC PRZEBIEGU Z CZASEM CI¥G£YM
