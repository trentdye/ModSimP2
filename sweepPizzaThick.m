function [A, B] = sweepPizzaThick()
    clf;
    pizzaThickMin = 0.005;
    pizzaThickMax = 0.07;
    pizzaThickStep = 0.001;
    disp((pizzaThickMax-pizzaThickMin)/pizzaThickStep);
    TIMES = zeros(1,(round((pizzaThickMax-pizzaThickMin)/pizzaThickStep)));
    pizzaThickS = zeros(1,length(TIMES));
    index = 1;
    for i = pizzaThickMin:pizzaThickStep:pizzaThickMax
        [X, Y] = newPizzaTimeSeries(i);
        TIMES(index) = pizzaCrunch(X, Y);
        PIZZAThickS(index) = i;
        index = index + 1;
    end

    plot((pizzaThickS-pizzaThickMin)*100, TIMES/60-(TIMES(1)/60), 'LineWidth', 3, 'Color', col2(4)); %additional topping mass
%     a = plot(71, 1.286, 'r.', 'markersize', 20); %assigned to variable so that just this can have a legend
%     b = plot(142, 2.357, 'b.', 'markersize', 20);
%     c = plot(35, 0.6468, 'c.', 'markersize', 20);
%     legend([a b c], 'Pepperoni','Pineapple', 'Garlic');
    A = pizzaThickS;
    B = TIMES;
    ylabel('Time gain (minutes)');
    xlabel('Thickness of Pizza');
    title('Time Gain vs. Thickness');
    xlim([0 (pizzaThickMax-pizzaThickMin)*1000]);
end