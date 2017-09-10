clc
clear
 
%mu0=0;
%sigma=1;
%USL=6;LSL=-6
%n: number of subgroups; m: subgroup size
 
Delta=3;
M=100;
N=100;
A=10000;
 
for delta=0:0.5:Delta
    for m=5:5:M
        for n=5:5:N
            for i=1:A
                X=normrnd(delta,1,[m,n]);
                mu=mean(mean(X));
                sigma=mean(std(X,0,1));%use Sbar to estimate sigma
                cpk(i)=min((6-mu)/(3*sigma),(mu+6)/(3*sigma));
            end
            cpk_true=min((6-delta)/3,(6+delta)/3);
            cpk_estimated=mean(cpk);
            upper_CI_cpk=mean(cpk)+1.96*std(cpk);%CI of cpk,not the CI of average cpk.
            lower_CI_cpk=mean(cpk)-1.96*std(cpk);
        end
    end
end
