
collinear(p(X1,Y1),p(X2,Y2),p(X3,Y3)):-(Y2-Y1)*(X3-X1)=:=(Y3-Y1)*(X2-X1).
collinear([A,B,C]):-collinear(A,B,C).
collinear([A,B,C|L]):-collinear(A,B,C),collinear([B,C|L]).

subs([A,B,C],[A,B,C]):-collinear(A,B,C).
subs([_|L],S):-subs(L,S).
subs([A|L],[A|S]):-subs(L,S), collinear([A|S]).

main(L,R):-findall(Res, subs(L,Res), R).
