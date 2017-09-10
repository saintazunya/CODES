% VM433 FA2016 Project 3 Part A Result Saving Codes
% Author: Sam SHEN Li (FA2016 VM433 Teaching Assistant)
% Last update date: Dec.5th, 2016

% Instructions:
%   1. Please copy and paste the following codes at the end of your main 
%      scripts of Part B4, Part B5 and Part B6, respectively.
%   2. Save your calculated value according to the requirements shown in
%      the comments, mind the units.

%% For Part B4 (copy and paste after you finish calculation)
% Nameing convention (all the numbers w.r.t. standard reference state): 
% Kp_WGS:	Kp for WGS reaction at a specified temperature (no unit)
% Kp_SMR:  	Kp for SMR reaction at a specified temperature (no unit)
Result_B4 = [   Kp_WGS_pt1,     Kp_SMR_pt1;                                 % pt1: 200 deg C
                Kp_WGS_pt2,     Kp_SMR_pt2;                                 % pt2: 500 deg C
                Kp_WGS_pt3,     Kp_SMR_pt3;                                 % pt3: 600 deg C
                Kp_WGS_pt4,     Kp_SMR_pt4;                                 % pt4: 700 deg C
                Kp_WGS_pt5,     Kp_SMR_pt5 ];                               % pt5: 1200 deg C

%% For Part B5 (copy and paste after you finish calculation)
% Nameing convention: 
% CH4_Frac_WGS: CH4 equlibrium molar fraction for WGS reaction at a specified temperature/pressure (in %)
% H2O_Frac_WGS: H2O equlibrium molar fraction for WGS reaction at a specified temperature/pressure (in %)
% H2_Frac_WGS:  H2  equlibrium molar fraction for WGS reaction at a specified temperature/pressure (in %)
% CO_Frac_WGS:  CO  equlibrium molar fraction for WGS reaction at a specified temperature/pressure (in %)
Result_B5 = [   CH4_Frac_WGS_pt1,   H2O_Frac_WGS_pt1,   H2_Frac_WGS_pt1,    CO_Frac_WGS_pt1;    % pt1: 200 deg C, 0.1 MPa 
                CH4_Frac_WGS_pt2,   H2O_Frac_WGS_pt2,   H2_Frac_WGS_pt2,    CO_Frac_WGS_pt2;    % pt2: 500 deg C, 0.1 MPa
                CH4_Frac_WGS_pt3,   H2O_Frac_WGS_pt3,   H2_Frac_WGS_pt3,    CO_Frac_WGS_pt3;    % pt3: 500 deg C, 1 MPa
                CH4_Frac_WGS_pt4,   H2O_Frac_WGS_pt4,   H2_Frac_WGS_pt4,    CO_Frac_WGS_pt4;    % pt4: 500 deg C, 10 MPa
                CH4_Frac_WGS_pt5,   H2O_Frac_WGS_pt5,   H2_Frac_WGS_pt5,    CO_Frac_WGS_pt5;    % pt5: 700 deg C, 0.1 MPa
                CH4_Frac_WGS_pt6,   H2O_Frac_WGS_pt6,   H2_Frac_WGS_pt6,    CO_Frac_WGS_pt6;    % pt6: 700 deg C, 1 MPa
                CH4_Frac_WGS_pt7,   H2O_Frac_WGS_pt7,   H2_Frac_WGS_pt7,    CO_Frac_WGS_pt7;    % pt7: 700 deg C, 10 MPa
                CH4_Frac_WGS_pt8,   H2O_Frac_WGS_pt8,   H2_Frac_WGS_pt8,    CO_Frac_WGS_pt8 ];  % pt8: 1200 deg C, 0.1 MPa
         
%% For Part B6 (copy and paste after you finish calculation)
% Nameing convention: 
% CH4_Frac_SMR: CH4 equlibrium molar fraction for SMR reaction at a specified temperature/pressure (in %)
% H2O_Frac_SMR: H2O equlibrium molar fraction for SMR reaction at a specified temperature/pressure (in %)
% H2_Frac_SMR:  H2  equlibrium molar fraction for SMR reaction at a specified temperature/pressure (in %)
% CO_Frac_SMR:  CO  equlibrium molar fraction for SMR reaction at a specified temperature/pressure (in %)
Result_B6 = [   CH4_Frac_SMR_pt1,   H2O_Frac_SMR_pt1,   H2_Frac_SMR_pt1,    CO_Frac_SMR_pt1;    % pt1: 200 deg C, 0.1 MPa 
                CH4_Frac_SMR_pt2,   H2O_Frac_SMR_pt2,   H2_Frac_SMR_pt2,    CO_Frac_SMR_pt2;    % pt2: 500 deg C, 0.1 MPa
                CH4_Frac_SMR_pt3,   H2O_Frac_SMR_pt3,   H2_Frac_SMR_pt3,    CO_Frac_SMR_pt3;    % pt3: 500 deg C, 1 MPa
                CH4_Frac_SMR_pt4,   H2O_Frac_SMR_pt4,   H2_Frac_SMR_pt4,    CO_Frac_SMR_pt4;    % pt4: 500 deg C, 10 MPa
                CH4_Frac_SMR_pt5,   H2O_Frac_SMR_pt5,   H2_Frac_SMR_pt5,    CO_Frac_SMR_pt5;    % pt5: 700 deg C, 0.1 MPa
                CH4_Frac_SMR_pt6,   H2O_Frac_SMR_pt6,   H2_Frac_SMR_pt6,    CO_Frac_SMR_pt6;    % pt6: 700 deg C, 1 MPa
                CH4_Frac_SMR_pt7,   H2O_Frac_SMR_pt7,   H2_Frac_SMR_pt7,    CO_Frac_SMR_pt7;    % pt7: 700 deg C, 10 MPa
                CH4_Frac_SMR_pt8,   H2O_Frac_SMR_pt8,   H2_Frac_SMR_pt8,    CO_Frac_SMR_pt8 ];  % pt8: 1200 deg C, 0.1 MPa      
            
% This is the end of the script.