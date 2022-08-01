:-['TreeCode.pl'].

%EXAMPLE tree
node(a,b,c).
node(b,d,e).
node(c,f,nil).
node(d,nil,nil).
node(e,nil,g).
node(f,nil,nil).
node(g,nil,nil).

score1a(S):-findall([R],root(R),Roots),
    ((Roots=[[a]], S is 4); \+ Roots=[[a]], S is 0 ).

score1b(S):-findall([L,N],leaf_of(L,N),LNs), sort(LNs, SLNs), length(SLNs,Len),
    ((Len =:= 7, S is 7); \+ Len = 7, S is 0 ).

score1c(S):-findall([P,Cs],parent_of(P,Cs),PCs), sort(PCs, SPCs), length(SPCs,Len),
    ((Len =:= 9, S is 4); \+ Len = 9, S is 0 ).

score(S):- score1a(Sa),score1b(Sb),score1c(Sc),
    S is Sa+Sb+Sc,
    write('Score Q1a = '),write(Sa),nl,
    write('Score Q1b = '),write(Sb),nl,
    write('Score Q1c = '),write(Sc),nl,
    write('Your Scrore is '),write(S).

:-score(_).
