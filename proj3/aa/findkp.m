function [Kp]=findkp(react, reactn,prod, prodn,T)
% ??G rxn = G react ? G prod
%kp=exp(-grxn/(Ru*T))
%unit in kmol 
%base on 1 equation 
%react={'a','b','c'}
%reactn=[1 2 3 4], not fraction but molar number in equation
%product similar to react
%prodn similar to reactn
R = 8.31447; % kJ/(kmol*K)
P=101.3;
lengthreact=length(react);
lengthprod=length(prod);
Grt=zeros(1,lengthreact);
Gpt=zeros(1,lengthprod);
for i=1:lengthreact
    gasr=react{i};
Grt(i)=findSpeciesGibbs(gasr,T,P)*reactn(i);
end
Gr=sum(Grt);
for i=1:lengthprod
    gasp=prod{i};
    Gpt(i)=findSpeciesGibbs(gasp,T,P)*prodn(i);
end
Gp=sum(Gpt);
Grxn=-Gr+Gp;
Kp=exp(-Grxn/(R*T));