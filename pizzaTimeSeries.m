function [T, M] = pizzaTimeSeries(mCheese) %sweepMCheese changes mCheese

%% CONSTANTS

hCheese = .1;
hCrust = .1;
% kPizza = 
cCrust = 1.7;
cCheese = 4;
mCrust = .556;
%mCheese = .198;
SApizzaB = 0.09931;
SApizzaS = 0.03429;
SApizzaT = .0792;

hBox = .01;
kBox = 0.078; %.21;
cBox = 1.17; %paper
mBox = 2; %changed for effect
dBox = 0.25;
SAboxCd = .09931;
SAboxCv = 1.2204;
SABoxOut = 1.3197; %SA of outside of box

cAir = 1.01;
mAir = 0.4; %changed for effect
tEnv = 20;


%% COMPUTE TIME SERIES

y1_init = 204;
y2_init = 27;
y3_init = 100;

[T, M] = ode45(@derivFunc, [0, 1200], [y1_init; y2_init; y3_init]);


%% DERIVATIVE FUNCTION

    function res = derivFunc(T, Y)
        
        tPizza = Y(1);
        tBox = Y(2);
        tAir = Y(3);
        
        qConvPizza = hCheese*SApizzaT*(tPizza-tAir) + hCrust*SApizzaS*(tPizza-tAir);
        qConvBoxI = hBox*SAboxCv*(tAir-tBox);
        qConvBoxO = hBox*SABoxOut*(tBox-tEnv);
        qCondPizza = kBox*SAboxCd*(tPizza-tBox)/dBox;
        
        dqdtPizza = -qConvPizza - qCondPizza;
        dqdtBox = qCondPizza - qConvBoxO;
        dqdtAir = qConvPizza - qConvBoxI;
        
        dTdtPizza = (1/(mCrust*cCrust + mCheese*cCheese))*dqdtPizza;
        dTdtBox =  (1/(mBox*cBox))*dqdtBox;
        dTdtAir = (1/(mAir*cAir))*dqdtAir;
        
        res = [dTdtPizza; dTdtBox; dTdtAir];
    end

%% PLOT TIME SERIES W/ OPTIONS



clf;
hold on;

 plot(T, M(:,1), 'LineWidth', 4, 'Color', col2(4));
 plot(T, M(:,2), 'LineWidth', 4, 'Color', col2(5));
 plot(T, M(:,3), 'LineWidth', 4, 'Color', col2(2));
 legend('Pizza', 'Box','Air');
 xlabel('Time (s)');
 ylabel('Temperature (Celsius)');
 title('Temperature vs. Time');
 
 
% disp('Done');
end




