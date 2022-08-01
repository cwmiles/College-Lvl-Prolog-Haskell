% you need to replace, e.g., "D='fix this'" with a valid query.

%Did Leonardo DiCaprio act in Babel?
q1 :- acted_in('Leonardo_Dicaprio','Babel').

%Who directed District 9?
q2(D) :- directed(D,'District 9').

%Did anyone act in Both Click and The Aviator
q3(A) :- acted_in(A, 'Click'), acted_in(A,'The Aviator').

%Was there a movie released in 2010 that did not star Jennifer Aniston?
q4(M):-  released(M,2010),\+ acted_in('Jennifer Aniston',M).

%Who directed movies released in 2009? (dont worry about ; part)
q5(D):-  directed(D,M),released(M,2009).

%Has anyone directed more than one movie?
q6(D) :- directed(D,M), directed(D,X), \+ M=X.

%Does any movie have more than one director?
q7(M) :- directed(D,M),directed(Y,M), \+ Y=D.

%Has anyone acted in more than one movie released in 2008?
q8(A) :- acted_in(A,M),acted_in(A,X),released(M,2008),released(X,2008), \+ M=X.

%Has anyone acted in more than two movies in the same year?
q9(A) :- released(M1,Y), released(M2,Y), released(M3,Y), acted_in(A,M1),acted_in(A,M2), acted_in(A,M3), \+M1=M2, \+ M2=M3, \+M1=M3.

%Who has worked with the same director in different years?
q10(A) :- directed(D,M),directed(D,R),released(M,Y),released(R,H),acted_in(A,M),acted_in(A,R), \+M=R, \+ Y=H.


