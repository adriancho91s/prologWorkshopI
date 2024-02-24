%--- Abraham %
es_padre_de(abraham,herbert).
es_padre_de(abraham,homero).

%--- Clancy %
es_padre_de(clancy,patty).
es_padre_de(clancy,selma).
es_padre_de(clancy,marge).

%--- Homero %
es_padre_de(homero,bart).
es_padre_de(homero,lisa).
es_padre_de(homero,maggie).

%--- Mona %
es_madre_de(mona,homero).
es_madre_de(mona,herbert).

%--- Jacqueline %
es_madre_de(jacqueline,marge).
es_madre_de(jacqueline,patty).
es_madre_de(jacqueline,selma).

%--- Marge %
es_madre_de(marge,bart).
es_madre_de(marge,lisa).
es_madre_de(marge,maggie).

%---Selma Bouvier%
es_madre_de(selma,ling).

%---Géneros%
%-- Hombre %
es_hombre(bart).
%-- Mujer %
es_mujer(lisa).
es_mujer(maggie).
es_mujer(ling).

% Relaciones %
es_hijo_de(Hijo, Papa_Mama):-
    (   
    	es_padre_de(Papa_Mama, Hijo);
    	es_madre_de(Papa_Mama, Hijo)
    ).
es_abuelo_de(Abuelo, Nieto):-
		(   es_padre_de(Papa, Nieto), es_hijo_de(Papa,Abuelo));
    	(   es_madre_de(Mama, Nieto), es_hijo_de(Mama,Abuelo)).
es_abuela_de(Abuela, Nieto):-
		(   es_padre_de(Papa, Nieto), es_hijo_de(Papa,Abuela));
    	(   es_madre_de(Mama, Nieto), es_hijo_de(Mama,Abuela)).
es_hermano_de(Hermano, Hermano_a):-
    (   (   es_padre_de(Papa, Hermano_a),
        es_padre_de(Papa, Hermano)),
    	es_hombre(Hermano), ( Hermano \= Hermano_a  ));
    (   (   es_madre_de(Mama, Hermano_a),
        es_madre_de(Mama, Hermano)),
    	es_hombre(Hermano), ( Hermano \= Hermano_a)).
es_hermana_de(Hermana, Hermano_a):-
    (   (   es_padre_de(Papa, Hermano_a),
        es_padre_de(Papa, Hermana)),
    	es_mujer(Hermana), ( Hermana \= Hermano_a  ));
    (   (   es_madre_de(Mama, Hermano_a),
        es_madre_de(Mama, Hermana)),
    	es_mujer(Hermana), ( Hermana \= Hermano_a)).


es_tia_de(Tia, Sobrino_Sobrina) :-
    (es_padre_de(PapaMama_Sobrino_Sobrina, Sobrino_Sobrina),
		( 
                es_hermana_de(Tia, PapaMama_Sobrino_Sobrina);
    	es_hermano_de(PapaMama_Sobrino_Sobrina, Tia)
        )
     );
    (es_hermana_de(Tia, Papa_Mama_Sobrino_Sobrina), 
     es_madre_de(Papa_Mama_Sobrino_Sobrina, Sobrino_Sobrina)).
es_tio_de(Tio, Sobrino_Sobrina) :-
    (es_hermano_de(Tio, Papa_Mama_Sobrino_Sobrina), 
     es_padre_de(Papa_Mama_Sobrino_Sobrina, Sobrino_Sobrina));
    (es_hermano_de(Tio, Papa_Mama_Sobrino_Sobrina), 
     es_madre_de(Papa_Mama_Sobrino_Sobrina, Sobrino_Sobrina)).

es_primo_de(Primo, Primo1) :- (
                              	es_tio_de(Tio, Primo1);
                              	es_tia_de(Tia, Primo1)
                              ), 
                              (
                              (es_padre_de(Tio, Primo));
                              (es_madre_de(Tia, Primo))
                              ).
es_prima_de(Prima, Prima1) :- (es_tio_de(Tio, Prima1);
                                es_tia_de(Tia, Prima1) ), 
                                (es_hija_de(Prima, Tio); es_hija_de(Prima, Tia)).