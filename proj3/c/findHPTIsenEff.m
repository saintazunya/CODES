function isenEff = findHPTIsenEff( inT, inP, outT, outP )
outs=XSteam('s_pT',inP,inT);
isenEff=(XSteam('h_pT',inP,inT)-XSteam('h_pT',outP,outT))/(XSteam('h_pT',inP,inT)-XSteam('h_ps',outP,outs));