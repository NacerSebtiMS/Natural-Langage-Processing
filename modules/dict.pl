/* ** DICTIONNAIRE ** */

/* Adjectifs */

%Liste des radicaux des adjectifs
adj_rad(X) :- member(X,[
"joli",
"grand",
"petit"

]).

/* Noms */

%Liste des noms feminins singulier
nom_fs(X) :- member(X,[
"femme",
"chienne",
"chatte"

]).

%Liste des noms masculin singulier
nom_ms(X) :- member(X,[
"homme",
"chien",
"chat"
]).

/* Verbes */

%Liste de radicaux de verbes
verbe_rad(X) :- member(X,[
"regard",
"mont",
"gard",
"frapp",
"lav",
"caress"
]).

/* Prepositions */
prep_d(X) :- member(X,["dans",
"par",
"avec",
"sur"
]).



/* Articles */

%Masculin singulier
art_d(X,m,s) :- member(X,["le","un"]).

%Feminin singulier
art_d(X,f,s) :- member(X,["la","une"]).

%Pluriel (Masculin + Feminin)
art_d(X,_,p) :- member(X,["les","des"]).


