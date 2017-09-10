p = imread('IS_2.jpg'); %读取图像
rs = size(p, 1); cs = size(p, 2);%取图像的行列数
sz =100 ;%设置块的大小
ch = sz; cw = sz;
numr = rs/sz;
numc = cs/sz;
t1 = (0:numr-1)*ch+1 ;
t3 = (0:numc-1)*cw +1;
figure;
for i = 1 : numr
    for j = 1 : numc
     p(t1(i),:,:)=0;
     p(:,t3(j),:)=0;
    end
end
imshow(p);