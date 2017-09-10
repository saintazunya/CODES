function AFT = findAdiabaticFlameTemp( ...
fuel, fuelMoleFrac, fuelT, air, airMoleFrac, airT, AF )
% FINDADIABATICFLAMETEMP Find adiabatic flame temperature
% for complete combustion of fuel in air
% Inputs:
% fuel/air = cell array of chemical symbols of fuel/air
% mixture species
% fuel/airMoleFrac = corresponding fuel/air mixture
% species mole fractions (%)
% fuel/airT = fuel/air mixture temperature (K)
% AF = air-fuel ratio (kg air / kg fuel)
% Output:
% AFT = adiabatic flame temperature (K)
%% E reactors
 Hreactors=findMixtureEnthalpy(fuelT, fuel, fuelMoleFrac )+findMixtureEnthalpy(airT,air,airMoleFrac);
 %---------------------debug may start from here
%% prodcuts
fuelcount=0;
lengthfuel=length(fuel);
airStoich=cell(lengthfuel);
  for i=1:lengthfuel
      if strcmp(fuel{i},'CH4')==1 
[ airStoich{i}, prod, prodStoich{i} ] =findCnHmStoichiometricCombustion( 1, 2, air, airMoleFrac);
  fuelcount=fuelcount+1;
      elseif strcmp(fuel{i},'C2H6')==1 
[ airStoich{i}, prod, prodStoich{i} ] =findCnHmStoichiometricCombustion( 2, 6, air, airMoleFrac );
  fuelcount=fuelcount+1;
      elseif strcmp(fuel{i},'C3H8')==1
[ airStoich{i}, prod, prodStoich{i} ] =findCnHmStoichiometricCombustion( 3, 8, air, airMoleFrac);
  fuelcount=fuelcount+1;
      end
  end
%% find air molarmass
[airmolar]= findmixturemolarmass( air, airMoleFrac );
%% find fuel molarmass
[fuelmolar]= findmixturemolarmass( fuel, fuelMoleFrac );%% find air used
  airused=0;
  for i=1:fuelcount
  airused=airused+airStoich{i}*fuelMoleFrac(i)/100;
  end
%% find air left
  airleft=AF*1*fuelmolar/airmolar;
  airleftn=zeros(1,length(air));
  lengthair=length(air);
  for i=1:lengthair
  airleftn(i)=airleft*airMoleFrac(i)/100;
  end
%% products
% productn is a matrix containing products for different fuels e.g. p(2,3)
% 2 represents fuel numbers, 3 is product numbers
productn=zeros(fuelcount,length(prod));
lengthprod=length(prod);
for i=1:lengthprod
    for j=1:fuelcount
    productn(j,i)=prodStoich{j}{i}*fuelMoleFrac(j)/100;
    end
end
%% sum up combustion products
productm=zeros(1,lengthprod);
for i=1:lengthprod
    productm(1,i)=sum(productn(:,i));
end
%% sum up products from combustion and excessive air
if lengthair==lengthprod
    finalprodfrac=airleftn+productm;
    AFT= fsolve(@(T) findMixtureEnthalpy(T, prod, finalprodfrac)-Hreactors,fuelT ,optimset('Display','off'));
end