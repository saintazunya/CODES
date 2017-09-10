function [AF] = findAirFuelRatio( ...
 fuel, fuelMoleFrac, fuelT, air, airMoleFrac, airT, AFT )
% FINDAIRFUELRATIO Find air-fuel ratio based on complete-
% combustion adiabatic flame temperature of fuel in air
% Inputs/Output:
% ... [see above] ...
f=@(af)findAdiabaticFlameTemp( fuel, fuelMoleFrac, fuelT, air, airMoleFrac, airT, af )-AFT;
AF=fsolve(f,30,optimset('Display','off'));

