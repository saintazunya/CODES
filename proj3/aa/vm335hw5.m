L=0:0.1:10;
for i=1:101
    G(i)=0.2*L(i)^2/(1+L(i)^2)^2;
end
plot(L,G)