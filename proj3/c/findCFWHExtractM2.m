function extractM = findCFWHExtractM2( extractT, extractP, ...
feedwaterInT, feedwaterInP, feedwaterInM, feedwaterPRatio, ...
drainInT, drainInP, drainInM, drainPRatio, TTD, DCA ) 
% for fwh1
syms md f
tempT=XSteam('Tsat_p',extractP);
TFWout=tempT-TTD;
Tdrainout=DCA+feedwaterInT;
Pdrainout=drainInP*drainPRatio;
if  drainInM==0
    Pdrainout=feedwaterInP*drainPRatio;
end
 Pfeedwaterout=feedwaterInP*feedwaterPRatio;
feedwaterOutM=feedwaterInM;
EdrainIn=drainInM*XSteam('h_pT',drainInP,drainInT);
Eextract=md*2486.5;
Efeedin=feedwaterInM*XSteam('h_pT',feedwaterInP,feedwaterInT);
Efeedout=feedwaterOutM*XSteam('h_pT',Pfeedwaterout,TFWout);
Edrainout=(md+drainInM)*XSteam('h_pT',Pdrainout,Tdrainout);
f=EdrainIn+Eextract+Efeedin-Efeedout-Edrainout;
extractM=double(solve(f,md));







