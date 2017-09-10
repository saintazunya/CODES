function [ polyEff ] = findLPTPolyEff( inT, inP, outx, outP )
%findLPTPolyEff calculates polytropic efficiency for LPT.
%
%   Input:
%       inT:       inlet temperature, in deg C
%       inP:       inlet pressure, in bar
%       outx:      outlet vapor-liquid quality, no unit
%       outP:      outlet pressure, in bar
%
%   Output:
%      polyEff:    polytropic efficiency

% START WRITING YOUR FUNCTION HERE
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
  T=XSteam('Tsat_p',outP);
  eff(1)=eta;
  eff(2)=eta2;
  outH=outx*XSteam('hV_p',outP)+(1-outx)*XSteam('hL_p',outP);
  H=outH-1;
while abs(H-outH)>0.01
   eta=(eff(1)+eff(2))/2;
   for i=2:sec
       hs(i)=XSteam('h_ps',p(i),s(i-1));
       h(i)=h(i-1)-eta*( h(i-1)-hs(i) );
        s(i)=XSteam('s_ph',p(i),h(i));
   end
   H=h(16);
   if H>outH
       eff(2)=eta;
   end
   if  H<outH
           eff(1)=eta;
   end
   if H==outH
       break
   end
end
polyEff=eta;