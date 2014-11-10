function [X, Y] = sweepTwoParams()
    hour = 60 * 60;
    drinkrates = linspace(0, 0.3, 15) / hour;
    Vm = linspace(0, 1, 20) / hour;
    
    for j = 1:length(Vm)
        for i = 1:length(drinkrates)
            [T, M] = alcoholTimeSeries(drinkrates(i), Vm(j));
            conc(i, j) = maxAlcoholConcentration(T, M);
        end
        plot(drinkrates * hour, conc)
    end
    
    clf
    
% Plot the rows one at a time
%     hold on
%     for i = 1:length(drinkrates)
%         row = conc(i, :);
%         plot(Vm*hour, row)
%     end
        
    pcolor(Vm * hour, drinkrates * hour, conc)
    %contourf(conc)
    colorbar()
    
    size = 14;
    xlabel('Vm (g/L/hour)', 'FontSize', size)
    ylabel('drinkrate (g/L/hour)', 'FontSize', size)
    zlabel('max conc (g/L)', 'FontSize', size)
end