/*
a.) Sort a list with removing the double values.[4 2 6 2 3 4] --> [2 3
 4 6]
minimum(l1..ln, min) = { min, n=0
                         minimum(l2..ln,l1), l1 < min
                         minimum(l2..ln,min), otherwise
minimum(L:List,M:int)
(i,o)
*/
minimum([M],M).
minimum([H|T],M) :- minimum(T,M1),M1 < H, M is M1.
minimum([H|T],M) :- minimum(T,M1),M1 >= H, M is H.
/*
removeAll(l1..ln,E) {[], n = 0
                            l1 U removeAll(l2..ln, E), l1 != E
                            removeAll(l2..ln, E), l1==E

removeAll(L:List, E:int, R:List)
(i,i,o)
*/
removeAll([],_,[]).
removeAll([H|T],E,R) :- H =:= E, removeAll(T,E,R).
removeAll([H|T],E,R) :- H =\= E, removeAll(T,E,R1),R = [H|R1].
/*
 sortWithoutDup(l1..ln) = {[], n=0
                           minimum(l1..ln,min) U
                    sortWithoutDup(removeAll(l1...ln,minimum(l1..ln,min))


 sortWithoutDup(L:List, R:List)
 (i,o)
*/
sortWithoutDup([],[]).
sortWithoutDup(L,R) :- minimum(L,M),removeAll(L,M,R1),sortWithoutDup(R1,R2), R = [M|R2].

/*
b.)For a heterogeneous list, formed from integer numbers and list of
numbers, write a predicate to sort every sublist with removing the
doubles.

sortSubl(l1..ln)={[], n=0
                 sortWithoutDup(l1) U sortSubl(l2..ln), is_list(l1)
                l1 U sortSubl(l2..ln), otherwise

sortSubl(L:List, R:List)
(i,o)
*/
sortSubl([],[]).
sortSubl([H|T], R):-is_list(H),!,sortWithoutDup(H,R1), sortSubl(T,R2), R=[R1|R2].
sortSubl([H|T], R):-sortSubl(T, R1), R=[H|R1].
