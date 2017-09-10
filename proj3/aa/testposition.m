a=20;
L=16;
%intital conditions
Ay=-a*sin(36/180*pi);
Ax=0;
Bx=a*cos(36/180*pi);
By=0;
Ex=1/2*(Ax+Bx);
Ey=1/2*(Ay+By);
Fx=Ex;
Fy=Ey-16;
Dx=Fx+1/2*a*cos(0/180*pi);
Dy=Fy-1/2*a*sin(0/180*pi);
Cx=0;
Cy=Fy+1/2*a*sin(0/180*pi);
line([Ax Bx],[Ay By]);
line([Cx Dx],[Cy Dy]);
line([Ex Fx],[Ey Fy]);
%-----------------------%
%stright forward movement
DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
BA=AA-BB;
 for i=0:3:72
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*CD;
    rotatetemp2=Rotate2*BA;
    Ax=rotatetemp2(1,1)+Bx;
    Ay=rotatetemp2(2,1)+By;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fy=Ey-16;
    Dy=Fy;
    Cy=Fy;
    plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3);
    line([Ax Bx],[Ay By]);
    line([Cx Dx],[Cy Dy]);
    line([Ex Fx],[Ey Fy]);
    axis equal;
       axis([-100 100 -100 100]);
  M(i/3+1)=getframe;
 end

DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
DC=-DD+CC;
AB=-AA+BB;
 for i=0:3:72
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fy=Ey-16;
    Dy=Fy;
    Cy=Fy;
     plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3);
    line([Ax Bx],[Ay By]);
    line([Cx Dx],[Cy Dy]);
    line([Ex Fx],[Ey Fy]);
    axis equal;
     axis([-100 100 -100 100]);
   M(i/3+25)=getframe;
 end
 DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
BA=AA-BB;
 for i=0:3:72
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*CD;
    rotatetemp2=Rotate2*BA;
    Ax=rotatetemp2(1,1)+Bx;
    Ay=rotatetemp2(2,1)+By;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fy=Ey-16;
    Dy=Fy;
    Cy=Fy;
     plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3);
    line([Ax Bx],[Ay By]);
    line([Cx Dx],[Cy Dy]);
    line([Ex Fx],[Ey Fy]);
    axis equal;
    axis([-100 100 -100 100]);
  M(i/3+50)=getframe;
 end
DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
DC=-DD+CC;
AB=-AA+BB;
 for i=0:3:72
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fy=Ey-16;
    Dy=Fy;
    Cy=Fy;
   plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3);
    line([Ax Bx],[Ay By]);
    line([Cx Dx],[Cy Dy]);
    line([Ex Fx],[Ey Fy]);
    axis equal;
     axis([-100 100 -100 100]);
   M(i/3+75)=getframe;
 end
movie(M)
movie2avi(M,'straight.avi','FPS',24)