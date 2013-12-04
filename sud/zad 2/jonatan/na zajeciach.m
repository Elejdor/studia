clear;
clc;

%populacja pocz¹tkowa w kohortach
x = [50; 190; 340; 420; 430; 450; 460; 440; 350; 290];

%wspó³czynniki okreœlaj¹ce liczbe urodzin w kohortach
urodzenia = [0; 0; 0.2; 0.3; 0.5; 0.1; 0.01; 0.0; 0.0; 0.0];

%wspó³czynniki okreœlaj¹ce liczbe zgonów w kohortach
zgony = [0.05; 0.01; 0.02; 0.03; 0.01; 0.01; 0.4; 0.5; 0.9; 1];

%liczba odcinków czasu rozpatrywanych w symulacji
k = [0 : 1 : 100];

%symulacja
populacja = x;
for j=2 : 1 : max(k)+1
    for i=1 : 1 : 10
        narodziny(i)=urodzenia(i)*populacja(i, j-1); %tworzenie pomocniczej macierzy zawieraj¹cej liczbê osób urodzonych w danym czasie
    end
    
    populacja(1, j) = sum(narodziny); %sumowanie urodzonych osób i wpisanie ich jako najmlodsza kohorta
    for i=2 : 1 : 10
        if j==50
            populacja(3, j)=0;
            populacja(4, j)=0;
        end
        populacja(i, j)=(1-zgony(i-1))*populacja(i-1, j-1); %uzupe³nienie liczby kolejnych kohort w pomniejszeniu o wspó³czynnnik zgonów
        end
end   
calkowitaPopulacja = sum(populacja); %obliczanie ca³kowitej populacji w danym czasie
plot(k, calkowitaPopulacja);
hold on;
plot(k, populacja);
    