syms x ts t km s K 
ilaplace(km*K/(s*s*(ts*s+1)))
simplify(diff(ilaplace(km*K/(s*s*(ts*s+1)))))
y=km/(s*(ts*s+1));
g=simplify(K*y/(1+K*y))
