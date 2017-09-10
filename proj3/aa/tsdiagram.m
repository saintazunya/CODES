function [ p, v, h, s ] = tsdiagram( Pi1,Pi2 )

% ts diagram
P = [ 1; ... % deg C
    ( 1 : 1 : 7.5)'; ...
    (10 : 2 : 48 )'; ...
     (50:10:20000)';(22001:1:22064)' ];
 
Tsat = zeros( size( P ) );
sVp = zeros( size( P ) );
sLp = zeros(size(P));

 
 
for j = 1 : length( P )
    
    Tsat( j, 1 ) = XSteam( 'Tsat_p', P( j ) ); % bar
    sVp(   j, 1 ) = XSteam( 'sV_p',   P( j ) ); % m3/kg
    sLp(j,1)=XSteam('sL_p',P(j));
   
end
T1=linspace(1,400,400);
Bar1=zeros(size(T1));

for j = 1 : 400
    
    Bar1(j,1)=XSteam( 's_pT',Pi1, T1( j ) );%(s,p,t)
    % continue with the evaluation of saturated vapor specific volume, vg
    
end
T2=linspace(1,400,400);
Bar2=zeros(size(T2));
for j = 1 : 400
    
    Bar2(j,1)=XSteam( 's_pT', Pi2, T2( j ) );
    % continue with the evaluation of saturated vapor specific volume, vg
    
end

 
semilogx(sVp,Tsat,sLp,Tsat,Bar1,T1,Bar2,T2)
axis([1 10 0 400] )
