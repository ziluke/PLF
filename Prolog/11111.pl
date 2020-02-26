f([],[]).
f([H|T], [H|R]):-f(T,R).
f([H|T],R):-H mod 2=:=0, f(T,R).