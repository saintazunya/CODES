%PVdiagram vapordome
function [ Tsat, Psat, vf, vg, hf, hg, sf, sg ] = vaporDome
T = [ 0.1; ... % deg C
    ( 1 : 1 : 370 )'; ...
    ( 370.1 : 0.1 : 373.9 )'; ...
      373.9458 ];
Psat = zeros( size( T ) );
vf = zeros( size( T ) );
vg = zeros(size(T));
for j = 1 : length( T )
    
    Psat( j, 1 ) = XSteam( 'psat_T', T( j ) ); % bar
    vf(   j, 1 ) = XSteam( 'vL_T',   T( j ) ); % m3/kg
    vg(j,1)=XSteam('vV_T',T(j));    
    
end
%TS/HSdiagram Vaoprdome
P = [ 1; ... % deg C
    ( 1 : 1 : 7.5)'; ...
    (10 : 2 : 48 )'; ...
     (50:10:20000)';(22001:1:22064)' ];
Tsat = zeros(size( P ) );
sg = zeros( size( P ) );
sf = zeros(size(P));
hf = zeros(size(P));
hg = zeros(size(P));
for j = 1 : length( P )
    
    Tsat( j, 1 ) = XSteam( 'Tsat_p', P( j ) ); % bar
    sg(j, 1 ) = XSteam( 'sV_p',  P( j ) ); % m3/kg
    sf(j,1)=XSteam('sL_p',P(j));
    hf(j,1)=XSteam('hL_p',P(j));
     hg(j,1)=XSteam('hV_p',P(j));
end
semilogx(vf,Psat,vg,Psat,'b');
