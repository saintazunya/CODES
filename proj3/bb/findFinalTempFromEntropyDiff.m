function [ T2 ] = findFinalTempFromEntropyDiff( cpCoeff, molarMass, T1, P1, P2, dskg )
%findFinalTempFromEntropyDiff returns final temperature for an given ideal gas
%   given initial temperature, initial pressure, final pressure and enthalpy difference.
%
% Inputs:    
%   cpCoeff:        Constant pressure specific heat coefficients, from the VM235 text book.
%   molarMass:      Molar mass, in kg/kmol
%   T1:             Initial temperature, in K
%   P1:             Initial pressure, in kPa
%   P2:             Final pressure, in kPa
%   dskg:           Specific entropy change, in kJ/(kg*K)
%
% Output:   
%   T2:             Final temperature, in K

% START WRITING YOUR FUNCTION HERE
R=8.3145;
%T2=400;T1=300;P1=200;P2=200;
%Cp=t^3*cpCoeff(4)+t^2*cpCoeff(3)+t*cpCoeff(2)+cpCoeff(1);
dskmol = dskg*molarMass;
f = @(T2)((T2^3-T1^3)*cpCoeff(4)/3+(T2^2-T1^2)*cpCoeff(3)/2+(T2-T1)*cpCoeff(2)+(log(T2)-log(T1))*cpCoeff(1) - R*log(P2/P1) - dskmol);
T2 = fsolve(f,500,optimset('Display','off'));
end

