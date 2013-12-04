clear;

owce = 7;
wilki = 7;

zgonyOwiec = 1;
narodzinyOwiec = 3;

zgonyWilkow = 0.7;
narodzinyWilkow = 1.1;

podzialka = 0.00003;
czas = 0 : podzialka : 10;

sim('simWilczkiOwieczki');

subplot(1, 2, 1);
plot(symulacjaOwce, symulacjaWilki)
hold on;

subplot(1, 2, 2);
plot(czas,symulacjaOwce , 'g');
hold on;
plot(czas, symulacjaWilki, 'r');