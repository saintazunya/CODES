C=zeros(1,100)



    n=20;
a=0;
c=(4*n+1);
for i=1:4:c
    a=a+nchoosek(c,i);
end
a
b=2^(4*n-1)+(-1)^(n)*2^(2*n-1)



