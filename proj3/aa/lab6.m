F=imread('lab6.jpg');
B=F(:,:,1);
Down=zeros(1,322);
for j=1:322
 for i=1:55
   if B(i,j)>200
    Down(1,j)=i;
   end
 end
end