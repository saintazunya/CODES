function [ dhkg, dhkmol ] = findEnthalpyDiff( cpCoeff, molarMass, T1, T2 )
%findEnthalpyDiff gives specific enthalpy change for an given ideal gas
%   between two given temperatures, in kJ/kg and kJ/kmol
%
% Inputs:    
%   cpCoeff:        Constant pressure specific heat coefficients, from the VM235 text book.
%   molarMass:      Molar mass, in kg/kmol
%   T1:             Initial temperature, in K
%   T2:             Final temperature, in K
%
% Outputs:   
%   dhkg:           Specific enthalpy change, in kJ/kg
%   dhkmol:         Specific enthalpy change, in kJ/kmol

% START WRITING YOUR FUNCTION HERE
%syms cp t
%cp=t^3*cpCoeff(4)+t^2*cpCoeff(3)+t*cpCoeff(2)+cpCoeff(1);
%(T2^4-T1^4)*cpCoeff(4)/4+(T2^3-T1^3)*cpCoeff(3)/3+(T2^2-T1^2)*cpCoeff(2)/2+cpCoeff(1)*(T2-T1)
dhkmol=(T2^4-T1^4)*cpCoeff(4)/4+(T2^3-T1^3)*cpCoeff(3)/3+(T2^2-T1^2)*cpCoeff(2)/2+cpCoeff(1)*(T2-T1);
dhkg=double(dhkmol/molarMass);
end

