%consider pattern matching and head-tail notation for these

%Q1 just a list of exactly the elements
exactly3(L):- L = [_,_,_].
%Q2 a list of at least three elements, that are a member of L.
at_least_3(L):- append([_,_,_|_],_,L).
%Q3
at_most_3(L):- L = [].
at_most_3(L):- L = [_].
at_most_3(L):- L = [_,_].
at_most_3(L):- L = [_,_,_].
%Q4
intersect(L1,L2):- member(L,L1), member(L,L2).
%Q5
all_intersect(ListofLists,L):-ListofLists = [Y|W],intersect(Y,L), all_intersect(W,L).
all_intersect(ListofLists,_):- ListofLists = [].

%source removal, see pdf. You'll probably want to define helper predicates
% assume G is set and you need to return list of nodes
% as [a,b,d...], not [ [a|[v,d]], [b| [d] ], [d| [c,x]],... ]


%Q6
source_removal([],[]).
source_removal(G,Toposort):- member([D,_],G), not_depends_on(G,D),
remove_node(G,D,SubG),source_removal(SubG,SubTopoSort),
append([D],SubTopoSort,AppendResult), Toposort = AppendResult.

%Q6 Helper Functions
%Depends on basically means that A is pointing at C on the graph, where Ns are the nodes A is pointing/connected to.
depends_on(G,A,C):- member([A,Ns],G), member(C,Ns).
%not depends on means there is no A to point C(any element on the graph)
not_depends_on(G,C):- \+depends_on(G,_,C).
%this is the recurisive version where the nodes (Ns) aren't specified.
remove_node([[RN,_]|Tl],RN,Tl).
%\+ cant remove head H=D
remove_node([[Hd,Ns]|Tl],RN,RoGraph):- \+ Hd=RN,remove_node(Tl,RN,TailReturn),append([[Hd,Ns]],TailReturn,RoGraph).
