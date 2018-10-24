square([],[]).
square([A|B], [X|L]):-
((number(A),
X is *(A, A));
(not(number(A)),
X = A)),
square(B, L).