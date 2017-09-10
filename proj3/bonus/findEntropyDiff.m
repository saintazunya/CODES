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
%syms cp t p
%cp=t^3*cpCoeff(4)+t^2*cpCoeff(3)+t*cpCoeff(2)+cpCoeff(1);
%(T2^3-T1^3)*cpCoeff(4)/3+(T2^2-T1^2)*cpCoeff(3)/2+(T2-T1)*cpCoeff(2)+(log(T2)-log(T1))*cpCoeff(1)
dskmol=(T2^3-T1^3)*cpCoeff(4)/3+(T2^2-T1^2)*cpCoeff(3)/2+(T2-T1)*cpCoeff(2)+(log(T2)-log(T1))*cpCoeff(1)-Ru*log(P2/P1);
dskg=dskmol/molarMass;
end

