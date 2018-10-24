everyother([],[]).
everyother([A,B|C],[A|L]):-
everyother(C, L).
everyother([A|[]],[A]).