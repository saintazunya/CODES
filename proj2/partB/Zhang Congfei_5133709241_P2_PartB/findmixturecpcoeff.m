function [cpcoeff]= findmixturecpcoeff(mixture ,mixturefraction)
% mixture is a cell
for i=1:8
    compname=mixture{i};
    cp(i,:)=Find_Ideal_Gas_Properties( compname, 'Cp_coeff' );
end
cpp=zeros(1,4);
for i=1:8
cpp=cpp+cp(i,:)*mixturefraction(i)/100;
end
cpcoeff=cpp;