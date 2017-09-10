function [ expandWork, exitT ] = gasTurbine2( ...
cpCoeff, molarMass, inT, inP, exitP, polyEff )
% Function description similar to above, but replace
% ¡®¡®compressor¡¯¡¯ by ¡®¡®turbine¡¯¡¯, and ¡®¡®compress¡¯¡¯ by ¡®¡®expand¡¯¡¯.

T = zeros(16);
P = T;
expandW = T;
T(1) = inT;
P(1) = inP;
dP = (exitP - inP)/15;

expandWork = 0;

for i = 2:16
    P(i) = P(i-1) +dP;
    [exitT_isen] = findFinalTempFromEntropyDiff(cpCoeff, molarMass, T(i-1), P(i-1), P(i), 0);
    [dhkg_isen,] = findEnthalpyDiff(cpCoeff, molarMass, T(i-1), exitT_isen);
    expendW(i) = dhkg_isen*polyEff;
    [T(i)] = findFinalTempFromEnthalpyDiff(cpCoeff, molarMass, T(i-1), expendW(i));
    expandWork = expandWork + expendW(i);
end
expandWork = -expandWork;
exitT = T(16);