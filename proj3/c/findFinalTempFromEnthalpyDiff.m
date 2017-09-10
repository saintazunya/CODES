function [ T2 ] = findFinalTempFromEnthalpyDiff( cpCoeff, molarMass, T1, dhkg )
%findFinalTempFromEnthalpyDiff returns final temperature for an given ideal gas
%   given initial temperature and enthalpy difference.
%
% Inputs:    
%   cpCoeff:        Constant pressure specific heat coefficients, from the VM235 text book.
%   molarMass:      Molar mass, in kg/kmol
%   T1:             Initial temperature, in K
%   dhkg:           Specific enthalpy change, in kJ/kg
%
% Output:   
%   T2:             Final temperature, in K

% START WRITING YOUR FUNCTION HERE
dhkmol=dhkg*molarMass;
f = @(T2)((T2^4-T1^4)*cpCoeff(4)/4+(T2^3-T1^3)*cpCoeff(3)/3+(T2^2-T1^2)*cpCoeff(2)/2+cpCoeff(1)*(T2-T1) - dhkmol);
T2=fsolve(f,T1,optimset('Display','off'));
end

