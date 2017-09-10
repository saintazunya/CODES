clear all; clc;

%%Species
Given.gas_input = 'air';
run( 'Ideal_Gas_Properties.m' )
[ Given.cpCoeff ] = Find_Ideal_Gas_Properties( Given.gas_input, 'Cp_coeff' );
[ Given.molarMass ] = Find_Ideal_Gas_Properties( Given.gas_input, 'Molar_mass' );
[ a  b ] = gasturbine( Given.cpCoeff, Given.molarMass, 300, 300, 200, 80 )
