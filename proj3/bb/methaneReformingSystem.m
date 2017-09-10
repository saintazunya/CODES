%starts on the standard of 1 mol CH4
%% at t=800 .c
reactwgs={'CO','H2O'};
reactnwgs=[1 1];
prodwgs={'CO2','H2'};
prodnwgs=[1 1];
T=800+273.15;
Kpwgs_800=findkp(reactwgs, reactnwgs,prodwgs, prodnwgs,T);
f=@(x)(((x^2-5*x+4)/(x+x^2)-Kpwgs_800)*1e25);
nco_800=fsolve(f,0.99,optimset('Display','off'));
%% HHV for smr
mixturer={'CH4','H2O'};mixturep={'CO','H2'};
mixfracr=[50 50];
mixfracp=[25 75];
molarrsmr=findmixturemolarmass(mixturer,[25 75]);
P=101.3;
%Heat_SMR= findMixtureEnthalpy(T,  mixturer, mixfracr )-findMixtureEnthalpy(T,  mixturep, mixfracp );
%% HHV for wgs
 mixturerwgs={'CO','H2O'};
 mixturepwgs={'CO2','H2'};
 mixfracrwgs=[50 50];mixfracpwgs=[50 50];
% Heat_WGS=findMixtureEnthalpy(T,  mixturerwgs, mixfracrwgs )-findMixtureEnthalpy(T,  mixturepwgs, mixfracpwgs );
 %% mixture product for part a
 mixturepa={'H2O','CO','H2','CO2'};
 mixfracnpa=[1+nco_800,nco_800,1-nco_800,4-nco_800];
 mixfracpa=mixfracnpa/sum(mixfracnpa)*100;
 %molarpsmr=findmixturemolarmass(mixturepa,mixfracpa);
 heat=findMixtureEnthalpy(T,mixturer,[25 75])*molarrsmr-findMixtureEnthalpy(T,mixturepa,mixfracpa)*molarrsmr;
 %% net heat
 %Netheat_T800=Heat_SMR+(1-nco_800)*Heat_WGS;
 HHV_CH4=55530;%(kj/kg)
 mfuel=abs(heat)/HHV_CH4/16;
 fprintf('For 1 kg fuel:\nT@800,\nMass of fuel needed %f kg\n', mfuel)
 fprintf('Gas composition %%:\nH2O:%f\nCO:%f\nH2:%f\nCO2:%f\n', mixfracpa(1),mixfracpa(2),mixfracpa(3),mixfracpa(4));
%% ----------------------------------b at T=400-------------------------------------
T=400+273.15;
reactsmr={'CH4','H2O'};
reactnsmr=[1 1];
prodsmr={'CO','H2O'};
prodnsmr=[1 1];
Kpwgs_400=findkp(reactwgs, reactnwgs,prodwgs, prodnwgs,T);
Kpsmr_400=findkp(reactsmr, reactnsmr,prodsmr, prodnsmr,T);
syms x y
f=(1-x-y)*(3-3*x+y)^3/(2*x+x^2-x*y)-Kpsmr_400;
g=(y^2+3*y-3*x*y)/((1-x-y)*(2+x-y))-Kpwgs_400;
[nco_400, nco2_400]=solve((1-x-y)*(3-3*x+y)^3/(2*x+x^2-x*y)-Kpsmr_400==0,(y^2+3*y-3*x*y)/((1-x-y)*(2+x-y))-Kpwgs_400==0,x,y);
xx=double(nco_400(2));
yy=double(nco2_400(2));
%% Heat gererated
mixturepb={'CH4','H2O','CO','H2','CO2'};
mixturenb=[xx,2+xx-yy,1-xx-yy,3-3*xx-yy,yy];
mixfracpb=mixturenb/sum(mixturenb)*100;
Netheat_T400=(findMixtureEnthalpy(T,  mixturepa, mixfracpa )-findMixtureEnthalpy(T,  mixturepb, mixfracpb))*molarrsmr;
%mfuel=abs(Netheat_T400)/HHV_CH4/16;
fprintf('T@400,\nHeat transfer needed %f kJ\n',-Netheat_T400)
fprintf('Gas composition %%:\nCH4:%f\nH2O:%f\nCO:%f\nH2:%f\nCO2:%f\n', mixfracpb(1),mixfracpb(2),mixfracpb(3),mixfracpb(4),mixfracpb(5));
%% ----------------------------------b at T=220-------------------------------------
T=220+273.15;
reactsmr={'CH4','H2O'};
reactnsmr=[1 1];
prodsmr={'CO','H2O'};
prodnsmr=[1 1];
Kpwgs_400=findkp(reactwgs, reactnwgs,prodwgs, prodnwgs,T);
Kpsmr_400=findkp(reactsmr, reactnsmr,prodsmr, prodnsmr,T);
syms x y
f=(1-x-y)*(3-3*x+y)^3/(2*x+x^2-x*y)-Kpsmr_400;
g=(y^2+3*y-3*x*y)/((1-x-y)*(2+x-y))-Kpwgs_400;
[nco_220, nco2_220]=solve((1-x-y)*(3-3*x+y)^3/(2*x+x^2-x*y)-Kpsmr_400==0,(y^2+3*y-3*x*y)/((1-x-y)*(2+x-y))-Kpwgs_400==0,x,y);
xx=double(nco_220(2));
yy=double(nco2_220(2));
%% Heat gererated
mixturepc={'CH4','H2O','CO','H2','CO2'};
mixturenc=[xx,2+xx-yy,1-xx-yy,3-3*xx-yy,yy];
mixfracpc=mixturenc/sum(mixturenc)*100;
Netheat_T220=(findMixtureEnthalpy(T,  mixturepb, mixfracpb )-findMixtureEnthalpy(T,  mixturepc, mixfracpc))*molarrsmr;
%mfuel=abs(Netheat_T220)/molarrsmr/HHV_CH4;
fprintf('T@220,\nHeat transfer needed %f kJ\n',-Netheat_T220)
fprintf('Gas composition %%:\nCH4:%f\nH2O:%f\nCO:%f\nH2:%f\nCO2:%f\n', mixfracpc(1),mixfracpc(2),mixfracpc(3),mixfracpc(4),mixfracpc(5));

