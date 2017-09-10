T = linspace(0,1000,100);
air = {'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4';'C2H6';'C3H8'};
airMoleFrac = [20.74 77.30 0.92 0.03 1.01 0 0 0];

[ airStoich, prod, prodStoich ] = ...
findCnHmStoichiometricCombustion( 3, 8, air, airMoleFrac );

mix = air;
mixMoleFrac = airMoleFrac*(airStoich/(1+airStoich)) + [0 0 0 0 0 0 0 1/(1+airStoich)];
prodMoleFrac = prodStoich/sum(prodStoich);
mixh = zeros(n);
mixs = mixh;
prodh = mixh;
prods = mixh;

for i=1:100
    [ mixh(i) ] = findMixtureEnthalpy( T(i), mix, mixMoleFrac );
    [ mixs(i) ] = findMixtureEntropy( T(i), 101.3, mix, mixMoleFrac );
    [ prodh(i) ] = findMixtureEnthalpy( T(i), prod, prodMoleFrac );
    [ prods(i) ] = findMixtureEntropy( T(i), 101.3, prod, prodMoleFrac );
end

figure(1);
plot(T,mixh);
hold on;
plot(T,prodh,'--r');
legend('h_m_i_x - T diagram','h_p_r_o_d - T diagram');
xlabel('h (kJ/kg)');
ylabel('T (K)');


figure(2);
plot(mixs,mixh);
hold on;
plot(prods,prodh,'--r');
legend('h_m_i_x - s_m_i_x diagram','h_p_r_o_d - s_p_r_o_d diagram');
xlabel('h (kJ/kg)');
ylabel('s (kJ/kg-K)');
