% VM433 FA2016 Project 3 Part A Result Saving Codes
% Author: Sam SHEN Li (FA2016 VM433 Teaching Assistant)
% Last update date: Nov.29th, 2016

% Instructions:
%   1. Please copy and paste the following codes at the end of your main 
%      scripts of Part A1, Part A2 and Part A3, respectively.
%   2. Save your calculated value according to the requirements shown in
%      the comments.

%% For Part A1 (copy and paste after you finish calculation)
% Nameing convention (all the numbers w.r.t. standard reference state): 
% Gj_O2:	Gibbs free energy for ideal gas O2 at 300 deg C, 500 kPa (in kJ/kmol O2)
% Gj_H2:  	Gibbs free energy for ideal gas H2 at 300 deg C, 500 kPa (in kJ/kmol H2)
% Gj_H2O:	Gibbs free energy for ideal gas H2O at 300 deg C, 500 kPa (in kJ/kmol H2O)
% G_mix:  	Gibbs free energy for ideal gas mixture with 70% N2 and 30% O2 at 300 deg C, 500 kPa (in kJ/kmol mixture)
Result_A1 = [ Gj_O2, Gj_H2, Gj_H2O, G_mix ];

%% For Part A2 (copy and paste after you finish calculation)
% Nameing convention: 
% eff_LHV:      1st law efficiency based on LHV
% eff_HHV:      1st law efficiency based on HHV
% eff_Carnot:   Carnot efficiency w.r.t. reference temperature 25 deg C
Result_A2 = [   eff_LHV_pt1,    eff_HHV_pt1,    eff_Carnot_pt1  ;           % pt1: 25 deg C 
                eff_LHV_pt2,    eff_HHV_pt2,    eff_Carnot_pt2  ;           % pt2: 100 deg C
                eff_LHV_pt3,    eff_HHV_pt3,    eff_Carnot_pt3  ;           % pt3: 300 deg C
                eff_LHV_pt4,    eff_HHV_pt4,    eff_Carnot_pt4  ;           % pt4: 700 deg C
                eff_LHV_pt5,    eff_HHV_pt5,    eff_Carnot_pt5  ];          % pt5: 1000 deg C
         
%% For Part A3 (copy and paste after you finish calculation)
% Nameing convention: 
% eff_80:	1st law efficiency based on LHV at 80 deg C  (typical for PEMFC)
% eff_220: 	1st law efficiency based on LHV at 220 deg C (typical for PAFC)
% eff_650: 	1st law efficiency based on LHV at 650 deg C (typical for MCFC)
% eff_800: 	1st law efficiency based on LHV at 800 deg C (typical for SOFC)
Result_A3a = [  eff_80_pt1,     eff_220_pt1,    eff_650_pt1,    eff_800_pt1 ;   % pt1:  excess air = 100 %,  at 0.1 MPa
                eff_80_pt2,     eff_220_pt2,    eff_650_pt2,    eff_800_pt2 ;   % pt2:  excess air = 300 %,  at 0.1 MPa
                eff_80_pt3,     eff_220_pt3,    eff_650_pt3,    eff_800_pt3 ;   % pt3:  excess air = 500 %,  at 0.1 MPa 
                eff_80_pt4,     eff_220_pt4,    eff_650_pt4,    eff_800_pt4 ;   % pt4:  excess air = 700 %,  at 0.1 MPa
                eff_80_pt5,     eff_220_pt5,    eff_650_pt5,    eff_800_pt5 ];  % pt5:  excess air = 1000 %, at 0.1 MPa
            
Result_A3b = [  eff_80_pt6,     eff_220_pt6,    eff_650_pt6,    eff_800_pt6 ;   % pt6:  operating pressure = 0.1 MPa, at 100% excess air
                eff_80_pt7,     eff_220_pt7,    eff_650_pt7,    eff_800_pt7 ;   % pt7:  operating pressure = 1 MPa,   at 100% excess air
                eff_80_pt8,     eff_220_pt8,    eff_650_pt8,    eff_800_pt8 ;   % pt8:  operating pressure = 2 MPa,   at 100% excess air 
                eff_80_pt9,     eff_220_pt9,    eff_650_pt9,    eff_800_pt9 ;   % pt9:  operating pressure = 3 MPa,   at 100% excess air
                eff_80_pt10,    eff_220_pt10,   eff_650_pt10,   eff_800_pt10 ]; % pt10: operating pressure = 4 MPa,   at 100% excess air        
            
% This is the end of the script.