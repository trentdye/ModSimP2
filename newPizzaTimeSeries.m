function [T, M] = newPizzaTimeSeries(hCheese) %sweepMCheese changes mCheese

%% CONSTANTS

hContact = .1;
%hCheese = 0.07;
hBoxSurr = 0.15;

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
dBox = 0.00635;
SAboxCd = .09931;
SAboxCv = 1.2204;
SABoxOut = 1.3197; %SA of outside of box

cAir = 1.01;
mAir = 0.4; %changed for effect
tEnv = 20;
tTable = 40;

SA = 0.09931;


%% COMPUTE TIME SERIES

y1_init = 204;
y2_init = 204;
y3_init = 23;

[T, M] = ode45(@derivFunc, [0, 1200], [y1_init; y2_init; y3_init]);


%% DERIVATIVE FUNCTION

    function res = derivFunc(T, Y)
        
        Tcheese = Y(1);
        Tcrust = Y(2);
        Tbox = Y(3);

        dqContact = hContact*SA*(Tcheese-Tcrust);
        dqCheeseSurr = hCheese*SA*(Tcheese-tEnv);
        dqCrustSurr = kBox*SA*(Tcrust-tTable)/dBox;
        dqBoxContact = hBox*SA*(Tcrust-Tbox);
        dqBoxSurr = hBoxSurr*SA*(Tbox-tEnv);
        
        dTdtCheese = 1/(mCheese*cCheese)*(-dqContact-dqCheeseSurr);
        dTdtCrust = 1/(mCrust*cCrust)*(dqContact-dqBoxContact);
        dTdtBox = 1/(mBox*cBox)*(dqBoxContact-dqBoxSurr);
        
        res = [dTdtCheese; dTdtCrust; dTdtBox];
    end

%% PLOT TIME SERIES W/ OPTIONS


% 
% clf;
% hold on;
% 
%  plot(T, M(:,1), 'LineWidth', 4, 'Color', col2(4));
%  plot(T, M(:,2), 'LineWidth', 4, 'Color', col2(5));
%  plot(T, M(:,3), 'LineWidth', 4, 'Color', col2(2));
%  legend('Cheese', 'Crust');
%  xlabel('Time (s)');
%  ylabel('Temperature (Celsius)');
%  title('Temperature vs. Time');
%  plot([0 1200],[32 32]);

 
% disp('Done');
end




