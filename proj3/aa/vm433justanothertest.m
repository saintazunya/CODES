 mixture={ 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8' };
 mixturefraction=[28.5 69.05 0.92 0.03 1.50 0 0 0];
 %cpCoeff=Find_Ideal_Gas_Properties( 'air', 'Cp_coeff' );
%Molar_mass=Find_Ideal_Gas_Properties( 'air', 'Molar_mass' );
% [Molarformixture]= findmixturemolarmass( mixture,mixturefraction);
 %cpCoeff=findmixturecpcoeff(mixture ,mixturefraction);
 %cpCoeff=Find_Ideal_Gas_Properties( 'air', 'Cp_coeff' );
% Molar_mass=Find_Ideal_Gas_Properties( 'air', 'Molar_mass' );
 %[work T]=gasturbine(cpCoeff, Molar_mass, 300, 300,200, 80 )
 %findmixturecpcoeff(mixture ,mixturefraction)
% mixture is a cell
%[a b]=gasturbine( cpCoeff, molarMass,200, 250, 300, 90 )
findMixtureEnthalpy(313.15,  mixture, mixturefraction )
findMixtureEntropy(313.15,319.1,mixture, mixturefraction)