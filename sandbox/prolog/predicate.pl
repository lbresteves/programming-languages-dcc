
third([_, _, Y | _], Y).

firstPair([E, E | _]).

del3([A, B, _ | TL], [A, B | TL]).

dupList([], []).
dupList([H|T], [H, H|DT]) :- 
    dupList(T, DT).

isDuped([]).
isDuped([H, H | T]) :-
    isDuped(T).


oddSize([_]).
oddSize([_, _ | T]) :-
    oddSize(T).

member(X, [X|_]).
member(X, [_|T]) :- 
    member(X, T).

isEqual(X, Y) :-
    subset(X, Y),
    subset(Y, X).

subset([], _).

subset([H|T], S) :-
    member(H, S),
    subset(T, S).