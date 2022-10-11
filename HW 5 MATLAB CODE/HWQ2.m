%% HW5 Q2

% Defining symbolic vairable z
syms z

% Defining pressures (references and pressure are at 1 atm)
P = 5;
P0 = 1;

% Natural log of Kt (Table A - 28)
lnKt = -1.894;

% Solving for Kt
Kt = exp(lnKt);

% Kt Equation
KtEqn = Kt == (z / (z-1)) * sqrt((5 * z) / (z + 2));

% Solving for z
zSol = solve(KtEqn, z);

% Extracting the positive value of z
% z = zSol(zSol > 0);

%% Solving for Heat Transfer per Mole of C02 Entering

% Enthalpy of formation
CO2P.hf = -393520;
CO2R.hf = -393520;
CO.hf = -110530;
O2.hf = 0;

% Enthalpy @ STD state
CO2P.hSTD = 9356;
CO.hSTD = 8669;
O2.hSTD = 8682;

% Enthaly @ exit state
CO2P.h = 149808;
CO.h = 94784;
O2.h = 98826;

% 1st law analysis resulting in heat transfer out per mole of CO2
qOut = CO2R.hf - ( ...
       (z(1) * (CO2P.hf + CO2P.h - CO2P.hSTD)) + ...
       ((1 - z(1)) * (CO.hf + CO.h - CO.hSTD)) + ...
       (((1 - z(1) / z(1))) * (O2.hf + O2.h - O2.hSTD)));


