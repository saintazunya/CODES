
 % hs diagram
function [ T, v, h, s ] =hsdiagram(Ti1,Ti2,Pi1,Pi2)
P = [ 1; ... % deg C
    ( 1 : 1 : 7.5)'; ...
    (10 : 2 : 48 )'; ...
     (50:10:20000)';(22001:1:22064)' ];
 
hsatl = zeros( size( P ) );
hsatv = zeros( size( P ) );
ssatl=zeros(size(P));
ssatv = zeros( size( P ) );
for j = 1 : length( P )
    
    ssatl( j, 1 ) = XSteam( 'sL_p', P( j ) ); % bar
    ssatv(j,1)=XSteam('sV_p',P(j));
    hsatl(j,1)=XSteam('hL_p',P(j));
    hsatv(j,1)=XSteam('hV_p',P(j));
   
end
T1=linspace(1,400,400);
Bar1s=zeros(size(T1));
Bar1h=zeros(size(T1));
Bar2s=zeros(size(T1));
Bar2h=zeros(size(T1));
for j = 1 : 400
    %isobar1
    Bar1s(j,1)=XSteam( 's_pT', Pi1, T1( j ) );%(s,p,t)
    Bar1h(j,1)=XSteam('h_pT',Pi1,T1(j));
    %isobar2
    Bar2s(j,1)=XSteam( 's_pT', Pi2, T1( j ) );%(s,p,t)
    Bar2h(j,1)=XSteam('h_pT',Pi2,T1(j));
end
P2=linspace(1,400,400);
Bar3s=zeros(size(P2));
Bar3h=zeros(size(P2));
Bar4s=zeros(size(P2));
Bar4h=zeros(size(P2));
for j = 1 : 400
    %isotherm1
    Bar3s(j,1)=XSteam( 's_pT', P2(j), Ti1 );
    Bar3h(j,1)=XSteam( 'h_pT', P2(j), Ti1 );
    %isotherm2
    Bar4s(j,1)=XSteam( 's_pT', P2(j), Ti2 );
    Bar4h(j,1)=XSteam( 'h_pT', P2(j), Ti2 );
end
semilogx(ssatl,hsatl,ssatv,hsatv)
axis([1 10 500 3000])
hold on
semilogx(Bar1s,Bar1h,'r',Bar2s,Bar2h,'g',Bar3s,Bar3h,'b',Bar4s,Bar4h,'y')
 
