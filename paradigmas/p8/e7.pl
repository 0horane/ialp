interseccion([],BS,[]).
interseccion([A|AS],BS,[A|CS]) :-member(A,BS), delete(BS,A,BSN), interseccion(AS,BSN,CS).
interseccion([A|AS],BS,CS) :- not(member(A,BS)), interseccion(AS,BS,CS).

partir(N,L,L1,L2) :- 
  length(L1,N),
  append(L1,L2,L).

% con N no definida hay generación infinita. aparte de eso es totalmente reversible
% preguntar si eso cuenta como reversible

borrar([],_,[]). 
borrar([A|AS],A,ASN) :- borrar(AS,A,ASN). 
borrar([A|AS],X,[A|ASN]) :- A \= X,borrar(AS,X,ASN).
% no se como usar member

%borrar([],_,[]).
%borrar([X|XS],A,[X|YS]) :- member()  


%sacarDuplicados(A,C) :- interseccion(A,A,C).
sacarDuplicados([],[]).
sacarDuplicados([X|XS],YS) :- member(X, XS), borrar(XS,X,XSsinX), sacarDuplicados([X | XSsinX],YS).
sacarDuplicados([X|XS],[X|YS]) :- not(member(X, XS)), sacarDuplicados(XS,YS).

permutacion([],[]).
permutacion()