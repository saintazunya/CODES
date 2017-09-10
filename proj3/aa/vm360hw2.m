syms x k;
y=(x-2)/((x+1)*(x^2+6*x+25));
simplify(k*y/(k*y+1))
 ra=routh([1 7 31+k 25-2*k], x);
 simplify(ra)