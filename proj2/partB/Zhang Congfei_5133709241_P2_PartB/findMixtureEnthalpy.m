function [ mixh ] = findMixtureEnthalpy( ...
mixT,  mix, mixMoleFrac )
% FINDMIXTUREENTHALPY Find specific enthalpy for an ideal gas mixture
% Inputs:
% mixT = mixture temperature (K)
% mixP = mixture pressure (kPa)
% mix = cell array of chemical symbols of mixture species
% (example: mix = {¡®O2¡¯; ¡®N2¡¯; ¡®Ar¡¯; ¡®CO2¡¯; ¡®H2O¡¯})
% mixMoleFrac = corresponding mixture species mole fractions (%)
% Output:
% mixh = mass-specific mixture enthalpy (kJ/kg)
Looptime=length(mix);
molarMass=zeros(size(mix));
hfromtemp=zeros(size(mix));
formationh=zeros(size(mix));
H=zeros(size(mix));
cpCoeff=cell(size(mix));
Molarair=zeros(size(mix));
for i=1:Looptime(1)
    gasname= mix{i};
    molarMass(i)=Find_Ideal_Gas_Properties( gasname, 'Molar_mass' );
    Molarair(i)=molarMass(i)*mixMoleFrac(i)/100;
end
Molar=sum(Molarair);
for i=1:Looptime(1)
gasname= mix{i};
[ formationh(i) ] = Find_Ideal_Gas_Properties( gasname, 'Formation_h' );
cpCoeff{i}=Find_Ideal_Gas_Properties( gasname, 'Cp_coeff' );
[~,hfromtemp(i)]=findEnthalpyDiff( cpCoeff{i}, molarMass(i), 25+273.15, mixT );
H(i)= (formationh(i)+hfromtemp(i))*(mixMoleFrac(i)/100)/Molar;%/kj
end
mixh=(sum(H));
a=1;