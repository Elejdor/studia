clear; 
clc;

owce = 10; %pocz¹tkowa liczba owiec
wilki = 10; %pocz¹tkowa liczba wilków
podzialka = 0.00005;
zgonyOwiec = 1.2; %wspó³czynnik œmiertelnoœci owiec
narodzinyOwiec = 2.4; %wspó³czynnik urodzin owiec
zgonyWilkow = 0.7; %wspó³czynnik œmiertelnoœci wilków
narodzinyWilkow = 0.5; %wspó³czynnik urodzeñ wilków
czas = 0:podzialka:10;
sim('simulinkzad3');%symulacja simulink populacji owce-wilki. Wynik zostanie zapisany w dwóch macierzach

subplot(1,2,1);
plot(symulacjaOwce, symulacjaWilki)
hold on;
subplot(1,2,2);
plot(czas,symulacjaOwce , 'g');
hold on;
plot(czas, symulacjaWilki, 'r');