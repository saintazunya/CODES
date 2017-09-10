clear
a=20;
L=16;
%intital conditions
Ay=-a*sin(18/180*pi);
Ax=0;
Bx=a*cos(18/180*pi);
By=0;
Ex=1/2*(Ax+Bx);
Ey=1/2*(Ay+By);
Fx=Ex;
Fy=Ey-16;
Dx=Fx+1/2*a*cos(18/180*pi);
Dy=Fy-1/2*a*sin(18/180*pi);
Cx=0;
Cy=Fy+1/2*a*sin(18/180*pi);
plot([Ax Bx],[Ay By]);
hold on
plot([Cx Dx],[Cy Dy]);
plot([Ex Fx],[Ey Fy]);
hold off
%-----------------------%
%stright forward movement
DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
BA=AA-BB;
 for i=0:2:36
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*CD;
    rotatetemp2=Rotate2*BA;
    Ax=rotatetemp2(1,1)+Bx;
    Ay=rotatetemp2(2,1)+By;
    Dx=rotatetemp1(1,1)+Cx;
    Dy=rotatetemp1(2,1)+Cy;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fx=1/2*(Cx+Dx);
    Fy=1/2*(Cy+Dy);
    plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
      axis([-50 50 -50 50]);
      hold off
 %set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120])
  M(i/2+1)=getframe;
 end

DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
    DC=-DD+CC;
AB=-AA+BB;
 for i=0:2:36
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay;
    Cx=rotatetemp2(1,1)+Dx;
    Cy=rotatetemp2(2,1)+Dy;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fx=1/2*(Cx+Dx);
    Fy=1/2*(Cy+Dy);
     plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
      axis([-50 50 -50 50]);
         hold off
 %set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+20)=getframe;
 end
 DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
BA=AA-BB;
 for i=0:2:36
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*CD;
    rotatetemp2=Rotate2*BA;
    Ax=rotatetemp2(1,1)+Bx;
    Ay=rotatetemp2(2,1)+By;
    Dx=rotatetemp1(1,1)+Cx;
    Dy=rotatetemp1(2,1)+Cy;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fx=1/2*(Cx+Dx);
    Fy=1/2*(Cy+Dy);
    plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
      axis([-50 50 -50 50]);
         hold off
 %set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120])
  M(i/2+39)=getframe;
 end

DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
DC=-DD+CC;
AB=-AA+BB;
 for i=0:2:36
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay;
    Cx=rotatetemp2(1,1)+Dx;
    Cy=rotatetemp2(2,1)+Dy;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fx=1/2*(Cx+Dx);
    Fy=1/2*(Cy+Dy);
     plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+58)=getframe;
 end

 DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
BA=AA-BB;
 for i=0:2:36
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*CD;
    rotatetemp2=Rotate2*BA;
    Ax=rotatetemp2(1,1)+Bx;
    Ay=rotatetemp2(2,1)+By;
    Dx=rotatetemp1(1,1)+Cx;
    Dy=rotatetemp1(2,1)+Cy;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fx=1/2*(Cx+Dx);
    Fy=1/2*(Cy+Dy);
     plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120])
  M(i/2+77)=getframe;
 end
DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
DC=-DD+CC;
AB=-AA+BB;
 for i=0:2:36
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay;
    Cx=rotatetemp2(1,1)+Dx;
    Cy=rotatetemp2(2,1)+Dy;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fx=1/2*(Cx+Dx);
    Fy=1/2*(Cy+Dy);
   plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+96)=getframe;
 end
DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
BA=AA-BB;
for i=0:2:36
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*CD;
    rotatetemp2=Rotate2*BA;
    Ax=rotatetemp2(1,1)+Bx;
    Ay=rotatetemp2(2,1)+By;
    Dx=rotatetemp1(1,1)+Cx;
    Dy=rotatetemp1(2,1)+Cy;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fx=1/2*(Cx+Dx);
    Fy=1/2*(Cy+Dy);
    plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
  M(i/2+115)=getframe;
end
DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
DC=-DD+CC;
AB=-AA+BB;
 for i=0:2:36
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay;
    Cx=rotatetemp2(1,1)+Dx;
    Cy=rotatetemp2(2,1)+Dy;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fx=1/2*(Cx+Dx);
    Fy=1/2*(Cy+Dy);
  plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+134)=getframe;
 end
DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
BA=AA-BB;
for i=0:2:36
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*CD;
    rotatetemp2=Rotate2*BA;
    Ax=rotatetemp2(1,1)+Bx;
    Ay=rotatetemp2(2,1)+By;
    Dx=rotatetemp1(1,1)+Cx;
    Dy=rotatetemp1(2,1)+Cy;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fx=1/2*(Cx+Dx);
    Fy=1/2*(Cy+Dy);
    plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120])
  M(i/2+153)=getframe;
end
DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
DC=-DD+CC;
AB=-AA+BB;
 for i=0:2:36
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay;
    Cx=rotatetemp2(1,1)+Dx;
    Cy=rotatetemp2(2,1)+Dy;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fx=1/2*(Cx+Dx);
    Fy=1/2*(Cy+Dy);
  plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+172)=getframe;
 end
DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
BA=AA-BB;
for i=0:2:36
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*CD;
    rotatetemp2=Rotate2*BA;
    Ax=rotatetemp2(1,1)+Bx;
    Ay=rotatetemp2(2,1)+By;
    Dx=rotatetemp1(1,1)+Cx;
    Dy=rotatetemp1(2,1)+Cy;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fx=1/2*(Cx+Dx);
    Fy=1/2*(Cy+Dy);
    plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120])
  M(i/2+191)=getframe;
end
DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
DC=-DD+CC;
AB=-AA+BB;
 for i=0:2:36
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay;
    Cx=rotatetemp2(1,1)+Dx;
    Cy=rotatetemp2(2,1)+Dy;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fx=1/2*(Cx+Dx);
    Fy=1/2*(Cy+Dy);
  plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+210)=getframe;
 end
DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
BA=AA-BB;
for i=0:2:36
    Rotate1=[cos(i/180*pi) -sin(i/180*pi);sin(i/180*pi) cos(i/180*pi)];
    Rotate2=[cos(-i/180*pi) -sin(-i/180*pi);sin(-i/180*pi) cos(-i/180*pi)];
    rotatetemp1=Rotate1*CD;
    rotatetemp2=Rotate2*BA;
    Ax=rotatetemp2(1,1)+Bx;
    Ay=rotatetemp2(2,1)+By;
    Dx=rotatetemp1(1,1)+Cx;
    Dy=rotatetemp1(2,1)+Cy;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);
    Fx=1/2*(Cx+Dx);
    Fy=1/2*(Cy+Dy);
    plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120])
  M(i/2+229)=getframe;
end

%--！！！！！！！！！！！！！！turn starts

DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
DC=-DD+CC;
AB=-AA+BB;
    for i=0:2:36
    Rotate1=[cos((2.2*i)/180*pi) -sin((2.2*i)/180*pi);sin((2.2*i)/180*pi) cos((2.2*i)/180*pi)];
    Rotate2=[cos(-0.76*i/180*pi) -sin(-0.76*i/180*pi);sin(-0.76*i/180*pi) cos(-0.76*i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay;
    FE=[Ex-Fx;Ey-Fy];
    FEn=FE/(norm(FE));
    Fx=Ex-FEn(1,1)*16;
    Fy=Ey-FEn(2,1)*16;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);  
    Cx=0.5*rotatetemp2(1,1)+Fx;
    Cy=0.5*rotatetemp2(2,1)+Fy;
    Dx=-0.5*rotatetemp2(1,1)+Fx;
    Dy=-0.5*rotatetemp2(2,1)+Fy;
   plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+248)=getframe;
    end
DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
BA=AA-BB;
       for i=0:2:36
    Rotate1=[cos((-0.92*i)/180*pi) -sin((-0.92*i)/180*pi);sin((-0.92*i)/180*pi) cos((-0.92*i)/180*pi)];
    Rotate2=[cos(1.5*i/180*pi) -sin(1.5*i/180*pi);sin(1.5*i/180*pi) cos(1.5*i/180*pi)];
    rotatetemp1=Rotate1*BA;
    rotatetemp2=Rotate2*CD;
    Ax=rotatetemp1(1,1)+Bx;
    Ay=rotatetemp1(2,1)+By;
    FE=[Ex-Fx;Ey-Fy];
    FEn=FE/(norm(FE));
    Fx=Ex-FEn(1,1)*16;
    Fy=Ey-FEn(2,1)*16;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);  
    Cx=-0.5*rotatetemp2(1,1)+Fx;
    Cy=-0.5*rotatetemp2(2,1)+Fy;
    Dx=+0.5*rotatetemp2(1,1)+Fx;
    Dy=+0.5*rotatetemp2(2,1)+Fy;
   plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+267)=getframe;
       end
 
DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
DC=-DD+CC;
AB=-AA+BB;
 for i=0:2:36
    Rotate1=[cos((2.2*i)/180*pi) -sin((2.2*i)/180*pi);sin((2.2*i)/180*pi) cos((2.2*i)/180*pi)];
    Rotate2=[cos(-0.76*i/180*pi) -sin(-0.76*i/180*pi);sin(-0.76*i/180*pi) cos(-0.76*i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay;
    FE=[Ex-Fx;Ey-Fy];
    FEn=FE/(norm(FE));
    Fx=Ex-FEn(1,1)*16;
    Fy=Ey-FEn(2,1)*16;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);  
    Cx=0.5*rotatetemp2(1,1)+Fx;
    Cy=0.5*rotatetemp2(2,1)+Fy;
    Dx=-0.5*rotatetemp2(1,1)+Fx;
    Dy=-0.5*rotatetemp2(2,1)+Fy;
   plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+286)=getframe;
    end
    DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
BA=AA-BB;
       for i=0:2:36
    Rotate1=[cos((-i)/180*pi) -sin((-i)/180*pi);sin((-i)/180*pi) cos((-i)/180*pi)];
    Rotate2=[cos(1.5*i/180*pi) -sin(1.5*i/180*pi);sin(1.5*i/180*pi) cos(1.5*i/180*pi)];
    rotatetemp1=Rotate1*BA;
    rotatetemp2=Rotate2*CD;
    Ax=rotatetemp1(1,1)+Bx;
    Ay=rotatetemp1(2,1)+By;
    FE=[Ex-Fx;Ey-Fy];
    FEn=FE/(norm(FE));
   Fx=Ex-FEn(1,1)*16;
   Fy=Ey-FEn(2,1)*16;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);  
    Cx=-0.5*rotatetemp2(1,1)+Fx;
    Cy=-0.5*rotatetemp2(2,1)+Fy;
    Dx=+0.5*rotatetemp2(1,1)+Fx;
    Dy=+0.5*rotatetemp2(2,1)+Fy;
   plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+305)=getframe;
       end
        
DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
DC=-DD+CC;
AB=-AA+BB;
for i=0:2:36
    Rotate1=[cos((i)/180*pi) -sin((i)/180*pi);sin((i)/180*pi) cos((i)/180*pi)];
    Rotate2=[cos(-1.1*i/180*pi) -sin(-1.1*i/180*pi);sin(-1.1*i/180*pi) cos(-1.1*i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay;
    FE=[Ex-Fx;Ey-Fy];
    FEn=FE/(norm(FE));
  Fx=Ex-FEn(1,1)*16;
    Fy=Ey-FEn(2,1)*16;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);  
    Cx=0.5*rotatetemp2(1,1)+Fx;
    Cy=0.5*rotatetemp2(2,1)+Fy;
    Dx=-0.5*rotatetemp2(1,1)+Fx;
    Dy=-0.5*rotatetemp2(2,1)+Fy;
    plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+324)=getframe;
 end
    DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
    BA=AA-BB;
 for i=0:2:36
    Rotate1=[cos((-0.7*i)/180*pi) -sin((-0.7*i)/180*pi);sin((-0.7*i)/180*pi) cos((-0.7*i)/180*pi)];
    Rotate2=[cos(1.5*i/180*pi) -sin(1.5*i/180*pi);sin(1.5*i/180*pi) cos(1.5*i/180*pi)];
    rotatetemp1=Rotate1*BA;
    rotatetemp2=Rotate2*CD;
    Ax=rotatetemp1(1,1)+Bx;
    Ay=rotatetemp1(2,1)+By;
    FE=[Ex-Fx;Ey-Fy];
    FEn=FE/(norm(FE));
    Fx=Ex-FEn(1,1)*16;
    Fy=Ey-FEn(2,1)*16;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);  
    Cx=-0.5*rotatetemp2(1,1)+Fx;
    Cy=-0.5*rotatetemp2(2,1)+Fy;
    Dx=+0.5*rotatetemp2(1,1)+Fx;
    Dy=+0.5*rotatetemp2(2,1)+Fy;
  plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3);hold on
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+343)=getframe;
 end
  DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
DC=-DD+CC;
AB=-AA+BB;
for i=0:2:36
    Rotate1=[cos((i)/180*pi) -sin((i)/180*pi);sin((i)/180*pi) cos((i)/180*pi)];
    Rotate2=[cos(-1*i/180*pi) -sin(-1*i/180*pi);sin(-1*i/180*pi) cos(-1*i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay;
    FE=[Ex-Fx;Ey-Fy];
    FEn=FE/(norm(FE));
  Fx=Ex-FEn(1,1)*16;
    Fy=Ey-FEn(2,1)*16;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);  
    Cx=0.5*rotatetemp2(1,1)+Fx;
    Cy=0.5*rotatetemp2(2,1)+Fy;
    Dx=-0.5*rotatetemp2(1,1)+Fx;
    Dy=-0.5*rotatetemp2(2,1)+Fy;
    plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+362)=getframe;
 end
    DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
    BA=AA-BB;
 for i=0:2:36
    Rotate1=[cos((-1*i)/180*pi) -sin((-1*i)/180*pi);sin((-1*i)/180*pi) cos((-1*i)/180*pi)];
    Rotate2=[cos(1.7*i/180*pi) -sin(1.7*i/180*pi);sin(1.7*i/180*pi) cos(1.7*i/180*pi)];
    rotatetemp1=Rotate1*BA;
    rotatetemp2=Rotate2*CD;
    Ax=rotatetemp1(1,1)+Bx;
    Ay=rotatetemp1(2,1)+By;
    FE=[Ex-Fx;Ey-Fy];
    FEn=FE/(norm(FE));
    Fx=Ex-FEn(1,1)*16;
    Fy=Ey-FEn(2,1)*16;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);  
    Cx=-0.5*rotatetemp2(1,1)+Fx;
    Cy=-0.5*rotatetemp2(2,1)+Fy;
    Dx=+0.5*rotatetemp2(1,1)+Fx;
    Dy=+0.5*rotatetemp2(2,1)+Fy;
  plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3);hold on
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+381)=getframe;
       end
 DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
DC=-DD+CC;
AB=-AA+BB;
for i=0:2:36
    Rotate1=[cos((i)/180*pi) -sin((i)/180*pi);sin((i)/180*pi) cos((i)/180*pi)];
    Rotate2=[cos(-1*i/180*pi) -sin(-1*i/180*pi);sin(-1*i/180*pi) cos(-1*i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay;
    FE=[Ex-Fx;Ey-Fy];
    FEn=FE/(norm(FE));
  Fx=Ex-FEn(1,1)*16;
    Fy=Ey-FEn(2,1)*16;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);  
    Cx=0.5*rotatetemp2(1,1)+Fx;
    Cy=0.5*rotatetemp2(2,1)+Fy;
    Dx=-0.5*rotatetemp2(1,1)+Fx;
    Dy=-0.5*rotatetemp2(2,1)+Fy;
    plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+400)=getframe;
 end
 DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
    BA=AA-BB;
 for i=0:2:36
    Rotate1=[cos((-1*i)/180*pi) -sin((-1*i)/180*pi);sin((-1*i)/180*pi) cos((-1*i)/180*pi)];
    Rotate2=[cos(1*i/180*pi) -sin(1*i/180*pi);sin(1*i/180*pi) cos(1*i/180*pi)];
    rotatetemp1=Rotate1*BA;
    rotatetemp2=Rotate2*CD;
    Ax=rotatetemp1(1,1)+Bx;
    Ay=rotatetemp1(2,1)+By;
    FE=[Ex-Fx;Ey-Fy];
    FEn=FE/(norm(FE));
    Fx=Ex-FEn(1,1)*16;
    Fy=Ey-FEn(2,1)*16;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);  
    Cx=-0.5*rotatetemp2(1,1)+Fx;
    Cy=-0.5*rotatetemp2(2,1)+Fy;
    Dx=+0.5*rotatetemp2(1,1)+Fx;
    Dy=+0.5*rotatetemp2(2,1)+Fy;
  plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3);hold on
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+419)=getframe;
       end
 DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
DC=-DD+CC;
AB=-AA+BB;
for i=0:2:36
    Rotate1=[cos((i)/180*pi) -sin((i)/180*pi);sin((i)/180*pi) cos((i)/180*pi)];
    Rotate2=[cos(-1*i/180*pi) -sin(-1*i/180*pi);sin(-1*i/180*pi) cos(-1*i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay;
    FE=[Ex-Fx;Ey-Fy];
    FEn=FE/(norm(FE));
  Fx=Ex-FEn(1,1)*16;
    Fy=Ey-FEn(2,1)*16;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);  
    Cx=0.5*rotatetemp2(1,1)+Fx;
    Cy=0.5*rotatetemp2(2,1)+Fy;
    Dx=-0.5*rotatetemp2(1,1)+Fx;
    Dy=-0.5*rotatetemp2(2,1)+Fy;
    plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+438)=getframe;
end
  DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
    BA=AA-BB;
 for i=0:2:36
    Rotate1=[cos((-1*i)/180*pi) -sin((-1*i)/180*pi);sin((-1*i)/180*pi) cos((-1*i)/180*pi)];
    Rotate2=[cos(1*i/180*pi) -sin(1*i/180*pi);sin(1*i/180*pi) cos(1*i/180*pi)];
    rotatetemp1=Rotate1*BA;
    rotatetemp2=Rotate2*CD;
    Ax=rotatetemp1(1,1)+Bx;
    Ay=rotatetemp1(2,1)+By;
    FE=[Ex-Fx;Ey-Fy];
    FEn=FE/(norm(FE));
    Fx=Ex-FEn(1,1)*16;
    Fy=Ey-FEn(2,1)*16;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);  
    Cx=-0.5*rotatetemp2(1,1)+Fx;
    Cy=-0.5*rotatetemp2(2,1)+Fy;
    Dx=+0.5*rotatetemp2(1,1)+Fx;
    Dy=+0.5*rotatetemp2(2,1)+Fy;
  plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3);hold on
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+457)=getframe;
 end
 DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
DC=-DD+CC;
AB=-AA+BB;
for i=0:2:36
    Rotate1=[cos((i)/180*pi) -sin((i)/180*pi);sin((i)/180*pi) cos((i)/180*pi)];
    Rotate2=[cos(-1*i/180*pi) -sin(-1*i/180*pi);sin(-1*i/180*pi) cos(-1*i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay;
    FE=[Ex-Fx;Ey-Fy];
    FEn=FE/(norm(FE));
  Fx=Ex-FEn(1,1)*16;
    Fy=Ey-FEn(2,1)*16;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);  
    Cx=0.5*rotatetemp2(1,1)+Fx;
    Cy=0.5*rotatetemp2(2,1)+Fy;
    Dx=-0.5*rotatetemp2(1,1)+Fx;
    Dy=-0.5*rotatetemp2(2,1)+Fy;
    plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+476)=getframe;
end
  DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
CD=DD-CC;
    BA=AA-BB;
 for i=0:2:36
    Rotate1=[cos((-1*i)/180*pi) -sin((-1*i)/180*pi);sin((-1*i)/180*pi) cos((-1*i)/180*pi)];
    Rotate2=[cos(1*i/180*pi) -sin(1*i/180*pi);sin(1*i/180*pi) cos(1*i/180*pi)];
    rotatetemp1=Rotate1*BA;
    rotatetemp2=Rotate2*CD;
    Ax=rotatetemp1(1,1)+Bx;
    Ay=rotatetemp1(2,1)+By;
    FE=[Ex-Fx;Ey-Fy];
    FEn=FE/(norm(FE));
    Fx=Ex-FEn(1,1)*16;
    Fy=Ey-FEn(2,1)*16;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);  
    Cx=-0.5*rotatetemp2(1,1)+Fx;
    Cy=-0.5*rotatetemp2(2,1)+Fy;
    Dx=+0.5*rotatetemp2(1,1)+Fx;
    Dy=+0.5*rotatetemp2(2,1)+Fy;
  plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3);hold on
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+495)=getframe;
 end
       DD=[Dx;Dy];
CC=[Cx;Cy];
AA=[Ax;Ay];
BB=[Bx;By];
DC=-DD+CC;
AB=-AA+BB;
for i=0:2:36
    Rotate1=[cos((i)/180*pi) -sin((i)/180*pi);sin((i)/180*pi) cos((i)/180*pi)];
    Rotate2=[cos(-1*i/180*pi) -sin(-1*i/180*pi);sin(-1*i/180*pi) cos(-1*i/180*pi)];
    rotatetemp1=Rotate1*AB;
    rotatetemp2=Rotate2*DC;
    Bx=rotatetemp1(1,1)+Ax;
    By=rotatetemp1(2,1)+Ay;
    FE=[Ex-Fx;Ey-Fy];
    FEn=FE/(norm(FE));
  Fx=Ex-FEn(1,1)*16;
    Fy=Ey-FEn(2,1)*16;
    Ex=1/2*(Ax+Bx);
    Ey=1/2*(Ay+By);  
    Cx=0.5*rotatetemp2(1,1)+Fx;
    Cy=0.5*rotatetemp2(2,1)+Fy;
    Dx=-0.5*rotatetemp2(1,1)+Fx;
    Dy=-0.5*rotatetemp2(2,1)+Fy;
    plot(Ax,Ay,'o',Bx,By,'o',Cx,Cy,'o',Dx,Dy,'o',Ex,Ey,'o',Fx,Fy,'o','MarkerSize',3); hold on 
    plot([Ax Bx],[Ay By]);
    plot([Cx Dx],[Cy Dy]);
    plot([Ex Fx],[Ey Fy]);
    axis equal;
 set (gcf,'Position',[100,100,400,400], 'color','w'),     plot([0 60 60 120 120 0 0]-80,[60 60 0 0 120 120 60],'m') ,     plot([120 60 60]-80,[60 60 120],'m--'),     hold off,     xlim([-40 120]-80),     ylim([-40 120]) 
   M(i/2+514)=getframe;
end
movie(M);
movie2avi(M,'positionanalysis2.avi','FPS',96);