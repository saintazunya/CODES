syms ka kb c s L u1 v1 the1 u2 v2 the2 u3 v3 the3 
c=cos(105*pi/180);
s=sin(105*pi/180);
  L=0.409 ;
  ka=100e-6*200e9/L;
  kb=200e9*833e-12/(L^3);  
  F=5000;   
  d=[the1 u2 the2 u3 v3 the3 ];
  A =[  2.52E+03	0.00E+00	6.66E+02	2.26E+03	-2.26E+03	5.96E+02;
0.00E+00	4.33E+07	-5.77E+03	-3.30E+06	1.22E+07	-5.77E+03;
6.66E+02	-5.77E+03	2.96E+03	5.77E+03	1.55E+03	8.15E+02;
2.26E+03	-3.30E+06	5.77E+03	2.12E+07	5.67E+06	8.03E+03;
-2.26E+03	1.22E+07	1.55E+03	5.67E+06	6.35E+07	-7.15E+02;
5.96E+02	-5.77E+03	8.15E+02	8.03E+03	-7.15E+02	2.82E+03];
PI=+0.5*d*A*d.'- v3*F
kframe=[ka*c^2+12*kb*s^2 ka*c*s-12*kb*c*s -6*L*kb*s -ka*c^2-12*kb*s^2 -ka*c*s+12*kb*s*c -6*L*kb*s;
          ka*c*s-12*kb*c*s ka*s^2+12*kb*c^2 6*L*kb*c -ka*c*s+12*kb*c*s -ka*s^2-12*kb*c^2 6*L*kb*c;
          -6*L*kb*s 6*L*kb*c 4*L^2*kb 6*L*kb*s -6*L*kb*c 2*L^2*kb;
         -ka*c^2-12*kb*s^2 -ka*c*s+12*kb*c*s 6*L*kb*s ka*c^2+12*kb*s^2 ka*c*s-12*kb*c*s 6*L*kb*s;
         -ka*c*s+12*kb*c*s -ka*s^2-12*kb*c^2 -6*L*kb*c ka*c*s-12*kb*c*s ka*s^2+12*kb*c^2 -6*L*kb*c;
         -6*L*kb*s 6*L*kb*c 2*L^2*kb 6*L*kb*s -6*L*kb*c 4*L^2*kb
          ] ;
      dfthe1=diff(PI,the1)
      dfu2=diff(PI,u2)
      dfthe2=diff(PI,the2)
      dfu3=diff(PI,u3)
      dfv3=diff(PI,v3)
      dfthe3=diff(PI,the3)
    [the1,u2,the2,u3,v3,the3]=solve(dfthe1==0,dfu2==0,dfthe2==0,dfu3==0,dfv3==0,dfthe3==0);
    the1=double(the1)
    u2=double(u2)
    the2=double(the2)
    u3=double(u3)
    v3=double(v3)
    the3=double(the3)
      %RH=[0;0;0;0;-5000;0];
      %LH\RH