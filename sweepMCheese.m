function [A, B] = sweepMCheese()
    clf;
    mCheeseMin = 0.198;
    mCheeseMax = 0.400;
    mCheeseStep = 0.001;
    disp((mCheeseMax-mCheeseMin)/mCheeseStep);
    TIMES = zeros(1,(round((mCheeseMax-mCheeseMin)/mCheeseStep)));
    MCHEESES = zeros(1,length(TIMES));
    index = 1;
    for i = mCheeseMin:mCheeseStep:mCheeseMax
        [X, Y] = pizzaTimeSeries(i);
        TIMES(index) = pizzaCrunch(X, Y);
        MCHEESES(index) = i;
        index = index + 1;
    end

    plot((MCHEESES-mCheeseMin)*1000, TIMES/60-(TIMES(1)/60), 'LineWidth', 3, 'Color', col2(4)); %additional topping mass
    a = plot(71, 1.286, 'r.', 'markersize', 20); %assigned to variable so that just this can have a legend
    b = plot(142, 2.357, 'b.', 'markersize', 20);
    c = plot(35, 0.6468, 'c.', 'markersize', 20);
    legend([a b c], 'Pepperoni','Pineapple', 'Garlic');
    A = MCHEESES;
    B = TIMES;
    ylabel('Time gain (minutes)');
    xlabel('Topping Mass (g)');
    title('Time Gain vs. Topping Mass');
    xlim([0 (mCheeseMax-mCheeseMin)/mCheeseStep]);
end