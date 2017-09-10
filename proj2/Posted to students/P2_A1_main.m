% VM433 FA2016 Project 2 Part A1 Main Script (Post with Project Part A)
% Author: Sam SHEN Li (FA2016 VM433 Teaching Assistant)
% Last update date: Oct.18th, 2016

% Insturctions:
%   1. Do NOT change anything in this script
%   2. Finish writing the following functions: findEnthalpyDiff, findEntropyDiff,
%      findFinalTempFromEnthalpyDiff and findFinalTempFromEntropyDiff
%   3. See sample answers in "VM433_FA2016_P2_A1_Sample_Answer.pdf"

%% Clean up
clear variables
clear global
close all
clc

%% Inputs
% Species
Given.gas_input = 'N2';

% Temperature
Given.T_ini = 300;          % initial T, in K
Given.T_fin = 400;          % final T, in K

% Pressure
Given.P_ini = 100;          % initial P, in kPa
Given.P_fin = 200;          % final P, in kPa

% Enthalpy difference
Given.dhkg = 100;           % in kJ/kg

% Entropy difference
Given.dskg = 0.1;           % in kJ/(kg*K)

%% Find ideal gas properties
run( 'Ideal_Gas_Properties.m' )
[ Given.cpCoeff ] = Find_Ideal_Gas_Properties( Given.gas_input, 'Cp_coeff' );
[ Given.molarMass ] = Find_Ideal_Gas_Properties( Given.gas_input, 'Molar_mass' );

%% Find enthalpy difference given T_ini and T_fin
[ Calc.dhkg, Calc.dhkmol ] = findEnthalpyDiff( Given.cpCoeff, Given.molarMass, Given.T_ini, Given.T_fin );

%% Find entropy difference given T_ini, P_ini and T_fin, P_ini
[ Calc.dskg, Calc.dskmol ] = findEntropyDiff( Given.cpCoeff, Given.molarMass, Given.T_ini, Given.P_ini, Given.T_fin, Given.P_fin );

%% Find T_fin given T_ini and enthalpy difference
[ Calc.T_fin.dhkg ] = findFinalTempFromEnthalpyDiff( Given.cpCoeff, Given.molarMass, Given.T_ini, Given.dhkg );

%% Find T_fin given T_ini, P_ini, P_fin and entropy difference
[ Calc.T_fin.dskg ] = findFinalTempFromEntropyDiff( Given.cpCoeff, Given.molarMass, Given.T_ini, Given.P_ini, Given.P_fin, Given.dskg );

%% Display answers in commend window
fprintf( '\nIdeal gas %s property calculations:\n', Given.gas_input )
fprintf( '\t1.\tGiven:\t State 1: %.2f K and %.2f kPa, State 2: %.2f K and %.2f kPa.\n', Given.T_ini, Given.P_ini, Given.T_fin, Given.P_fin )
fprintf( '\t\t(a)\t enthalpy difference \t = \t %.2f \t kJ/kg \n', Calc.dhkg )
fprintf( '\t\t\t enthalpy difference \t = \t %.2f \t kJ/kmol \n', Calc.dhkmol )
fprintf( '\t\t(b)\t entropy difference \t = \t %.2f \t\t kJ/(kg*K) \n', Calc.dskg )
fprintf( '\t\t\t entropy difference \t = \t %.2f \t\t kJ/(kmol*K) \n', Calc.dskmol )
fprintf( '\n')
fprintf( '\t2.\tGiven:\t initial temperature = %.2f K, enthalpy difference = %.2f kJ/kg. \n', Given.T_ini, Given.dhkg )
fprintf( '\t\tWe find: final temperature = %.2f K \n',  Calc.T_fin.dhkg )
fprintf( '\n')
fprintf( '\t3.\tGiven:\t initial temperature = %.2f K, initial pressure = %.2f kPa, \n', Given.T_ini, Given.P_ini )
fprintf( '\t\t\t\t final pressure = %.2f kPa, enthalpy difference = %.2f kJ/(kg*K). \n', Given.P_fin, Given.dskg )
fprintf( '\t\tWe find: final temperature = %.2f K \n',  Calc.T_fin.dskg )

%% Save results for grading
Result = [ Calc.dhkg, Calc.dhkmol, Calc.dskg, Calc.dskmol, Calc.T_fin.dhkg, Calc.T_fin.dskg ];
