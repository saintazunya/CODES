clc;close;
clear all;
r= importdata('backup.txt');
x = r(:,1);
y= r(:,3);
z=r(:,2);
x1=[];
y1=[];
s=0;
standarderror=0;
steady=[];
%plot(x,y);
 %DAT = iddata(y,z,0.05);
 %model=pem(DAT,'P2U')
 %k=model.Kp.value;
 %tw=model.Tw.value;
 %zt=model.Zeta.value;
 %plot(model);
 l=length(x);
for i=1:1:l
    x1(i)=x(i);
    y1(i)=y(i);
end
for i=50:1:l
    if y1(i)>1.025*y1(i-1)
        y1(i)=1.025*y1(i-1);
    end
    if y1(i)<0.975*y1(i-1)
        y1(i)=0.975*y1(i-1);
    end 
end
for i=l-99:1:l
        s=s+y1(i);
end   
s=s/100;
steadyerror=250-s
s10=s/10;
s90=s/10*9;
t10=0;
t90=0;
for i=1:1:950  %risetime
    if y1(i)<= s10 && y1(i+1)>s10
        t10=x(i);
    end
    if y1(i)<= s90 && y1(i+1)>s90 && y1(i+2)>s90 && y1(i+3)>s90 && y1(i+4)>s90 && y1(i+5)>s90 && y1(i+6)>s90
        t90=x(i);
        i
        break
    end
end
for i=1:1:l-5  %risetime
    if y1(i)<= 250 && y1(i+1)>=250 && y1(i+2)>=250 && y1(i+3)>=250 && y1(i+4)>=250 && y1(i+5)>=250 && y1(i+6)>=250
        sttime=x(i);
        break
    else 
        sttime=x(l);
    end
end
sttime
for i=l-99:1:l
    standarderror=standarderror+(y1(i)-s)^2;
end
standarderror=sqrt(standarderror)/99
risetime=t90-t10
%subplot(2,2,1);
%plot(x1,s,'r');
%hold on;
%subplot(2,2,2);
%plot(x1,s10,'r');
%hold on;
%subplot(2,2,3);
%plot(x1,s90,'r');
%hold on;
subplot(2,2,1);
plot(x1,y1);


