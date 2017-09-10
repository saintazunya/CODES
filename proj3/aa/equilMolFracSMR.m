close all; clear all
%% kp for   SMR
reactsmr={'CH4','H2O'};
reactnsmr=[1 1];
prodsmr={'CO','H2'};
prodnsmr=[1 3];
Kpsmr=zeros(1,length(25:25:1200));
Kpwgs=Kpsmr;
nch4n=Kpsmr;
nch4=Kpsmr;
nh2o=Kpsmr;
nco=Kpsmr;
nh2=Kpsmr;
P0=101.3;
for i=1:3 
 switch i
     case 1
       P=100;
     case 2
       P=1000;
     case 3
       P=10000;
 end
for Tc=25:25:1200
    T=273.15+Tc;
    count=Tc/25;
[Kpsmr(count)]=findkp(reactsmr, reactnsmr,prodsmr, prodnsmr,T);
% h2o:ch4=3:1
% (kp + (3*kp + 1)^(1/2) + 1)/(kp - 1)
kp=Kpsmr(count);
f=@(x)((((1-x)^4*27)/(x*(2+x)*(6-2*x)^2)-kp/(P/P0)^2)*1e25);
 nch4n(count)=fsolve(f,0.3,optimset('Display','off'));
 nch4(count)=nch4n(count)/(6-2*nch4n(count))*99;
 nh2o(count)=(2+nch4n(count))/(6-2*nch4n(count))*100;
 nco(count)=(1-nch4n(count))/(6-2*nch4n(count))*100;
 nh2(count)=300*(1-nch4n(count))/(6-2*nch4n(count));
 %% geting required results
 if     i==1;
     if Tc==200;
         Result_B5(1,:)=[nch4(count) nh2o(count) nh2(count) nco(count)];
     elseif Tc==500;
         Result_B5(2,:)=[nch4(count) nh2o(count) nh2(count) nco(count)];
     elseif Tc==700;
         Result_B5(5,:)=[nch4(count) nh2o(count) nh2(count) nco(count)];
     elseif  Tc==1200;
         Result_B5(8,:)=[nch4(count) nh2o(count) nh2(count) nco(count)];
     end
 elseif i==2;
    if Tc==500;
      Result_B5(3,:)=[nch4(count) nh2o(count) nh2(count) nco(count)];
    elseif Tc==700;
      Result_B5(6,:)=[nch4(count) nh2o(count) nh2(count) nco(count)];
    end
 elseif i==3;
     if Tc==500;
      Result_B5(4,:)=[nch4(count) nh2o(count) nh2(count) nco(count)];
    elseif Tc==700;
      Result_B5(7,:)=[nch4(count) nh2o(count) nh2(count) nco(count)];
    end
 end
end
Tsmr=25:25:1200;
%% ploting process
figure(1)
switch i
    case 1
 plot(Tsmr,nch4,'--r')
 hold on
 plot(Tsmr,nh2o,'--g')
 plot(Tsmr,nco,'--b')
 plot(Tsmr,nh2,'--y')
 axis([0 1200 0 100])
    case 2 
 plot(Tsmr,nch4,'r:')
 hold on
 plot(Tsmr,nh2o,'g:')
 plot(Tsmr,nco,'b:')
 plot(Tsmr,nh2,'y:')
 axis([0 1200 0 100])
    case 3
 plot(Tsmr,nch4,'r')
 hold on
 plot(Tsmr,nh2o,'g')
 plot(Tsmr,nco,'b')
 plot(Tsmr,nh2,'y')
 axis([0 1200 0 100])
end
legend('CH4@P=0.1 MPa','H2O@P=0.1 MP','CO@P=0.1 MP','H2@P=0.1 MP','CH4@P=1 MPa','H2O@P=1 MP','CO@P=1 MP','H2@P=1 MP','CH4@P=10 MPa','H2O@P=10 MP','CO@P=10 MP','H2@P=10 MP')
end
