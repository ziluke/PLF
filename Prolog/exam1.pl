reverse1([],Acc,Acc).
reverse1([H|T],Acc,R):-reverse1(T,[H|Acc], R).

reverseSubList([],Acc, Acc).
reverseSubList([H|T], Acc, R):-is_list(H),!,reverseSubList(H,[],R1), reverseSubList(T, [R1|Acc], R).
reverseSubList([H|T], Acc, R):-reverseSubList(T, [H|Acc],R).

main([],[]).
main(L, R):-reverseSubList(L, [], R).

%deepReverse(List,R):-deepReverseTail(List,[],R).

%deepReverseTail([],Acc,Acc).

%deepReverseTail([H|T],Acc,R):-             % when H is a list
     %is_list(H),                           % check if it's a list.
     %!,                                    % cut the process if not. 
     %deepReverseTail(H,[],Hrev),           % reverse this current list
     %deepReverseTail(T,[Hrev|Acc],R).      % continue the general recursion

%deepReverseTail([H|T],Acc,R):- deepReverseTail(T,[H|Acc],R). % when H is a simple term

subsets([],[]).
subsets([X|T], [X|R]):-subsets(T,R).
subsets(T,[_|R]):-subsets(T,R).

%(o,i,i)
subsetsN([],0,_):-!.
subsetsN([X|T], N,[X|R]):-N1 is N-1,subsetsN(T,N1,R).
subsetsN(T, N,[_|R]):-subsetsN(T,N,R).