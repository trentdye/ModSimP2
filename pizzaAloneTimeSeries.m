function res = pizzaAloneTimeSeries()

clf;

hCheese = [8 0.1];
hCrust = [12 .1];
cCrust = [1.7 .1];
cCheese = [3.7 1];

% kPizza = 
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

[T, M] = ode45(@deriv_func, [0, 1000], [y1_init]);

    function res = deriv_func(T, Y)
        tPizza = Y(1);
        qConvPizza = hCheese(2)*SApizzaT*(tPizza-20) + hCrust(2)*SApizzaS*(tPizza-20);
        dTdtPizza = (1/(mCrust*cCrust(1) + mCheese*cCheese(1)))*-qConvPizza;
        
        res = dTdtPizza;
    end

plot(T, M);
end