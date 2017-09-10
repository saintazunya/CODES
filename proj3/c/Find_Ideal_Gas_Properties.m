function [ output ] = Find_Ideal_Gas_Properties( Gas_name, Property_name )
%Find_Ideal_Gas_Properties gives properties for given ideal gas.
%
% Inputs:
%   Gas_name:       Chemical formula for ideal gas, in a char format. 
%                   The available gases are: 'air', 'N2', 'O2', 'CO2', 'H2O', 'Ar', 'CH4', 'C2H6' and 'C3H8'.
%   Property_name:  Property for ideal gas, in a char format.
%                   The available properties are:
%                   'Cp_coeff':     4 coefficients for cubic polynomial fit of Cp, 
%                                   format: [ a b c d ]
%                                   formula: Cp(T) / M = a + b*T + c*T^2 + d*T^3
%                   'Molar_mass':   Molar mass, in kg/kmol
%                   'Formation_h':  Formation enthalpy, in kJ/kmol
%                   'Absolute_s':   Absolute entropy at reference state, in kJ/(kmol*K)
%
% Output: Ideal gas property specified by the user in the input.

global Cp_coeff Molar_mass Formation_h Absolute_s

%% Check whether the properties have been loaded
if isempty( Cp_coeff ) == 1
    run( 'Ideal_Gas_Properties.m' )
end

%% Find output property category
switch Property_name
    case 'Cp_coeff'
        output_property = Cp_coeff;
    case 'Molar_mass'
        output_property = Molar_mass;
    case 'Formation_h'
        output_property = Formation_h;
    case 'Absolute_s'
        output_property = Absolute_s;
    otherwise
        fprintf( '\n Available inputs (in char form): ''Cp_coeff'', ''Molar_mass'', ''Formation_h'' and ''Absolute_s'' \n')
        error( 'Invalid property name, please check.' )
end

%% Find output property for given species
switch Gas_name
    case 'air'
        output = output_property.air;
    case 'N2'
        output = output_property.N2;
    case 'O2'
        output = output_property.O2;
    case 'CO2'
        output = output_property.CO2;
    case 'H2O'
        output = output_property.H2O;
    case 'Ar'
        output = output_property.Ar;
    case 'CH4'
        output = output_property.CH4;
    case 'C2H6'
        output = output_property.C2H6;
    case 'C3H8'
        output = output_property.C3H8;
    case 'H2'
        output = output_property.H2;    
    case 'CO'
        output = output_property.CO;
    otherwise
        fprintf( '\n Available inputs (in char form): ''air'', ''N2'', ''O2'', ''CO2'', ''H2O'', ''Ar'', ''CH4'', ''C2H6'',''H2'',''CO'' and ''C3H8'' \n')
        error( 'Invalid gas name, please check.' )
end

end