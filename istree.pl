istree(A,B):-
((is_list(A);
atom(A)),
B = false);
B = true.
