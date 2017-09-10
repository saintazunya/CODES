function isenEff = findLPTIsenEff( inT, inP, outx, outP )
outs=XSteam('s_pT',inP,inT);
outh=outx*XSteam('hV_p',outP)+(1-outx)*(XSteam('hL_p',outP));
isenEff=(XSteam('h_pT',inP,inT)-outh)/(XSteam('h_pT',inP,inT)-XSteam('h_ps',outP,outs));
