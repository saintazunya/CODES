function [ mixs ] = findMixtureEntropy( ...
mixT, mixP, mix, mixMoleFrac )
% FINDMIXTUREENTROPY Find specific entropy for an ideal gas mixture
% Inputs:
% ... [see above] ...
% Output:
% mixs = mass-specific mixture entropy (kJ/kg-K)
Looptime=length(mix);
molarMass=zeros(size(mix));
sfromtemp=zeros(size(mix));
Absolute_s=zeros(size(mix));
S=zeros(size(mix));
cpCoeff=cell(size(mix));
p.std=101.3;
R=8.31447;
Molarair=zeros(size(mix));
for i=1:Looptime(1)
    gasname= mix{i};
    molarMass(i)=Find_Ideal_Gas_Properties( gasname, 'Molar_mass' );
    Molarair(i)=molarMass(i)*mixMoleFrac(i)/100;
end
Molar=sum(Molarair);
for i=1:Looptime(1)
gasname= mix{i};
[ Absolute_s(i) ] = Find_Ideal_Gas_Properties( gasname, 'Absolute_s' );
cpCoeff{i}=Find_Ideal_Gas_Properties( gasname, 'Cp_coeff' );
[~,sfromtemp(i)]=findEntropyDiff( cpCoeff{i}, molarMass(i), 25+273.15,p.std, mixT,mixP );
%{
if mixMoleFrac(i)==0
    S(i)= 0;
else
    S(i)= (Absolute_s(i)+sfromtemp(i)-log(mixMoleFrac(i))*R)*(mixMoleFrac(i)/100)/Molar;%/kj
end
%}
S(i)= (Absolute_s(i)+sfromtemp(i))*(mixMoleFrac(i)/100)/Molar;%/kj
end
mixs=(sum(S));