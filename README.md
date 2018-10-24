Andrew Levandowski
Short assignments from my Advanced Programming Languages class.

Instructions for:
square.pl, deepsquare.pl, everyother.pl, addbubbles.pl

-
1. Create a binary predicate called 'square' which will square each
    number in a list.  This pred. will be shallow.
  e.g. ?-square([a,[[3]],b,4,c(5),8],X).
       X=[a,[[3]],b,16,c(5),64]

~
memb(A,[A|B]).
memb(A,[X|Y]):-memb(A,Y).
~
memb(X,[X|Y]).
memb(X,[T|V]):-memb(X,V).
% the following are little improvements; note that this does a shallow
% search, as does the one above.
% Also note that memb2(X,[X|_]).   abbreviates memb(X,[X|_]) :- true.
memb2(X,[X|_]).
memb2(X,[_|V]):-memb2(X,V).
first(X,[X|_]) :- true.


2. Create a binary predicate called 'deepsquare' which will give
  a list in which all numbers are squared, including those in sublists.

  e.g. ?-dsquare([a,[[3]],b,4,c(5),4],C).
       C=[a,[[9]],b,c(5),16]

~
isList2([]).
isList2([X|Y]):-isList2(Y).
membDeep(X,[X|_]).
membDeep(X,[Y|Z]):-isList2(Y),membDeep(X,Y).
membDeep(X,[_|Z]):-membDeep(X,Z).
~

3. Write a predicate 'addbubbles' which will place 'bubbles' after each atom
 in a list.  The empty list is unchanged.

  e.g. ?-addbubbles([a,b,8,c],X).
       X=[a,bubbles,b,bubbles,8,c,bubbles]

This one is shallow, not deep.  Tiny bubbles, in the list, make me happy,
make me feel fine.

4.  Write a predicate 'everyother' which will remove every other element in a list,
 starting with the second element.  List length can be odd or even.

    e.g. ?- everyother([h,k,i,p,d,t,d,r,e,g,n],L).
         L = [h,i,d,d,e,n];
         fail
-

Instructions for:
substit.pl, soln.pl(unsuccessful)

1. Write PROLOG code to take a prolog tree constant and replace each
       atom 'sword' by the the atom 'plowshare'.  You may assume the tree
       has only atomic data.  There are various possibilities for doing this,
       but you can think in terms of traversals of trees.  Or not.

       e.g. substit(a(sword,joe,b(moe,sword,sword,toe)),X).
         X = a(plowshare,joe,b(moe,plowshare,plowshare,toe))

      NOTE: ignore 'functors';  only replace leaves


    --------
    In solving Caliban problems you should translate loyally each 'clue'
    from English to Prolog.  Use rules like
       clue1(L):-and translate the first clue here

    Your goal will be, more or less, of the form
    soln(L):-setup(L), clue1(L), clue2(L),etc
    since things will then be easier to debug.



    2. Brown, Clark, Jones and Smith are 4 substantial citizens who serve their
    community as achitect, banker, doctor and lawyer, though not necessarily
    respectively.

      Brown, who is more conservative than Jones but more liberal than Smith,
      is a better golfer than the men who are younger than he is and has a
      larger income than the men who are older than Clark.

      The banker, who earns more than the architect, is neither the youngest
      nor the oldest.

      The doctor, who is a poorer golfer than the lawyer, is less conservative
      than the architect.

      As might be expected, the oldest man is the most conservative and has the
      largest income, and the youngest man is the best golfer.

    What is each man's profession?

    hint: to rank people for weath, ability, relative age, etc
        use the numbers 1,2,3,4     Be careful to state whether 1 represents,
        e.g., youngest or oldest.  Doing this makes comparisons easy to code.

    3.  Prolog uses general trees, not binary trees.   An example is

         a(b,c,d(e,f,g))   where root a has 3 kids, as does kid d.

     It is possible to define both preorder and postorder for general trees,
     although inorder of course makes no sense.

     For this assignment we are interested in postorder, which is defined as
     follows:

       to 'visit' a tree in postorder,
          you visit the subtrees of the root, in left to right order,
          in postorder, and then you visit the root

     Thus the example above would yield the following postorder traversal:

            b c e f g d a


     Write Prolog code which will perform a postorder traversal of a Prolog
     tree constant.   Hint: you might use 'univ', or its cousins.

     Sample dialog:

     ?- postorder(a(b,c,d(e,f,g))).
     b c e f g d a    true

Instructions not found for:
istree.pl - Detects whether an input is a tree.
postorder.pl - Given a tree, provides the elements in postorder.