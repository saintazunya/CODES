%figure(1)
open('vm4332b4fig1.fig');
%figure(2)
open('vm4332b4fig2.fig');
%figure(3)
open('vm4332b4fig3.fig');

%load airstandardlm100.mat
s2=0;
h2=0;
%{
%% previous plot
%% ts diagram
figure(1)
tsc1=plot([s2_c,s23_c],[T2_c,T23_c]);
hold on 
%2325
T2325_c=linspace(T23_c,T25_c,10);
dskmol2325temp_c=zeros(size(T2325_c));
for i=1:10
    dskmol2325temp_c(i) = cp_c*log(T2325_c(i)/T23_c)-R*log(P25_c/P23_c);
end
dskmol2325temp_c=s23_c+dskmol2325temp_c;
plot(dskmol2325temp_c,T2325_c);
%ts 253
plot([s25_c,s3_c],[T25_c,T3_c])
%ts341
T341_c=linspace(T3_c,T41_c,10);
dskmol341temp_c=zeros(size(T341_c));
for i=1:10
   dskmol341temp_c(i) =  cp_c*log(T341_c(i)/T3_c)-R*log(P41_c/P3_c);
end
dskmol341temp_c=s3_c+dskmol341temp_c;
plot(dskmol341temp_c,T341_c)
%ts 4150
plot([s41_c,s50_c],[T41_c,T50_c])
%ts 502
T502_c=linspace(T50_c,T2_c,10);
dskmol502temp_c=zeros(size(T502_c));
for i=1:10
   dskmol502temp_c(i) =cp_c*log(T502_c(i)/T50_c)-R*log(P2_c/P50_c);
end
dskmol502temp_c=s50_c+dskmol502temp_c;
plot(dskmol502temp_c,T502_c)
%label 
title('t-s Diagram for LMS100');
text(s2,T2,'2');text(s23,T23,'23');text(s25,T25,'25');text(s3,T3,'3');text(s41,T41,'41');text(s50,T50,'50')
xlabel('Entropy( KJ/(K*Kmol) )')
ylabel('Temperature( K )')
%% pv diagram
figure(2)
%pv 2-23
v2_c=(T2_c*R/molarMass)/(P2_c);
P223_c=linspace(P2_c,P23_c,10);
v223_c=zeros(size(P223_c));
for i=1:10
    v223_c(i)=v2_c*(P2_c/P223_c(i))^(1/1.4);
end
pvc1=semilogx(v223_c,P223_c);
hold on 
v23_c=v223_c(10);
%pv 23-25
v25_c=T25_c/T23_c*P23_c/P25_c*v23_c;
semilogx([v23_c,v25_c],[P23_c,P25_c])
%pv 25-3
P253_c=linspace(P25_c,P3_c,10);
v253_c=zeros(size(P253_c));
for i=1:10
    v253_c(i)=v25_c*(P25_c/P253_c(i))^(1/1.4);
end
semilogx(v253_c,P253_c);
v3_c=v253_c(10);
%pv 3-41
v41_c=T41_c/T3_c*P3_c/P41_c*v3_c;
semilogx([v3_c,v41_c],[P3_c,P41_c])
%pv 41-50
P4150_c=linspace(P41_c,P50_c,10);
v4150_c=zeros(size(P4150_c));
for i=1:10
    v4150_c(i)=v41_c*(P41_c/P4150_c(i))^(1/1.4);
end
semilogx(v4150_c,P4150_c);
v50_c=v4150_c(10);
% pv 502
semilogx([v50_c,v2_c],[P50_c,P2_c])
text(v2_c,P2_c,'2');text(v23_c,P23_c,'23');text(v3_c,P3_c,'3');text(v41_c,P41_c,'41');text(v50_c,P50_c,'50');
title('p-v Diagram for LMS100');
ylabel('Pressure ( Bar )')
xlabel('Specific Volume ( m^3/kg )')
%% hs diagram
%hs 2-23
dhkmol223_c  =cp_c*(T23_c-T2_c);
h23_c=h2_c+dhkmol223_c;
figure(3)
hsc1=plot([s2_c,s23_c],[h2_c,h23_c]);
hold on
%hs 23-25
T2325_c;
dhkmol2325_c=zeros(size(T2325_c));
dskmol2325_c=zeros(size(T2325_c));
for i=1:10
    dhkmol2325_c(i)  =cp_c*(T2325_c(i)-T23_c);
     dskmol2325_c(i) = cp_c*log(T2325_c(i)/T23_c);%isobar
end
dhkmol2325_c=dhkmol2325_c+h23_c;
dskmol2325_c=dskmol2325_c+s23_c;
s25_c=dskmol2325_c(10);
h25_c=dhkmol2325_c(10);
plot(dskmol2325_c,dhkmol2325_c)
%hs 25-3
dhkmol253_c= cp_c*(T3_c-T25_c);
h3_c=h25_c+dhkmol253_c;
plot([s25_c,s3_c],[h25_c,h3_c])
%hs 3-41
T341_c;
dhkmol341_c=zeros(size(T341_c));
dskmol2325_c=zeros(size(T341_c));
for i=1:10
    dhkmol341_c(i)  =cp_c*(T341_c(i)-T3_c);
     dskmol341_c(i) = cp_c*log(T341_c(i)/T3_c);%isobar
end
dhkmol341_c=dhkmol341_c+h3_c;
dskmol341_c=dskmol341_c+s3_c;
s41_c=dskmol341_c(10);
h41_c=dhkmol341_c(10);
plot(dskmol341_c,dhkmol341_c)
% hs 41-50
 dhkmol4150_c= cp_c*(T50_c-T41_c);
h50_c=h41_c+dhkmol4150_c;
plot([s41_c,s50_c],[h41_c,h50_c])
%hs 50-2
T502_c;
dhkmol502_c=zeros(size(T502_c));
dskmol502_c=zeros(size(T502_c));
for i=1:10
    dhkmol502_c(i)  =cp_c*(T502_c(i)-T50_c);
     dskmol502_c(i) = cp_c*log(T502_c(i)/T50_c);%isobar
end
dhkmol502_c=dhkmol502_c+h50_c;
dskmol502_c=dskmol502_c+s50_c;
s2_c=dskmol502_c(10);   
h2_c=dhkmol502_c(10);
plot(dskmol502_c,dhkmol502_c)
%}
%s ,work in unit of /kg,     others in unit of kmol
%% real systems starts here:
%% stage 
s2=0;
h2=0;
cpCoeff=Find_Ideal_Gas_Properties( 'air', 'Cp_coeff' );
molarMass=Find_Ideal_Gas_Properties( 'air', 'Molar_mass' );
R=8.3145;
T2=15+273.15;
P2=101.3;
%{
air={ 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8' };
airMoleFrac=[20.74 77.30 0.92 0.03 1.01 0 0 0];
h2=findMixtureEnthalpy(T2,  air, airMoleFrac );
s2=findMixtureEntropy(T2, P2, air, airMoleFrac );
%}
%% stage23
P23=P2*4;
%s23=s2;
%ds=0;
%T23=findFinalTempFromEntropyDiff( cpCoeff, molarMass, T2, P2, P23, ds );
[ compressWork223, T23 ] = gasCompressor( cpCoeff, molarMass, T2, P2, P23, 90 );
[ dskg223, ~ ] = findEntropyDiff( cpCoeff, molarMass, T2, P2, T23, P23 );
s23=s2+dskg223;
[ dhkg223, ~ ] = findEnthalpyDiff( cpCoeff, molarMass, T2, T23 );
h23=h2+dhkg223;
%% stage 25
P25=P23*0.94;
T25=288.15+20;
[ dskg2325, ~ ] = findEntropyDiff( cpCoeff, molarMass, T23, P23, T25, P25 );
s25=s23+dskg2325;
[ dhkg2325, ~ ] = findEnthalpyDiff( cpCoeff, molarMass, T23, T25 );
h25=h23+dhkg2325;
%% stage3
P3=P2*42;
%T3=findFinalTempFromEntropyDiff( cpCoeff, molarMass, T25, P25, P3, ds );
[ compressWork253, T3 ] = gasCompressor( cpCoeff, molarMass, T25, P25, P3, 90);
[ dskg253, ~ ] = findEntropyDiff( cpCoeff, molarMass, T25, P25, T3, P3 );
s3=s25+dskg253;
[ dhkg253, ~ ] = findEnthalpyDiff( cpCoeff, molarMass, T25, T3 );
h3=h25+dhkg253;
%% stage 41
T41=1380+273.15;
P41=P3*0.94;
[ dskg341, ~ ] = findEntropyDiff( cpCoeff, molarMass, T3, P3, T41, P41 );
s41=s3+dskg341;
[ dhkg341, ~ ] = findEnthalpyDiff( cpCoeff, molarMass, T3, T41 );
h41=h3+dhkg341;
%----------------------------------------------------------stops here---
%% stage 46
T46=findFinalTempFromEnthalpyDiff( cpCoeff, molarMass, T41, -compressWork253 );
Ptemp(1,1)=4000;
Ptemp(1,2)=1000;
Ttemp=T41;
while abs(Ttemp-T46)>1
   eta=(Ptemp(1,1)+Ptemp(1,2))/2;
   [~,Ttemp]=gasturbine(cpCoeff, molarMass, T41, P41, eta, 90);
   if Ttemp<T46
       Ptemp(1,2)=eta;
   end
   if  Ttemp>T46
           Ptemp(1,1)=eta;
   end
   if Ttemp==T46
       break
   end 
   a=1;
end
P46=eta;
[ dskg4146, ~ ] = findEntropyDiff( cpCoeff, molarMass, T41, P41, T46, P46 );
s46=s41+dskg4146;
[ dhkg4146, ~ ] = findEnthalpyDiff( cpCoeff, molarMass, T41, T46 );
h46=h41+dhkg4146;
%% stage 48
T48=findFinalTempFromEnthalpyDiff(cpCoeff,molarMass,T46,-compressWork223);
%f48=@(p)gasturbine(cpCoeff,molarMass,T46,P46,p,90)-[compressWork223, T48];
%P48 = fsolve(f48,P46,optimset('Display','off'));
Ptemp(1,1)=4000;
Ptemp(1,2)=0;
Ttemp=T46;
while abs(Ttemp-T48)>1
   eta=(Ptemp(1,1)+Ptemp(1,2))/2;
   [~,Ttemp]=gasturbine(cpCoeff, molarMass, T41, P41, eta, 90);
   if Ttemp<T48
       Ptemp(1,2)=eta;
   end
   if  Ttemp>T48
           Ptemp(1,1)=eta;
   end
   if Ttemp==T48
       break
   end 
   a=1;
end
P48=eta;
[ dhkg4648, ~ ] = findEnthalpyDiff( cpCoeff, molarMass, T46, T48 );
h48=h46+dhkg4648;
[ dskg4648, ~ ] = findEntropyDiff( cpCoeff, molarMass, T46, P46, T48, P48 );
s48=s46+dskg4648;
%% stage 50
%s50=s41;
P50=101.3;
%ds=0;
%T50=findFinalTempFromEntropyDiff( cpCoeff, molarMass, T41, P41, P50, ds );
[ compressWork4850, T50 ] = gasturbine( cpCoeff, molarMass, T48, P48, P50, 90 );
[ dskg4850, ~] = findEntropyDiff( cpCoeff, molarMass, T48, P48, T50, P50 );
s50=s48+dskg4850;
[ dhkg4850, ~ ] = findEnthalpyDiff( cpCoeff, molarMass, T48, T50 );
h50=h48+dhkg4850;
%% end of stage condition
fliplr(cpCoeff);
syms t
cp=poly2sym(fliplr(cpCoeff),t);
Qcomb=int(cp,T3,T41);
Qic=int(cp,T25,T23);
Qexh=int(cp,T2,T50);
Efficiency=double(1-(Qic+Qexh)/(Qcomb));
Heatrate=double(Qcomb/(Qcomb-Qic-Qexh))*3600;
spcw=double(Qcomb-Qic-Qexh)/molarMass;
fprintf('For Air Standard Assumption:\nThermal efficiency= %f \n',Efficiency)
fprintf('Heat Rate= %f (kJ/kWh)\n',Heatrate)
fprintf('Specific Work= %f (kW/(kg/s))\n',spcw)
fprintf('Turbine exhaust temperature=%f (¡£C)\n',T50-273.15)
%% plot 
figure(3)
hold on
aa3=plot([s2,s23,s25,s3,s41,s46,s48,s50,s2],[h2,h23,h25,h3,h41,h46,h48,h50,h2],'--r');
v2=R*T2/(molarMass*P2);v23=R*T23/(molarMass*P23);v25=R*T25/(molarMass*P25);v3=R*T3/(molarMass*P3);
v41=R*T41/(molarMass*P41);v46=R*T46/(molarMass*P46);v48=R*T48/(molarMass*P48);v50=R*T50/(molarMass*P50);
title('h-s Diagram for LMS100');
xlabel('Entropy( KJ/( K*Kmol) )')
ylabel('Enthalpy( KJ/( K*Kmol )')
bb3 = semilogx(v2,P2,'--b');
legend([aa3,bb3],' 2(b)',' 4(b)');
figure(1)
hold on
bb1=plot([v2,v23,v25,v3,v41,v46,v48,v50,v2],[P2,P23,P25,P3,P41,P46,P48,P50,P2],'--r');
title('p-v Diagram for LMS100');
ylabel('Pressure ( Bar )')
xlabel('Specific Volume ( m^3/kg )')
aa1 = semilogx(v2,P2,'--b');
legend([aa1,bb1],' 2(b)',' 4(b)');
figure(2)
hold on
bb2=plot([s2,s23,s25,s3,s41,s46,s48,s50,s2],[T2,T23,T25,T3,T41,T46,T48,T50,T2],'--r');
title('p-v Diagram for LMS100');
xlabel('Entropy( KJ/(K*Kmol) )');
ylabel('Temperature( K )');
aa2 = semilogx(s2,h2,'--b');
legend([aa2,bb2],' 2(b)',' 4(b)');
Thermal_eff=Efficiency;
heat_rate=Heatrate;
specific_work=spcw;
turbine_ext_T=T50-273.15;
Result_B4 = [ Thermal_eff, heat_rate,specific_work, turbine_ext_T ];
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