function res = pizzaContourMap()
clf;
hold on;
pizzaThickMin = 0.005;
pizzaThickMax = 0.07;
pizzaThickStep = 0.001;
index = 0
    for i = pizzaThickMin:pizzaThickStep:pizzaThickMax
        [T, M] = newPizzaTimeSeries(i);
        plot(T, M(:,1), 'LineWidth', 2, 'Color', [256-index 0 index]/256);
        index = index + 256/((pizzaThickMax-pizzaThickMin)/pizzaThickStep);
    end
end