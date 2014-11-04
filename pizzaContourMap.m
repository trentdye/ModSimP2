function res = pizzaContourMap()
clf;
hold on;
hMin = 0.01;
hMax = .07
hStep = .006
index = 0
    for i = hMin:hStep:hMax
        [T, M] = newPizzaTimeSeries(i);
        plot(T, M(:,1), 'LineWidth', 4, 'Color', [0 0 index]/256);
        index = index + 256/((hMax-hMin)/hStep);
    end
end