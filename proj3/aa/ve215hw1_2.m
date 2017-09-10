x=0:0.1:6;
y1=1.5*x.^2;
plot(x,y1);
hold on 
x=6:0.1:10;
y2=-54+18*x;
plot(x,y2);
hold on 
x=10:0.1:15;
y3=120+126-12*x;
plot(x,y3);
hold on 
x=15:0.01:20;
y4=66;
plot(x,y4)