clear;close all; 
p = imread('IS_48.jpg'); %��ȡͼ�� 
figure,imshow(p); 
hold on 
[mm,nn,~]=size(p); %����N���Ըı������С  
x=0:300:nn+300; 
y=0:300:nn+300; 
M=meshgrid(x,y); 
plot(x,M,'r');%�ú��߻����� 
hold on; 
plot(M,y,'r'); 