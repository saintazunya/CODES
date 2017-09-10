% VM433 FA2016 Project 2 Ideal gas properties table (cited from VM235 textbook)
% Author: Sam SHEN Li (FA2016 VM433 Teaching Assistant)
% Last update date: Oct.18th, 2016

global Cp_coeff Molar_mass Formation_h Absolute_s Ru

%% Cp coefficients: Cp(T) / M = a + b*T + c*T^2 + d*T^3
Cp_coeff.air        =   [   28.11,      0.1967E-2,  0.4802E-5, -1.966E-9    ];
Cp_coeff.O2         =   [   25.48,      1.520E-2,  -0.715E-5,   1.312E-9    ];
Cp_coeff.N2         =   [   28.90,     -0.1571E-2,  0.8081E-5, -2.873E-9	];
Cp_coeff.Ar         =   [   20.7849,    0,          0,          0           ];
Cp_coeff.CO2        =   [   22.26,      5.981E-2,  -3.501E-5,   7.469E-9	];
Cp_coeff.H2O        =   [   32.24,      0.1923E-2,  1.055E-5,  -3.595E-9	];
Cp_coeff.CH4        =   [   19.89,      5.024E-2,   1.269E-5,  -11.01E-9	];
Cp_coeff.C2H6       =   [   6.900,      17.27E-2,  -6.406E-5,   7.285E-9	];
Cp_coeff.C3H8       =   [   -4.04,      30.48E-2,  -15.72E-5,   31.74E-9	];

%% Molar mass (in kg/kmol)
Molar_mass.air      =   28.97;
Molar_mass.O2       =   31.999;
Molar_mass.N2       =   28.013;
Molar_mass.Ar       =   39.948;
Molar_mass.CO2      =   44.01;
Molar_mass.H2O      =   18.015;
Molar_mass.CH4      =   16.043;
Molar_mass.C2H6     =   30.070;
Molar_mass.C3H8     =   44.097;

%% Formation enthalpy (in kJ/kmol)
Formation_h.air     =   NaN;    % Not given, need to be calculated from components (will not be used)
Formation_h.O2      =   0;
Formation_h.N2      =   0;
Formation_h.Ar      =   0;
Formation_h.CO2     =   -393520;
Formation_h.H2O     =   -241820;
Formation_h.CH4     =   -74850;
Formation_h.C2H6    =   -84680;
Formation_h.C3H8    =   -103850;

%% Absolute entropy at reference state (in kJ/(kmol*K))
Absolute_s.air      =   NaN;    % Not given, need to be calculated from components (will not be used)
Absolute_s.O2       =   205.04;
Absolute_s.N2       =   191.61;
Absolute_s.Ar       =   154.845;
Absolute_s.CO2      =   213.80;
Absolute_s.H2O      =   188.83;
Absolute_s.CH4      =   186.16;
Absolute_s.C2H6     =   229.49;
Absolute_s.C3H8     =   269.91;

%% Universal gas constant
Ru = 8.31447; % kJ/(kmol*K)
