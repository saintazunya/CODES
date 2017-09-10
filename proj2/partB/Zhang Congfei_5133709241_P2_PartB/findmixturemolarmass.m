function [Molarformixture]= findmixturemolarmass( mixture, mixturefrac )  
% mixture is a cell
% mixutrefrac is a matrix e.g. [1 2 3 4]
mixturefrac=mixturefrac/100;
Looptime=length(mixture);
Molarair=zeros(size(mixture));
molarMass=zeros(size(mixture));
for i=1:Looptime(1)
    gasname= mixture{i};
    molarMass(i)=Find_Ideal_Gas_Properties( gasname, 'Molar_mass' );
    Molarair(i)=molarMass(i)*mixturefrac(i);
end
Molarformixture=sum(Molarair);