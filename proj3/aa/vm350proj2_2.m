syms r xc yc Ax Ay Bx By Cx Cy Dx Dy Ex Ey Fx Fy Gx Gy Hx Hy Ix Iy Jx Jy Kx Ky
%circle
r=300;
Fx=300;Fy=300;
seta=0:0.001:2*pi; 
xx=Fx-r*cos(seta); 
yy=Fy-r*sin(seta); 
plot(xx,yy) 
axis equal
hold on;
%frame
Ax=0;Ay=0;Bx=800;By=0;Cx=800;Cy=600;Dx=0;Dy=600;
plot([Ax Bx],[Ay By],[Cx Dx],[Cy Dy],[Bx,Cx],[By,Cy],[Ax,Dx],[Ay,Dy]);
hold on;
Ex=600;Ey=0;Hx=600;Hy=600;Ix=800;Iy=600;Jx=800;Jy=0;Kx=756.25;Ky=0;Lx=400;Ly=0;Gx=756.25;Gy=300;
plot(Ax,Ay,Bx,By,Cx,Cy,Dx,Dy,Ex, Ey, Fx, Fy, Gx, Gy, Hx, Hy ,Ix, Iy, Jx, Jy, Kx, Ky);
axis([-100 1500 -800 800]);
      %hold off