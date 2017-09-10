function polyEff = findHPTPolyEff( inT, inP, outT, outP )
 sec=16;
 h=zeros(sec,1);
 hs=zeros(sec,1);
 s=zeros(sec,1);
 h(1)=XSteam('h_pT',inP,inT);
 hs(1)=h(1);
 s(1)=XSteam('s_pT',inP,inT);
 p=linspace(inP,outP,sec);
  eta=1;
  eta2=0;
  T=outT-10;
  eff(1)=eta;
  eff(2)=eta2;
while abs(T-outT)>0.1
   eta=(eff(1)+eff(2))/2;
   for i=2:sec
       hs(i)=XSteam('h_ps',p(i),s(i-1));
       h(i)=h(i-1)-eta*( h(i-1)-hs(i) );
        s(i)=XSteam('s_ph',p(i),h(i));
   end
   T=XSteam('T_ph',p(16),h(16));
   if T>outT
       eff(2)=eta;
   end
   if  T<outT
           eff(1)=eta;
   end
   if T==outT
       break
   end 
end
polyEff=eta;