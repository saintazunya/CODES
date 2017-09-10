syms x
FFx=28.34+0.02616*x+0.00108*x^2-3.025e-6*x^3;
Fx=(28.34+0.02616*(x*49.54)+0.00108*(x*49.54)^2-3.025e-6*(x*49.54)^3)*0.021;
Dx=diff(Fx);
Nx=abs(-1/Dx);
nx=Nx/(sqrt(Nx^2+1))*cos((6/180)*pi)+sin((6/180)*pi)*1/(sqrt(Nx^2+1));
double(int(nx,0,6.5));
Downx=-262.68+404*x-113.14*x^2+8.79*x^3;
double(int(nx*Downx,0,8.042))/100