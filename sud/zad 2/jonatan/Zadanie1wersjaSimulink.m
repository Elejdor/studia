%Skrypt realizuje liniowe modele wzrostu populacji (czas dyskretny i
%ci�g�y)
clear;
clc;
subplot(1,2,1);%podzia� okna rysowania na dwa wykresy

czasProbki = 0.25; %czas jaki trwa jeden odcinek czasu
populacja = 25; %populacja pocz�tkowa
wspolczynnik = 1.2; %wspolczynnik wzrosu populacji 
wspolczynnikCiagly = -1;


sim('simulink1');

plot(wartosciCzasu, wartosciPopulacji, 'bs');

subplot(1,2,2);%przej�cie do drugiego wykresu
plot (wartosciCzasuCiagle, wartosciPopulacjiCiagle, 'b');
%PRZEBIEG LINIOWY Z CZASEM DYSKRETNYM