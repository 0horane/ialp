natural(0).
natural(suc(X)) :- natural(X).
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
menorOIgual(X,X) :- natural(X).

% el problema es que se sigue tomando solo la primera rama y agregando sucs al valor original de la segunda variable porque siempre unifica. 
