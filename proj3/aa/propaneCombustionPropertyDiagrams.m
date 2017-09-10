cpCoeff=Find_Ideal_Gas_Properties( 'air', 'Cp_coeff' );
molarMass=Find_Ideal_Gas_Properties( 'air', 'Molar_mass' );
air={ 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8' };
airMoleFrac=[20.74 77.30 0.92 0.03 1.01 0 0 0];
[airn,prod, prodStoich]=findCnHmStoichiometricCombustion( 3,8, air, airMoleFrac );
mixture1={ 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8' };
mixture1frac=airn/(airn+1)*airMoleFrac+1/(airn+1)*[0 0 0 0 0 0 0 100];
%% for mixture
% assume 
p=101.3;
T=100:500;
h=zeros(1,401);
s=zeros(1,401);
for i=100:500
    h(i-99)=findMixtureEnthalpy(T(i-99),  mixture1, mixture1frac );
    s(i-99)=findMixtureEntropy(T(i-99), 101.3, mixture1, mixture1frac );
end
figure(1)
plot(T,h);
hold on
figure(2)
plot(s,h);
hold on
%%  for products
hh=zeros(1,401);
ss=zeros(1,401);
for i=100:500
    hh(i-99)=findMixtureEnthalpy(T(i-99),  prod, prodStoich );
    ss(i-99)=findMixtureEntropy(T(i-99), 101.3, prod, prodStoich );
end
figure(1)
plot(T,hh,'r');
legend('h- T (mixture)diagram','h - T (product)diagram');
xlabel('h (kJ/kg)');
ylabel('T (K)');
figure(2)
plot(ss,hh,'r');
legend('h- s (mixture)diagram','h - s (product)diagram');
xlabel('h (kJ/kg)');
ylabel('s (kJ/kg-K)');
