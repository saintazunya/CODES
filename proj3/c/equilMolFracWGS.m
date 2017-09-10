clear all
close all
%% kp for wgs
reactwgs={'CO','H2O'};
reactnwgs=[1 1];
prodwgs={'CO2','H2'};
prodnwgs=[1 1];
Kpwgs=zeros(1,length(25:25:100));
nch4=Kpwgs;
nh2o=Kpwgs;
nco=Kpwgs;
nh2=Kpwgs;
nco2=Kpwgs;

for Tc=25:25:1200
    T=273.15+Tc;
    count=Tc/25;
[Kpwgs(count)]=findkp(reactwgs, reactnwgs,prodwgs, prodnwgs,T);
kp=Kpwgs(count);
f=@(x)(((1-x)*(4-x)/(x*(1+x))-kp)*1e25);
 nco(count)=fsolve(f,0.1667,optimset('Display','off'));
 nh2o(count)=(1+nco(count))*100/6;
 nco2(count)=(1-nco(count))*100/6;
 nh2(count)=(4-nco(count))*100/6;
 nco(count)=nco(count)*100/6;
 Twgs=25:25:1200;
 if Tc==200
      Result_B6(1,:)=[nco(count) nh2o(count) nh2(count) nco2(count)];
 elseif Tc==500;
      Result_B6(2,:)=[nco(count) nh2o(count) nh2(count) nco2(count)];  
      Result_B6(3,:)= Result_B6(2,:);
      Result_B6(4,:)= Result_B6(2,:);
 elseif Tc==700
      Result_B6(5,:)=[nco(count) nh2o(count) nh2(count) nco2(count)];
      Result_B6(6,:)=Result_B6(5,:);
      Result_B6(7,:)=Result_B6(5,:);
 elseif Tc==1200
     Result_B6(8,:)=[nco(count) nh2o(count) nh2(count) nco2(count)];
 end
end
 figure(1)
 plot(Twgs,nco,'r')
 hold on
 plot(Twgs,nh2o,'g')
 plot(Twgs,nco2,'b')
 plot(Twgs,nh2,'y')
 legend('CO','H2O','CO2','H2')
 axis([0 1200 0 100]);
 title('P=0.1 MPa&1 MPa&10 MPa');

