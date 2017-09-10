function AFT = findAdiabaticFlameTemp( ...
fuel, fuelMoleFrac, fuelT, air, airMoleFrac, airT, AF )
% FINDADIABATICFLAMETEMP Find adiabatic flame temperature
% for complete combustion of fuel in air
% Inputs:
% fuel/air = cell array of chemical symbols of fuel/air
% mixture species
% fuel/airMoleFrac = corresponding fuel/air mixture
% species mole fractions (%)
% fuel/airT = fuel/air mixture temperature (K)
% AF = air-fuel ratio (kg air / kg fuel)
% Output:
% AFT = adiabatic flame temperature (K)
%% find air molarmass
[airmolar]= findmixturemolarmass( air, airMoleFrac );
%% find fuel molarmass
[fuelmolar]= findmixturemolarmass( fuel, fuelMoleFrac );
%% total air amount
airn=AF*1*fuelmolar/airmolar;
%% E reactors
 prod=air;
 Hreactors=findMixtureEnthalpy(fuelT, fuel, fuelMoleFrac)*(1*fuelmolar)+findMixtureEnthalpy(airT,air,airMoleFrac)*(airn*airmolar);
 %---------------------debug may start from here
%% prodcuts
airStoich=cell(8);
[ airStoich{6}, ~, prodStoich6] =findCnHmStoichiometricCombustion( 1, 4, air, airMoleFrac);
[ airStoich{7}, ~, prodStoich7] =findCnHmStoichiometricCombustion( 2, 6, air, airMoleFrac);
[ airStoich{8}, ~, prodStoich8] =findCnHmStoichiometricCombustion( 3, 8, air, airMoleFrac);
%% find air used
  airused=airStoich{6}(1)*fuelMoleFrac(6)/100+airStoich{7}(1)*fuelMoleFrac(7)/100+airStoich{8}(1)*fuelMoleFrac(8)/100;
%% find air in the product
  airleft=airn-airused;
%% sum up combustion products
productn=prodStoich6*(fuelMoleFrac(6)/100)+prodStoich7*fuelMoleFrac(7)/100+prodStoich8*fuelMoleFrac(8)/100+airleft*airMoleFrac/100;%mol
%% find AFT
f=@(T)findMixtureEnthalpy(T, prod, productn)*(fuelmolar+airn*airmolar)-Hreactors ;
AFT= fsolve(f, 400 ,optimset('Display','off'));
