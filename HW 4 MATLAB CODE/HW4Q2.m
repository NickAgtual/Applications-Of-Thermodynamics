%% HW4Q2

HcFuel = 7.191 * 10 ^ 4;

% Molar Flow Rates
NCO2P = .108;

NH2OP = .117;

NN2 = .9006;

NO2EP = .073;

NFuelR = .009;

NO2R = .2394;

% Sensible Enthalpy Change of Reactants

hO2R = 21660;

hFuelR = 325306;

hN2R = 20485;

% Sensible Enthalpy Change of Products

hCO2P = 107770;

hH2OP = 87258;

hO2P = 69470;

hN2P = 65871;

sensibleEnergyChange = (NCO2P * hCO2P ) + ...
                       (NH2OP * hH2OP) + ...
                       (NN2 * hN2P) + ...
                       (NO2EP * hO2P) - ( ...
                       (NFuelR * hFuelR) + ...
                       (NO2R * hO2R) + ...
                       (NN2 * hN2R));
                       