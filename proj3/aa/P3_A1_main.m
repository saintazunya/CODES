%P3_A1_main
% Nameing convention (all the numbers w.r.t. standard reference state): 
% Gj_O2:	Gibbs free energy for ideal gas O2 at 300 deg C, 500 kPa (in kJ/kmol O2)
% Gj_H2:  	Gibbs free energy for ideal gas H2 at 300 deg C, 500 kPa (in kJ/kmol H2)
% Gj_H2O:	Gibbs free energy for ideal gas H2O at 300 deg C, 500 kPa (in kJ/kmol H2O)
% G_mix:  	Gibbs free energy for ideal gas mixture with 70% N2 and 30% O2 at 300 deg C, 500 kPa (in kJ/kmol mixture)
[ Gj_O2 ] = findSpeciesGibbs( 'O2', 300+273.15, 500);
[ Gj_H2 ] = findSpeciesGibbs( 'H2', 300+273.15, 500);
[ Gj_H2O ] = findSpeciesGibbs( 'H2O', 300+273.15, 500);
air={ 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8' };
airMoleFrac=[30 70 0 0 0 0 0 0];
airmolar=findmixturemolarmass(air,airMoleFrac);
[ G_mix ] = findMixtureGibbs( air, airMoleFrac,airmolar, 300+273.15,500 );
Result_A1 = [ Gj_O2, Gj_H2, Gj_H2O, G_mix ];
