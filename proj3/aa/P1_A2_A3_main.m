% VM433 FA2016 Project 1 Part A2 & A3 Grading Script (Post with Project Part A)
% Author: Sam SHEN Li (FA2016 VM433 Teaching Assistant)
% Last update date: Sep.22th, 2016

% Insturctions:
%   1. Please read through the comments in this script carefully.
%   2. Change every line that we ask you to change (comments will follow for those lines)
%   3. You can only change the numbers only, be aware of the units.
%   4. Any line with NO comment = do NOT change

%% Clean up
clear
close all
clc

%% Inputs
% Turbine inlet temperature
Turbine_inT = [ ...
    540;                                                                    % HPT, in deg C (CHANGE THIS LINE TO IVANPAH DATA)
    480;                                                                    % IPT, in deg C (CHANGE THIS LINE TO IVANPAH DATA)
    221.6;                                                                    % LPT, in deg C (CHANGE THIS LINE TO IVANPAH DATA)
    ];

% Turbine inlet pressure
Turbine_inP = [ ...
    160;                                                                    % HPT, in bar (CHANGE THIS LINE TO IVANPAH DATA)
    35;                                                                     % IPT, in bar (CHANGE THIS LINE TO IVANPAH DATA)
    4.5;                                                                      % LPT, in bar (CHANGE THIS LINE TO IVANPAH DATA)
    ];

% Turbine outlet temperature
Turbine_outT = [ ...
    346.5;                                                                    % HPT, in deg C (CHANGE THIS LINE TO IVANPAH DATA)
    221.6;                                                                    % IPT, in deg C (CHANGE THIS LINE TO IVANPAH DATA)
    ];

% Turbine outlet vapor-liquid quality
Turbine_outx = 0.914;                                                        % LPT, no unit (CHANGE THIS LINE TO IVANPAH DATA, SEE PROJECT 1 PDF FILE)

% Turbine outlet pressure
Turbine_outP = [ ...
    42.48;                                                                     % HPT, in bar (CHANGE THIS LINE TO IVANPAH DATA)
    4.5;                                                                      % IPT, in bar (CHANGE THIS LINE TO IVANPAH DATA)
    0.1265;                                                                    % LPT, in bar (CHANGE THIS LINE TO IVANPAH DATA)
    ];

% Extraction steam temperature at turbine inlet
Extract_inT = [ ...
    221.6;                                                                    % for FWH 1, in deg C (CHANGE THIS LINE TO IVANPAH DATA)
    221.6;                                                                    % for FWH 2, in deg C (CHANGE THIS LINE TO IVANPAH DATA)
    480;                                                                    % for FWH 4, in deg C (CHANGE THIS LINE TO IVANPAH DATA)
    540;                                                                    % for FWH 5, in deg C (CHANGE THIS LINE TO IVANPAH DATA)
    540;                                                                    % for FWH 6, in deg C (CHANGE THIS LINE TO IVANPAH DATA)            
    ];

% Extraction steam pressure at turbine inlet
Extract_inP = [ ...
    4.5;                                                                      % for FWH 1, in bar (CHANGE THIS LINE TO IVANPAH DATA)
    4.5;                                                                      % for FWH 2, in bar (CHANGE THIS LINE TO IVANPAH DATA)
    35;                                                                     % for FWH 4, in bar (CHANGE THIS LINE TO IVANPAH DATA)
    160;                                                                    % for FWH 5, in bar (CHANGE THIS LINE TO IVANPAH DATA)
    160;                                                                    % for FWH 6, in bar (CHANGE THIS LINE TO IVANPAH DATA)            
    ];

% Extraction steam pressure at turbine outlet
Extract_outP = [ ...
    0.36;                                                                    % for FWH 1, in bar (CHANGE THIS LINE TO IVANPAH DATA)
    2.019;                                                                      % for FWH 2, in bar (CHANGE THIS LINE TO IVANPAH DATA)
    11.79;                                                                     % for FWH 4, in bar (CHANGE THIS LINE TO IVANPAH DATA)
    42.48;                                                                     % for FWH 5, in bar (CHANGE THIS LINE TO IVANPAH DATA)
    51.93;                                                                     % for FWH 6, in bar (CHANGE THIS LINE TO IVANPAH DATA)            
    ];

%% Part A2: Isentropic Efficiency Calculatation 
HPT_isenEff = findHPTIsenEff( Turbine_inT(1), Turbine_inP(1), Turbine_outT(1), Turbine_outP(1) );           % HPT, in % (DO NOT CHANGE THIS LINE)
IPT_isenEff = findHPTIsenEff( Turbine_inT(2), Turbine_inP(2), Turbine_outT(2), Turbine_outP(2) );           % IPT, in % (DO NOT CHANGE THIS LINE)
LPT_isenEff = findLPTIsenEff( Turbine_inT(3), Turbine_inP(3), Turbine_outx(1), Turbine_outP(3) );           % LPT, in % (DO NOT CHANGE THIS LINE)

%% Part A2: Polytropic Efficiency Calculatation (take 15 stages for your calculation)
HPT_polyEff = findHPTPolyEff( Turbine_inT(1), Turbine_inP(1), Turbine_outT(1), Turbine_outP(1) );           % HPT, in % (DO NOT CHANGE THIS LINE)
IPT_polyEff = findHPTPolyEff( Turbine_inT(2), Turbine_inP(2), Turbine_outT(2), Turbine_outP(2) );           % IPT, in % (DO NOT CHANGE THIS LINE)
LPT_polyEff = findLPTPolyEff( Turbine_inT(3), Turbine_inP(3), Turbine_outx(1), Turbine_outP(3) );           % LPT, in % (DO NOT CHANGE THIS LINE)

%% Part A3: Extraction Steam Temperature Calculation
FWH1_extractT = findTurbineExtractT( Extract_inT(1), Extract_inP(1), Extract_outP(1), LPT_polyEff );        % FWH1, in deg C (DO NOT CHANGE THIS LINE)
FWH2_extractT = findTurbineExtractT( Extract_inT(2), Extract_inP(2), Extract_outP(2), LPT_polyEff );        % FWH2, in deg C (DO NOT CHANGE THIS LINE)
FWH4_extractT = findTurbineExtractT( Extract_inT(3), Extract_inP(3), Extract_outP(3), IPT_polyEff );        % FWH4 in deg C (DO NOT CHANGE THIS LINE)
FWH5_extractT = findTurbineExtractT( Extract_inT(4), Extract_inP(4), Extract_outP(4), HPT_polyEff );        % FWH5, in deg C (DO NOT CHANGE THIS LINE)
FWH6_extractT = findTurbineExtractT( Extract_inT(5), Extract_inP(5), Extract_outP(5), HPT_polyEff );        % FWH6, in deg C (DO NOT CHANGE THIS LINE)

%% Report for Results in Part A2
% Save in matrices for grading
isenEff = [ HPT_isenEff; IPT_isenEff; LPT_isenEff ];                        % (DO NOT CHANGE THIS LINE)
polyEff = [ HPT_polyEff; IPT_polyEff; LPT_polyEff ];                        % (DO NOT CHANGE THIS LINE)

% Display results in commend window
fprintf( 'Results for Project 1 Part A2: \n' )                                      % (DO NOT CHANGE THIS LINE)
fprintf( '\n' )                                                                     % (DO NOT CHANGE THIS LINE)
fprintf( '\t Isentropic efficiency for HPT \t = \t %.2f %% \n', HPT_isenEff )       % (DO NOT CHANGE THIS LINE)
fprintf( '\t Isentropic efficiency for IPT \t = \t %.2f %% \n', IPT_isenEff )       % (DO NOT CHANGE THIS LINE)
fprintf( '\t Isentropic efficiency for LPT \t = \t %.2f %% \n', LPT_isenEff )       % (DO NOT CHANGE THIS LINE)
fprintf( '\n' )                                                                     % (DO NOT CHANGE THIS LINE)
fprintf( '\t Polytropic efficiency for HPT \t = \t %.2f %% \n', HPT_polyEff )       % (DO NOT CHANGE THIS LINE)
fprintf( '\t Polytropic efficiency for IPT \t = \t %.2f %% \n', IPT_polyEff )       % (DO NOT CHANGE THIS LINE)
fprintf( '\t Polytropic efficiency for LPT \t = \t %.2f %% \n', LPT_polyEff )       % (DO NOT CHANGE THIS LINE)
fprintf( '\n' )                                                                     % (DO NOT CHANGE THIS LINE)

%% Report for Results in Part A2
% Save in matrices for grading
Extract_outT = [ FWH1_extractT; FWH2_extractT; FWH4_extractT; FWH5_extractT; FWH6_extractT ];   % (DO NOT CHANGE THIS LINE)

% Display results in commend window
fprintf( 'Results for Project 1 Part A3: \n' )                                      % (DO NOT CHANGE THIS LINE)
fprintf( '\n' )                                                                     % (DO NOT CHANGE THIS LINE)
fprintf( '\t Extraction steam temperature for FWH1 = %.2f �� \n', FWH1_extractT )   % (DO NOT CHANGE THIS LINE)
fprintf( '\t Extraction steam temperature for FWH2 = %.2f �� \n', FWH2_extractT )   % (DO NOT CHANGE THIS LINE)
fprintf( '\t Extraction steam temperature for FWH4 = %.2f �� \n', FWH4_extractT )   % (DO NOT CHANGE THIS LINE)
fprintf( '\t Extraction steam temperature for FWH5 = %.2f �� \n', FWH5_extractT )   % (DO NOT CHANGE THIS LINE)
fprintf( '\t Extraction steam temperature for FWH6 = %.2f �� \n', FWH6_extractT )   % (DO NOT CHANGE THIS LINE)
fprintf( '\n' )                                                                     % (DO NOT CHANGE THIS LINE)