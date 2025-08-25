aplanar([],[]).
aplanar([[X|XS]|B],[X|C]) :- aplanar(XS,A),append(A,B,C).
aplanar([X|XS], [X|YS]) :- not(is_list(X)), aplanar(XS,YS).
