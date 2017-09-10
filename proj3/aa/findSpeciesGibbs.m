function [ spg ] = findSpeciesGibbs( gasname, Tg, Pg)
%g=h-ts
%unit in /kg
%% find h
molarMass=Find_Ideal_Gas_Properties(gasname,'Molar_mass');
[ formationh ] = Find_Ideal_Gas_Properties( gasname, 'Formation_h' );
cpCoeff=Find_Ideal_Gas_Properties( gasname, 'Cp_coeff' );
[~,hfromtemp]=findEnthalpyDiff( cpCoeff, molarMass, 25+273.15, Tg );
%% s
[ Absolute_s ] = Find_Ideal_Gas_Properties( gasname, 'Absolute_s' );
[~,sfromtemp]=findEntropyDiff( cpCoeff, molarMass, 25+273.15,101.3, Tg,Pg );
H=(formationh+hfromtemp);
S=(Absolute_s+sfromtemp);
spg=H-Tg*S;
