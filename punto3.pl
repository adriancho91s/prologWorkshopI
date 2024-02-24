% Hechos
es_estrella(sol).
es_satelite(luna).
es_planeta(venus).
es_planeta(tierra).

% Reglas
orbita_a(luna, tierra).
orbita_a(Satelite_Planeta, Planeta_Estrella) :-
    (es_satelite(Satelite_Planeta), es_planeta(Planeta_Estrella));
    (es_estrella(Planeta_Estrella), es_planeta(Satelite_Planeta)).

es_cuerpo_celeste(Satelite_Planeta_Estrella) :-
    es_estrella(Satelite_Planeta_Estrella);
    es_planeta(Satelite_Planeta_Estrella);
    es_satelite(Satelite_Planeta_Estrella).
