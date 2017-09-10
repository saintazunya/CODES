function [ airStoich, prod, prodStoich ] = ...
findCnHmleanCombustion( n, m, air, airMoleFrac, AF )
% Inputs:
% n, m = numbers of fuel carbon and hydrogen atoms
% air = cell array of chemical symbols of air mixture species
% = {¡®O2¡¯; ¡®N2¡¯; ¡®Ar¡¯; ¡®CO2¡¯; ¡®H2O¡¯}
% airMoleFrac = corresp. air mixture species mole fractions (%)
% Outputs:
% airStoich = stoichiometric amount of air for the complete
% combustion of fuel (in kmol per kmol of fuel)
% prod = cell array of chemical symbols of complete-combustion
% product species = {¡®O2¡¯; ¡®N2¡¯; ¡®Ar¡¯; ¡®CO2¡¯; ¡®H2O¡¯}
% prodStoich = corresp. stoichiometric amount of complete-
% combustion product species (in kmol per kmol of fuel)
%% chemical equations
airMoleFrac=airMoleFrac/100;
airStoich=(n+m/4)/airMoleFrac(1);
%% calculate air molarmass
[Molarforair]= findmixturemolarmass( air, airMoleFrac*100 );
%% find molarmass of fuel
Molarforfuel=12*n+m;
%% air left 
nairleft=AF*1*Molarforfuel/Molarforair-airStoich;
%% calculate products
        prodStoich(1,1)=0+airMoleFrac(1)*nairleft;
        prodStoich(1,2)=airStoich*airMoleFrac(2)+airMoleFrac(2)*nairleft;
        prodStoich(1,3)=airStoich*airMoleFrac(3)+airMoleFrac(3)*nairleft;
        prodStoich(1,4)=n+airStoich*airMoleFrac(4)+airMoleFrac(4)*nairleft;
        prodStoich(1,5)=m/2+airStoich*airMoleFrac(5)+airMoleFrac(5)*nairleft;
        prodStoich(1,6)=0;
        prodStoich(1,7)=0;
        prodStoich(1,8)=0;
prod=air;
prodStoich;
%{
coeff{i}=airStoich/airMoleFrac(numN2);
coeff_Ar=airStoich/airMoleFrac(numAr);
coeff_CO2=n+airStoich/airMoleFrac(numCO2);
coeff_H2O=airStoich/airMoleFrac(numH2O)+m/2;
%}