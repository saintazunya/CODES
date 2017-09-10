  format SHORTE
syms c1 c2 s1 s2 u1 v1 u2 v2 u3 v3 
F=5000;
c1=cos(105*pi/180);
s1=sin(105*pi/180);
k1=100e-6*200e9/0.559;
k2=100e-6*200e9/0.409;
k3=100e-6*200e9/0.500;
 A=k2*[c1^2 c1*s1 -c1^2 -c1*s1 ; c1*s1 s1^2 -c1*s1 -s1^2; -c1^2 -c1*s1 c1^2 c1*s1; -c1*s1 -s1^2 c1*s1 s1^2 ]
A1=[1.79E+07	1.79E+07;1.79E+07	1.79E+07];
A2=[
    21200000     5660000;
     5660000    63500000];
d2=[u3 v3];
PI=+0.5*d2*A2*d2.'- v3*F;
vpa(PI,3);
%dfu2=vpa(diff(PI,u2),3)
dfu3=vpa(diff(PI,u3),3);
dfv3=vpa(diff(PI,v3),3);
LH=[ 2.12e7 5.66e6; 5.66e6 6.35e7];
RH=[0;-5000];
LH\RH;