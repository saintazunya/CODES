 %[ mixh ] = findMixtureEnthalpy( 288.15,  { 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8'},[28.50 69.05 0.92 0.03 1.50 0 0 0] );
 %[ mixh2 ] = findMixtureEnthalpy( 313.15,  { 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8'},[28.50 69.05 0.92 0.03 1.50 0 0 0] );
 %[ mixs ] = findMixtureEntropy( 288.15, 101.3, { 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8'},[28.50 69.05 0.92 0.03 1.50 0 0 0] );
 AFT = findAdiabaticFlameTemp({ 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8' }, [0.5 1.0 0 0.5 0 92 4 2 ], 300,{ 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8' }, [28.5 69.05 0.92 0.03 1.50 0 0 0], 300, 30 )
%{
 AFT = findAdiabaticFlameTemp( ...
fuel, fuelMoleFrac, fuelT, air, airMoleFrac, airT, AF )
%}
%[a, b, c]=findCnHmStoichiometricCombustion( 2, 6, {'O2'; 'N2'; 'H2O'; 'CO2'}, [20 70 5 3 2] )
%[a b c]=findCnHmStoichiometricCombustion( 1, 4, { 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8' }, [28.5 69.05 0.92 0.03 1.50 0 0 0])
 %[AF] = findAirFuelRatio({ 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8' }, [0.5 1.0 0 0.5 0 92 4 2 ], 300,{ 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8' }, [28.5 69.05 0.92 0.03 1.50 0 0 0], 300, 2000 )