function res = pizzaCrunch(T, M)
    coldTemp = 32.000; %highest temp for which temperature is considered 'cold'
    PizzaTemp = M(:, 1);
    coldTime = 0; %initialize coldTime in case of emergency
    for i = 1:length(PizzaTemp)
        if PizzaTemp(i) < coldTemp;
            %disp(PizzaTemp(i)); %check
            coldTime = T(i);
            break;
        end
    end
    res = coldTime;
end