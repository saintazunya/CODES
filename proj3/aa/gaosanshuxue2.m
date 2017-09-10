x=0:0.01:5;
y=(1+sin(x.*pi)/5).*(sin(x.*(4*pi)+pi/3));
plot(x,y)