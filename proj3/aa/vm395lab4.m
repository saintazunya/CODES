I=imread('40X_4.bmp');
J=rgb2gray(I);
 i=270;
for k=1:1:512
 if J(k,i)>=230
     disp('row&column')
     disp(i)
     disp(k)
     end
end
