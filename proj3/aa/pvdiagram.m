 function[  T, p, vf, vg, hf, hg, sf, sg] =pvdiagram(Ti1,Ti2)
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
P1=linspace(0,300,100);
V1=zeros(100);
for j = 1 : 100
    
   V1( j, 1 ) = XSteam( 'v_pT', P1(j),Ti1 ); % bar 
end
P2=linspace(0,300,100);
V2=zeros(100);
for j = 1 : 100
    
   V2( j, 1 ) = XSteam( 'v_pT', P1(j),Ti2 ); % bar
end
 T=[200 400];

semilogx(vg,Psat,vf,Psat,V1,P1,V2,P2)
 
 



