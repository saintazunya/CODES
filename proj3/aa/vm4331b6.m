[ Tsat, Psat, vf, vg, hf, hg, sf, sg ] = vaporDome;
close all
p=zeros(3,17);
p(:,1)=[243;1056;XSteam('s_pT',198,243)];
p(:,2)=[400;2879;XSteam('s_pT',183,400)];
p(:,3)=[395;2878;XSteam('s_pT',175,395)];
p(:,4)=[542.8;3412;XSteam('s_pT',164.8,542.8)];
p(:,5)=[540;3409;XSteam('s_pT',160,540)];
p(:,6)=[480;3405;XSteam('s_pT',35,480)];
p(:,7)=[221.6;2903.4;XSteam('s_pT',4.5,221.6)];
p(:,8)=[50.51;2387.4;XSteam('s_pT',0.1256,50.51)];
p(:,9)=[48.6;2030.2;XSteam('s_pT',0.115,48.6)];
p(:,10)=[46.47;194.5;XSteam('s_pT',0.4141,46.47)];
p(:,11)=[46.68;169.7;XSteam('s_pT',15.43,46.68)];
p(:,12)=[69.45;XSteam('h_pT',13.98,69.45);XSteam('s_pT',13.98,69.45)];
p(:,13)=[117.8;XSteam('h_pT',13.98*0.906,117.8);XSteam('s_pT',13.98*0.906,117.8)];
p(:,14)=[144.5;XSteam('h_pT',13.98*0.906*0.906,144.5);XSteam('s_pT',13.98*0.906*0.906,144.5)];
p(:,15)=[185.8;789.2;XSteam('s_pT',11.45,185.8)];
p(:,16)=[190.6;XSteam('h_pT',198/0.99/0.906,190.6);XSteam('s_pT',198/0.99/0.906,190.6)];
p(:,17)=[218.2;XSteam('h_pT',198/0.906,190.6);XSteam('s_pT',198/0.906,190.6)];
figure(1)
hold on
semilogx(sf,Tsat,'--b')
semilogx(sg,Tsat,'--b')
semilogx(p(3,:),p(1,:),'r-p')
set(gca,'XScale','log')
title('T-s Diagram for Water');
legend('sf-Tsat','sg-Tsat','Rankine engine circuit');
xlabel('s(kJ/kg-deg C)');
ylabel('T(deg C)');
figure(2)
hold on
semilogx(sf,hf,'--b')
semilogx(sg,hg,'--b')
set(gca,'XScale','log')
semilogx(p(3,:),p(2,:),'r-p')
title('h-s Diagram for Water');
legend('sf-hf','sg-hg','Rankine engine circuit');
xlabel('s (kJ/kg-deg C)');
ylabel('h (kJ/kg)');