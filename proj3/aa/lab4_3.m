clear;close all; 
p = imread('IS_48.jpg'); %读取图像 
figure,imshow(p); 
hold on 
[mm,nn,~]=size(p); %调节N可以改变网格大小  
x=0:300:nn+300; 
y=0:300:nn+300; 
M=meshgrid(x,y); 
plot(x,M,'r');%用红线画网格 
hold on; 
plot(M,y,'r'); 