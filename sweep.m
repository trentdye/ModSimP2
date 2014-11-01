function res = sweep()
    clf;
    hCheeseMin = 0.1;
    hCheeseMax = 3;
    hCheeseStep = 0.1;
    disp((hCheeseMax-hCheeseMin)/hCheeseStep);
    TIMES = zeros(round((hCheeseMax-hCheeseMin)/hCheeseStep));
    HCHEESES = zeros(length(TIMES));
    index = 1;
    for i = hCheeseMin:hCheeseStep:hCheeseMax
        [X, Y] = pizzaTimeSeries(i);
        TIMES(index) = pizzaCrunch(X, Y);
        HCHEESES(index) = i;
        index = index + 1;
    end
    plot(HCHEESES, TIMES);
end