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
for i=1:length(air)
    %fprintf('Specific Work= )\n')
if strcmp(air{i},'O2')==1 
        numO2=i;
elseif strcmp(air{i}, 'N2')==1
        numN2=i;
elseif strcmp(air{i},'CO2')==1
        numCO2=i;
elseif strcmp(air{i}, 'H2O')==1
        numH2O=i;
elseif strcmp(air{i}, 'Ar')==1
        numAr=i;
else     fprintf( '\n Available inputs (in char form): ''air'', ''N2'', ''O2'', ''CO2'', ''H2O'', ''Ar'' \n')
        error( 'Invalid gas name, please check.' )
end

end
airStoich=(n+m/2)/airMoleFrac(numO2);
%% calculate air molarmass
[Molarforair]= findmixturemolarmass( air, airMoleFrac );
%% find molarmass of fuel
Molarforfuel=12*n+m;
%% air left 
nairleft=AF*1*Molarforfuel/Molarforair-airStoich;
%% calculate products
for i=1:length(air)
    if i==numO2
        prod{i}='O2';
        prodStoich{i}=0+airMoleFrac(i)*nairleft;
    elseif i==numN2
        prod{i}='N2';
        prodStoich{i}=airStoich*airMoleFrac(numN2)+airMoleFrac(i)*nairleft;
    elseif i==numCO2
        prod{i}='CO2';
        prodStoich{i}=n+airStoich*airMoleFrac(numCO2)+airMoleFrac(i)*nairleft;
    elseif i==numH2O
        prod{i}='H2O';
        prodStoich{i}=m/2+airStoich*airMoleFrac(numH2O)+airMoleFrac(i)*nairleft;
    elseif i==numAr
        prod{i}='Ar';
        prodStoich{i}=airStoich*airMoleFrac(numAr)+airMoleFrac(i)*nairleft;
    end
end
prod;
prodStoich;
%{
coeff{i}=airStoich/airMoleFrac(numN2);
coeff_Ar=airStoich/airMoleFrac(numAr);
coeff_CO2=n+airStoich/airMoleFrac(numCO2);
coeff_H2O=airStoich/airMoleFrac(numH2O)+m/2;
%}