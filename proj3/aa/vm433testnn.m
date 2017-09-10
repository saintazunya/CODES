%{
Ptemp(1,1)=4000;
Ptemp(1,2)=0;
Ttemp=T41;
while abs(Ttemp-T46)>1
   eta=(Ptemp(1,1)+Ptemp(1,2))/2;
   [~,Ttemp]=gasturbine( prodcpCoeff, prodmolarMass, T41, P41, eta, 90);
   if Ttemp<T46
       Ptemp(1,2)=eta;
   end
   if  Ttemp>T46
           Ptemp(1,1)=eta;
   end
   if Ttemp==T46
       break
   end 
   a=1;
end
P46=eta;
%}
%{
 cpCoeff=Find_Ideal_Gas_Properties( 'N2', 'Cp_coeff' );
molarMass=Find_Ideal_Gas_Properties( 'N2', 'Molar_mass' );
findFinalTempFromEnthalpyDiff( cpCoeff, molarMass, 300,100 )
findFinalTempFromEntropyDiff( cpCoeff, molarMass, 300,100, 200, 0.1 )
[a b]=findEnthalpyDiff( cpCoeff, molarMass, 300, 400 )
[c d]=findEntropyDiff( cpCoeff, molarMass, 300,100,400,200 )
%}
findSpeciesGibbs('O2', 300,400)