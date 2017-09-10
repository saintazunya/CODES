syms x
FFx=34.29+0.10711*x+5.17e-4*x^2-2.72e-6*x^3;
Fx=(34.29+0.10711*(x*49.54)+5.17e-4*(x*49.54)^2-2.72e-6*(x*49.54)^3)*0.021;
Dx=diff(Fx);
Nx=abs(-1/Dx);
nx=Nx/(sqrt(Nx^2+1))*cos((0/180)*pi)+sin((0/180)*pi)*1/(sqrt(Nx^2+1));
double(int(nx,0,6.5));
Upx=82.46+68.27*x-10.97*x^2+0.811*x^3;
double(int(nx*Upx,0,7.856))/100