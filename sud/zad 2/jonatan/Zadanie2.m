clear;
clc;
subplot(1,2,1);
%populacja pocz�tkowa w kohortach
x = [50; 190; 340; 420; 430; 450; 460; 440; 350; 290];

%wsp�czynniki okre�laj�ce liczbe urodzin w kohortach
urodzenia = [0; 0; 0.0; 0.02; 0.02; 0.01; 0.37; 0.8; 0.8; 0.4];

%wsp�czynniki okre�laj�ce liczbe zgon�w w kohortach
zgony = [0.05; 0.01; 0.02; 0.03; 0.01; 0.01; 0.4; 0.5; 0.9; 1];

%liczba odcink�w czasu rozpatrywanych w symulacji
k = [0 : 1 : 100];

%symulacja
populacja = x;
for j=2 : 1 : max(k)+1
    for i=1 : 1 : 10
        narodziny(i)=urodzenia(i)*populacja(i, j-1); %tworzenie pomocniczej macierzy zawieraj�cej liczb� os�b urodzonych w danym czasie
    end
    populacja(1, j) = sum(narodziny); %sumowanie urodzonych os�b i wpisanie ich jako najmlodsza kohorta
    for i=2 : 1 : 10
        populacja(i, j)=(1-zgony(i-1))*populacja(i-1, j-1); %uzupe�nienie liczby kolejnych kohort w pomniejszeniu o wsp�czynnnik zgon�w
    end
end   
calkowitaPopulacja = sum(populacja); %obliczanie ca�kowitej populacji w danym czasie
plot(k, calkowitaPopulacja);
hold on;
plot(k, populacja);

%symulacja z migracj�
migracja = 100; %wsp�czynnik migracji
populacja1 = x;
for j=2 : 1 : max(k)+1
    for i=1 : 1 : 10
        narodziny1(i)=urodzenia(i)*populacja1(i, j-1);%tworzenie pomocniczej macierzy zawieraj�cej liczb� os�b urodzonych w danym czasie
    end
    populacja1(1, j) = sum(narodziny1)+rand*100;%sumowanie urodzonych os�b i wpisanie ich jako najmlodsza kohorta
    for i=2 : 1 : 10
        populacja1(i, j)=(1-zgony(i-1))*populacja1(i-1, j-1)+(rand*migracja-migracja/2);%uzupe�nienie liczby kolejnych kohort w pomniejszeniu o wsp�czynnnik zgon�w
        if populacja1 (i, j) < 0   %dbnie o to �eby rand nie tworzy� ujemnej liczby ludno�ci w kohorcie
            populacja1 (i, j) = 0;
        end
    end
end   
calkowitaPopulacja1=sum(populacja1); %obliczanie ca�kowitej populacji w danym czasie
subplot(1,2,2);
plot (k, calkowitaPopulacja1); 
hold on;
plot (k, populacja1);
    