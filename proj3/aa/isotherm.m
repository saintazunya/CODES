function [ p, v, h, s ] = isotherm( T )

P=linspace(1,400,400);
p=zeros(length(P),1);
p=P';
s=zeros(length(P),1);
h=zeros(length(P),1);
v=zeros(length(P),1);
for j = 1 : 400
    s(j,1)=XSteam( 's_pT', p(j), T );
    h(j,1)=XSteam( 'h_pT', p(j), T );
    v( j, 1 ) = XSteam( 'v_pT', p(j),T ); % bar 
end
