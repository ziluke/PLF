% Se dau N puncte in plan (prin coordonatele lor). Se cere sa se
% determine toate submultimile de puncte coliniare
%
% el:(X:integer,Y:integer)
% list el*
%
%  verif((X:integer,Y:integer),(X1:integer,Y1:integer),(X2:integer,Y2:integer))
%       (i,i,i)
%      -(X,Y)= prima pereche de coordonate
%      -(X1,Y1)= a doua pereche de coordonate
%      -(X2,Y2)= a treia pereche de coordonate
%
%  coliniare(T:list)         (i)
%      -T= lista de perechi de coordonate ce se verifica daca sunt sau
%      nu coliniare
%
%  card(N:integer,T:list)     (o,i) determinist
%      -N= nr de elemente din lista T
%      -T= lista de perechi de coordonate
%
%  subm(T:list,T1:list)       (i,o) nedeterminist
%      -T= lista de perechi de coordonate
%      -T1= submultime formata din elemente ale listei T
%
%  prog(T:list,T1:list)       (i,o) nedeterminist
%      -T= lista de perechi de coordonate
%      -T1= submultime formata din elemente ale listei T (submultime de
%      puncte coliniare)


 verif(i(X,Y),i(X1,Y1),i(X2,Y2)):- A is Y-Y1, B is Y2-Y1, C is X-X1, D is X2-X1,
                                   A div B == C div D, A mod B == C mod D.
           %  (Y-Y1)div(Y2-Y1)==(X-X1)div(X2-X1).

 coliniare([i(_,_)|[i(_,_)]]):-!.
 coliniare([i(X,Y)|[i(X1,Y1)|[i(X2,Y2)|L]]]):-
           verif(i(X,Y),i(X1,Y1),i(X2,Y2)),
           coliniare([i(X1,Y1)|[i(X2,Y2)|L]]).

 card(0,[]).
 card(N,[i(_,_)|L]):-card(N2,L),N=N2+1.

 subm([],[]).
 subm([_|L],L1):-subm(L,L1).
 subm([H|L],L1):-subm(L,L2),L1=[H|L2].

  prog([],[]):-!.
  prog(L,R):-subm(L,R),card(N,R),N>2,coliniare(R).
  prog(_,_).






