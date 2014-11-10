function [T, M] = newPizzaTimeSeries(tReveal) %sweepMCheese changes mCheese

%% CONSTANTS

hContact = .1;
hCheese = 0.07;
hBoxSurr = 0.15;
hAirBox = 0.01;

hCrust = .1;
% kPizza = 
cCrust = 1.7;
cCheese = 4;
mCrust = .556;
mCheese = .198;
SApizzaB = 0.09931;
SApizzaS = 0.03429;
SApizzaT = .0792;

hBox = .06;
kBox = 0.0078; %.21;
cBox = 1.17; %paper
mBox = 2; %changed for effect
dBox = 0.002;
SAboxCd = .09931;
SAboxCv = 1.2204;
SABoxOut = 1.3197; %SA of outside of box

L = .357;
W = .375;
H = .05;
pizzaThick = .02;

SA = 0.09931;

cAir = 1.007;
mAir = (L*W*H-SA*pizzaThick)*1.225*100; %changed for effect
tEnv = 20;




%% COMPUTE TIME SERIES

y1_init = 204;
y2_init = 204;
y3_init = 23;
y4_init = 23;
%tReveal = 300;

[T1, M1] = ode45(@derivFunc, [0, tReveal], [y1_init; y2_init; y3_init; y4_init]);
[T2, M2] = ode45(@derivFunc, [tReveal+1, 2000], [M1(end, 1); M1(end, 2); M1(end, 3); y4_init]);

T = vertcat(T1, T2);
M = vertcat(M1, M2);

%% DERIVATIVE FUNCTION

    function res = derivFunc(T, Y)
        
        Tcheese = Y(1);
        Tcrust = Y(2);
        Tbox = Y(3);
        Tair = Y(4);

        dqContact = hContact*SA*(Tcheese-Tcrust);
        dqCheeseAir = hCheese*SA*(Tcheese-Tair);
        dqCrustSurr = kBox*SA*(Tcrust-tEnv)/dBox;
        dqBoxContact = hBox*SA*(Tcrust-Tbox);
        dqBoxSurr = hBoxSurr*(2*L*W + 2*H*W + 2*H*L)*(Tbox-tEnv);
        dqAirBox = hAirBox*(L*W + 2*H*W + 2*H*L)*(Tair-Tbox);
        
        dTdtCheese = 1/(mCheese*cCheese)*(-dqContact-dqCheeseAir);
        dTdtCrust = 1/(mCrust*cCrust)*(dqContact-dqBoxContact);
        dTdtBox = 1/(mBox*cBox)*(dqBoxContact-dqBoxSurr+dqAirBox);
        dTdtAir = 1/(mAir*cAir)*(dqCheeseAir-dqAirBox);
        
        res = [dTdtCheese; dTdtCrust; dTdtBox; dTdtAir];
    end

%% PLOT TIME SERIES W/ OPTIONS
% 
% clf;
% hold on;
%  rect = rectangle('Position', [5, 32, 2000, 33]);
%  set(rect, 'FaceColor', [202, 237, 175]./256);
%  set(rect, 'EdgeColor', [202, 237, 175]./256);
%  plot(T, M(:,1), 'LineWidth', 3.5, 'Color', pizzaColors(1));
%  plot(T, M(:,2), 'LineWidth', 3.5, 'Color', pizzaColors(2));
%  plot(T, M(:,4), 'LineWidth', 3.5, 'Color', pizzaColors(3));
%  plot(T, M(:,3), 'LineWidth', 3.5, 'Color', pizzaColors(4));
%  %legend('Cheese', 'Crust', 'Air', 'Box');
%  xlabel('Time (s)');
%  ylabel('Temperature (Celsius)');
%  % title('Temperature vs. Time');
%  %plot([0 1500],[32 32], 'LineWidth', 1, 'Color', pizzaColors(5));
%  %plot([0 1500], [65 65], 'LineWidth', 1, 'Color', pizzaColors(5));
%  xlim([0 1200]);
% 
% disp('Done');

end




