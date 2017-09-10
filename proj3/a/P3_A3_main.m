%eff=-(Gprod-Greact)/(mfuel*heating value)
%reaction=  1/2o2+h2->h20
%on the base of 1 kmol H2
% in /kg unit
%hv=(Hp-Hr)/mfuel
% all in low heating value
clear all
%% chemical reaction
air={ 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8' };
airMoleFrac=[21 79 0 0 0 0 0 0];
airmolar=findmixturemolarmass(air,airMoleFrac);
%O2molar=Find_Ideal_Gas_Properties( 'O2', 'Molar_mass' );
fuel={'H2'};
fuelfrac=[100];
fuelmolar=Find_Ideal_Gas_Properties( fuel{1}, 'Molar_mass' );
watermolar=Find_Ideal_Gas_Properties( 'H2O', 'Molar_mass' );
figurecount=0;
pstd=100;
%% for air change
 figure(2);
 for mixT=([80 220 650 800]+273.15)
     figurecount=1+figurecount;
     aircount=0;
   for airamount=2:0.25:11
       aircount=aircount+1;
[ airStoich, ~, ~ ]=findCnHmStoichiometricCombustion( 0, 2, air, airMoleFrac );
AF=airamount*airStoich*airmolar/fuelmolar;
[ ~, prod, prodcomp ]=findCnHmleanCombustion( 0, 2, air, airMoleFrac, AF );
prodfrac=prodcomp/(sum(prodcomp))*100;
prodmolar=findmixturemolarmass(prod,prodfrac);
ph2=pstd;
po2=0.21*pstd;
tstd=25+273.15;
%% Gibbs free energy
Tg=mixT;
mf=1*fuelmolar;
ma=AF*mf;
[ spgH2 ] = findSpeciesGibbs( 'H2', Tg, ph2)/fuelmolar;
[airg]=findMixtureGibbs( air, airMoleFrac,airmolar,Tg,pstd )/airmolar;
[prodg]=findMixtureGibbs( prod, prodfrac,prodmolar,Tg,pstd )/prodmolar;
Greact=spgH2*mf+airg*ma;
Gprod=prodg*(ma+mf);
%% find reactnt property
Hf=findMixtureEnthalpy( tstd,  fuel, fuelfrac )*mf;
Ha=findMixtureEnthalpy( tstd,  air, airMoleFrac )*ma;
Hr=Hf+Ha;
%% find product property
water={'H2O'};
Hp=findMixtureEnthalpy( tstd,  water, [100] )*watermolar;
%% heat value
HV=-(Hp-Hr)/mf;
%% efficiency
effl{figurecount}(aircount)=100*(Greact-Gprod)/(mf*HV);
%end
   end
 end
   plot([100:25:1000],effl{1},'r');
   hold on
   plot([100:25:1000],effl{2},'g');
   plot([100:25:1000],effl{3},'b');
   plot([100:25:1000],effl{4},'k')
 xlabel('Air access rate %');
 ylabel('Efficiency %');
 legend('T=80 .C','T=220 .C','T=650 .C','T=800 .C');
 axis([100 1000 80 100])
%% Report results
Result_A3at(:,1)=effl{1};
Result_A3at(:,2)=effl{2};    
Result_A3at(:,3)=effl{3};
Result_A3at(:,4)=effl{4};
Result_A3a(1,:)=Result_A3at(1,:);
Result_A3a(2,:)=Result_A3at(9,:);
Result_A3a(3,:)=Result_A3at(17,:);
Result_A3a(4,:)=Result_A3at(25,:);
Result_A3a(5,:)=Result_A3at(37,:);
%% ---------------------------------next section---------------------------------------------------
figure(3);
%% for pressure change
air={ 'O2'; 'N2'; 'Ar'; 'CO2'; 'H2O'; 'CH4'; 'C2H6'; 'C3H8' };
airMoleFrac=[21 79 0 0 0 0 0 0];
airmolar=findmixturemolarmass(air,airMoleFrac);
%O2molar=Find_Ideal_Gas_Properties( 'O2', 'Molar_mass' );
fuel={'H2'};
fuelfrac=[100];
fuelmolar=Find_Ideal_Gas_Properties( fuel{1}, 'Molar_mass' );
watermolar=Find_Ideal_Gas_Properties( 'H2O', 'Molar_mass' );
 [ airStoich, ~, ~ ]=findCnHmStoichiometricCombustion( 0, 2, air, airMoleFrac );
AF=2*airStoich*airmolar/fuelmolar;
[ ~, prod, prodcomp ]=findCnHmleanCombustion( 0, 2, air, airMoleFrac, AF );
prodfrac=prodcomp/(sum(prodcomp))*100;
prodmolar=findmixturemolarmass(prod,prodfrac);
%effl2=zeros(size([(0.1:0.05:0.95),(1:0.2:4)]));
tstd=25+273.15;
figurecount=0;
for mixT=([80 220 650 800]+273.15)
    figurecount=1+figurecount;
    count=0;
    Tg=mixT;
    for pstd= [(10:5:100),(100:10:400)]
        count=count+1;
plength=length([(10:5:100),(100:10:400)]);
mf=1*fuelmolar;
ma=AF*mf;
ph2=pstd;
po2=0.21*pstd;
[ spgH2 ] = findSpeciesGibbs( 'H2', Tg, ph2)/fuelmolar;
[airg]=findMixtureGibbs( air, airMoleFrac,airmolar,Tg,pstd )/airmolar;
[prodg]=findMixtureGibbs( prod, prodfrac,prodmolar,Tg,pstd )/prodmolar;
Greact=spgH2*mf+airg*ma;
Gprod=prodg*(ma+mf);
%% find reactnt property
Hf=findMixtureEnthalpy( tstd,  fuel, fuelfrac )*mf;
Ha=findMixtureEnthalpy( tstd,  air, airMoleFrac )*ma;
Hr=Hf+Ha;
%% find product property
water={'H2O'};
Hp=findMixtureEnthalpy( tstd,  water, [100] )*watermolar;
%% heat value
HV=-(Hp-Hr)/mf;
%% efficiency
effl2{figurecount}(count)=100*(Greact-Gprod)/(mf*HV);
    end
%plot([(0.1:0.05:0.95),(1:0.2:4)]',effl2)
%hold on
end
%% plot for second section
 plot([(10:5:100),(100:10:400)]',effl2{1},'r')
 hold on
 plot([(10:5:100),(100:10:400)]',effl2{2},'g')
 plot([(10:5:100),(100:10:400)]',effl2{3},'b')
 plot([(10:5:100),(100:10:400)]',effl2{4},'k')
 legend('T=80 .C','T=220 .C','T=650 .C','T=800 .C');
 xlabel('Pressure (kPa)');
 ylabel('Efficiency %');
 axis([0 400 80 100]);
 %% report
Result_A3bt(:,1)=effl2{1};
Result_A3bt(:,2)=effl2{2};
Result_A3bt(:,3)=effl2{3};
Result_A3bt(:,4)=effl2{4};
Result_A3b(1,:)=Result_A3bt(1,:);
Result_A3b(2,:)=Result_A3bt(19,:);
Result_A3b(3,:)=Result_A3bt(30,:);
Result_A3b(4,:)=Result_A3bt(40,:);
Result_A3b(5,:)=Result_A3bt(50,:);