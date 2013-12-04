clear; 
clc;

owce = 10; %pocz�tkowa liczba owiec
wilki = 10; %pocz�tkowa liczba wilk�w
podzialka = 0.00005;
zgonyOwiec = 1.2; %wsp�czynnik �miertelno�ci owiec
narodzinyOwiec = 2.4; %wsp�czynnik urodzin owiec
zgonyWilkow = 0.7; %wsp�czynnik �miertelno�ci wilk�w
narodzinyWilkow = 0.5; %wsp�czynnik urodze� wilk�w
czas = 0:podzialka:10;
sim('simulinkzad3');%symulacja simulink populacji owce-wilki. Wynik zostanie zapisany w dw�ch macierzach

subplot(1,2,1);
plot(symulacjaOwce, symulacjaWilki)
hold on;
subplot(1,2,2);
plot(czas,symulacjaOwce , 'g');
hold on;
plot(czas, symulacjaWilki, 'r');