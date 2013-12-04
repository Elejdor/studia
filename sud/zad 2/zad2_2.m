clear all;

%liniowy model populacji z podzia³em na kohorty

%dane
startPopulation = [60; 180; 340; 450; 440; 430; 460; 440; 320; 260];        %populacja pocz¹tkowa
b = [0; 0; 0.0; 0.08; 0.07; 0.05; 0.45; 0.8; 0.7; 0.3];                    %wsp. urodzenia
d = [0.05; 0.01; 0.02; 0.03; 0.01; 0.01; 0.5; 0.6; 0.9; 1];                %wsp. umieralnoœci
t = [0 : 1 : 100];                                                          %czas symulacji

population = startPopulation;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for j=2:101
    %tablica zawieraj¹ca liczbê osób urodzonych w danym czasie
    for i=1:10
        births(i) = b(i)*population(i, j-1); 
    end
    %pierwsza kohorta - sumowanie narodzonych osób
    population(1, j) = sum(births); 
    %pozosta³e kohorty pomniejszone o wspó³czynnik zgonów
    for i=2:10
        population(i, j) = (1-d(i-1))*population(i-1, j-1); 
    end
end   

%obliczanie ca³kowitej populacji w danym czasie
totalPopulation = sum(population); 

%wykresy
figure(1);
subplot(2,2,1);
%hold on;
plot(t,population);
legend('0-10','11-20','21-30','31-40','41-50','51-60','61-70','71-80','81-90','91-100');

%figure(2);
subplot(2,2,2);
hold on;
plot(t,totalPopulation,'b');
plot(t,population);
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% symulacja z uwzglêdnieniem migracji
% do tego celu skorzystamy z funkcji rand

migration = 10;
populationM = startPopulation;

for j=2:101
    %tablica zawieraj¹ca liczbê osób urodzonych w danym czasie
    for i=1:10
        births(i) = b(i)*populationM(i, j-1); 
    end
    %pierwsza kohorta - sumowanie narodzonych osób +/- migracja
    populationM(1, j) = sum(births) + rand*migration; 
    %pozosta³e kohorty pomniejszone o wspó³czynnik zgonów +/- migracja
    for i=2:10
        populationM(i, j) = ( 1-d(i-1))*populationM(i-1, j-1) + rand*migration; 
        if populationM(i, j) < 0   
            populationM(i, j) = 0;
        end
    end
end   

totalPopulationM = sum(populationM);

%wykresy
%figure(2);
subplot(2,2,3);
%hold on;
plot(t,populationM);
legend('0-10','11-20','21-30','31-40','41-50','51-60','61-70','71-80','81-90','91-100');

%figure(2);
subplot(2,2,4);
hold on;
plot(t,totalPopulationM,'b');
plot(t,populationM);
hold off;