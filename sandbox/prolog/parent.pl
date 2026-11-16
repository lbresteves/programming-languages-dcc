parent(kim, holly).
parent(margaret, kim).
parent(margaret, kent).
parent(esther, margaret).
parent(herbert, margaret).
parent(herbert, jean).

female(kim).
female(margaret).
female(esther).
female(holly).

mother(X, Y) :- 
    parent(X, Y), 
    female(X).

sister(X, Y) :-
    parent(P, X),
    parent(P, Y),
    female(X),
    not(X = Y).

firstCousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    parent(GP, P1),
    parent(GP, P2),
    P1 \= P2.

descendant(X, Y) :- 
    parent(Y, X).

descendant(X, Y) :- 
    parent(Y, Z), 
    descendant(X, Z).