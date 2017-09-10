% VM235 HW3
% Project: Water Properties
% Kwee-Yan Teh, 5/15/2014
 function[ ]=Vapordome

close all
clear all
%% Evaluate saturation properties (vapor dome)
 
% Set temperature limits 
% Near-freezing to just below critical
% (647.096 K = 373.946 deg C)
T = [ 0.1; ... % deg C
    ( 1 : 1 : 370 )'; ...
    ( 370.1 : 0.1 : 373.9 )'; ...
      373.9458 ];
 
% Saturation pressure, bar
Psat = zeros( size( T ) );
% Saturated liquid specific volume, m3/kg
vf = zeros( size( T ) );
vg = zeros(size(T));
 
 
for j = 1 : length( T )
    
    Psat( j, 1 ) = XSteam( 'psat_T', T( j ) ); % bar
    vf(   j, 1 ) = XSteam( 'vL_T',   T( j ) ); % m3/kg
    vg(j,1)=XSteam('vV_T',T(j));
    % continue with the evaluation of saturated vapor specific volume, vg
    
end
 
 
%% Evaluate
% - isotherms: (P,v) at constant temperature, and 
% - isobars: (T,v) at constant pressure
P1=linspace(0,300,100);
for j = 1 : 100
    
   V1( j, 1 ) = XSteam( 'v_pT', P1(j),400 ); % bar
  
    % continue with the evaluation of saturated vapor specific volume, vg
    
end
P2=linspace(0,300,100);
for j = 1 : 100
    
   V2( j, 1 ) = XSteam( 'v_pT', P1(j),200 ); % bar
  
    % continue with the evaluation of saturated vapor specific volume, vg
    
end
 
%% Plot on P-v and T-v axes
% - use <semilogx> function to plot specific volume on the log scale - why?
Vapordome=semilogx(vg,Psat,vf,Psat,V1,P1,V2,P2)



