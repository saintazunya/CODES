p = imread('IS_2.jpg'); %��ȡͼ��
rs = size(p, 1); cs = size(p, 2);%ȡͼ���������
sz =100 ;%���ÿ�Ĵ�С
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