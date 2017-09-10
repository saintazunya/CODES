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
syms cp t T2
cpCoeff=fliplr(cpCoeff);
cp=poly2sym(cpCoeff,t);
dhkmol=dhkg*molarMass;
f=int(cp,t,T1,T2)-dhkmol;
T2=fsolve(matlabFunction(f),T1,optimset('Display','off'));
end

