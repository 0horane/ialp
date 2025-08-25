natural(cero).
natural(suc(X)) :- natural(X).

mayorA2(suc(suc(suc(X)))) :- natural(X). 

%! entre(+X,+Y,-Z)
%entre(X,Y,Z) :- 
%    X>=Z, 
%    Z=<Y,
%    X<=Y.
%
%

%
%entre(X,Y,X) :- X =< Y.
%entre(X,Y,Z) :- Xp1 is X+1, entre(Xp1,Y,Z).


entre(X,Y,X) :- X =< Y.
entre(X,Y,Z) :- entre(X+1,Y,Z).



sufijo(L,P) :- append(_, P, L).

prefijo(L,P) :- append(P, _, L).

insertar(X,L, LX) :- 
    append(Pre, [X|Suf], LX), 
    append(Pre,Suf,L).
