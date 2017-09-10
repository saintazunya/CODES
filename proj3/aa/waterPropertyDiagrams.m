function []=waterPropertyDiagrams
close all
clear all
 [ Tsat, Psat, vf, vg, hf, hg, sf, sg ] = vaporDome;
 [ p, v, h, s ] = isotherm( 300 );
 [p1, v1, h1, s1]=isotherm(500);
 [ TT, vv, hh, ss ] = isobar( 100 );
 [TT1,vv1,hh1,ss1]=isobar(300);
 figure(1) %PV
 hold on
 %semilogx(vf,Psat,vg,Psat,'--')
 semilogx(v,p,'r')
 semilogx(v1,p1,'g')
 title('P-v Diagram for Water');
legend('vf-Psat','vg-Psat','T = 300 deg C','T = 500 deg C');
xlabel('v(m^3/kg)');
ylabel('P(bar)');

figure(2) %TS
hold on
semilogx(sf,Tsat,':')
semilogx(sg,Tsat,':')
semilogx(ss,TT,'g')
semilogx(ss1,TT1,'r')
set(gca,'XScale','log')
axis([0.2 20 0 500])
title('T-s Diagram for Water');
legend('sf-Tsat','sg-Tsat','p = 100 bar','p = 300 bar');
xlabel('s(kJ/kg-deg C)');
ylabel('T(deg C)');

figure(3) %HS
semilogx(sf,hf,sg,hg,'b')
hold on 
semilogx(s,h,'r')
semilogx(s1,h1,'g')
semilogx(ss,hh,'y')
semilogx(ss1,hh1,'m')
title('h-s Diagram for Water');
legend('sf-hf','sg-hg','T = 300 deg C','T = 500 deg C','p = 100 bar','p = 300 bar');
xlabel('s (kJ/kg-deg C)');
ylabel('h (kJ/kg)');