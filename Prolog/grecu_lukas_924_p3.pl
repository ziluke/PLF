% 2.) Are given n points in a plan (represented using its coordinates).
% Write a predicate to determine all subsets of collinear points.

% collinear(x1, y1, x2, y2, z1, z2) ={ True, x1 == x2 == x3
%                                      True, y1 == y2 == y3
%                                      True, x1!=x2!=x3 & y1!=y2!=y3 &
%                                        (y2-y1)/(x2-x1) == (y3-y2)/(x3-x2)

% collinear(x1:number, y1:number, x2:number, y2:number, x3:number,y3:number)
% collinear(i,i,i,i)

collinear(X,_,X,_,X,_):-!.
collinear(_,Y,_,Y,_,Y):-!.
collinear(X1,Y1,X2,Y2,X3,Y3):-
    X1 =\= X2,X2 =\= X3,X1 =\= X3,
    Y1 =\= Y2,Y2 =\= Y3,Y1 =\= Y3,
    P1 is (Y2-Y1)/(X2-X1),
    P2 is (Y3-Y2)/(X3-X2),
    P1 =:= P2.

% subsets(L:list, R:list)
% subsets(i, o)

subsets([],[]).
subsets([[A,B],[A1,B1],[A2,B2]|T],[[[A,B],[A1,B1],[A2,B2]]|R]):-
    collinear(A,B,A1,B1,A2,B2), !,
    subsets([[A1,B1],[A2,B2]|T],R).
subsets([_|T],R):-subsets(T,R).

% main(L:list, R:list)
% main(i, o)

main(L, R) :-
 findall(Res, subsets(L, Res), R).
