%all in /kg assume 1kg/s air in 
%% stage set up
R=8.3145;
T2=15+273.15;
P2=101.3;
air={ 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8' };
fuel={ 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8' };
airMoleFrac=[20.74 77.30 0.92 0.03 1.01 0 0 0];
fuelMoleFrac=[1 1.8 0 1 0 90.7 3.6 1.9 ];
h2=findMixtureEnthalpy(T2,  air, airMoleFrac );
s2=findMixtureEntropy(T2, P2, air, airMoleFrac );
aircpCoeff=findmixturecpcoeff( air , airMoleFrac );
fuelcpCoeff=findmixturecpcoeff( fuel , fuelMoleFrac );
airmolarMass=findmixturemolarmass( air, airMoleFrac );
fuelmolarMass=findmixturemolarmass( fuel, fuelMoleFrac );
%% stage23
P23=P2*4;
[ compressWork223, T23 ] = gasCompressor( aircpCoeff, airmolarMass, T2, P2, P23, 90 );
s23=findMixtureEntropy(T23, P23, air, airMoleFrac );
h23=findMixtureEnthalpy(T23,  air, airMoleFrac );
%% stage 25
P25=P23*0.94;
T25=288.15+20;
s25=findMixtureEntropy(T25, P25, air, airMoleFrac );
h25=findMixtureEnthalpy(T25,  air, airMoleFrac );
%% stage3 before combustion
%----------air--------------------
P3=P2*42;
[ compressWork253, T3a ] = gasCompressor( aircpCoeff, airmolarMass, T25, P25, P3, 90);
s3a=findMixtureEntropy(T3a, P3, air, airMoleFrac );
h3a=findMixtureEnthalpy(T3a,  air, airMoleFrac );
T3=T3a;
%--------------fuel--------------
%T3f=findFinalTempFromEntropyDiff( fuelcpCoeff, fuelmolarMass, T2, P2, 2*P3, 0 );
[ compressWorkf, T3f ] = gasturbine(fuelcpCoeff, fuelmolarMass, T2, P2, 2*P3, 100 );
s3f=findMixtureEntropy(T3f, 2*P3, fuel, fuelMoleFrac );
h3f=findMixtureEnthalpy(T3f,  fuel, fuelMoleFrac );
%---------------------find AF -----------------------
AFT=1380+273.15;
AF=findAirFuelRatio( fuel, fuelMoleFrac, T3f, air, airMoleFrac,T3a, AFT );
fuelleft=fuelMoleFrac;
fuelleft(1,6)=0;fuelleft(1,7)=0;fuelleft(1,8)=0;
molarfuelleft=findmixturemolarmass(fuel,fuelleft);
AFa=AF/(1-molarfuelleft/fuelmolarMass);
%--------------------------------------------end find AF-- start find moles of fuel and air----------------
nfuel=(1/AF)/fuelmolarMass;
nair=1/airmolarMass;
%------------------mixture-------------------
P3m=P3;
%T3 not known, but i don't think it necessary to get T3 known, I have h3m
%aleardy.
h3=(h3a/1+h3f/AF)*(1+1/AF);
ya=nair/(nair+nfuel);yf=nfuel/(nair+nfuel);
mixturemolarMass=ya*airmolarMass+yf*fuelmolarMass;
sgen=-R*(ya*log(ya)+yf*log(yf));% in kmol I have to do unit change.
s3=s3f/AF+s3a/1+sgen/mixturemolarMass;
%% stage 41 after combustion 
avgn=(1*fuelMoleFrac(6)+2*fuelMoleFrac(7)+3*fuelMoleFrac(8))/100;
avgm=(4*fuelMoleFrac(6)+6*fuelMoleFrac(7)+8*fuelMoleFrac(8))/100;
[ ~, prod, prodn ] =findCnHmleanCombustion( avgn, avgm, air, airMoleFrac, AFa );
prodn=prodn*nfuel+nfuel*fuelleft/100;   
prodfrac=prodn/sum(prodn)*100;
P41=P3*0.94;
s41=findMixtureEntropy(AFT, P41, prod, prodfrac )*(1+1/AF);
h41=findMixtureEnthalpy(AFT, prod, prodfrac)*(1+1/AF);
prodcpCoeff=findmixturecpcoeff( prod , prodfrac );
prodmolarMass=findmixturemolarmass( prod , prodfrac );
T41=AFT;
%----------------------------------------------------------stops here---
%% stage 46
%% binary method
T46=findFinalTempFromEnthalpyDiff( prodcpCoeff, prodmolarMass, T41, -compressWork253/(1+1/AF) );
% set pmax=5000, pmin=0
Ptemp(1,1)=4000;
Ptemp(1,2)=1000;
Ttemp=T41;
while abs(Ttemp-T46)>0.1
   eta=(Ptemp(1,1)+Ptemp(1,2))/2;
   [~,Ttemp]=gasturbine( prodcpCoeff, prodmolarMass, T41, P41, eta, 90);
   if Ttemp<T46
       Ptemp(1,2)=eta;
   end
   if  Ttemp>T46
           Ptemp(1,1)=eta;
   end
   if Ttemp==T46
       break
   end 
end
P46=eta;
s46=findMixtureEntropy(T46,P46, prod, prodfrac)*(1+1/AF);
h46=findMixtureEnthalpy(T46,  prod, prodfrac )*(1+1/AF);
%% stage 48
T48=findFinalTempFromEnthalpyDiff( prodcpCoeff, prodmolarMass,T46,-compressWork223/(1+1/AF));
Ptemp(1,1)=4000;
Ptemp(1,2)=0;
Ttemp=T46;
while abs(Ttemp-T48)>0.1
   eta=(Ptemp(1,1)+Ptemp(1,2))/2;
   [~,Ttemp]=gasturbine( prodcpCoeff, prodmolarMass, T41, P41, eta, 90);
   if Ttemp<T48
       Ptemp(1,2)=eta;
   end
   if  Ttemp>T48
           Ptemp(1,1)=eta;
   end
   if Ttemp==T48
       break
   end 
end
P48=eta;
s48=findMixtureEntropy(T48,P48, prod, prodfrac)*(1+1/AF);
h48=findMixtureEnthalpy(T48,  prod, prodfrac )*(1+1/AF);
%% stage 50
%s50=s41;
P50=101.3;
%ds=0;
%T50=findFinalTempFromEntropyDiff( cpCoeff, molarMass, T41, P41, P50, ds );
[ compressWork4850, T50 ] = gasturbine(  prodcpCoeff, prodmolarMass, T48, P48, P50, 90 );
compressWork4850=compressWork4850*(1+1/AF);
s50=findMixtureEntropy(T50,P50, prod, prodfrac)*(1+1/AF);
h50=findMixtureEnthalpy(T50,  prod, prodfrac )*(1+1/AF);
%% end of stage condition
hfr=findMixtureEnthalpy(298.15,air,airMoleFrac)*1+findMixtureEnthalpy(298.15,fuel,fuelMoleFrac)/AF;
hfp=findMixtureEnthalpy(298.15,prod,prodfrac)*(1+1/AF);
dq=h48-h50;
Efficiency=(dq-compressWorkf/AF)/(hfr-hfp);
Heatrate=1/Efficiency*3600;
spcw=dq-compressWorkf/AF;
fprintf('For Air Standard Assumption:\nThermal efficiency= %f %%\n',Efficiency*100)
fprintf('Heat Rate= %f (kJ/kWh)\n',Heatrate)
fprintf('Specific Work= %f (kW/(kg/s))\n',spcw)
fprintf('Turbine exhaust temperature=%f (¡£C)\n',T50-273.15)
%% plot 
open('vm4332b7fig1.fig');
open('vm4332b7fig2.fig');
open('vm4332b7fig3.fig');
figure(3)
plot([s2,s23,s25,s3a,s3,s41,s46,s48,s50,s2],[h2,h23,h25,h3a,h3,h41,h46,h48,h50,h2],'--');
v2=R*T2/(airmolarMass*P2);v23=R*T23/(airmolarMass*P23);v25=R*T25/(airmolarMass*P25);v3=R*T3/(airmolarMass*P3);v3_=R*T3/(mixturemolarMass*P3);
v41=R*T41/(prodmolarMass*P41);v46=R*T46/(prodmolarMass*P46);v48=R*T48/(prodmolarMass*P48);v50=R*T50/(prodmolarMass*P50);
title('h-s Diagram for LMS100');
xlabel('Entropy( KJ/( K*Kmol) )')
ylabel('Enthalpy( KJ/( K*Kmol )')
text(s2,h2,'2');text(s23,h23,'23');text(s25,h25,'25');text(s3a,h3a,'3-');text(s3,h3,'3');text(s41,h41,'41');text(s46,h46,'46');text(s48,h48,'48');text(s50,h50,'50');
figure(1)
plot([v2,v23,v25,v3,v3_,v41,v46,v48,v50,v2],[P2,P23,P25,P3,P3,P41,P46,P48,P50,P2],'--');
title('p-v Diagram for LMS100');
ylabel('Pressure ( Bar )')
xlabel('Specific Volume ( m^3/kg )')
text(v2,P2,'2');text(v23,P23,'23');text(v25,P25,'25');text(v3,P3,'3-');text(v3_,P3,'3');text(v41,P41,'41');text(v46,P46,'46');text(v48,P48,'48');text(v50,P50,'50');

figure(2)
plot([s2,s23,s25,s3a,s3,s41,s46,s48,s50,s2],[T2,T23,T25,T3,T3,T41,T46,T48,T50,T2],'--');
title('p-v Diagram for LMS100');
xlabel('Entropy( KJ/(K*Kmol) )');
ylabel('Temperature( K )');
text(s2,T2,'2');text(s23,T23,'23');text(s25,T25,'25');text(s3a,T3,'3-');text(s3,T3,'3');text(s41,T41,'41');text(s46,T46,'46');text(s48,T48,'48');text(s50,T50,'50');

Thermal_eff=Efficiency;
heat_rate=Heatrate;
specific_work=spcw;
turbine_ext_T=T50-273.15;
Result_B7 = [ Thermal_eff, heat_rate, specific_work, turbine_ext_T ];
%2)polt prepartion--------------------------------------------------
%{
%% ts diagram
figure(1)
tss1=plot([s2,s23],[T2,T23],'r');
hold on 
%2325
T2325=linspace(T23,T25,10);
dskmol2325temp=zeros(size(T2325));
for i=1:10
    [ dskg2325, dskmol2325temp(i) ] = findEntropyDiff( cpCoeff, molarMass, T23, P23, T2325(i), P25 );
end
dskmol2325temp=s23+dskmol2325temp;
plot(dskmol2325temp,T2325,'r');
%ts 253
plot([s25,s3],[T25,T3],'r')
%ts341
T341=linspace(T3,T41,10);
dskmol341temp=zeros(size(T341));
for i=1:10
    [ dskg341, dskmol341temp(i) ] = findEntropyDiff( cpCoeff, molarMass, T3, P3, T341(i), P3 );
end
dskmol341temp=s3+dskmol341temp;
plot(dskmol341temp,T341,'r')
%ts 4150
plot([s41,s50],[T41,T50],'r')
%ts 502
T502=linspace(T50,T2,10);
dskmol502temp=zeros(size(T502));
for i=1:10
    [ dskg502, dskmol502temp(i) ] = findEntropyDiff( cpCoeff, molarMass, T50, P50, T502(i), P50 );
end
dskmol502temp=s50+dskmol502temp;
plot(dskmol502temp,T502,'r')
%label 
title('t-s Diagram for LMS100');
text(s2,T2,'2');text(s23,T23,'23');text(s25,T25,'25');text(s3,T3,'3');text(s41,T41,'41');text(s50,T50,'50')
xlabel('Entropy( KJ/(K*Kmol) )')
ylabel('Temperature( K )')
legend(tss1,'air-standard assumption')
%% pv diagram
figure(2)
%pv 2-23
%v2=1/1.293;
P223=linspace(P2,P23,10);
v223=zeros(size(P223));
T223=zeros(size(P223));
for i=1:10
    T223(i)=findFinalTempFromEntropyDiff( cpCoeff, molarMass, T2, P2, P223(i), 0 );
    v223(i)=(R/molarMass)*T223(i)/P223(i);
end
pvs1=semilogx(v223,P223,'r');
hold on 
v23=v223(10);
v2=v223(1);
%pv 23-25
v25=T25/T23*P23/P25*v23;
semilogx([v23,v25],[P23,P25],'r')
%pv 25-3
P253=linspace(P25,P3,10);
v253=zeros(size(P253));
T253=zeros(size(P223));
for i=1:10
    T253(i)=findFinalTempFromEntropyDiff( cpCoeff, molarMass, T25, P25, P253(i), 0 );
    v253(i)=(R/molarMass)*T253(i)/P253(i);
end
semilogx(v253,P253,'r');
v3=v253(10);
%pv 3-41
v41=T41/T3*P3/P41*v3;
semilogx([v3,v41],[P3,P41],'r')
%pv 41-50
P4150=linspace(P41,P50,10);
v4150=zeros(size(P4150));
T4150=zeros(size(P4150));
for i=1:10
    T4150(i)=findFinalTempFromEntropyDiff( cpCoeff, molarMass, T41, P41, P4150(i), 0 );
    v4150(i)=(R/molarMass)*T4150(i)/P4150(i);
end
semilogx(v4150,P4150,'r');
v50=v4150(10);
% pv 502
semilogx([v50,v2],[P50,P2],'r')
text(v2,P2,'2');text(v23,P23,'23');text(v3,P3,'3');text(v41,P41,'41');text(v50,P50,'50');
title('p-v Diagram for LMS100');
ylabel('Pressure ( Bar )')
xlabel('Specific Volume ( m^3/kg )')
legend(pvs1,'air-standard assumption')
%% hs diagram
%hs 2-23
[ dhkg223, dhkmol223 ] = findEnthalpyDiff( cpCoeff, molarMass, T2, T23 );
h23=h2+dhkmol223;
figure(3)
hss1=plot([s2,s23],[h2,h23],'r');
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
plot(dskmol2325,dhkmol2325,'r')
%hs 25-3
[ dhkg253, dhkmol253 ] = findEnthalpyDiff( cpCoeff, molarMass, T25, T3 );
h3=h25+dhkmol253;
plot([s25,s3],[h25,h3],'r')
%hs 3-41
T341;
dhkmol341=zeros(size(T341));
dskmol341=zeros(size(T341));
for i=1:10
    [ dhkg341, dhkmol341(i) ] = findEnthalpyDiff( cpCoeff, molarMass, T3, T341(i) );
     [ dskg341, dskmol341(i) ] = findEntropyDiff( cpCoeff, molarMass, T3, P3, T341(i), P3 );
end
dhkmol341=dhkmol341+h3;
dskmol341=dskmol341+s3;
s41=dskmol341(10);
h41=dhkmol341(10);
plot(dskmol341,dhkmol341,'r')
% hs 41-50
[ dhkg4150, dhkmol4150 ] = findEnthalpyDiff( cpCoeff, molarMass, T41, T50 );
h50=h41+dhkmol4150;
plot([s41,s50],[h41,h50],'r')
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
plot(dskmol502,dhkmol502,'r')
text(s2,h2,'2');text(s23,h23,'23');text(s25,h25,'25');text(s3,h3,'3');text(s41,h41,'41');text(s50,h50,'50');
title('h-s Diagram for LMS100');
xlabel('Entropy( KJ/( K*Kmol) )')
ylabel('Enthalpy( KJ/( K*Kmol )')
legend(hss1,'air-standard assumption')
%}