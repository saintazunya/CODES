%eff=-(Gprod-Greact)/(mfuel*heating value)
%reaction=  1/2o2+h2->h20
%on the base of 1 kmol H2
% in kg unit
%hv=(Hp-Hr)/mfuel
clear all
close all
%% for HHV
air={ 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8' };
airMoleFrac=[21 79 0 0 0 0 0 0];
airmolar=findmixturemolarmass(air,airMoleFrac);
%O2molar=Find_Ideal_Gas_Properties( 'O2', 'Molar_mass' );
fuel={'H2'};
fuelfrac=[100];
fuelmolar=Find_Ideal_Gas_Properties( fuel{1}, 'Molar_mass' );
watermolar=Find_Ideal_Gas_Properties( 'H2O', 'Molar_mass' );
[ airStoich, ~, ~ ]=findCnHmStoichiometricCombustion( 0, 2, air, airMoleFrac );
AF=2*airStoich*airmolar/fuelmolar;
[ ~, prod, prodcomp ]=findCnHmleanCombustion( 0, 2, air, airMoleFrac, AF );
prodfrac=prodcomp/(sum(prodcomp))*100;
prodmolar=findmixturemolarmass(prod,prodfrac);
pstd=100;
ph2=pstd;
po2=0.21*pstd;
effl=zeros(1,976);
effh=zeros(1,976);
effcarnot=zeros(1,976);
T=[298:1273];
tstd=25+273.15;
for mixT=298:1273
Tg=mixT;
mf=1*fuelmolar;
ma=AF*mf;
[ spgH2 ] = findSpeciesGibbs( 'H2', Tg, ph2)/fuelmolar;
[airg]=findMixtureGibbs( air, airMoleFrac,airmolar,Tg,pstd )/airmolar;
[prodg]=findMixtureGibbs( prod, prodfrac,prodmolar,Tg,pstd )/prodmolar;
Greact=spgH2*mf+airg*ma;
Gprod=prodg*(ma+mf);
%% find reactnt property
Hf=findMixtureEnthalpy( tstd,  fuel, fuelfrac )*mf;
Ha=findMixtureEnthalpy( tstd,  air, airMoleFrac )*ma;
Hr=Hf+Ha;
%% find product property
water={'H2O'};
Hp=findMixtureEnthalpy( tstd,  water, [100] )*watermolar;
%% heat value
HV=-(Hp-Hr)/mf;
hHV=141800;
%% efficiency
effl(mixT-297)=(Greact-Gprod)/(mf*HV)*100;
effh(mixT-297)=(Greact-Gprod)/(mf*hHV)*100;
effcarnot(mixT-297)=1-(273.15+25)/Tg;
effcarnot(mixT-297)=effcarnot(mixT-297)*100;
end
a=1;
figure(1)
plot(T,effl,T,effh,T,effcarnot)
hold on
xlabel('Temperature (K))');
ylabel('Efficiency %');
legend('LHV','HHV','Carnot cycle')
axis([273.15 1273.15 0 100])
Result_A2t(:,1)=effl;
Result_A2t(:,2)=effh;
Result_A2t(:,3)=effcarnot;
Result_A2(1,:)=Result_A2t(1,:);
Result_A2(2,:)=Result_A2t(76,:);
Result_A2(3,:)=Result_A2t(276,:);
Result_A2(4,:)=Result_A2t(676,:);
Result_A2(5,:)=Result_A2t(976,:);