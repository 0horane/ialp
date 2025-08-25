juntar([],A,A).
juntar([A|AS],B,[C|CS]) :-
  A = C, juntar(AS,B,CS).
