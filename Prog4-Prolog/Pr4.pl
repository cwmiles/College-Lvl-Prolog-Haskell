
%For all of these, especially the first two, see the examples in the book
%Ignore the Singleton variable warning, that goes away when you 
% define the rules. 

%europe map coloring problem -- use these colors as the domain
europe_color(Fr,Sw,It,Be,Ho,Ge,Au):- 
color(Fr),color(Sw),color(It),color(Be), 
color(Ho),color(Ge),color(Au),\+Ho=Be,\+Ho=Ge,
\+Be=Ge,\+Be=Fr,\+Fr=Ge,\+Fr=Sw,\+Fr=It,\+It=Sw,\+It=Au,
\+Au=Sw,\+Au=Ge,\+Ge=Sw.



cryptarithmetic(C,R,O,S,A,D,N,G,E):- dig(S),dig(S),
    R is (S+S) mod 10,C1 is (S+S) // 10,dig(S),dig(D),
    E is (S+D+C1) mod 10,C10 is (S+D+C1) // 10,dig(O),dig(A),
    G is (O+A+C10) mod 10, C100 is (O+A+C10) // 10,dig(R),dig(O),
    N is (R+O+C100) mod 10, C1000 is (R+O+C100) // 10,dig(C),C>0,dig(R),R>0,
    A is (C+R+C1000) mod 10, D is (C+R+C1000) // 10,unit_digits(C,R,O,S,A,D,N,G,E).

unit_digits(C,R,O,S,A,D,N,G,E):- dig(C),dig(R),dig(O),dig(S),dig(A),dig(D),dig(N),dig(G),dig(E),
    \+C=R,\+C=O,\+R=O,\+C=S,\+R=S,\+O=S,\+C=A,\+R=A,\+O=A,\+S=A,\+C=D,\+R=D,
    \+O=D,\+S=D,\+A=D,\+C=N,\+R=N,\+A=N,\+O=N,\+S=N,\+D=N,\+C=G,\+R=G,\+O=G,
    \+S=G,\+A=G,\+D=G,\+N=G,\+C=E,\+R=E,\+O=E,\+S=E,\+A=E,\+D=E,\+N=E,\+G=E.



%Persons are just their names, lower case
who_ordered_pizza(PizzaPerson):- uniq_person(Donna,Danny,David,Doreen),uniq_person(Steak,Chicken,Lasagna,Pizza),
    uniq_person(Water,Coke,Coffee,Milk), across(David,Danny),across(Doreen,Donna),beside(Doreen,Steak),
    across(Lasagna,Milk), matchPerson(Pizza,Danny,'Danny'),matchPerson(Pizza,Donna,'Donna'),matchPerson(Pizza,Doreen,'Doreen'),
    matchPerson(Pizza,David,'David'),whichPerson('Danny','Donna','Doreen','David',Pizza,PizzaPerson),
    \+David=Coffee,Donna=Water,\+Danny=Steak,Chicken=Coke.


whichPerson(A,B,C,D,Y,R):- (A=Y;B=Y;C=Y;D=Y),Y=R.
whichPerson(_,_,_,_,Y,_).
matchPerson(Y,Y,Name).

matchPerson(X,Y,_):- \+X=Y. 

beside(Y,X):- person(Y), X is (Y+1) mod 2.
across(Y,X):- person(Y), X is (Y+2) mod 4.

uniq_person(A,B,C,D):- person(A),person(B),person(C),person(D),\+A=B,\+A=C,\+A=D,\+B=C,\+B=D,\+C=D.

person(1).
person(2).
person(3).
person(4).