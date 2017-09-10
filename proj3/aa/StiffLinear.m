
function [Stiffness]= StiffLinear(N,EN,NoN,xx,yy,EA,EI,GDof)
Stiffness=zeros(GDof);

for e=1:N
 
    ID=EN(e,:);
    DE=[ID ID+NoN ID+2*NoN];
    xa=xx(ID(2))-xx(ID(1));
    ya=yy(ID(2))-yy(ID(1));
    Le=sqrt(xa*xa+ya*ya);
    LL(e)=Le;
    C=xa/Le;
    S=ya/Le;
    L= [C*eye(2) S*eye(2) zeros(2);
     -S*eye(2) C*eye(2) zeros(2);
     zeros(2,4) eye(2)];
    oneu=[1 -1;-1 1];
    oneu2=[1 -1;1 -1];
    oneu3=[1 1;-1 -1];
    oneu4=[4 2;2 4];
    Ke=[EA/Le*oneu   zeros(2,4);
        zeros(2) 12*EI/Le^3*oneu 6*EI/Le^2*oneu3;
        zeros(2) 6*EI/Le^2*oneu2 EI/Le*oneu4];
    Stiffness(DE,DE)=Stiffness(DE,DE)+L'*Ke*L;
end