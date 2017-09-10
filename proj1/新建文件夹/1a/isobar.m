function [ T, v, h, s ] = isobar( p )
%TSdiagram
T=linspace(1,400,400);
s=zeros(length(T),1);
h=zeros(length(T),1);
v=zeros(length(T),1);
for j = 1 : 400
    v(j,1)=XSteam('v_pT',p,T(j));
    s(j,1)=XSteam( 's_pT',p, T( j ) );%TS 
    h(j,1)=XSteam('h_pT',p,T(j)); %HS
end
%semilogx(s,T)