% Hechos
es_estadounidense(col_west).
es_nacion_hostil(corea_del_sur).
tiene_misiles(corea_del_sur).

% Reglas
vende_armas(X, Y) :-
    es_estadounidense(X),
    es_nacion_hostil(Y).

es_criminal(X) :-
    vende_armas(X, Y),
    tiene_misiles(Y).
