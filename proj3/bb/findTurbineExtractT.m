function extractT = findTurbineExtractT( inT, inP, extractP, polyEff )
hin=XSteam('h_pT',inP,inT); 
sin=XSteam('s_pT',inP,inT);
sex=sin;
hexs=XSteam('h_ps',extractP,sex);
hexa=hin-polyEff*(hin-hexs);
extractT=XSteam('T_ph',extractP,hexa);
