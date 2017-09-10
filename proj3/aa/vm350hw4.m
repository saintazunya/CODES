clear
syms  eta ksi x1 x2 x3 x4 y1 y2 y3 y4
A=[x1 x2 x3 x4; y1 y2 y3 y4];
n1=1/4*(1-eta)*(1-ksi);
n2=1/4*(1+eta)*(1-ksi);
n3=1/4*(1+eta)*(1+ksi);
n4=1/4*(1-eta)*(1+ksi);
j11=diff(n1,eta);
j12=diff(n1,ksi);
j21=diff(n2,eta);
j22=diff(n2,ksi);
j31=diff(n3,eta);
j32=diff(n3,ksi);
j41=diff(n4,eta);
j42=diff(n4,ksi);
B=[j11 j12;j21 j22; j31 j32; j41 j42];
J=A*B;
DETJ=det(J);
eta=-1;
ksi=-1;
x1=0.5;y1=0.5;x2=1;y2=-1;x3=1;y3=1; x4=-1;y4=1;
