clear
syms xi eta
N1=1/4*xi*(1-xi)*eta*(1-eta);
N2=-1/4*xi*(1+xi)*eta*(1-eta);
N3=1/4*xi*(1+xi)*eta*(1+eta);
N4=-1/4*xi*(1-xi)*eta*(1+eta);
N5=-1/2*(1+xi)*(1-xi)*(1-eta)*eta;
N6=1/2*xi*(1+xi)*(1+eta)*(1-eta);
N7=1/2*(1+xi)*(1-xi)*(1+eta)*eta;
N8=-1/2*xi*(1-xi)*(1-eta^2);
N9=(1-xi^2)*(1-eta^2);
x1=0;x2=4;x3=4;x4=0;x5=2;x6=4;x7=2;x8=0;x9=2;
y1=0;y2=0;y3=2;y4=2;y5=0;y6=1;y7=2;y8=1;y9=1;
EQ1=N1*x1+N2*x2+N3*x3+N4*x4+N5*x5+N6*x6+N7*x7+N8*x8+N9*x9;
EQ2=N1*y1+N2*y2+N3*y3+N4*y4+N5*y5+N6*y6+N7*y7+N8*y8+N9*y9;
[Sxi,Seta]=solve(EQ1==1, EQ2==1);
%-------------------------------------mapback
x1=0;x4=0;x5=0;x6=0;x7=0;x8=0;x9=0;x2=1;x3=1;
y1=0;y2=0;y3=0;y4=0;y5=0;y6=0;y7=0;y8=0;y9=0;
N1=1/4*xi*(1-xi)*eta*(1-eta);
N2=-1/4*xi*(1+xi)*eta*(1-eta);
N3=1/4*xi*(1+xi)*eta*(1+eta);
N4=-1/4*xi*(1-xi)*eta*(1+eta);
N5=-1/2*(1+xi)*(1-xi)*(1-eta)*eta;
N6=1/2*xi*(1+xi)*(1+eta)*(1-eta);
N7=1/2*(1+xi)*(1-xi)*(1+eta)*eta;
N8=-1/2*xi*(1-xi)*(1-eta^2);
N9=(1-xi^2)*(1-eta^2);
EQ1=N1*x1+N2*x2+N3*x3+N4*x4+N5*x5+N6*x6+N7*x7+N8*x8+N9*x9;
EQ2=N1*y1+N2*y2+N3*y3+N4*y4+N5*y5+N6*y6+N7*y7+N8*y8+N9*y9;
%------------for abedge
xi=1;
EQ1=N1*x1+N2*x2+N3*x3+N4*x4+N5*x5+N6*x6+N7*x7+N8*x8+N9*x9
