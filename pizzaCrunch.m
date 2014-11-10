function [okTime, okRange] = pizzaCrunch(T, M)
    coldTemp = 32.000; %highest temp for which temperature is considered 'cold'
    hotTemp = 65;
    PizzaTemp = (M(:, 2) + M(:,1))/2;
    index = 1;
    for i = 1:length(PizzaTemp)
        if PizzaTemp(i) < hotTemp && PizzaTemp(i) > coldTemp;
            %disp(PizzaTemp(i)); %check
            goodTime(index) = T(i);
            index = index + 1;
        end
    end
    okTime = goodTime(1);
    okRange = goodTime(end) - goodTime(1);
%     disp(goodTime);
end