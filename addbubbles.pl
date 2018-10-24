addbubbles([], []).
addbubbles([A|B], [A,bubbles|L]):-
atom(A),
addbubbles(B, L).
addbubbles([A|B], [A|L]):-
not(atom(A)),
addbubbles(B, L).

