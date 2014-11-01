function [T, M] = pizzaTimeSeries()

hCheese = .1;
hCrust = .1;
% kPizza = 
cCrust = 1.7;
cCheese = 4;
mCrust = .556;
mCheese = .198;
SApizzaB = 0.09931;
SApizzaS = 0.03429;
SApizzaT = .0792;

hBox = .01;
kBox = .21;
cBox = 5; %paper
mBox = 2; %changed for effect
SAboxCd = .09931;
SAboxCv = 1.2204;
SABoxOut = 1.3197;

cAir = 1.01;
mAir = 0.4; %changed for effect
tEnv = 20;

y1_init = 204;
y2_init = 27;
y3_init = 27;

[T, M] = ode45(@derivFunc, [0, 300], [y1_init; y2_init; y3_init]);

    function res = derivFunc(T, Y)
        
        tPizza = Y(1);
        tBox = Y(2);
        tAir = Y(3);
        
        qConvPizza = hCheese*SApizzaT*(tPizza-tAir) + hCrust*SApizzaS*(tPizza-tAir);
        qConvBoxI = hBox*SAboxCv*(tAir-tBox);
        qConvBoxO = hBox*SABoxOut*(tBox-tEnv);
        qCondPizza = kBox*SAboxCd*(tPizza-tBox)/.25;
        
        dqdtPizza = -qConvPizza - qCondPizza;
        dqdtBox = qCondPizza - qConvBoxO;
        dqdtAir = qConvPizza - qConvBoxI;
        
        dTdtPizza = (1/(mCrust*cCrust + mCheese*cCheese))*dqdtPizza;
        dTdtBox =  (1/(mBox*cBox))*dqdtBox;
        dTdtAir = (1/(mAir*cAir))*dqdtAir;
        
        res = [dTdtPizza; dTdtBox; dTdtAir];
    end
 plot(T, M);
 legend('Pizza', 'Box','Air');
 disp('Done');
end




