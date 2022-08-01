% see the tree structure in the test file
root(R):- node(R,_,_), not(node(_,R,_)), not(node(_,_,R)).

%helper functions are fine, as always
% L is (non-nil) leaf of N
leaf_of(L,N):- node(L,nil,nil), descendent(L,N), \+N=nil, \+L=nil.
descendent(D,X):- childof(D,X).
descendent(D,X):- childof(D,Y), descendent(Y,X).
childof(C,P):- node(P,C,_) ; node(P,_,C).


%parent_of(P,Cs) Cs is a list of the non-nil children in any order
parent_of(P,Cs):- node(P,X,Y), \+X=Y, \+X=nil, \+Y=nil, Cs=[Y,X].
parent_of(P,Cs):- node(P,X,Y), \+X=Y, \+X=nil, \+Y=nil, Cs=[X,Y].
parent_of(P,Cs):- node(P,X,nil), \+X=nil, Cs=[X].
parent_of(P,Cs):- node(P,nil,X), \+X=nil, Cs=[X].
parent_of(P,Cs):- node(P,nil,nil), Cs=[].