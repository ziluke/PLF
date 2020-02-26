collinear(X,_,X,_,X,_):-!.
collinear(_,Y,_,Y,_,Y):-!.
collinear(X1,Y1,X2,Y2,X3,Y3):-
    X1 =\= X2,X2 =\= X3,X1 =\= X3,
    Y1 =\= Y2,Y2 =\= Y3,Y1 =\= Y3,
    P1 is (Y2-Y1)/(X2-X1),
    P2 is (Y3-Y2)/(X3-X2),
    P1 =:= P2.

subset([],[]).
subset([H|T],[H|T1]):-subset(T,T1).
subset([_|T],T1):-subset(T,T1).

main(L,R):-subset(L,T),T =[A,B,C|T],collinear(A,B,C), R =[T|R].
