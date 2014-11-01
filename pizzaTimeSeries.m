function [T, M] = pizzaTimeSeries()

hCheese = 8;
hCrust = 12;
% kPizza = 
cCrust = 1.7;
cCheese = 3.7;
mCrust = .556;
mCheese = .198;
SApizzaB = 0.09931;
SApizzaS = 0.03429;
SApizzaT = .0792;

hBox = 10;
kBox = .21;
cBox = 1.17; %paper
mBox = .01;
SAboxCd = .09931;
SAboxCv = 1.2204;
SABoxOut = 1.3197;

cAir = 1.01;
mAir = 0.004935;
tEnv = 20;

y1_init = 204;
y2_init = 27;
y3_init = 27;

[T, M] = ode45(@derivFunc, [0, 10], [y1_init; y2_init; y3_init]);

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
 disp('Done');
end




