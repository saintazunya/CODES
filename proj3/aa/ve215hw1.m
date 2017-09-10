syms x
q1=int( 3*x, x );
ezplot(q1,[0,6])

hold on
q1=int( 3*x, x ,0,6);

q2=54+int(18+0*x,x);
ezplot(q2,[0,4])
xlim([0,20]);

q2=q1+int(18+0*x,x,0,4)


q3=q2+int(-12+0*x,[0,5]);
ezplot(q3);

hold on

q3=q2+int(-12+0*x,x,10,15)

q4=q3+int(0*x,[15,20]);
ezplot(q4)
xlim([0,20]);
hold on 