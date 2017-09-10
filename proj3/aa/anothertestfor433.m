clear variables
clear global
close all
clc
%{
%%
%part A2
run( 'Ideal_Gas_Properties.m' )
[ Given.cpCoeff ] = Find_Ideal_Gas_Properties( 'air', 'Cp_coeff' );
[ Given.molarMass ] = Find_Ideal_Gas_Properties( 'air', 'Molar_mass' );

syms Cp T
Cp =  Given.cpCoeff(1) +  Given.cpCoeff(2).*T +  Given.cpCoeff(3).*T.^2 +  Given.cpCoeff(4).*T.^3;

K = 273.15;%C to K
T2 = 15 + K;
P2 = 1.013*100;
s2 = 0;
h2 = 0;


s23 = s2;
P23 = P2*4;
[T23] = findFinalTempFromEntropyDiff( Given.cpCoeff, Given.molarMass, T2, P2, P23, s23-s2 );

P25 = P23;
T25 = T2;
[ dskg23to25, dskmol23to25 ] = findEntropyDiff( Given.cpCoeff, Given.molarMass, T23, P23, T25, P25 );
s25 = s23 + dskg23to25;

P3 = P2*42;
s3 = s25;
[T3] = findFinalTempFromEntropyDiff( Given.cpCoeff, Given.molarMass, T25, P25, P3, s3-s25 );

P41 = P3;
T41 = 1380 + K;
[ dskg3to41, dskmol3to41 ] = findEntropyDiff( Given.cpCoeff, Given.molarMass, T3, P3, T41, P41 );
s41 = s3 + dskg3to41;

P50 = P2;
s50 = s41;
[T50] = findFinalTempFromEntropyDiff( Given.cpCoeff, Given.molarMass, T41, P41, P50, s50-s41 );

Qcomb = int(Cp,T,T3,T41);
Qic = int(Cp,T,T25,T23);
Qexh = int(Cp,T,T2,T50);

ThermalEfficiency = double((1 - (Qic + Qexh)/Qcomb)*100);
HeatRate = 3.6*100000/ThermalEfficiency;
SpecificWork = double(Qcomb - Qic - Qexh)/Given.molarMass;
TurbineExhaustTemperature = double(T50) - K;

%%
%P-v
v2 = 0.77;
v23 = P2/P23*T23/T2*v2;
v25 = P23/P25*T25/T23*v23;
v3 = P25/P3*T3/T25*v25;
v41 = P3/P41*T41/T3*v3;
v50 = P41/P50*T50/T41*v41;

P2to23 = linspace(P2,P23,15);
P25to3 = linspace(P25,P3,15);
P41to50 = linspace(P41,P50,15);
v2to23 = zeros(size(P2to23));
v25to3 = v2to23;
v41to50 = v2to23;
for i = 1:15
    [ T2to23 ] = findFinalTempFromEntropyDiff( Given.cpCoeff, Given.molarMass, T2, P2, P2to23(i), 0);
    v2to23(i) = P2/P2to23(i)*T2to23/T2*v2;
    [ T25to3 ] = findFinalTempFromEntropyDiff( Given.cpCoeff, Given.molarMass, T25, P25, P25to3(i), 0);
    v25to3(i) = P25/P25to3(i)*T25to3/T25*v25;
     [ T41to50 ] = findFinalTempFromEntropyDiff( Given.cpCoeff, Given.molarMass, T41, P41, P41to50(i), 0);
    v41to50(i) = P41/P41to50(i)*T41to50/T41*v41;
end

figure(1);
apv = semilogx(v2to23,P2to23,'-r');
hold on;
semilogx(v25to3,P25to3,'-r');
semilogx(v41to50,P41to50,'-r');
semilogx([v2to23(15),v25to3(1)],[P2to23(15),P25to3(1)],'-r');
semilogx([v25to3(15),v41to50(1)],[P25to3(15),P41to50(1)],'-r');
semilogx([v41to50(15),v2to23(1)],[P41to50(15),P2to23(1)],'-r');
title('P-v Diagram for Air-Standard LMS100');
xlabel('v(m^3/kg)');
ylabel('P(kPa)');
text(v2to23(1),P2to23(1),'2');
text(v2to23(15),P2to23(15),'23');
text(v25to3(1),P25to3(1),'25');
text(v25to3(15),P25to3(15),'3');
text(v41to50(1),P41to50(1),'41');
text(v41to50(15),P41to50(15),'50');

%%
%T-s
T23to25 = linspace(T23,T25,15);
T3to41 = linspace(T3,T41,15);
T50to2 = linspace(T50,T2,15);
s23to25 = v2to23;
s3to41 = v2to23;
s50to2 = v2to23;
for i=1:15
     [ s23to25(i), a] = findEntropyDiff( Given.cpCoeff, Given.molarMass, T23, P23, T23to25(i), P23);
     s23to25(i) = s23to25(i) + s23;
     [ s3to41(i), a] = findEntropyDiff( Given.cpCoeff, Given.molarMass, T3, P3, T3to41(i), P3);
     s3to41(i) = s3to41(i) + s3;
     [ s50to2(i), a] = findEntropyDiff( Given.cpCoeff, Given.molarMass, T50, P50, T50to2(i), P50);
     s50to2(i) = s50to2(i) + s50;
end

figure(2);
ats = plot(s23to25,T23to25,'-r');
hold on;
plot(s3to41,T3to41,'-r');
plot(s50to2,T50to2,'-r');
plot([s50to2(15),s23to25(1)],[T50to2(15),T23to25(1)],'-r');
plot([s23to25(15),s3to41(1)],[T23to25(15),T3to41(1)],'-r');
plot([s3to41(15),s50to2(1)],[T3to41(15),T50to2(1)],'-r');
title('T-s Diagram for Air-Standard LMS100');
xlabel('s(kJ/kg*K) where s2 = 0');
ylabel('T(K)');
text(s50to2(15),T50to2(15),'2');
text(s50to2(1),T50to2(1),'50');
text(s23to25(15),T23to25(15),'25');
text(s23to25(1),T23to25(1),'23');
text(s3to41(15),T3to41(15),'41');
text(s3to41(1),T3to41(1),'3');


%%
%h-s
h23to25 = v2to23;
h3to41 = v2to23;
h50to2 = v2to23;

for i=1:15
    [ h23to25(i), a ] = findEnthalpyDiff( Given.cpCoeff, Given.molarMass, T2, T23to25(i));
    h23to25(i) = h23to25(i) + h2;
    [ h3to41(i), a ] = findEnthalpyDiff( Given.cpCoeff, Given.molarMass, T2, T3to41(i));
    h3to41(i) = h3to41(i) + h2;
    [ h50to2(i), a ] = findEnthalpyDiff( Given.cpCoeff, Given.molarMass, T2, T50to2(i));
    h50to2(i) = h50to2(i) + h2;
end

figure(3);
ahs = plot(s23to25,h23to25,'-r');
hold on;
ash = plot(s3to41,h3to41,'-r');
plot(s50to2,h50to2,'-r');
plot([s50to2(15),s23to25(1)],[h50to2(15),h23to25(1)],'-r');
plot([s23to25(15),s3to41(1)],[h23to25(15),h3to41(1)],'-r');
plot([s3to41(15),s50to2(1)],[h3to41(15),h50to2(1)],'-r');
title('h-s Diagram for Air-Standard LMS100');
xlabel('s(kJ/kg*K) where s2 = 0');
ylabel('h(kJ/kg) where h2 = 0');
text(s50to2(15),h50to2(15),'2');
text(s50to2(1),h50to2(1),'50');
text(s23to25(15),h23to25(15),'25');
text(s23to25(1),h23to25(1),'23');
text(s3to41(15),h3to41(15),'41');
text(s3to41(1),h3to41(1),'3');

%}
K=273.15;
%%
%%
%partA3
global Ru;
[ Given.cpCoeff ] = Find_Ideal_Gas_Properties( 'air', 'Cp_coeff' );
[ Given.molarMass ] = Find_Ideal_Gas_Properties( 'air', 'Molar_mass' );

syms Cp_2
Cp_2 =  Given.cpCoeff(1) +  Given.cpCoeff(2).*300 +  Given.cpCoeff(3).*300.^2 +  Given.cpCoeff(4).*300.^3;

T2_2 = 15 + K;
P2_2 = 1.013*100;
s2_2 = 0;
h2_2 = 0;

P23_2 = P2_2*4;
s23_2 = s2_2;
T23_2 = T2_2*(P23_2/P2_2)^(Ru/Cp_2);

P25_2 = P23_2;
T25_2 = T2_2;
dskg23to25_2 = (Cp_2*log(T25_2/T23_2)-Ru*log(P25_2/P23_2))/Given.molarMass;
s25_2 = s23_2+dskg23to25_2;

P3_2 = P2_2*42;
s3_2 = s25_2;
T3_2 = T2_2*(P3_2/P25_2)^(Ru/Cp_2);

T41_2 = 1380 + K;
P41_2 = P3_2;
dskg3to41_2 = (Cp_2*log(T41_2/T3_2) - Ru*log(P41_2/P3_2))/Given.molarMass;
s41_2 = s3_2 + dskg3to41_2;

s50_2 = s41_2;
P50_2 = P2_2;
T50_2 = T41_2*(P50_2/P41_2)^(Ru/Cp_2);

Qcomb_2 = Cp_2*(T41_2 - T3_2);
Qic_2 = Cp_2*(T23_2 - T25_2);
Qexh_2 = Cp_2*(T50_2 - T2_2);

ThermalEfficiency_2 = double((1 - (Qic_2 + Qexh_2)/Qcomb_2)*100);
HeatRate_2 = 3.6*100000/ThermalEfficiency_2;
SpecificWork_2 = double(Qcomb_2 - Qic_2 - Qexh_2)/Given.molarMass;
TurbineExhaustTemperature_2 = double(T50_2) - K;


%% pv diagram
figure(1);

v2_2 = (T2_2*Ru/Given.molarMass)/(P2_2);
P2to23_2 = linspace(P2_2,P23_2,10);
v2to23_2 = zeros(size(P2to23_2));
for i = 1:10
    v2to23_2(i) = v2_2*(P2_2/P2to23_2(i))^(1/1.4);
end
bpv = semilogx(v2to23_2,P2to23_2,'--b');
hold on;
v23_2 = v2to23_2(10);

v25_2 = T25_2/T23_2*P23_2/P25_2*v23_2;
semilogx([v23_2,v25_2],[P23_2,P25_2],'--b')

P25to3_2 = linspace(P25_2,P3_2,10);
v25to3_2 = zeros(size(P25to3_2));
for i = 1:10
    v25to3_2(i) = v25_2*(P25_2/P25to3_2(i))^(1/1.4);
end
semilogx(v25to3_2,P25to3_2,'--b');
v3_2 = v25to3_2(10);

v41_2 = T41_2/T3_2*P3_2/P41_2*v3_2;
semilogx([v3_2,v41_2],[P3_2,P41_2],'--b')

P41to50_2 = linspace(P41_2,P50_2,10);
v41to50_2 = zeros(size(P41to50_2));
for i = 1:10
    v41to50_2(i) = v41_2*(P41_2/P41to50_2(i))^(1/1.4);
end
semilogx(v41to50_2,P41to50_2,'--b');
v50_2 = v41to50_2(10);

semilogx([v50_2,v2_2],[P50_2,P2_2],'--b')
text(v2_2,P2_2,'2');
text(v23_2,P23_2,'23');
text(v3_2,P3_2,'3');
text(v41_2,P41_2,'41');
text(v50_2,P50_2,'50');

%legend([apv,bpv],'x represents variable-specific-heat process','x# represents constant-specific-heat process');

%%
figure(2);
bts = plot([s2_2,s23_2],[T2_2,T23_2],'--b');
hold on 

T23to25_2 = linspace(T23_2,T25_2,10);
dskg23to25temp_2 = zeros(size(T23to25_2));
for i = 1:10
    dskg23to25temp_2(i) = (Cp_2*log(T23to25_2(i)/T23_2)-Ru*log(P25_2/P23_2))/Given.molarMass;
end
dskg23to25temp_2 = s23_2+dskg23to25temp_2;
plot(dskg23to25temp_2,T23to25_2,'--b');
plot([s25_2,s3_2],[T25_2,T3_2],'--b')
T3to41_2 = linspace(T3_2,T41_2,10);
dskg3to41temp_2 = zeros(size(T3to41_2));
for i = 1:10
   dskg3to41temp_2(i) =  (Cp_2*log(T3to41_2(i)/T3_2)-Ru*log(P41_2/P3_2))/Given.molarMass;
end
dskg3to41temp_2 = s3_2+dskg3to41temp_2;
plot(dskg3to41temp_2,T3to41_2,'--b')
plot([s41_2,s50_2],[T41_2,T50_2],'--b')
T50to2_2 = linspace(T50_2,T2_2,10);
dskg50to2temp_2 = zeros(size(T50to2_2));
for i = 1:10
   dskg50to2temp_2(i) = (Cp_2*log(T50to2_2(i)/T50_2)-Ru*log(P2_2/P50_2))/Given.molarMass;
end
dskg50to2temp_2 = s50_2+dskg50to2temp_2;
plot(dskg50to2temp_2,T50to2_2,'--b')

text(s2_2,T2_2,'2');
text(s23_2,T23_2,'23');
text(s25_2,T25_2,'25');
text(s3_2,T3_2,'3');
text(s41_2,T41_2,'41');
text(s50_2,T50_2,'50')

%legend([ats,bts],'x represents variable-specific-heat process','x# represents constant-specific-heat process');

%% hs diagram
figure(3);

dhkg223_2  =(Cp_2*(T23_2-T2_2))/Given.molarMass;
h23_2 = h2_2+dhkg223_2;

bsh = plot([s2_2,s23_2],[h2_2,h23_2],'--b');
hold on

T23to25_2;
dhkg23tp25_2 = zeros(size(T23to25_2));
dskg23to25_2 = zeros(size(T23to25_2));
for i = 1:10
     dhkg23tp25_2(i) =(Cp_2*(T23to25_2(i)-T23_2))/Given.molarMass;
     dskg23to25_2(i) = (Cp_2*log(T23to25_2(i)/T23_2))/Given.molarMass;
end
dhkg23tp25_2 = dhkg23tp25_2 + h23_2;
dskg23to25_2 = dskg23to25_2 + s23_2;
s25_2 = dskg23to25_2(10);
h25_2 = dhkg23tp25_2(10);
plot(dskg23to25_2,dhkg23tp25_2,'--b')

dhkg25to3_2 = (Cp_2*(T3_2-T25_2))/Given.molarMass;
h3_2 = h25_2 + dhkg25to3_2;
plot([s25_2,s3_2],[h25_2,h3_2],'--b')

T3to41_2;
dhkg3to41_2 = zeros(size(T3to41_2));
dskg23to25_2 = zeros(size(T3to41_2));
for i=1:10
     dhkg3to41_2(i) = (Cp_2*(T3to41_2(i)-T3_2))/Given.molarMass;
     dskg3to41_2(i) = (Cp_2*log(T3to41_2(i)/T3_2))/Given.molarMass;
end
dhkg3to41_2 = dhkg3to41_2+h3_2;
dskg3to41_2 = dskg3to41_2+s3_2;
s41_2 = dskg3to41_2(10);
h41_2 = dhkg3to41_2(10);
plot(dskg3to41_2,dhkg3to41_2,'--b')

dhkg41to50_2 = (Cp_2*(T50_2-T41_2))/Given.molarMass;
h50_2 = h41_2+dhkg41to50_2;
plot([s41_2,s50_2],[h41_2,h50_2],'--b')

T50to2_2;
dhkg50to2_2 = zeros(size(T50to2_2));
dskg50to2_2 = zeros(size(T50to2_2));
for i = 1:10
     dhkg50to2_2(i) = (Cp_2*(T50to2_2(i)-T50_2))/Given.molarMass;
     dskg50to2_2(i) = (Cp_2*log(T50to2_2(i)/T50_2))/Given.molarMass;
end
dhkg50to2_2 = dhkg50to2_2+h50_2;
dskg50to2_2 = dskg50to2_2+s50_2;
s2_2 = dskg50to2_2(10);   
h2_2 = dhkg50to2_2(10);
plot(dskg50to2_2,dhkg50to2_2,'--b');

text(s2_2,h2_2,'2');
text(s23_2,h23_2,'23');
text(s25_2,h25_2,'25');
text(s3_2,h3_2,'3');
text(s41_2,h41_2,'41');
text(s50_2,h50_2,'50')

%legend([ash,bsh],'x represents variable-specific-heat process','x# represents constant-specific-heat process');


%%
%output
clc
%{
fprintf( '\nvariable-specific-heat working fluid/ideal-process:\n')
fprintf( '\tThermal Efficiency = %.2f %%\n', ThermalEfficiency)
fprintf( '\tHeat Rate = %.2f kJ/kWh\n', HeatRate)
fprintf( '\tSpecific Work = %.2f kW/(kg/s)\n', SpecificWork)
fprintf( '\tTurbine Exhaust Temperature = %.2f ¡æ\n', TurbineExhaustTemperature)
%}
fprintf( '\nconstant-specific-heat working fluid/ideal-process:\n')
fprintf( '\tThermal Efficiency = %.2f %%\n', ThermalEfficiency_2)
fprintf( '\tHeat Rate = %.2f kJ/kWh\n', HeatRate_2)
fprintf( '\tSpecific Work = %.2f kW/(kg/s)\n', SpecificWork_2)
fprintf( '\tTurbine Exhaust Temperature = %.2f ¡æ\n', TurbineExhaustTemperature_2)