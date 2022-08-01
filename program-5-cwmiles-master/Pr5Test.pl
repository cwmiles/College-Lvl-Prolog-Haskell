
:-['Pr5.pl'].


lists([]).
lists([a]).
lists([c,b]).
lists([b,c]).
lists([a,c]).
lists([a,b]).
lists([c,b,a]).
lists([b,c,b]).
lists([a,c,c]).
lists([a,b,d]).
lists([c,b,d,b]).
lists([b,c,c,a]).
lists([a,c,b,c]).
lists([a,b,a,d]).
lists([a,c,a,a]).
lists(L):-listsA(L).

%all_intersect tests explode... so listsA is just a fraction of lists

listsA([d]).
listsA([c,b]).
listsA([b,a]).
listsA([a,c,a]).
listsA([b,a,a]).
listsA([b,a,b,d]).


graph(G1) :- graph1(G1).
%graph(G2) :- graph2(G2).

graph1( [ [a,[b,e,f]], [b,[f,g]], [c,[g,d]], [d,[h]], [e,[f]], [f,[]], [g,[h]], [h,[]] ]).

score(S):-
	testQ6a(Sa),write('Score Q6(a) is: '),write(Sa),nl,
	testQ6b(Sb),write('Score Q6(b) is: '),write(Sb),nl,
	testQ6c(Sc),write('Score Q6(c) is: '),write(Sc),nl,
	testQ6d(Sd),write('Score Q6(d) is: '),write(Sd),nl,
	testQ6e(Se),write('Score Q6(e) is: '),write(Se),nl,
	testSR(SSR),write('Score source_removal is: '),write(SSR),nl,
	S is Sa+Sb+Sc+Sd+Se+SSR,
	write('TOTAL SCORE = '),write(S),nl.






testExactly3(L):-lists(L),exactly3(L).
testQ6a(S):-findall([L],testExactly3(L),LL),
	                 TRUEs= [[[a,b,d]],[[a,c,a]],[[a,c,c]],[[b,a,a]],[[b,c,b]],[[c,b,a]]],
			 sort(LL,SLL),
			 ((SLL=TRUEs,S is 20) ; (\+ SLL = TRUEs,S is 0)).


testAt_least_3(L):-lists(L),at_least_3(L).
testQ6b(S):-findall([L],testAt_least_3(L),LL),
	                 TRUEs= [[[a,b,a,d]],[[a,b,d]],[[a,c,a]],[[a,c,a,a]],[[a,c,b,c]],[[a,c,c]],[[b,a,a]],[[b,a,b,d]],[[b,c,b]],[[b,c,c,a]],[[c,b,a]],[[c,b,d,b]]],
			 sort(LL,SLL),
			 ((SLL=TRUEs,S is 20) ; (\+ SLL = TRUEs,S is 0)).

testAt_most_3(L):-lists(L),at_most_3(L).
testQ6c(S):-findall([L],testAt_most_3(L),LL),
	                 TRUEs=  [[[]],[[a]],[[a,b]],[[a,b,d]],[[a,c]],[[a,c,a]],[[a,c,c]],[[b,a]],[[b,a,a]],[[b,c]],[[b,c,b]],[[c,b]],[[c,b,a]],[[d]]],
			 sort(LL,SLL),
			 ((SLL=TRUEs,S is 20) ; (\+ SLL = TRUEs,S is 0)).


testIntersect(L1,L2):-lists(L1),lists(L2),intersect(L1,L2).
testQ6d(S):-findall([L1,L2],testIntersect(L1,L2),LL),
	                 TRUEs=[[[a],[a]],[[a],[a,b]],[[a],[a,b,a,d]],[[a],[a,b,d]],[[a],[a,c]],[[a],[a,c,a]],[[a],[a,c,a,a]],[[a],[a,c,b,c]],[[a],[a,c,c]],[[a],[b,a]],[[a],[b,a,a]],[[a],[b,a,b,d]],[[a],[b,c,c,a]],[[a],[c,b,a]],[[a,b],[a]],[[a,b],[a,b]],[[a,b],[a,b,a,d]],[[a,b],[a,b,d]],[[a,b],[a,c]],[[a,b],[a,c,a]],[[a,b],[a,c,a,a]],[[a,b],[a,c,b,c]],[[a,b],[a,c,c]],[[a,b],[b,a]],[[a,b],[b,a,a]],[[a,b],[b,a,b,d]],[[a,b],[b,c]],[[a,b],[b,c,b]],[[a,b],[b,c,c,a]],[[a,b],[c,b]],[[a,b],[c,b,a]],[[a,b],[c,b,d,b]],[[a,b,a,d],[a]],[[a,b,a,d],[a,b]],[[a,b,a,d],[a,b,a,d]],[[a,b,a,d],[a,b,d]],[[a,b,a,d],[a,c]],[[a,b,a,d],[a,c,a]],[[a,b,a,d],[a,c,a,a]],[[a,b,a,d],[a,c,b,c]],[[a,b,a,d],[a,c,c]],[[a,b,a,d],[b,a]],[[a,b,a,d],[b,a,a]],[[a,b,a,d],[b,a,b,d]],[[a,b,a,d],[b,c]],[[a,b,a,d],[b,c,b]],[[a,b,a,d],[b,c,c,a]],[[a,b,a,d],[c,b]],[[a,b,a,d],[c,b,a]],[[a,b,a,d],[c,b,d,b]],[[a,b,a,d],[d]],[[a,b,d],[a]],[[a,b,d],[a,b]],[[a,b,d],[a,b,a,d]],[[a,b,d],[a,b,d]],[[a,b,d],[a,c]],[[a,b,d],[a,c,a]],[[a,b,d],[a,c,a,a]],[[a,b,d],[a,c,b,c]],[[a,b,d],[a,c,c]],[[a,b,d],[b,a]],[[a,b,d],[b,a,a]],[[a,b,d],[b,a,b,d]],[[a,b,d],[b,c]],[[a,b,d],[b,c,b]],[[a,b,d],[b,c,c,a]],[[a,b,d],[c,b]],[[a,b,d],[c,b,a]],[[a,b,d],[c,b,d,b]],[[a,b,d],[d]],[[a,c],[a]],[[a,c],[a,b]],[[a,c],[a,b,a,d]],[[a,c],[a,b,d]],[[a,c],[a,c]],[[a,c],[a,c,a]],[[a,c],[a,c,a,a]],[[a,c],[a,c,b,c]],[[a,c],[a,c,c]],[[a,c],[b,a]],[[a,c],[b,a,a]],[[a,c],[b,a,b,d]],[[a,c],[b,c]],[[a,c],[b,c,b]],[[a,c],[b,c,c,a]],[[a,c],[c,b]],[[a,c],[c,b,a]],[[a,c],[c,b,d,b]],[[a,c,a],[a]],[[a,c,a],[a,b]],[[a,c,a],[a,b,a,d]],[[a,c,a],[a,b,d]],[[a,c,a],[a,c]],[[a,c,a],[a,c,a]],[[a,c,a],[a,c,a,a]],[[a,c,a],[a,c,b,c]],[[a,c,a],[a,c,c]],[[a,c,a],[b,a]],[[a,c,a],[b,a,a]],[[a,c,a],[b,a,b,d]],[[a,c,a],[b,c]],[[a,c,a],[b,c,b]],[[a,c,a],[b,c,c,a]],[[a,c,a],[c,b]],[[a,c,a],[c,b,a]],[[a,c,a],[c,b,d,b]],[[a,c,a,a],[a]],[[a,c,a,a],[a,b]],[[a,c,a,a],[a,b,a,d]],[[a,c,a,a],[a,b,d]],[[a,c,a,a],[a,c]],[[a,c,a,a],[a,c,a]],[[a,c,a,a],[a,c,a,a]],[[a,c,a,a],[a,c,b,c]],[[a,c,a,a],[a,c,c]],[[a,c,a,a],[b,a]],[[a,c,a,a],[b,a,a]],[[a,c,a,a],[b,a,b,d]],[[a,c,a,a],[b,c]],[[a,c,a,a],[b,c,b]],[[a,c,a,a],[b,c,c,a]],[[a,c,a,a],[c,b]],[[a,c,a,a],[c,b,a]],[[a,c,a,a],[c,b,d,b]],[[a,c,b,c],[a]],[[a,c,b,c],[a,b]],[[a,c,b,c],[a,b,a,d]],[[a,c,b,c],[a,b,d]],[[a,c,b,c],[a,c]],[[a,c,b,c],[a,c,a]],[[a,c,b,c],[a,c,a,a]],[[a,c,b,c],[a,c,b,c]],[[a,c,b,c],[a,c,c]],[[a,c,b,c],[b,a]],[[a,c,b,c],[b,a,a]],[[a,c,b,c],[b,a,b,d]],[[a,c,b,c],[b,c]],[[a,c,b,c],[b,c,b]],[[a,c,b,c],[b,c,c,a]],[[a,c,b,c],[c,b]],[[a,c,b,c],[c,b,a]],[[a,c,b,c],[c,b,d,b]],[[a,c,c],[a]],[[a,c,c],[a,b]],[[a,c,c],[a,b,a,d]],[[a,c,c],[a,b,d]],[[a,c,c],[a,c]],[[a,c,c],[a,c,a]],[[a,c,c],[a,c,a,a]],[[a,c,c],[a,c,b,c]],[[a,c,c],[a,c,c]],[[a,c,c],[b,a]],[[a,c,c],[b,a,a]],[[a,c,c],[b,a,b,d]],[[a,c,c],[b,c]],[[a,c,c],[b,c,b]],[[a,c,c],[b,c,c,a]],[[a,c,c],[c,b]],[[a,c,c],[c,b,a]],[[a,c,c],[c,b,d,b]],[[b,a],[a]],[[b,a],[a,b]],[[b,a],[a,b,a,d]],[[b,a],[a,b,d]],[[b,a],[a,c]],[[b,a],[a,c,a]],[[b,a],[a,c,a,a]],[[b,a],[a,c,b,c]],[[b,a],[a,c,c]],[[b,a],[b,a]],[[b,a],[b,a,a]],[[b,a],[b,a,b,d]],[[b,a],[b,c]],[[b,a],[b,c,b]],[[b,a],[b,c,c,a]],[[b,a],[c,b]],[[b,a],[c,b,a]],[[b,a],[c,b,d,b]],[[b,a,a],[a]],[[b,a,a],[a,b]],[[b,a,a],[a,b,a,d]],[[b,a,a],[a,b,d]],[[b,a,a],[a,c]],[[b,a,a],[a,c,a]],[[b,a,a],[a,c,a,a]],[[b,a,a],[a,c,b,c]],[[b,a,a],[a,c,c]],[[b,a,a],[b,a]],[[b,a,a],[b,a,a]],[[b,a,a],[b,a,b,d]],[[b,a,a],[b,c]],[[b,a,a],[b,c,b]],[[b,a,a],[b,c,c,a]],[[b,a,a],[c,b]],[[b,a,a],[c,b,a]],[[b,a,a],[c,b,d,b]],[[b,a,b,d],[a]],[[b,a,b,d],[a,b]],[[b,a,b,d],[a,b,a,d]],[[b,a,b,d],[a,b,d]],[[b,a,b,d],[a,c]],[[b,a,b,d],[a,c,a]],[[b,a,b,d],[a,c,a,a]],[[b,a,b,d],[a,c,b,c]],[[b,a,b,d],[a,c,c]],[[b,a,b,d],[b,a]],[[b,a,b,d],[b,a,a]],[[b,a,b,d],[b,a,b,d]],[[b,a,b,d],[b,c]],[[b,a,b,d],[b,c,b]],[[b,a,b,d],[b,c,c,a]],[[b,a,b,d],[c,b]],[[b,a,b,d],[c,b,a]],[[b,a,b,d],[c,b,d,b]],[[b,a,b,d],[d]],[[b,c],[a,b]],[[b,c],[a,b,a,d]],[[b,c],[a,b,d]],[[b,c],[a,c]],[[b,c],[a,c,a]],[[b,c],[a,c,a,a]],[[b,c],[a,c,b,c]],[[b,c],[a,c,c]],[[b,c],[b,a]],[[b,c],[b,a,a]],[[b,c],[b,a,b,d]],[[b,c],[b,c]],[[b,c],[b,c,b]],[[b,c],[b,c,c,a]],[[b,c],[c,b]],[[b,c],[c,b,a]],[[b,c],[c,b,d,b]],[[b,c,b],[a,b]],[[b,c,b],[a,b,a,d]],[[b,c,b],[a,b,d]],[[b,c,b],[a,c]],[[b,c,b],[a,c,a]],[[b,c,b],[a,c,a,a]],[[b,c,b],[a,c,b,c]],[[b,c,b],[a,c,c]],[[b,c,b],[b,a]],[[b,c,b],[b,a,a]],[[b,c,b],[b,a,b,d]],[[b,c,b],[b,c]],[[b,c,b],[b,c,b]],[[b,c,b],[b,c,c,a]],[[b,c,b],[c,b]],[[b,c,b],[c,b,a]],[[b,c,b],[c,b,d,b]],[[b,c,c,a],[a]],[[b,c,c,a],[a,b]],[[b,c,c,a],[a,b,a,d]],[[b,c,c,a],[a,b,d]],[[b,c,c,a],[a,c]],[[b,c,c,a],[a,c,a]],[[b,c,c,a],[a,c,a,a]],[[b,c,c,a],[a,c,b,c]],[[b,c,c,a],[a,c,c]],[[b,c,c,a],[b,a]],[[b,c,c,a],[b,a,a]],[[b,c,c,a],[b,a,b,d]],[[b,c,c,a],[b,c]],[[b,c,c,a],[b,c,b]],[[b,c,c,a],[b,c,c,a]],[[b,c,c,a],[c,b]],[[b,c,c,a],[c,b,a]],[[b,c,c,a],[c,b,d,b]],[[c,b],[a,b]],[[c,b],[a,b,a,d]],[[c,b],[a,b,d]],[[c,b],[a,c]],[[c,b],[a,c,a]],[[c,b],[a,c,a,a]],[[c,b],[a,c,b,c]],[[c,b],[a,c,c]],[[c,b],[b,a]],[[c,b],[b,a,a]],[[c,b],[b,a,b,d]],[[c,b],[b,c]],[[c,b],[b,c,b]],[[c,b],[b,c,c,a]],[[c,b],[c,b]],[[c,b],[c,b,a]],[[c,b],[c,b,d,b]],[[c,b,a],[a]],[[c,b,a],[a,b]],[[c,b,a],[a,b,a,d]],[[c,b,a],[a,b,d]],[[c,b,a],[a,c]],[[c,b,a],[a,c,a]],[[c,b,a],[a,c,a,a]],[[c,b,a],[a,c,b,c]],[[c,b,a],[a,c,c]],[[c,b,a],[b,a]],[[c,b,a],[b,a,a]],[[c,b,a],[b,a,b,d]],[[c,b,a],[b,c]],[[c,b,a],[b,c,b]],[[c,b,a],[b,c,c,a]],[[c,b,a],[c,b]],[[c,b,a],[c,b,a]],[[c,b,a],[c,b,d,b]],[[c,b,d,b],[a,b]],[[c,b,d,b],[a,b,a,d]],[[c,b,d,b],[a,b,d]],[[c,b,d,b],[a,c]],[[c,b,d,b],[a,c,a]],[[c,b,d,b],[a,c,a,a]],[[c,b,d,b],[a,c,b,c]],[[c,b,d,b],[a,c,c]],[[c,b,d,b],[b,a]],[[c,b,d,b],[b,a,a]],[[c,b,d,b],[b,a,b,d]],[[c,b,d,b],[b,c]],[[c,b,d,b],[b,c,b]],[[c,b,d,b],[b,c,c,a]],[[c,b,d,b],[c,b]],[[c,b,d,b],[c,b,a]],[[c,b,d,b],[c,b,d,b]],[[c,b,d,b],[d]],[[d],[a,b,a,d]],[[d],[a,b,d]],[[d],[b,a,b,d]],[[d],[c,b,d,b]],[[d],[d]]],
			 sort(LL,SLL),
			 ((SLL=TRUEs,S is 20) ; (\+ SLL = TRUEs,S is 0)).



testAll_intersect(L1,L2,L3):-listsA(L1),listsA(L2),listsA(L3),all_intersect([L1,L2],L3).
testQ6e(S):-findall([L1,L2,L3],testAll_intersect(L1,L2,L3),LL),
	                 TRUEs=  [[[a,c,a],[a,c,a],[a,c,a]],[[a,c,a],[a,c,a],[b,a]],[[a,c,a],[a,c,a],[b,a,a]],[[a,c,a],[a,c,a],[b,a,b,d]],[[a,c,a],[a,c,a],[c,b]],[[a,c,a],[b,a],[a,c,a]],[[a,c,a],[b,a],[b,a]],[[a,c,a],[b,a],[b,a,a]],[[a,c,a],[b,a],[b,a,b,d]],[[a,c,a],[b,a],[c,b]],[[a,c,a],[b,a,a],[a,c,a]],[[a,c,a],[b,a,a],[b,a]],[[a,c,a],[b,a,a],[b,a,a]],[[a,c,a],[b,a,a],[b,a,b,d]],[[a,c,a],[b,a,a],[c,b]],[[a,c,a],[b,a,b,d],[a,c,a]],[[a,c,a],[b,a,b,d],[b,a]],[[a,c,a],[b,a,b,d],[b,a,a]],[[a,c,a],[b,a,b,d],[b,a,b,d]],[[a,c,a],[b,a,b,d],[c,b]],[[a,c,a],[c,b],[a,c,a]],[[a,c,a],[c,b],[b,a]],[[a,c,a],[c,b],[b,a,a]],[[a,c,a],[c,b],[b,a,b,d]],[[a,c,a],[c,b],[c,b]],[[a,c,a],[d],[b,a,b,d]],[[b,a],[a,c,a],[a,c,a]],[[b,a],[a,c,a],[b,a]],[[b,a],[a,c,a],[b,a,a]],[[b,a],[a,c,a],[b,a,b,d]],[[b,a],[a,c,a],[c,b]],[[b,a],[b,a],[a,c,a]],[[b,a],[b,a],[b,a]],[[b,a],[b,a],[b,a,a]],[[b,a],[b,a],[b,a,b,d]],[[b,a],[b,a],[c,b]],[[b,a],[b,a,a],[a,c,a]],[[b,a],[b,a,a],[b,a]],[[b,a],[b,a,a],[b,a,a]],[[b,a],[b,a,a],[b,a,b,d]],[[b,a],[b,a,a],[c,b]],[[b,a],[b,a,b,d],[a,c,a]],[[b,a],[b,a,b,d],[b,a]],[[b,a],[b,a,b,d],[b,a,a]],[[b,a],[b,a,b,d],[b,a,b,d]],[[b,a],[b,a,b,d],[c,b]],[[b,a],[c,b],[a,c,a]],[[b,a],[c,b],[b,a]],[[b,a],[c,b],[b,a,a]],[[b,a],[c,b],[b,a,b,d]],[[b,a],[c,b],[c,b]],[[b,a],[d],[b,a,b,d]],[[b,a,a],[a,c,a],[a,c,a]],[[b,a,a],[a,c,a],[b,a]],[[b,a,a],[a,c,a],[b,a,a]],[[b,a,a],[a,c,a],[b,a,b,d]],[[b,a,a],[a,c,a],[c,b]],[[b,a,a],[b,a],[a,c,a]],[[b,a,a],[b,a],[b,a]],[[b,a,a],[b,a],[b,a,a]],[[b,a,a],[b,a],[b,a,b,d]],[[b,a,a],[b,a],[c,b]],[[b,a,a],[b,a,a],[a,c,a]],[[b,a,a],[b,a,a],[b,a]],[[b,a,a],[b,a,a],[b,a,a]],[[b,a,a],[b,a,a],[b,a,b,d]],[[b,a,a],[b,a,a],[c,b]],[[b,a,a],[b,a,b,d],[a,c,a]],[[b,a,a],[b,a,b,d],[b,a]],[[b,a,a],[b,a,b,d],[b,a,a]],[[b,a,a],[b,a,b,d],[b,a,b,d]],[[b,a,a],[b,a,b,d],[c,b]],[[b,a,a],[c,b],[a,c,a]],[[b,a,a],[c,b],[b,a]],[[b,a,a],[c,b],[b,a,a]],[[b,a,a],[c,b],[b,a,b,d]],[[b,a,a],[c,b],[c,b]],[[b,a,a],[d],[b,a,b,d]],[[b,a,b,d],[a,c,a],[a,c,a]],[[b,a,b,d],[a,c,a],[b,a]],[[b,a,b,d],[a,c,a],[b,a,a]],[[b,a,b,d],[a,c,a],[b,a,b,d]],[[b,a,b,d],[a,c,a],[c,b]],[[b,a,b,d],[b,a],[a,c,a]],[[b,a,b,d],[b,a],[b,a]],[[b,a,b,d],[b,a],[b,a,a]],[[b,a,b,d],[b,a],[b,a,b,d]],[[b,a,b,d],[b,a],[c,b]],[[b,a,b,d],[b,a,a],[a,c,a]],[[b,a,b,d],[b,a,a],[b,a]],[[b,a,b,d],[b,a,a],[b,a,a]],[[b,a,b,d],[b,a,a],[b,a,b,d]],[[b,a,b,d],[b,a,a],[c,b]],[[b,a,b,d],[b,a,b,d],[a,c,a]],[[b,a,b,d],[b,a,b,d],[b,a]],[[b,a,b,d],[b,a,b,d],[b,a,a]],[[b,a,b,d],[b,a,b,d],[b,a,b,d]],[[b,a,b,d],[b,a,b,d],[c,b]],[[b,a,b,d],[b,a,b,d],[d]],[[b,a,b,d],[c,b],[a,c,a]],[[b,a,b,d],[c,b],[b,a]],[[b,a,b,d],[c,b],[b,a,a]],[[b,a,b,d],[c,b],[b,a,b,d]],[[b,a,b,d],[c,b],[c,b]],[[b,a,b,d],[d],[b,a,b,d]],[[b,a,b,d],[d],[d]],[[c,b],[a,c,a],[a,c,a]],[[c,b],[a,c,a],[b,a]],[[c,b],[a,c,a],[b,a,a]],[[c,b],[a,c,a],[b,a,b,d]],[[c,b],[a,c,a],[c,b]],[[c,b],[b,a],[a,c,a]],[[c,b],[b,a],[b,a]],[[c,b],[b,a],[b,a,a]],[[c,b],[b,a],[b,a,b,d]],[[c,b],[b,a],[c,b]],[[c,b],[b,a,a],[a,c,a]],[[c,b],[b,a,a],[b,a]],[[c,b],[b,a,a],[b,a,a]],[[c,b],[b,a,a],[b,a,b,d]],[[c,b],[b,a,a],[c,b]],[[c,b],[b,a,b,d],[a,c,a]],[[c,b],[b,a,b,d],[b,a]],[[c,b],[b,a,b,d],[b,a,a]],[[c,b],[b,a,b,d],[b,a,b,d]],[[c,b],[b,a,b,d],[c,b]],[[c,b],[c,b],[a,c,a]],[[c,b],[c,b],[b,a]],[[c,b],[c,b],[b,a,a]],[[c,b],[c,b],[b,a,b,d]],[[c,b],[c,b],[c,b]],[[c,b],[d],[b,a,b,d]],[[d],[a,c,a],[b,a,b,d]],[[d],[b,a],[b,a,b,d]],[[d],[b,a,a],[b,a,b,d]],[[d],[b,a,b,d],[b,a,b,d]],[[d],[b,a,b,d],[d]],[[d],[c,b],[b,a,b,d]],[[d],[d],[b,a,b,d]],[[d],[d],[d]]],
			 sort(LL,SLL),
			 ((SLL=TRUEs,S is 20) ; (\+ SLL = TRUEs,S is 0)).


testSR(S):-findall(TS,( graph(G),source_removal(G,TS) ),TSs),
	sort(TSs,SortedTSs),
	TRUEs = [[a,b,c,d,e,f,g,h],[a,b,c,d,e,g,f,h],[a,b,c,d,e,g,h,f],[a,b,c,d,g,e,f,h],
			 [a,b,c,d,g,e,h,f],[a,b,c,d,g,h,e,f],[a,b,c,e,d,f,g,h],[a,b,c,e,d,g,f,h],
			 [a,b,c,e,d,g,h,f],[a,b,c,e,f,d,g,h],[a,b,c,e,f,g,d,h],[a,b,c,e,g,d,f,h],
			 [a,b,c,e,g,d,h,f],[a,b,c,e,g,f,d,h],[a,b,c,g,d,e,f,h],[a,b,c,g,d,e,h,f],
			 [a,b,c,g,d,h,e,f],[a,b,c,g,e,d,f,h],[a,b,c,g,e,d,h,f],[a,b,c,g,e,f,d,h],
			 [a,b,e,c,d,f,g,h],[a,b,e,c,d,g,f,h],[a,b,e,c,d,g,h,f],[a,b,e,c,f,d,g,h],
			 [a,b,e,c,f,g,d,h],[a,b,e,c,g,d,f,h],[a,b,e,c,g,d,h,f],[a,b,e,c,g,f,d,h],
			 [a,b,e,f,c,d,g,h],[a,b,e,f,c,g,d,h],[a,c,b,d,e,f,g,h],[a,c,b,d,e,g,f,h],
			 [a,c,b,d,e,g,h,f],[a,c,b,d,g,e,f,h],[a,c,b,d,g,e,h,f],[a,c,b,d,g,h,e,f],
			 [a,c,b,e,d,f,g,h],[a,c,b,e,d,g,f,h],[a,c,b,e,d,g,h,f],[a,c,b,e,f,d,g,h],
			 [a,c,b,e,f,g,d,h],[a,c,b,e,g,d,f,h],[a,c,b,e,g,d,h,f],[a,c,b,e,g,f,d,h],
			 [a,c,b,g,d,e,f,h],[a,c,b,g,d,e,h,f],[a,c,b,g,d,h,e,f],[a,c,b,g,e,d,f,h],
			 [a,c,b,g,e,d,h,f],[a,c,b,g,e,f,d,h],[a,c,d,b,e,f,g,h],[a,c,d,b,e,g,f,h],
			 [a,c,d,b,e,g,h,f],[a,c,d,b,g,e,f,h],[a,c,d,b,g,e,h,f],[a,c,d,b,g,h,e,f],
			 [a,c,d,e,b,f,g,h],[a,c,d,e,b,g,f,h],[a,c,d,e,b,g,h,f],[a,c,e,b,d,f,g,h],
			 [a,c,e,b,d,g,f,h],[a,c,e,b,d,g,h,f],[a,c,e,b,f,d,g,h],[a,c,e,b,f,g,d,h],
			 [a,c,e,b,g,d,f,h],[a,c,e,b,g,d,h,f],[a,c,e,b,g,f,d,h],[a,c,e,d,b,f,g,h],
			 [a,c,e,d,b,g,f,h],[a,c,e,d,b,g,h,f],[a,e,b,c,d,f,g,h],[a,e,b,c,d,g,f,h],
			 [a,e,b,c,d,g,h,f],[a,e,b,c,f,d,g,h],[a,e,b,c,f,g,d,h],[a,e,b,c,g,d,f,h],
			 [a,e,b,c,g,d,h,f],[a,e,b,c,g,f,d,h],[a,e,b,f,c,d,g,h],[a,e,b,f,c,g,d,h],
			 [a,e,c,b,d,f,g,h],[a,e,c,b,d,g,f,h],[a,e,c,b,d,g,h,f],[a,e,c,b,f,d,g,h],
			 [a,e,c,b,f,g,d,h],[a,e,c,b,g,d,f,h],[a,e,c,b,g,d,h,f],[a,e,c,b,g,f,d,h],
			 [a,e,c,d,b,f,g,h],[a,e,c,d,b,g,f,h],[a,e,c,d,b,g,h,f],[c,a,b,d,e,f,g,h],
			 [c,a,b,d,e,g,f,h],[c,a,b,d,e,g,h,f],[c,a,b,d,g,e,f,h],[c,a,b,d,g,e,h,f],
			 [c,a,b,d,g,h,e,f],[c,a,b,e,d,f,g,h],[c,a,b,e,d,g,f,h],[c,a,b,e,d,g,h,f],
			 [c,a,b,e,f,d,g,h],[c,a,b,e,f,g,d,h],[c,a,b,e,g,d,f,h],[c,a,b,e,g,d,h,f],
			 [c,a,b,e,g,f,d,h],[c,a,b,g,d,e,f,h],[c,a,b,g,d,e,h,f],[c,a,b,g,d,h,e,f],
			 [c,a,b,g,e,d,f,h],[c,a,b,g,e,d,h,f],[c,a,b,g,e,f,d,h],[c,a,d,b,e,f,g,h],
			 [c,a,d,b,e,g,f,h],[c,a,d,b,e,g,h,f],[c,a,d,b,g,e,f,h],[c,a,d,b,g,e,h,f],
			 [c,a,d,b,g,h,e,f],[c,a,d,e,b,f,g,h],[c,a,d,e,b,g,f,h],[c,a,d,e,b,g,h,f],
			 [c,a,e,b,d,f,g,h],[c,a,e,b,d,g,f,h],[c,a,e,b,d,g,h,f],[c,a,e,b,f,d,g,h],
			 [c,a,e,b,f,g,d,h],[c,a,e,b,g,d,f,h],[c,a,e,b,g,d,h,f],[c,a,e,b,g,f,d,h],
			 [c,a,e,d,b,f,g,h],[c,a,e,d,b,g,f,h],[c,a,e,d,b,g,h,f],[c,d,a,b,e,f,g,h],
			 [c,d,a,b,e,g,f,h],[c,d,a,b,e,g,h,f],[c,d,a,b,g,e,f,h],[c,d,a,b,g,e,h,f],
			 [c,d,a,b,g,h,e,f],[c,d,a,e,b,f,g,h],[c,d,a,e,b,g,f,h],[c,d,a,e,b,g,h,f]],
			 ((SortedTSs=TRUEs,S is 50) ; (\+ SortedTSs = TRUEs,S is 0)).


:-score(S),nl,write('Score = '),write(S).
