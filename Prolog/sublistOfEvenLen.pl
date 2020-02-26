subsetsN([],[],0).
subsetsN([H|T], [H|R], N):-subsetsN(T, R, N1),N is N1+1.
subsetsN([_|T],R,N):-subsetsN(T, R, N).


genSub(L,R):-subsetsN(L,R,N),mod(N,2)=:=0.

main(L,R):-findall(X,genSub(L,X),R).