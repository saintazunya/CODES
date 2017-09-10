function [ mixg ] = findMixtureGibbs( mixture, mixfrac, mixT,mixP )
% in /kg
mixfrac=mixfrac/100;
lengthmix=length(mixture);
spg=zeros(1,lengthmix);
p=zeros(1,lengthmix);
for i=1:lengthmix
     p(i)=mixfrac(i)*mixP;
     if p(i)==0
         spg(i)=0;
     else
    [ spg(i) ] = (findSpeciesGibbs( mixture{i}, mixT,p(i)))*mixfrac(i);
     end
end
mixg=sum(spg);
    
