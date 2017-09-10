function extractM = findOFWHExtractM( extractT, extractP, ...
feedwaterInT, feedwaterInP, feedwaterInM, ...
drainInT, drainInP, drainInM )
syms md f
Eextract=md*XSteam('h_pT',extractP,extractT);
Edrainin=drainInM*XSteam('h_pT',drainInP,drainInT);
Efeedwater=feedwaterInM*XSteam('h_pT',feedwaterInP,feedwaterInT);
Eout=(md+drainInM+feedwaterInM)*XSteam('hL_p',feedwaterInP);
f=Eextract+Edrainin+Efeedwater-Eout;
extractM=double(solve(f,md));
