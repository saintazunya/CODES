F=imread('lab6_2.jpg');
B=F(:,:,1);
Up=zeros(1,322);
for j=1:322
 for i=1:55
   if B(i,j)>200
    Up(1,j)=i;
   end
 end
end
