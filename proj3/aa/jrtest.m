[ T, p, vf, vg, hf, hg, sf, sg ] = vaporDome;
semilogx(vf,p,':');
hold on;
semilogx(vg,p,':');
hold on;
[ p, v, h, s ] = isotherm( 380 );
semilogx(v,p,'--');
hold on;
[ p, v, h, s ] = isotherm( 300 );
semilogx(v,p);
title('P-v Diagram for Water');
legend('vf-Psat','vg-Psat','T = 380 deg C','T = 300 deg C');
xlabel('v(m^3/kg)');
ylabel('P(bar)');
hold off;

figure;
[ T, p, vf, vg, hf, hg, sf, sg ] = vaporDome;
semilogx(sf,T,':');
hold on;
semilogx(sg,T,':');
hold on;
[ T, v, h, s ] = isobar( 1000 );
semilogx(s,T,'--');
hold on;
[ T, v, h, s ] = isobar( 20 );
semilogx(s,T);
title('T-s Diagram for Water');
legend('sf-Tsat','sg-Tsat','p = 1000 bar','p = 20 bar');
xlabel('s(kJ/kg-deg C)');
ylabel('T(deg C)');
hold off;


figure;
[ T, p, vf, vg, hf, hg, sf, sg ] = vaporDome;
semilogx(sf,hf,':');
hold on;
semilogx(sg,hg,':');
hold on;
[ p, v, h, s ] = isotherm( 380 );
semilogx(s,h,'--k');
hold on;
[ p, v, h, s ] = isotherm( 300 );
semilogx(s,h,'k');
hold on;
[ T, v, h, s ] = isobar( 1000 );
semilogx(s,h,'--r');
hold on;
[ T, v, h, s ] = isobar( 20 );
semilogx(s,h,'r');
title('h-s Diagram for Water');
legend('vf-hf','vg-hg','T = 380 deg C','T = 300 deg C','p = 1000 bar','p = 20 bar');
xlabel('s(kJ/kg-deg C)');
ylabel('h(kJ/kg)');
hold off;