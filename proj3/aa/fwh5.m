% VM433 FA2016 Project 1 Part B4 & B5 Main Script (Post with Project Part B)
% Author: Sam SHEN Li (FA2016 VM433 Teaching Assistant)
% Last update date: Sep.26th, 2016

%% Insturctions:
%   1. Please read through the comments in this script carefully
%   2. Change every line that we ask you to change (comments will follow for those lines)
%   3. You can only change the numbers only, be aware of the units
%   4. Any line with NO comment = do NOT change
%   5. Make necessary assumptions and list them together with the answers clearly in the submitted word file
%       Hint: Is the number in Line 27 (CFWH_feedwaterPRatio) reasonable?
%   6. Change the inputs to Ivanpah FWH4 and FWH5 while submitting your code

%% Clean up
clear
close all
clc

%% Inputs
% Part B4: Closed FWH5
% Extraction steam
CFWH_extractT = 325;                                                        % Temperature at extration steam inlet, in deg C (CHANGE THIS LINE TO IVANPAH FWH NO.5)
CFWH_extractP = 22.05;                                                         % Pressure at extration steam inlet, in bar (CHANGE THIS LINE TO IVANPAH FWH NO.5)
% Feedwater
CFWH_feedwaterInT = 190.6;                                                    % Temperature at feedwater(main flow) inlet, in deg C (CHANGE THIS LINE TO IVANPAH FWH NO.5)
CFWH_feedwaterInP =198/0.906/0.99;                                                    % Pressure at feedwater(main flow) inlet, in bar (CHANGE THIS LINE TO IVANPAH FWH NO.5)
CFWH_feedwaterPRatio = 0.99;                                                 % Pressure ratio of feedwater ( outlet / inlet ) (CHANGE THIS LINE TO IVANPAH FWH NO.5)
CFWH_feedwaterInM = 341.1;                                                    % Mass flow rate in feedwater(main flow), in tons/hr (CHANGE THIS LINE TO IVANPAH FWH NO.5)
% Drain
CFWH_drainInT = 223.1;                                                        % Temperature at drain inlet, in deg C (CHANGE THIS LINE TO IVANPAH FWH NO.5)
CFWH_drainInP = 34.93;                                                         % Pressure at drain inlet, in bar (CHANGE THIS LINE TO IVANPAH FWH NO.5)
CFWH_drainInM = 18.22;                                                         % Mass flow rate at drain inlet, in tons/hr (CHANGE THIS LINE TO IVANPAH FWH NO.5)
CFWH_drainPRatio = 22.05/34.93;                                                     % Pressure ratio of drain ( outlet / inlet ) (CHANGE THIS LINE TO IVANPAH FWH NO.5)
% Parameter
CFWH_TTD =-0.79;                                                               % Terminal temperature difference, in deg C (CHANGE THIS LINE TO IVANPAH FWH NO.5)
CFWH_DCA = 5.00;                                                              % Drain cooler apporoach, in deg C (CHANGE THIS LINE TO IVANPAH FWH NO.5)

% Part B5: Open FWH
% Extraction steam
OFWH_extractT = 331;                                                        % Temperature at extration steam inlet, in deg C (CHANGE THIS LINE TO IVANPAH FWH NO.4)
OFWH_extractP = 11.45;                                                         % Pressure at extration steam inlet, in bar (CHANGE THIS LINE TO IVANPAH FWH NO.4)
% Feedwater
OFWH_feedwaterInT = 144.5;                                                    % Temperature at feedwater(main flow) inlet, in deg C (CHANGE THIS LINE TO IVANPAH FWH NO.4)
OFWH_feedwaterInP = 11.46;                                                     % Pressure at feedwater(main flow) inlet, in bar (CHANGE THIS LINE TO IVANPAH FWH NO.4)
OFWH_feedwaterInM = 283.9;                                                    % Mass flow rate in feedwater(main flow), in tons/hr (CHANGE THIS LINE TO IVANPAH FWH NO.4)
% Drain 
OFWH_drainInT = 195.6;                                                        % Temperature at drain inlet, in deg C (CHANGE THIS LINE TO IVANPAH FWH NO.4)
OFWH_drainInP = 22.05;                                                         % Pressure at drain inlet, in bar (CHANGE THIS LINE TO IVANPAH FWH NO.4)
OFWH_drainInM = 35.81;                                                         % Mass flow rate at drain inlet, in tons/hr (CHANGE THIS LINE TO IVANPAH FWH NO.4)
                                                        % Mass flow rate at drain inlet, in tons/hr (CHANGE THIS LINE TO IVANPAH FWH NO.4)

%% Part B4: Closed FWH Extraction Mass Flow Rate Calculation 
[ CFWH_extractM ] = findCFWHExtractM( CFWH_extractT, CFWH_extractP,...                                                      % (DO NOT CHANGE THIS LINE)
                                        CFWH_feedwaterInT, CFWH_feedwaterInP, CFWH_feedwaterInM, CFWH_feedwaterPRatio,...   % (DO NOT CHANGE THIS LINE)
                                            CFWH_drainInT, CFWH_drainInP, CFWH_drainInM, CFWH_drainPRatio,...               % (DO NOT CHANGE THIS LINE)
                                                CFWH_TTD, CFWH_DCA );                                                       % (DO NOT CHANGE THIS LINE)
                                            
%% Part B5: Open FWH Extraction Mass Flow Rate Calculation                                             
[ OFWH_extractM ] = findOFWHExtractM( OFWH_extractT, OFWH_extractP, ...                                     % (DO NOT CHANGE THIS LINE)
                                        OFWH_feedwaterInT, OFWH_feedwaterInP, OFWH_feedwaterInM,...         % (DO NOT CHANGE THIS LINE)
                                            OFWH_drainInT, OFWH_drainInP, OFWH_drainInM );                  % (DO NOT CHANGE THIS LINE)

%% Display results in commend window
% Part B4
fprintf( 'Results for Project 1 Part B4: \n' )                                                              % (DO NOT CHANGE THIS LINE)
fprintf( '\n' )                                                                                             % (DO NOT CHANGE THIS LINE)
fprintf( '\t Extraction steam mass flow rate for closed FWH \t = \t %.2f tons/hr \n', CFWH_extractM )       % (DO NOT CHANGE THIS LINE)
fprintf( '\n' )                                                                                             % (DO NOT CHANGE THIS LINE)
% Part B5
fprintf( 'Results for Project 1 Part B5: \n' )                                                              % (DO NOT CHANGE THIS LINE)
fprintf( '\n' )                                                                                             % (DO NOT CHANGE THIS LINE)
fprintf( '\t Extraction steam mass flow rate for open FWH \t\t = \t %.2f tons/hr \n', OFWH_extractM )       % (DO NOT CHANGE THIS LINE)
fprintf( '\n' )                                                                                             % (DO NOT CHANGE THIS LINE)