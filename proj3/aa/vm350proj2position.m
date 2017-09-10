clear all
close all

VE=zeros(1,60);
VF=zeros(1,60);
VD=zeros(1,60);
vV=zeros(1,60);
Hx=0;Hy=0;Tx=800;Ty=0;Jx=800;Jy=600;Kx=0;Ky=600;%frame
Bx=710;By=40;
l1=250;l2=180;l3=250;l4=200;
%initial start
the1=140;
i=the1-140;
Vx=Bx;Vy=100;
Ax=380;Ay=180;Dx=Vx+l1*cos(the1/180*pi);Dy=l1*sin(the1*pi/180)+Vy;Ux=400;Uy=0;
the2=atan((Dy-Ay)/(Dx-Ax))+1/2*pi;
Ex=Ax+cos(the2)*l3;Ey=l3*sin(the2)+Ay;
Fy=450;d=sqrt(l4^2-(500-Ey)^2);Fx=Ex-d;
F2x=Fx-32;F2y=Fy+16;F3x=Fx+32;F3y=F2y;F4x=Fx-32;F4y=Fy-16;F5x=Fx+32;F5y=Fy-16;
F8x=780;F8y=Fy+24;F6x=0;F6y=F8y;F7x=0;F7y=Fy-24;F9x=780;F9y=F7y;
AA=[Ax;Ay];DD=[Dx;Dy];
DAnorminitial=180;
DA=(AA-DD)/(norm(AA-DD));
Cx=Ax-l2*DA(1,1);
Cy=Ay-l2*DA(2,1);
Lx=Fx-90.19+15;Ly=20;Mx=Fx+400-90.19-15;My=20;Nx=Mx;Ny=580;Ox=Lx;Oy=Ny;
Px=415;Py=0-i;Qx=785;Qy=Py;Rx=Qx;Ry=Qy+560;Sx=Px;Sy=Ry;Vx=Bx;Vy=80;Wx=Bx;Wy=Ry;Xx=Bx;Xy=Qy;
RR=[Rx;Ry];QQ=[Qx;Qy];PP=[Px;Py];SS=[Sx;Sy];BB=[Bx;By];VV=[Vx;Vy];WW=[Wx;Wy];XX=[Xx;Xy];
RB=RR-BB;SB=SS-BB;PB=PP-BB;QB=QQ-BB;VB=VV-BB;WB=WW-BB;XB=XX-BB;
Rotate=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
ROTRB=Rotate*RB;ROTQB=Rotate*QB;ROTSB=Rotate*SB;ROTPB=Rotate*PB;ROTVB=Rotate*VB;ROTWB=Rotate*WB;ROTXB=Rotate*XB;
Rx=ROTRB(1,1)+Bx;Ry=ROTRB(2,1)+By;
Qx=ROTQB(1,1)+Bx;Qy=ROTQB(2,1)+By;
Sx=ROTSB(1,1)+Bx;Sy=ROTSB(2,1)+By;
Px=ROTPB(1,1)+Bx;Py=ROTPB(2,1)+By;
Vx=ROTVB(1,1)+Bx;Vy=ROTVB(2,1)+By;
Wx=ROTVB(1,1)+Bx;Wy=ROTVB(2,1)+By;
Xx=ROTVB(1,1)+Bx;Xy=ROTVB(2,1)+By;
%initial position end
%calculation for slider on D
D5x=Dx-16*cos(the2-1/2*pi);D5y=Dy-8*sin(the2-1/2*pi);
D6x=Dx+16*cos(the2-1/2*pi);D6y=Dy+8*sin(the2-1/2*pi);
D1x=D5x+8*sin(the2-1/2*pi);D1y=D5y-8*cos(the2-1/2*pi);
D4x=D5x-8*sin(the2-1/2*pi);D4y=D5y+8*cos(the2-1/2*pi);
D2x=D6x+8*sin(the2-1/2*pi);D2y=D6y-8*cos(the2-1/2*pi);
D3x=D6x-8*sin(the2-1/2*pi);D3y=D6y+8*cos(the2-1/2*pi);
for i=0:10:560
 Px=415;Py=0-i;Qx=785;Qy=Py;Rx=Qx;Ry=Qy+560;Sx=Px;Sy=Ry;Vx=Bx;Vy=80;Wx=Bx;Wy=Ry;Xx=Bx;Xy=Qy;
   plot([Ux,Hx,Kx,Jx,Tx],[Uy,Hy,Ky,Jy,Ty],'k')%frame
  hold on
  plot([Ex,Ax,Dx,Cx],[Ey,Ay,Dy,Cy],'y')%linkage
  plot([Dx,Vx,Bx],[Dy,Vy,By],'b')%linkage
  plot([Wx,Bx,Xx],[Wy,By,Xy],'b')%railway
  plot([F2x,F4x,F5x,F3x,F2x],[F2y,F4y,F5y,F3y,F2y],'g')%sliderF
  plot([D1x,D2x,D3x,D4x,D1x],[D1y,D2y,D3y,D4y,D1y],'r')%Slider D
  plot([Ex,Fx],[Ey,Fy],'b')
   plot([Rx,Sx,Px,Qx,Rx,Wx,Bx],[Ry,Sy,Py,Qy,Ry,Wy,By])%outpart
  plot([Lx,Mx,Nx,Ox,Lx],[Ly,My,Ny,Oy,Ly],'g')  
  plot(Fx,Fy,'o',Ex,Ey,'o',Ax,Ay,'o',Bx,By,'o',Dx,Dy,'o','MarkerSize',3)%pins
  plot(Ax,Ay,'o','MarkerSize',3,'markerfacecolor','r');
   plot(Bx,By,'o','MarkerSize',3,'markerfacecolor','B');
  hold off 
   axis equal
   axis([-200 1500 -1000 700])
    M(i/10+1)=getframe;
end

    for i=570:10:800
 Px=415;Py=0-i;Qx=785;Qy=Py;Rx=Qx;Ry=Qy+560;Sx=Px;Sy=Ry;Vx=Bx;Vy=80;Wx=Bx;Wy=Ry;Xx=Bx;Xy=Qy;
  plot([Ux,Hx,Kx,Jx,Tx],[Uy,Hy,Ky,Jy,Ty],'k')%frame
  hold on
  plot([Ex,Ax,Dx,Cx],[Ey,Ay,Dy,Cy],'y')%linkage
  plot([Dx,Vx,Bx],[Dy,Vy,By],'b')%linkage
  plot([Wx,Bx,Xx],[Wy,By,Xy],'b')%railway
  plot([F2x,F4x,F5x,F3x,F2x],[F2y,F4y,F5y,F3y,F2y],'g')%sliderF
  plot([D1x,D2x,D3x,D4x,D1x],[D1y,D2y,D3y,D4y,D1y],'r')%Slider D
  plot([Ex,Fx],[Ey,Fy],'b')
   plot([Rx,Sx,Px,Qx,Rx,Wx,Bx],[Ry,Sy,Py,Qy,Ry,Wy,By])%outpart
  plot([Lx,Mx,Nx,Ox,Lx],[Ly,My,Ny,Oy,Ly],'g')  
  plot(Fx,Fy,'o',Ex,Ey,'o',Ax,Ay,'o',Bx,By,'o',Dx,Dy,'o','MarkerSize',3)%pins
  plot(Ax,Ay,'o','MarkerSize',3,'markerfacecolor','r');
   plot(Bx,By,'o','MarkerSize',3,'markerfacecolor','B');
  hold off 
   axis equal
   axis([-200 1500 -1000 700])
    M(i/10+1)=getframe;
    end
RR=[Rx;Ry];QQ=[Qx;Qy];PP=[Px;Py];SS=[Sx;Sy];BB=[Bx;By];VV=[Vx;Vy];WW=[Wx;Wy];XX=[Xx;Xy];
RB=RR-BB;SB=SS-BB;PB=PP-BB;QB=QQ-BB;VB=VV-BB;WB=WW-BB;XB=XX-BB;
D1=[D1x;D1y];D2=[D2x;D2y];D3=[D3x;D3y];D4=[D4x;D4y];AA=[Ax;Ay];
D1A=D1-AA;D2A=D2-AA;D3A=D3-AA;D4A=D4-AA;
for the1=138:0.5:170
    i=the1-138;
    %position before:
    PosB=[Ex Ey;Fx Fy;Ax Ay;Cx Cy;Dx Dy;Bx By;Vx Vy];
Ax=380;Ay=180;Dx=Vx+l1*cos(the1/180*pi);Dy=l1*sin(the1*pi/180)+Vy;Ux=400;Uy=0;
the2=atan((Dy-Ay)/(Dx-Ax))+1/2*pi;
Ex=Ax+cos(the2)*l3;Ey=l3*sin(the2)+Ay;
Fy=450;d=sqrt(l4^2-(500-Ey)^2);Fx=Ex-d;
AA=[Ax;Ay];DD=[Dx;Dy];
DAnorm=norm(AA-DD);
DA=(AA-DD)/(norm(AA-DD));
Cx=Ax-l2*DA(1,1);
Cy=Ay-l2*DA(2,1);
Lx=Fx-90.19+15;Ly=20;Mx=Fx+400-90.19-15;My=20;Nx=Mx;Ny=580;Ox=Lx;Oy=Ny;
F2x=Fx-32;F2y=Fy+16;F3x=Fx+32;F3y=F2y;F4x=Fx-32;F4y=Fy-16;F5x=Fx+32;F5y=Fy-16;
F8x=780;F8y=Fy+24;F6x=0;F6y=F8y;F7x=0;F7y=Fy-24;F9x=780;F9y=F7y;
%outpart rotate
Rotate=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
ROTRB=Rotate*RB;ROTQB=Rotate*QB;ROTSB=Rotate*SB;ROTPB=Rotate*PB;ROTVB=Rotate*VB;ROTWB=Rotate*WB;ROTXB=Rotate*XB;
Rx=ROTRB(1,1)+Bx;Ry=ROTRB(2,1)+By;
Qx=ROTQB(1,1)+Bx;Qy=ROTQB(2,1)+By;
Sx=ROTSB(1,1)+Bx;Sy=ROTSB(2,1)+By;
Px=ROTPB(1,1)+Bx;Py=ROTPB(2,1)+By;
Vx=ROTVB(1,1)+Bx;Vy=ROTVB(2,1)+By;
Wx=ROTWB(1,1)+Bx;Wy=ROTWB(2,1)+By;
Xx=ROTXB(1,1)+Bx;Xy=ROTXB(2,1)+By;
%end
%slider D rotate
%Rotate=[cos(-(2.0543-the2)) -sin(-(2.0543-the2));sin(-(2.0543-the2)) cos(-(2.0543-the2))];
%ROTD1=Rotate*D1A*DAnorminitial;ROTD2=Rotate*D2A;ROTD3=Rotate*D3A;ROTD4=Rotate*D4A;
%D1x=ROTD1(1,1)+Ax;D1y=ROTD1(2,1)+Ay;
%D2x=ROTD2(1,1)+Ax;D2y=ROTD2(2,1)+Ay;
%D3x=ROTD3(1,1)+Ax;D3y=ROTD3(2,1)+Ay;
%D4x=ROTD4(1,1)+Ax;D4y=ROTD4(2,1)+Ay;
D5x=Dx-16*cos(the2-1/2*pi);D5y=Dy-8*sin(the2-1/2*pi);
D6x=Dx+16*cos(the2-1/2*pi);D6y=Dy+8*sin(the2-1/2*pi);
D1x=D5x+8*sin(the2-1/2*pi);D1y=D5y-8*cos(the2-1/2*pi);
D4x=D5x-8*sin(the2-1/2*pi);D4y=D5y+8*cos(the2-1/2*pi);
D2x=D6x+8*sin(the2-1/2*pi);D2y=D6y-8*cos(the2-1/2*pi);
D3x=D6x-8*sin(the2-1/2*pi);D3y=D6y+8*cos(the2-1/2*pi);
%end 
%velocity analysis
PosN=[Ex Ey;Fx Fy;Ax Ay;Cx Cy;Dx Dy;Bx By;Vx Vy];
EE=[Ex;Ey];FF=[Fx;Fy];AA=[Ax;Ay];DD=[Dx;Dy];BB=[Bx;By];
EF=EE-FF;AE=AA-FF;AD=AA-DD;DB=DD-BB;
VF(i*2+1)=(PosN(2,:)-PosB(2,:))*AE;
VE(i*2+1)=(PosN(1,:)-PosB(1,:))*EF/VF(i*2+1);
VD(i*2+1)=(PosN(5,:)-PosB(5,:))*[cos(90/180*pi) -sin(90/180*pi);sin(90/180*pi) cos(90/180*pi)]*DB/VF(i*2+1);
vV(1*2+1)=norm(PosN(6,:)-PosB(6,:));
 plot([Ux,Hx,Kx,Jx,Tx],[Uy,Hy,Ky,Jy,Ty],'k')%frame
  hold on
  plot([Ex,Ax,Dx,Cx],[Ey,Ay,Dy,Cy],'y')%linkage
  plot([Dx,Vx,Bx],[Dy,Vy,By],'b')%linkage
  plot([Wx,Bx,Xx],[Wy,By,Xy],'b')%railway
  plot([F2x,F4x,F5x,F3x,F2x],[F2y,F4y,F5y,F3y,F2y],'g')%sliderF
  plot([D1x,D2x,D3x,D4x,D1x],[D1y,D2y,D3y,D4y,D1y],'r')%Slider D
  plot([Ex,Fx],[Ey,Fy],'b')
   plot([Rx,Sx,Px,Qx,Rx,Wx,Bx],[Ry,Sy,Py,Qy,Ry,Wy,By])%outpart
  plot([Lx,Mx,Nx,Ox,Lx],[Ly,My,Ny,Oy,Ly],'g')  
  plot(Fx,Fy,'o',Ex,Ey,'o',Ax,Ay,'o',Bx,By,'o',Dx,Dy,'o','MarkerSize',3)%pins
  plot(Ax,Ay,'o','MarkerSize',3,'markerfacecolor','r');
   plot(Bx,By,'o','MarkerSize',3,'markerfacecolor','B');
  hold off 
   axis equal
   axis([-200 1500 -1000 700])
   M(i*2+81)=getframe;
end
RR=[Rx;Ry];QQ=[Qx;Qy];PP=[Px;Py];SS=[Sx;Sy];BB=[Bx;By];VV=[Vx;Vy];WW=[Wx;Wy];XX=[Xx;Xy];
RB=RR-BB;SB=SS-BB;PB=PP-BB;QB=QQ-BB;VB=VV-BB;WB=WW-BB;XB=XX-BB;
D1=[D1x;D1y];D2=[D2x;D2y];D3=[D3x;D3y];D4=[D4x;D4y];AA=[Ax;Ay];
D1A=D1-AA;D2A=D2-AA;D3A=D3-AA;D4A=D4-AA;
size(M)

     for i=1:10
   plot([Ux,Hx,Kx,Jx,Tx],[Uy,Hy,Ky,Jy,Ty],'k')%frame
  hold on
  plot([Ex,Ax,Dx,Cx],[Ey,Ay,Dy,Cy],'y')%linkage
  plot([Dx,Vx,Bx],[Dy,Vy,By],'b')%linkage
  plot([Wx,Bx,Xx],[Wy,By,Xy],'b')%railway
  plot([F2x,F4x,F5x,F3x,F2x],[F2y,F4y,F5y,F3y,F2y],'g')%sliderF
  plot([D1x,D2x,D3x,D4x,D1x],[D1y,D2y,D3y,D4y,D1y],'r')%Slider D
  plot([Ex,Fx],[Ey,Fy],'b')
   plot([Rx,Sx,Px,Qx,Rx,Wx,Bx],[Ry,Sy,Py,Qy,Ry,Wy,By])%outpart
  plot([Lx,Mx,Nx,Ox,Lx],[Ly,My,Ny,Oy,Ly],'g')  
  plot(Fx,Fy,'o',Ex,Ey,'o',Ax,Ay,'o',Bx,By,'o',Dx,Dy,'o','MarkerSize',3)%pins
  plot(Ax,Ay,'o','MarkerSize',3,'markerfacecolor','r');
   plot(Bx,By,'o','MarkerSize',3,'markerfacecolor','B');
  hold off 
   axis equal
   axis([-200 1500 -1000 700])
    M(i+145)=getframe;
    end
size(M)


for the1=-[138:0.5:170]+138+170
    i=the1-170;
    %position before:
    PosB=[Ex Ey;Fx Fy;Ax Ay;Cx Cy;Dx Dy;Bx By;Vx Vy];
Ax=380;Ay=180;Dx=Vx+l1*cos(the1/180*pi);Dy=l1*sin(the1*pi/180)+Vy;Ux=400;Uy=0;
the2=atan((Dy-Ay)/(Dx-Ax))+1/2*pi;
Ex=Ax+cos(the2)*l3;Ey=l3*sin(the2)+Ay;
Fy=450;d=sqrt(l4^2-(500-Ey)^2);Fx=Ex-d;
AA=[Ax;Ay];DD=[Dx;Dy];
DAnorm=norm(AA-DD);
DA=(AA-DD)/(norm(AA-DD));
Cx=Ax-l2*DA(1,1);
Cy=Ay-l2*DA(2,1);
Lx=Fx-90.19+15;Ly=20;Mx=Fx+400-90.19-15;My=20;Nx=Mx;Ny=580;Ox=Lx;Oy=Ny;
F2x=Fx-32;F2y=Fy+16;F3x=Fx+32;F3y=F2y;F4x=Fx-32;F4y=Fy-16;F5x=Fx+32;F5y=Fy-16;
F8x=780;F8y=Fy+24;F6x=0;F6y=F8y;F7x=0;F7y=Fy-24;F9x=780;F9y=F7y;
%outpart rotate
Rotate=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
ROTRB=Rotate*RB;ROTQB=Rotate*QB;ROTSB=Rotate*SB;ROTPB=Rotate*PB;ROTVB=Rotate*VB;ROTWB=Rotate*WB;ROTXB=Rotate*XB;
Rx=ROTRB(1,1)+Bx;Ry=ROTRB(2,1)+By;
Qx=ROTQB(1,1)+Bx;Qy=ROTQB(2,1)+By;
Sx=ROTSB(1,1)+Bx;Sy=ROTSB(2,1)+By;
Px=ROTPB(1,1)+Bx;Py=ROTPB(2,1)+By;
Vx=ROTVB(1,1)+Bx;Vy=ROTVB(2,1)+By;
Wx=ROTWB(1,1)+Bx;Wy=ROTWB(2,1)+By;
Xx=ROTXB(1,1)+Bx;Xy=ROTXB(2,1)+By;
%end
%slider D rotate
%Rotate=[cos(-(2.0543-the2)) -sin(-(2.0543-the2));sin(-(2.0543-the2)) cos(-(2.0543-the2))];
%ROTD1=Rotate*D1A*DAnorminitial;ROTD2=Rotate*D2A;ROTD3=Rotate*D3A;ROTD4=Rotate*D4A;
%D1x=ROTD1(1,1)+Ax;D1y=ROTD1(2,1)+Ay;
%D2x=ROTD2(1,1)+Ax;D2y=ROTD2(2,1)+Ay;
%D3x=ROTD3(1,1)+Ax;D3y=ROTD3(2,1)+Ay;
%D4x=ROTD4(1,1)+Ax;D4y=ROTD4(2,1)+Ay;
D5x=Dx-16*cos(the2-1/2*pi);D5y=Dy-8*sin(the2-1/2*pi);
D6x=Dx+16*cos(the2-1/2*pi);D6y=Dy+8*sin(the2-1/2*pi);
D1x=D5x+8*sin(the2-1/2*pi);D1y=D5y-8*cos(the2-1/2*pi);
D4x=D5x-8*sin(the2-1/2*pi);D4y=D5y+8*cos(the2-1/2*pi);
D2x=D6x+8*sin(the2-1/2*pi);D2y=D6y-8*cos(the2-1/2*pi);
D3x=D6x-8*sin(the2-1/2*pi);D3y=D6y+8*cos(the2-1/2*pi);
%end 
%velocity analysis
PosN=[Ex Ey;Fx Fy;Ax Ay;Cx Cy;Dx Dy;Bx By;Vx Vy];
EE=[Ex;Ey];FF=[Fx;Fy];AA=[Ax;Ay];DD=[Dx;Dy];BB=[Bx;By];
EF=EE-FF;AE=AA-FF;AD=AA-DD;DB=DD-BB;

 plot([Ux,Hx,Kx,Jx,Tx],[Uy,Hy,Ky,Jy,Ty],'k')%frame
  hold on
  plot([Ex,Ax,Dx,Cx],[Ey,Ay,Dy,Cy],'y')%linkage
  plot([Dx,Vx,Bx],[Dy,Vy,By],'b')%linkage
  plot([Wx,Bx,Xx],[Wy,By,Xy],'b')%railway
  plot([F2x,F4x,F5x,F3x,F2x],[F2y,F4y,F5y,F3y,F2y],'g')%sliderF
  plot([D1x,D2x,D3x,D4x,D1x],[D1y,D2y,D3y,D4y,D1y],'r')%Slider D
  plot([Ex,Fx],[Ey,Fy],'b')
   plot([Rx,Sx,Px,Qx,Rx,Wx,Bx],[Ry,Sy,Py,Qy,Ry,Wy,By])%outpart
  plot([Lx,Mx,Nx,Ox,Lx],[Ly,My,Ny,Oy,Ly],'g')  
  plot(Fx,Fy,'o',Ex,Ey,'o',Ax,Ay,'o',Bx,By,'o',Dx,Dy,'o','MarkerSize',3)%pins
  plot(Ax,Ay,'o','MarkerSize',3,'markerfacecolor','r');
   plot(Bx,By,'o','MarkerSize',3,'markerfacecolor','B');
  hold off 
   axis equal
   axis([-200 1500 -1000 700])
   M(-i*2+156)=getframe;
end
size(M)

 for i=-[570:10:800]+570+800
 Px=415;Py=0-i;Qx=785;Qy=Py;Rx=Qx;Ry=Qy+560;Sx=Px;Sy=Ry;Vx=Bx;Vy=80;Wx=Bx;Wy=Ry;Xx=Bx;Xy=Qy;
  plot([Ux,Hx,Kx,Jx,Tx],[Uy,Hy,Ky,Jy,Ty],'k')%frame
  hold on
  plot([Ex,Ax,Dx,Cx],[Ey,Ay,Dy,Cy],'y')%linkage
  plot([Dx,Vx,Bx],[Dy,Vy,By],'b')%linkage
  plot([Wx,Bx,Xx],[Wy,By,Xy],'b')%railway
  plot([F2x,F4x,F5x,F3x,F2x],[F2y,F4y,F5y,F3y,F2y],'g')%sliderF
  plot([D1x,D2x,D3x,D4x,D1x],[D1y,D2y,D3y,D4y,D1y],'r')%Slider D
  plot([Ex,Fx],[Ey,Fy],'b')
   plot([Rx,Sx,Px,Qx,Rx,Wx,Bx],[Ry,Sy,Py,Qy,Ry,Wy,By])%outpart
  plot([Lx,Mx,Nx,Ox,Lx],[Ly,My,Ny,Oy,Ly],'g')  
  plot(Fx,Fy,'o',Ex,Ey,'o',Ax,Ay,'o',Bx,By,'o',Dx,Dy,'o','MarkerSize',3)%pins
  plot(Ax,Ay,'o','MarkerSize',3,'markerfacecolor','r');
   plot(Bx,By,'o','MarkerSize',3,'markerfacecolor','B');
  hold off 
   axis equal
   axis([-200 1500 -1000 700])
    M((-i+800)/10+221)=getframe;
 end
    size(M)
    
    
for i=-[0:10:590]+570
 Px=415;Py=0-i;Qx=785;Qy=Py;Rx=Qx;Ry=Qy+560;Sx=Px;Sy=Ry;Vx=Bx;Vy=80;Wx=Bx;Wy=Ry;Xx=Bx;Xy=Qy;
  plot([Ux,Hx,Kx,Jx,Tx],[Uy,Hy,Ky,Jy,Ty],'k')%frame
  hold on
  plot([Ex,Ax,Dx,Cx],[Ey,Ay,Dy,Cy],'y')%linkage
  plot([Dx,Vx,Bx],[Dy,Vy,By],'b')%linkage
  plot([Wx,Bx,Xx],[Wy,By,Xy],'b')%railway
  plot([F2x,F4x,F5x,F3x,F2x],[F2y,F4y,F5y,F3y,F2y],'g')%sliderF
  plot([D1x,D2x,D3x,D4x,D1x],[D1y,D2y,D3y,D4y,D1y],'r')%Slider D
  plot([Ex,Fx],[Ey,Fy],'b')
   plot([Rx,Sx,Px,Qx,Rx,Wx,Bx],[Ry,Sy,Py,Qy,Ry,Wy,By])%outpart
  plot([Lx,Mx,Nx,Ox,Lx],[Ly,My,Ny,Oy,Ly],'g')  
  plot(Fx,Fy,'o',Ex,Ey,'o',Ax,Ay,'o',Bx,By,'o',Dx,Dy,'o','MarkerSize',3)%pins
  plot(Ax,Ay,'o','MarkerSize',3,'markerfacecolor','r');
   plot(Bx,By,'o','MarkerSize',3,'markerfacecolor','B');
  hold off 
   axis equal
   axis([-200 1500 -1000 700])
    M((-i+570)/10+245)=getframe;
end
VE(1,1)=5000;
VF(1,1)=5000;
VD(1,1)=5000;
vV(1,1)=5000;
min(abs(VE));
min(abs(VF));
min(abs(VD));
min(abs(VV));
%movie(M);
%movie2avi(M,'proj2.avi','FPS',24)