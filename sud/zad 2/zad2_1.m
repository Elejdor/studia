clear all;

%liniowy model wzrostu - czas dyskretny

sampleRate = 1;
wspolczynnikWzrostu1 = 1;
wspolczynnikWzrostu2 = 1.2;
wspolczynnikWzrostu3 = 0.8;

%tworzenie dziedziny i templateów funkcji
x = 1:sampleRate:10;
lmwD1 = 1:sampleRate:10;
lmwD2 = 1:sampleRate:10;
lmwD3 = 1:sampleRate:10;

%tworzenie zbiorow wartosci
for i=1:9,
    lmwD1(i+1) = wspolczynnikWzrostu1*lmwD1(i);
    lmwD2(i+1) = wspolczynnikWzrostu2*lmwD2(i);
    lmwD3(i+1) = wspolczynnikWzrostu3*lmwD3(i);
end
  

%rysowanie wykresów
figure(1);
hold on;
xlabel('k');
ylabel('x(k)');
stem(x, lmwD1,'b','LineStyle','none','marker','o');
stem(x, lmwD2,'r','LineStyle','none','marker','x');
stem(x, lmwD3,'g','LineStyle','none','marker','+');
legend('a = 1','a = 1.2','a = 0.8');
hold off;


% liniowy model wzrostu - czas ci¹g³y

sampleRate = 0.01;
wspolczynnikWzrostu1 = 2;
wspolczynnikWzrostu2 = 0;
wspolczynnikWzrostu3 = -2;

x = 0:sampleRate:1;
x0 = 1;

lmwC1 = x0*exp(wspolczynnikWzrostu1*x);
lmwC2 = x0*exp(wspolczynnikWzrostu2*x);
lmwC3 = x0*exp(wspolczynnikWzrostu3*x);

figure(2);
hold on;
xlabel('t');
ylabel('x(t)');
plot(x,lmwC1,'r');
plot(x,lmwC2,'b');
plot(x,lmwC3,'g');
legend('a = 2','a = 0','a = -2');
hold off;