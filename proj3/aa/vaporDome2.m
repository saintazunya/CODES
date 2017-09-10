%PVdiagram vapordome2
function [ Tsat, Psat, vf, vg, hf, hg, sf, sg ] = vaporDome2
T = [ 0.1; ... % deg C
    ( 1 : 1 : 370 )'; ...
    ( 370.1 : 0.1 : 373.9 )'; ...
      373.9458 ];
  Tsat=T;
Psat = zeros( size( T ) );
vf = zeros( size( T ) );
vg = zeros(size(T));
sg = zeros( size(T) );
sf = zeros(size(T));
hf = zeros(size(T));
hg = zeros(size(T));
for j = 1 : length( T )
    
    Psat( j, 1 ) = XSteam( 'psat_T', T( j ) ); % bar
    vf(   j, 1 ) = XSteam( 'vL_T',   T( j ) ); % m3/kg
    vg(j,1)=XSteam('vV_T',T(j));    
    sg(j,1)=XSteam('sV_T',T(j));
    sf(   j, 1 ) = XSteam( 'sL_T',   T( j ) ); 
    hf(   j, 1 ) = XSteam( 'hL_T',   T( j ) ); % m3/kg
    hg(j,1)=XSteam('hV_T',T(j));
end
 semilogx(vg,Psat,'b')
 hold on
 semilogx(vf,Psat,'b')
 title('P-v Diagram for Water');
 legend('vf-Psat','vg-Psat','T = 300 deg C','T = 500 deg C');
 xlabel('v(m^3/kg)');
 ylabel('P(bar)');


