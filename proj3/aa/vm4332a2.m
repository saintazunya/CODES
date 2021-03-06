close all
clear all
%% stage 
s2=1000;
h2=100;
cpCoeff=Find_Ideal_Gas_Properties( 'air', 'Cp_coeff' );
molarMass=Find_Ideal_Gas_Properties( 'air', 'Molar_mass' );
T2=15+273.15;
P2=101.3;
%stage23
P23=P2*4;
s23=s2;
ds=0;
T23=findFinalTempFromEntropyDiff( cpCoeff, molarMass, T2, P2, P23, ds );
%stage 25
P25=P23;
T25=T2;
[ dskg2325, dskmol2325 ] = findEntropyDiff( cpCoeff, molarMass, T23, P23, T25, P25 );
s25=s23+dskmol2325;
%stage3
P3=P2*42;
ds=0;
s3=s25;
T3=findFinalTempFromEntropyDiff( cpCoeff, molarMass, T25, P25, P3, ds );
%stage 41
T41=1380+273.16;
P41=P3;
[ dskg341, dskmol341 ] = findEntropyDiff( cpCoeff, molarMass, T3, P3, T41, P41 );
s41=s3+dskmol341;
%stage 50
s50=s41;
P50=101.3;
ds=0;
T50=findFinalTempFromEntropyDiff( cpCoeff, molarMass, T41, P41, P50, ds );
%end of stage condition
fliplr(cpCoeff);
syms t
cp=poly2sym(fliplr(cpCoeff),t);
Qcomb=int(cp,T3,T41);
Qic=int(cp,T25,T23);
Qexh=int(cp,T2,T50);
Efficiency=double(1-(Qic+Qexh)/(Qcomb));
Heatrate=double(Qcomb/(Qcomb-Qic-Qexh))*3600;
spcw=double(Qcomb-Qic-Qexh)/molarMass;
fprintf('Thermal efficiency= %f \n',Efficiency)
fprintf('Heat Rate= %f (kJ/kWh)\n',Heatrate)
fprintf('Specific Work= %f\n (kW/(kg/s))',spcw)
fprintf('Turbine exhaust temperature=%f (kW/(kg/s))\n',T50)
%2)polt prepartion
%% ts diagram
figure(1)
plot([s2,s23],[T2,T23])
hold on 
%2325
T2325=linspace(T23,T25,10);
dskmol2325temp=zeros(size(T2325));
for i=1:10
    [ dskg2325, dskmol2325temp(i) ] = findEntropyDiff( cpCoeff, molarMass, T23, P23, T2325(i), P25 );
end
dskmol2325temp=s23+dskmol2325temp;
plot(dskmol2325temp,T2325);
%ts 253
plot([s25,s3],[T25,T3])
%ts341
T341=linspace(T3,T41,10);
dskmol341temp=zeros(size(T341));
for i=1:10
    [ dskg341, dskmol341temp(i) ] = findEntropyDiff( cpCoeff, molarMass, T3, P3, T341(i), P3 );
end
dskmol341temp=s3+dskmol341temp;
plot(dskmol341temp,T341)
%ts 4150
plot([s41,s50],[T41,T50])
%ts 502
T502=linspace(T50,T2,10);
dskmol502temp=zeros(size(T502));
for i=1:10
    [ dskg502, dskmol502temp(i) ] = findEntropyDiff( cpCoeff, molarMass, T50, P50, T502(i), P50 );
end
dskmol502temp=s50+dskmol502temp;
plot(dskmol502temp,T502)
%label 
title('t-s Diagram for LMS100');
text(s2,T2,'2');text(s23,T23,'23');text(s25,T25,'25');text(s3,T3,'3');text(s41,T41,'41');text(s50,T50,'50')
xlabel('Entropy( KJ/(K*Kmol) )')
ylabel('Temperature( K )')
%% pv diagram
figure(2)
%pv 2-23
v2=1/1.293;
P223=linspace(P2,P23,10);
v223=zeros(size(P223));
for i=1:10
    v223(i)=v2*(P2/P223(i))^(1/1.4);
end
semilogx(v223,P223);
hold on 
v23=v223(10);
%pv 23-25
v25=T25/T23*P23/P25*v23;
semilogx([v23,v25],[P23,P25])
%pv 25-3
P253=linspace(P25,P3,10);
v253=zeros(size(P253));
for i=1:10
    v253(i)=v25*(P25/P253(i))^(1/1.4);
end
semilogx(v253,P253);
v3=v253(10);
%pv 3-41
v41=T41/T3*P3/P41*v3;
semilogx([v3,v41],[P3,P41])
%pv 41-50
P4150=linspace(P41,P50,10);
v4150=zeros(size(P4150));
for i=1:10
    v4150(i)=v41*(P41/P4150(i))^(1/1.4);
end
semilogx(v4150,P4150);
v50=v4150(10);
% pv 502
semilogx([v50,v2],[P50,P2])
text(v2,P2,'2');text(v23,P23,'23');text(v3,P3,'3');text(v41,P41,'41');text(v50,P50,'50');
title('p-v Diagram for LMS100');
ylabel('Pressure ( Bar )')
xlabel('Specific Volume ( m^3/kg )')
%% hs diagram
%hs 2-23
[ dhkg223, dhkmol223 ] = findEnthalpyDiff( cpCoeff, molarMass, T2, T23 );
h23=h2+dhkmol223;
figure(3)
plot([s2,s23],[h2,h23])
hold on
%hs 23-25
T2325;
dhkmol2325=zeros(size(T2325));
dskmol2325=zeros(size(T2325));
for i=1:10
    [ dhkg2325, dhkmol2325(i) ] = findEnthalpyDiff( cpCoeff, molarMass, T23, T2325(i) );
     [ dskg2325, dskmol2325(i) ] = findEntropyDiff( cpCoeff, molarMass, T23, P23, T2325(i), P23 );
end
dhkmol2325=dhkmol2325+h23;
dskmol2325=dskmol2325+s23;
s25=dskmol2325(10);
h25=dhkmol2325(10);
plot(dskmol2325,dhkmol2325)
%hs 25-3
[ dhkg253, dhkmol253 ] = findEnthalpyDiff( cpCoeff, molarMass, T25, T3 );
h3=h25+dhkmol253;
plot([s25,s3],[h25,h3])
%hs 3-41
T341;
dhkmol341=zeros(size(T341));
dskmol2325=zeros(size(T341));
for i=1:10
    [ dhkg341, dhkmol341(i) ] = findEnthalpyDiff( cpCoeff, molarMass, T3, T341(i) );
     [ dskg341, dskmol341(i) ] = findEntropyDiff( cpCoeff, molarMass, T3, P3, T341(i), P3 );
end
dhkmol341=dhkmol341+h3;
dskmol341=dskmol341+s3;
s41=dskmol341(10);
h41=dhkmol341(10);
plot(dskmol341,dhkmol341)
% hs 41-50
[ dhkg4150, dhkmol4150 ] = findEnthalpyDiff( cpCoeff, molarMass, T41, T50 );
h50=h41+dhkmol4150;
plot([s41,s50],[h41,h50])
%hs 50-2
T502;
dhkmol502=zeros(size(T502));
dskmol502=zeros(size(T502));
for i=1:10
    [ dhkg502, dhkmol502(i) ] = findEnthalpyDiff( cpCoeff, molarMass, T50, T502(i) );
     [ dskg502, dskmol502(i) ] = findEntropyDiff( cpCoeff, molarMass, T50, P50, T502(i), P2 );
end
dhkmol502=dhkmol502+h50;
dskmol502=dskmol502+s50;
s2=dskmol502(10);
h2=dhkmol502(10);
plot(dskmol502,dhkmol502)
text(s2,h2,'2');text(s23,h23,'23');text(s25,h25,'25');text(s3,h3,'3');text(s41,h41,'41');text(s50,h50,'50');
title('h-s Diagram for LMS100');
xlabel('Entropy( KJ/( K*Kmol) )')
ylabel('Enthalpy( KJ/( K*Kmol )')