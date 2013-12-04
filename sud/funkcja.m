function funkcja = funkcja(a, b, c, d)
    funkcja = @owce_drapieznicy;  %zwrocenie odwolania do funkcji

    function tab = owce_drapieznicy(t, x)
        tab = [0; 0];
        tab(1) = a * x(1) - b * x(1) * x(2);   %obliczenie pochodnej dla populacji ofiar        
        tab(2) = c * x(2) * x(1) -  d * x(2);  %obliczenie pochodnej dla drapieznikow
    end
end