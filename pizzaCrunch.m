function res = pizzaCrunch(T, M)
    coldTemp = 32;
    PizzaTemp = M(:, 1);
    coldTime = 0;
    for i = 1:length(PizzaTemp)
        if PizzaTemp(i) < coldTemp;
            %disp(PizzaTemp(i)); %check
            coldTime = T(i);
            break;
        end
    end
    res = coldTime;
end