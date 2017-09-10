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
syms p t T2
R=8.3145;
%T2=400;T1=300;P1=200;P2=200;
cpCoeff=fliplr(cpCoeff);
cp=poly2sym(cpCoeff,t);
dskmol=int(cp/t,t,T1,T2)-R*log(P2/P1);
f=dskmol/molarMass-dskg;
T2=fsolve(matlabFunction(f),T1,optimset('Display','off'));
end

