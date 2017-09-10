function [ dskg, dskmol ] = findEntropyDiff( cpCoeff, molarMass, T1, P1, T2, P2 )
%findEntropyDiff finds specific entropy change for an given ideal gas
%   between two given temperatures, in kJ/(kg*K) and kJ/(kmol*K)
%
% Inputs:    
%   cpCoeff:        Constant pressure specific heat coefficients, from the VM235 text book.
%   molarMass:      Molar mass, in kg/kmol
%   T1:             Initial temperature, in K
%   P1:             Initial pressure, in kPa
%   T2:             Final temperature, in K
%   P2:             Final pressure, in kPa
%
% Outputs:   
%   dskg:           Specific entropy change, in kJ/(kg*K)
%   dskmol:         Specific entropy change, in kJ/(kmol*K)

%% Universal gas constant
global Ru % kJ/(kmol*K) (DO NOT CHANGE THIS LINE)

% START WRITING YOUR FUNCTION HERE


end

