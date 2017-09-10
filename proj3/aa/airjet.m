function [ u ]= airjet(Kh, Kc, Kp, Ph, Pc, Pp, Th, Tc, Tp, Rh, Rc, Rp, bta, aph, phi, mu )
lamc=1;
while 1
syms lamdh qh2 f KH
qc=((Kc+1)/2)^(1/(Kc-1))*lamc*(1-(Kc-1)*lamc^2/(Kc+1))^(1/(Kc-1));
PIph=Ph/Pp;
lamph=sqrt(((Kp+1)/(Kp-1))*(1-PIph^((Kp-1)/Kp)));
qph=((Kp+1)/2)^(1/(Kp-1))*lamph*(1-(Kp-1)*lamph^2/(Kp+1))^(1/(Kp-1));
ac=sqrt(2*Kc/(Kc+1)*(Rc*Tc));
ah=sqrt(2*Kh/(Kh+1)*(Rh*Th));
ap=sqrt(2*Kp/(Kp+1)*(Rp*Tp));
PIh=(2/(Kh+1))^(Kh/(Kh-1));
PIp=(2/(Kp+1))^(Kp/(Kp-1));
PIc=(2/(Kc+1))^(Kc/(Kc-1));
upip2=(mu*ac*Kh*PIh*Ph/(ah*Kc*PIc*Pc*qc)-ap*Kh*PIh*Ph/(ah*Kp*PIp*Pp*qph))/(1-(mu*ac*Kh*PIh*Ph)/(ah*Kc*PIc*Pc*qc));
qh2=upip2/((bta*(1+upip2)*ac*Kh*PIh*Ph/(ah*Kc*PIc*Pc*qc))-ap*Kh*PIh*Ph/(ah*Kp*PIp*Pp*qph));
KH=Kh;
f=((KH+1)/2)^(1/(KH-1))*lamdh*(1-(KH-1)*lamdh^2/(KH+1))^(1/(KH-1))-qh2;
lamdh2=double(solve(f,lamdh));
PIh2=(1-(Kh-1)*lamdh2^2/(Kh+1))^(Kh/(Kh-1));
PIc2=Ph/Pc*PIh2;
K1=0.834;
K2=0.812;
K3=1+phi*ap*Pc*(PIc-(Ph/Pc)*(bta-0.5*(bta-1)*PIh2*(1+((Pc/Ph)^(1-aph))*((PIc/PIh2)^(1-aph)))))/(ac*Pp*Kp*PIp*lamc*qph*bta);
K4=1+phi*(ah/ac)*(Pc/Ph)*(PIc-PIc2*(bta-0.5*(bta-1)*(1+(Pc/Ph)^(1-aph)*(PIc/PIh2)^(1-aph))))/(Kh*PIh*lamc*qh2*bta);
u=(K1*(ap/ac)*lamph-K3*lamc)/(K4*lamc-K2*(ah/ac)*lamdh2);
 if (u-upip2)<0
     break
 end
 lamc=lamc-0.05;
end
upip2=(mu*ac*Kh*PIh*Ph/(ah*Kc*PIc*Pc*qc)-ap*Kh*PIh*Ph/(ah*Kp*PIp*Pp*qph))/(1-(mu*ac*Kh*PIh*Ph)/(ah*Kc*PIc*Pc*qc));
while 1
%qc=((Kc+1)/2)^(1/(Kc-1))*lamc*(1-(Kc-1)*lamc^2/(Kc+1))^(1/(Kc-1));
%PIph=Ph/Pp;
%lamph=sqrt(((Kp+1)/(Kp-1))*(1-PIph^((Kp-1)/Kp)));
%qph=((Kp+1)/2)^(1/(Kp-1))*lamph*(1-(Kp-1)*lamph^2/(Kp+1))^(1/(Kp-1));
%ac=sqtr(2*Kc/(Kc+1)*(Rc*Tc));
%ah=sqtr(2*Kh/(Kh+1)*(Rh*Th));
%ap=sqtr(2*Kp/(Kp+1)*(Rp*Tp));
%PIh=(2/(Kh+1))^(Kh/(Kh-1));
%PIp=(2/(Kp+1))^(Kp/(Kp-1));
%PIc=(2/(Kc+1))^(Kc/(Kc-1));

qh2=upip2/((bta*(1+upip2)*ac*Kh*PIh*Ph/(ah*Kc*PIc*Pc*qc))-ap*Kh*PIh*Ph/(ah*Kp*PIp*Pp*qph));
KH=Kh;
f=((KH+1)/2)^(1/(KH-1))*lamdh*(1-(KH-1)*lamdh^2/(KH+1))^(1/(KH-1))-qh2;
lamdh2=double(solve(f,lamdh));
PIh2=(1-(Kh-1)*lamdh2^2/(Kh+1))^(Kh/(Kh-1));
PIc2=Ph/Pc*PIh2;
K1=0.834;
K2=0.812;
K3=1+phi*ap*Pc*(PIc-(Ph/Pc)*(bta-0.5*(bta-1)*PIh2*(1+((Pc/Ph)^(1-aph))*((PIc/PIh2)^(1-aph)))))/(ac*Pp*Kp*PIp*lamc*qph*bta);
K4=1+phi*(ah/ac)*(Pc/Ph)*(PIc-PIc2*(bta-0.5*(bta-1)*(1+(Pc/Ph)^(1-aph)*(PIc/PIh2)^(1-aph))))/(Kh*PIh*lamc*qh2*bta);
u=(K1*(ap/ac)*lamph-K3*lamc)/(K4*lamc-K2*(ah/ac)*lamdh2);
if abs(u-upip2)<0.01
     break
end
upip2=u;
end 
