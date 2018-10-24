postorder(T):-
T=..[M|L],
treecheck(L),
write(M), tab(1),!.
treecheck([]).
treecheck([F|R]):-
((atom(F),
write(F), tab(1),
treecheck(R));
(is_list(F),
treecheck(F),
treecheck(R));
(postorder(F),
treecheck(R))).
%turned the tree into the list and split the root off
%check if the remaining stuff is an atom, list or tree.
%print if it's an atom (leaf), otherwise, repeat for
%each item in a list. call postorder if 1 item is a tree.
%finally, recombine back into a tree after adding root.