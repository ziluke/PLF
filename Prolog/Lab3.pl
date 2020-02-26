/*
a.) Sort a list with removing the double values.[4 2 6 2 3 4] --> [2 3
 4 6] minimum(l1..ln, min) = { min, n=0 minimum(l2..ln,l1), l1 < min
 minimum(l2..ln,min), otherwise minimum(L:List, M:int) (i,o)
*/
minimum([M],M).
minimum([H|T],M) :- minimum(T,M1),M1 < H, M is M1.
minimum([H|T],M) :- minimum(T,M1),M1 >= H, M is H.
/*
deleteOccurences(l1..ln,E) {[], n = 0
                            l1 U deleteOccurences(l2..ln, E), l1 != E
                            deleteOccurences(l2..ln, E), l1==E

deleteOccurences(L:List, E:int, R:List)
(i,i,o)
*/
deleteOccurences([],_,[]).
deleteOccurences([H|T],E,R) :- H =:= E, deleteOccurences(T,E,R).
deleteOccurences([H|T],E,R) :- H =\= E, deleteOccurences(T,E,R1),R = [H|R1].
/*
 lab3_1(l1..ln) = {[], n=0
                   minimum(l1..ln,l1) U lab3_1(deleteOccurences(l1...ln, minimum(l1..ln,l1))

 lab3_1(L:List, R:List)
 (i,o)
*/
lab3_1([],[]).
lab3_1(L,R) :- minimum(L,M),deleteOccurences(L,M,R1),lab3_1(R1,R2), R = [M|R2].

/*
b.)For a heterogeneous list, formed from integer numbers and list of
numbers, write a predicate to sort every sublist with removing the
doubles.

lab3_2(l1..ln)={[], n=0
                 lab3_1(l1) U lab3_2(l2..ln), is_list(l1)
                l1 U lab3_1(l2..ln), otherwise

lab3_2(L:List, R:List)
(i,o)
*/
lab3_2([],[]).
lab3_2([H|T], R):-is_list(H),!,lab3_1(H,R1), lab3_2(T,R2), R=[R1|R2].
lab3_2([H|T], R):-lab3_2(T, R1), R=[H|R1].
