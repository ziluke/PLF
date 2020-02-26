del(X, [X|L], L).
del(X, [Y|L], [Y|L1]):-del(X, L, L1).

perm([],[]).
perm(L, [X|P]):-del(X,L,L1), perm(L1,P).
