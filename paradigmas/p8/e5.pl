pertenece(A,[A|_]).
pertenece(A,[_|AS]) :- pertenece(A,AS).
