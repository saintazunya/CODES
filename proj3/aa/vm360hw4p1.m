num1=[1.268];
den1=[1 3 2.2536 1.268];
sys1=tf(num1,den1);
time=0:0.1:30;
y1=step(sys1,time);
num2=[5];
den2=[1 3 3 5];
sys2=tf(num2,den2);
y2=step(sys2,time);
plot(time,y1,'g',time,y2,'b')


num1=[1];
den1=[1 0 1];
sys1=tf(num1,den1);
time=0:0.1:15;
y1=step(sys1,time);
num2=[2 2];
den2=[1 2 2];
sys2=tf(num2,den2);
y2=step(sys2,time);
num3=[2];
den3=[1 2 2];
sys3=tf(num3,den3);
y3=step(sys3,time);
num4=[4 2];
den4=[1 3 4 2];
sys4=tf(num4,den4);
y4=step(sys4,time);
plot(time,y1,'b',time,y2,'g',time,y3,'r',time,y4,'y')



