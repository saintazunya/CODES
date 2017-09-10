function [ compressWork, exitT ] = gasCompressor( ...
cpCoeff, molarMass, inT, inP, exitP, polyEff )
% GASturbine Find ideal gas turbine specific work input
% and exit temperature
%using kmol as process unit
% Inputs:
% ... [see above] ...
% inT = turbine inlet gas temperature (K)
% inP = turbine inlet gas pressure (kPa)
% exitP = turbine exit gas pressure (kPa)
% polyEff = turbine polytropic efficiency (percent)
% Output:
% compressWork = mass-specific turbine work input (kJ/kg)
% exitT = turbine exit gas temperature (K) 
p=zeros(1,16);
dp=(exitP-inP)/15;
for i=1:16
    p(i)=inP+dp*(i-1);
end
polyEff=polyEff/100;
dskmol=0;
Touts=zeros(1,16);Touts(1)=inT;
T=zeros(1,16);T(1)=inT;
EnthalpyDiffa=zeros(1,16);
%% loop
for i=2:16
%% for isentropic process:
[Touts(i)]=findFinalTempFromEntropyDiff(cpCoeff, molarMass, T(i-1), p(i-1), p(i), dskmol);
[ ~, houtkmols ] =findEnthalpyDiff( cpCoeff, molarMass, T(i-1), Touts(i) );
%% calculate real temperature by polytropic efficiency
EnthalpyDiffa(i)=houtkmols/polyEff;%(/kmol)
T(i)=findFinalTempFromEnthalpyDiff(cpCoeff, molarMass, T(i-1), EnthalpyDiffa(i)/molarMass);
end
exitT=T(16);    
compressWork=abs(sum(EnthalpyDiffa)/molarMass);%(kjkg)
