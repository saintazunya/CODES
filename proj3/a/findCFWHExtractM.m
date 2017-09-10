function extractM = findCFWHExtractM( extractT, extractP, ...
feedwaterInT, feedwaterInP, feedwaterInM, feedwaterPRatio, ...
drainInT, drainInP, drainInM, drainPRatio, TTD, DCA ) 
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
Eextract=md*XSteam('h_pT',extractP,extractT);
Efeedin=feedwaterInM*XSteam('h_pT',feedwaterInP,feedwaterInT);
Efeedout=feedwaterOutM*XSteam('h_pT',Pfeedwaterout,TFWout);
Edrainout=(md+drainInM)*XSteam('h_pT',Pdrainout,Tdrainout);
f=EdrainIn+Eextract+Efeedin-Efeedout-Edrainout;
extractM=double(solve(f,md));







