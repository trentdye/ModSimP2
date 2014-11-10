function [A, B] = sweepTReveal()
    clf;
    tRevealMin = 10;
    tRevealMax = 500;
    tRevealStep = 1;
    disp((tRevealMax-tRevealMin)/tRevealStep);
    OkTimes = zeros(1,(round((tRevealMax-tRevealMin)/tRevealStep)));
    OkRanges = zeros(1, length(OkTimes));
    tReveals = zeros(1,length(OkTimes));
    index = 1;
    for i = tRevealMin:tRevealStep:tRevealMax
        [X, Y] = newPizzaTimeSeries(i);
        [a, b] = pizzaCrunch(X, Y);
        TReveals(index) = i;
        OkTimes(index) = a;
        OkRanges(index) = b;
        index = index + 1;
    end
    savitzky = sgolayfilt(OkTimes, 3, 469);
    golay = sgolayfilt(OkRanges, 3, 469);
%     plot(TReveals, savitzky, 'LineWidth', 4, 'Color', pizzaColors(5))
%     %set(gca,'XTick',[]);
%     ylabel('Ready Time (s)');
%     xlabel('Time of Reveal (s)');
    ylim([300 400])
%     title('Difference in Ready Times');
    plot(TReveals, golay, 'LineWidth', 4, 'Color', pizzaColors(6))
    ylabel('Pleasant Zone Duration (s)')
    xlabel('Time of Reveal (s)')
    
    xlim([0 250]);
    
    
    %ylim([350 500]);

    
%     plot((tREVEALS-tRevealMin)*1000, TIMES/60-(TIMES(1)/60), 'LineWidth', 3, 'Color', col2(4)); %additional topping mass
%     a = plot(71, 1.286, 'r.', 'markersize', 20); %assigned to variable so that just this can have a legend
%     b = plot(142, 2.357, 'b.', 'markersize', 20);
%     c = plot(35, 0.6468, 'c.', 'markersize', 20);
%     legend([a b c], 'Pepperoni','Pineapple', 'Garlic');
%     A = tREVEALS;
%     B = TIMES;
%     ylabel('Time gain (minutes)');
%     xlabel('Topping Mass (g)');
%     title('Time Gain vs. Topping Mass');
%     xlim([0 (tRevealMax-tRevealMin)*1000]);
end