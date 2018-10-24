substit(T,X):-
T=..[M|L],
replace(L,Y),
X=..[M|Y],
!.
replace(A,Z):-
((atom(A),
((A=sword,
Z=plowshare);
Z=A));
(is_list(A),
replacelist(A,Z));
(substit(A,Z))).
replacelist([],[]).
replacelist([F|R],[F2|R2]):-
replace(F,F2),
replace(R,R2).
%turn in to list and take off root, search
%remaining to see if it's an atom/leaf and
%check for "sword", or see if it's a list/
%collection of leaves and iterate through
%the leaves individually, or see if it's a
%tree and call original substit. Finally,
%combine possibly replaced leaves with root
