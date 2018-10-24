morecon(2,1).
morecon(3,1).
morecon(4,1).
morecon(3,2).
morecon(4,2).
morecon(4,3).
%4 is most conservative
golf(2,1).
golf(3,1).
golf(4,1).
golf(3,2).
golf(4,2).
golf(4,3).
%4 is best golfer
richer(2,1).
richer(3,1).
richer(4,1).
richer(3,2).
richer(4,2).
richer(4,3).
%4 is richest
older(2,1).
older(3,1).
older(4,1).
older(3,2).
older(4,2).
older(4,3).
%4 is oldest
soln(L):- setup(L),clue1(L),clue2(L),clue3(L),clue4(L),clue5(L),clue6(L),clue7(L),clue8(L),clue9(L),clue10(L),rule1(L).
setup(L):- L = [[_,brown,_,_,_,_],[_,clark,_,_,_,_],[_,jones,_,_,_,_],[_,smith,_,_,_,_]].
%setup function for format
clue1(L):- member([_,brown,PB1,_,_,_],L),
member([_,jones,PJ1,_,_,_],L),
morecon(PB1,PJ1).
%brown is more cons. than jones
clue2(L):- member([_,brown,PB2,_,_,_],L),
member([_,smith,PS2,_,_,_],L),
morecon(PS2,PB2).
%smith is more cons. than brown
clue3(L):- (member([_,brown,_,GB3,_,AB3],L),
member([_,_,_,G1X3,_,A1X3],L),
member([_,_,_,G2X3,_,A2X3],L),
member([_,_,_,G3X3,_,A3X3],L),
((older(A1X3,AB3))->golf(GB3,G1X3)),
((older(A2X3,AB3))->golf(GB3,G2X3)),
((older(A3X3,AB3))->golf(GB3,G3X3))).
%brown is better at golfing than all who are younger
clue4(L):- member([_,brown,_,_,WB4,_],L),
member([_,clark,_,_,_,AC4],L),
member([_,_,_,_,W1X4,A1X4],L),
member([_,_,_,_,W2X4,A2X4],L),
member([_,_,_,_,W3X4,A3X4],L),
(older(A1X4,AC4)->richer(WB4,W1X4)),
(older(A2X4,AC4)->richer(WB4,W2X4)),
(older(A3X4,AC4)->richer(WB4,W3X4)).
%brown is richer than those older than clark
clue5(L):- member([banker,_,_,_,WB5,_],L),
member([architect,_,_,_,WA5,_],L),
richer(WB5,WA5).
%banker is richer than the architect
clue6(L):- member([banker,_,_,_,_,AB6],L),
(AB6=2;AB6=3).
%banker not oldest or youngest
clue7(L):- member([doctor,_,_,GD7,_,_],L),
member([lawyer,_,_,GL7,_,_],L),
golf(GL7,GD7).
%doctor worse at golf than lawyer
clue8(L):- member([doctor,_,PD8,_,_,_],L),
member([architect,_,PA8,_,_,_],L),
morecon(PA8,PD8).
%doctor less cons. than architect
clue9(L):- member([_,_,4,_,4,4],L).
%oldest is richest and most const.
clue10(L):- member([_,_,_,4,_,1],L).
%youngest is best golfer
rule1(L):- member([J1,N1,P1,G1,W1,A1],L),
member([J2,N2,P2,G2,W2,A2],L),
((not(N1=N2))->(not(J1=J2))),
((not(N1=N2))->(not(P1=P2))),
((not(N1=N2))->(not(G1=G2))),
((not(N1=N2))->(not(W1=W2))),
((not(N1=N2))->(not(A1=A2))).
%rule for uniqueness, no one can have the same ranking.