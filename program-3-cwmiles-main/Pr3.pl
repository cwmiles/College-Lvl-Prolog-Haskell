%yours
%Q1
mother(M,C):- child(C,M), female(M).

grand_parent(GP,GC):-parent(GP,X), parent(X,GC).

great_grand_mother(GGM,GGC):-mother(GGM,X), grand_parent(X,GGC).

%Q2
%Must ensure that we arent checking the same child and calling them siblings
sibling(A,B):- parent(X,A),parent(X,B), A\=B.
brother(B,Sib):- sibling(B,Sib),male(B).
sister(S,Sib):- sibling(S,Sib), female(S).

%Q3 --
%You have to know both parents for full siblings for half_sibling
half_sibling(S1,S2):- sibling(S1,S2),mother(Z,S1),mother(X,S2),father(W,S1),father(Y,S2),((Y=W,Z\=X);(Z=X,W\=Y)).


full_sibling(S1,S2):- sibling(S1,S2),mother(X,S1),mother(X,S2),father(Y,S1),father(Y,S2).

%Q4
first_cousin(C1,C2):- grand_parent(GP,C1),grand_parent(GP,C2),parent(X,C1),parent(Y,C2),sibling(X,Y).

second_cousin(C1,C2):- parent(X,C1),parent(Y,C2),first_cousin(X,Y).

%Q5
half_first_cousin(C1,C2):- parent(X,C1), parent(Y,C2), half_sibling(X,Y).

double_first_cousin(C1,C2):- parent(X,C1), parent(Y,C1), parent(Z,C2), parent(W,C2), (sibling(X,Z);sibling(X,W)),(sibling(Y,W);sibling(Y,Z)),X\=Y,W\=Z.

%Q6-----NOT FINISHED
first_cousin_twice_removed(C1,C2):- ((grand_parent(X,C1), first_cousin(X,C2)) | (first_cousin(C1,Y),grand_parent(Y,C2))).
%first_cousin(X,C2),(grand_parent(X,C1);grand_parent(Y,X),grand_parent(Z,Y),sibling(Z,D),parent(D,K),parent(K,C1)),X\=Y.

%Q7
descendant(D,A):- child(D,A).
descendant(D,A):- child(D,C), descendant(C,A).

ancestor(A,D):- descendant(D,A).

%Q8
%this version of "cousin" does not handle "____ removed",
%read description carefully
cousin(X, Y):- first_cousin(X,Y); second_cousin(X,Y);half_first_cousin(X,Y);double_first_cousin(X,Y), \+X=Y.

%Q9
%do not return anything for closest_common_ancestor(X,X,A).
common_ancestor(R1,R2,A):- ancestor(A,R1), ancestor(A,R2), \+R1=R2. 
closest_common_ancestor(R1,R2,A):- common_ancestor(R1,R2,A), \+ (child(X,A),common_ancestor(R1,R2,X)). 

%ancestor(X,R1), ancestor(X,R2)
%common_ancestor(A,R1,R2),\+ (child(C,A),common_ancestor(C,R1,R2)).
%parent(A,X),ancestor(X,R1),parent(A,Y), X\==Y, ancestor(Y,R2).
%common_ancestor(R1,R2,A),\=child(P,R1),((ancestor(P,R2);ancestor(P,A)),\=common_ancestor(P,R2,A).
%common_ancestor(R1,R2,A),(child(X,R1),\=common_ancestor(X,R2,A)),R2\=A.


% Q10 -- not scored, but will do
%   write_descendant_chain(jim,anna) and
%   write_descendant_chain(louise,gina) and
%   write_descendant_chain(emma,lily) <-this one should print nothing
%   (make sure this does not fail (read the instructions carefully)).

write_child(X,Y):-
	write(X), write(' is a child of '), write(Y), nl.

write_descendant_chain(X,Y):- child(X,Y), write_child(X,Y).
write_descendant_chain(X,Y):- child(X,P), descendant(P,Y), write_child(X,P), write_descendant_chain(P,Y).

