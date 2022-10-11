%% HW5 Q1

% Defining symbolic vairable z
syms z

% Defining pressures (references and pressure are at 1 atm)
P = 1;
P0 = 1;

% Natural log of Kt (Table A - 28)
lnKt = -1.111;

% Solving for Kt
Kt = exp(lnKt);

% Kt Equation
KtEqn = Kt == (2 / (1 - z)) * (z / (z + 9.52)) ^ 1/2 * (P / P0) ^ 1/2;

% Solving for z
zSol = double(solve(KtEqn, z));

% Extracting the positive value of z
z = zSol(zSol > 0);

yCO = (2 * z) / (z + 9.52);
yCO2 = ((2 * (1 - z))) / ( z + 9.52);
yO2 = z / (z + 9.52);
yN2 = 7.52 / (z + 9.52);
