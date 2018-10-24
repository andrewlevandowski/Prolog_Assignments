deepsquare([],[]).
deepsquare([A|B], [X|L]):-
((number(A),
X is *(A, A));
(is_list(A),
deepsquare(A, X));
(not(number(A)),
X = A)),
deepsquare(B, L).