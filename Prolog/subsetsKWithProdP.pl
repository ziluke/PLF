vars(0,_,[]).
vars(N,L,[H|Vars]):-N>0,N1 is N-1,del(H,L,R),vars(N1,R,Vars).

del(X, [X|L], L).
del(X, [Y|L], [Y|L1]):-del(X,L,L1).


prod([], 1).
prod([H|T], S):-
    prod(T, N),
    S is N*H.
	
generator(L,N,P,R):-vars(N,L,R), prod(R, P). 

main(L,N,P,R):-findall(X,generator(L,N,P,X), R).

%main([2,5,3,4,10],2,20,R).