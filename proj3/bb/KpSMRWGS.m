clear all; close all
%% kp for   SMR
reactsmr={'CH4','H2O'};
reactnsmr=[1 1];
prodsmr={'CO','H2'};
prodnsmr=[1 3];
P=101.3;
Kpsmr=zeros(1,length(25:25:1200));
Kpwgs=Kpsmr;
for Tc=25:25:1200
    T=273.15+Tc;
[Kpsmr(Tc/25)]=findkp(reactsmr, reactnsmr,prodsmr, prodnsmr,T);
end
%% kp for wgs
reactwgs={'CO','H2O'};
reactnwgs=[1 1];
prodwgs={'CO2','H2'};
prodnwgs=[1 1];
for Tc=25:25:1200
    T=273.15+Tc;
[Kpwgs(Tc/25)]=findkp(reactwgs, reactnwgs,prodwgs, prodnwgs,T);
end
semilogy(25:25:1200,Kpsmr,'r')
hold on 
semilogy(25:25:1200,Kpwgs)
legend('SMR','WGS')
axis([0 1200 10^(-3) 10^3])
Result_B4 = [   Kpwgs(8),      Kpsmr(8);                                 % pt1: 200 deg C
                Kpwgs(20),     Kpsmr(20);                                 % pt2: 500 deg C
                Kpwgs(24),     Kpsmr(24);                                 % pt3: 600 deg C
                Kpwgs(28),     Kpsmr(28);                                 % pt4: 700 deg C
                Kpwgs(48),     Kpsmr(48) ];                               % pt5: 1200 deg C
