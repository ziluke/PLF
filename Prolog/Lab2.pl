%a.) subValueWithList(l1...ln,v,c1...cm) = -[], n=0
%											-l1 U subValueWithList(l2...ln, v, c1..cm), l1 !=v
%											-subValueWithList(concatenate(c1..cm, l1..ln), v, ci..cm), l1 = v
%concatenate(C:list, L:list, R:list)
%(i,i,o)

concatenate([],L,L).
concatenate([H|T],L,R):-concatenate(T,L,R1), R = [H|R1].

%subValueWithList(L:list, V:integer, C:list, R:list)
%(i,i,i,o)

subValueWithList([],_,_,[]).
subValueWithList([H|T],V,C,R):-H\=V,subValueWithList(T,V,C,R1),R=[H|R1].
subValueWithList([H|T], V, C, R):-H=:=V,concatenate(C,[H|T],X),subValueWithList(X,V,C,R).

%b.)Remove the nth element from a list
%removen(l1...lm,n) = - [], l=[]
%					  - l2...lm, n=1
%					  - l1 U removen(l2...lm,n-1), otherwise
%removen(L;list, E:integer, R:list)
%(i,i,o)
removen([],_,[]).
removen([_|T],1,T).
removen([H|T],E,R):-E\=1, E1 is E-1, removen(T,E1,R1), R=[H|R1].
