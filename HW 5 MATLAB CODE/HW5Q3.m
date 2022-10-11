%% HW 5 Q3

%% Mole fractions

% Defining symbolic variable z & beta
syms z beta

% CO
CO.y = (2 * z) / (1 + beta + z);

% CO2
CO2.y = (1 - (2 * z)) / (1 + beta + z);

% O2
O2.y = (beta + z - 2) / (1 + beta + z);

% H20
H20.y = z / (1 + beta + z);

%% Kt Equation

% Interpolating to find logKt
logKt = (((3250 - 3200) / (3400 - 3200)) * (.169 - (-.429))) + (-.429);
Kt = exp(logKt);

% KtEqn (Equation 1 in system of equations)
KtEqn = Kt == (((CO.y ^ 1) * (O2.y ^ .5)) / (CO2.y));

%% 1st Law Balance

% Enthaly of formation
CH4.hf = -78850;
O2.hf = 0;
CO.hf = -110530;
CO2.hf = -393520;
H20.hf = -285830;

% Enthaly @ STD State
O2.hSTD = 8682;
CO.hSTD = 8669;
CO2.hSTD = 9364;
H20.hSTD = 9904;

%
% Enthaly at exit state
O2.h = [11711 116827]; % [entrace exit]
CO.h = 111534;
CO2.h = 117822;
H20.h = 150272;

% 1st Law Equation

firstLaw = 0 == CH4.hf + (beta * O2.hf + O2.h(1) - O2.hSTD) - ( ...
                ((2 * z) * (CO.hf + CO.h - CO.hSTD)) + ...
                ((1 - 2 * z) * (CO2.hf + CO2.h - CO2.hSTD)) + ...
                ((beta + z - 2) * (O2.hf + O2.h(2) - O2.hSTD)) + ...
                (2 * (H20.hf + H20.h - H20.hSTD)));

solutionStruct = solve([KtEqn, firstLaw], [z, beta]);

test = matlabFunction(firstLaw);


firstLaw2 = 0 == -890.9 + (beta * O2.hf + O2.h(1) - O2.hSTD) - ( ...
                ((2 * z) * (CO.hf + CO.h - CO.hSTD)) + ...
                ((1 - (2 * z)) * (CO2.hf + CO2.h - CO2.hSTD)) + ...
                ((beta + z - 2) * (O2.hf + O2.h(2) - O2.hSTD)) + ...
                (2 * (H20.hf + H20.h - H20.hSTD)));

solutionStruct2 = solve([KtEqn, firstLaw2], [z, beta]);


