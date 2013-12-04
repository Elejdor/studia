time = 100; %czas symulacji
wolves = 20; %ilosc wilkow (drapieznikow) na poczatku symulacji
wolves_born = 0.01; %wspolczynnik narodzin u drapieznikow
wolves_dead = 0.3; %wspolczynnik umieralnosci u drapieznikow
sheeps = 50; %liczba owiec (ofiar) na poczatku symulacji
sheeps_born = 2; %wspolczynnik narodzin u ofiar
sheeps_dead = 0.1; %wspolczynnik umieralnosci ofiar

ode_settings = odeset('RelTol', 1e-4, 'NonNegative', [1 2]);   %wprowadzenie odpowiednich ustawien dla funkcji rozwiazujacej rownanie rozniczkowe

[czas_symulacji, populacje] = ode23(funkcja(sheeps_born, sheeps_dead, wolves_born, wolves_dead), [0 time], [sheeps wolves], ode_settings);  %symulacja

%wykres populacji owiec od czasu
figure;
hold on;
grid on;
title('Zmiana populacji owiec w czasie');
xlabel('t');
ylabel('populacja');
plot(czas_symulacji, populacje(:, 1), 'Color', 'r');
hold off;

%wykres populacji wilkow od czasu
figure;
hold on;
grid on;
title('Zmiana populacji wilkow w czasie');
xlabel('t');
ylabel('populacja');
plot(czas_symulacji, populacje(:, 2), 'Color', 'r');
hold off;

figure;
hold on;
grid on;
title('Populacja drapiezników w zaleznosci od populacji ofiar');
xlabel('owce');
ylabel('wilki');
plot(populacje(:, 1), populacje(:, 2), 'Color', 'r');
hold off;