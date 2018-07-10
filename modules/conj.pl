:- [dict].
/* CONJUGAISON */

%  ADJECTIFS
adj_construct(X,G,N) :- adj_rad(Y), adj_term(Z,G,N),
    atom_concat(Y,Z,X).


adj_term("",m,s).
adj_term("e",f,s).
adj_term("s",m,p).
adj_term("es",f,p).

%  VERBS

verbe_construct(X,PP) :- verbe_rad(Y), verbe_term(Z,PP),
    atom_concat(Y, Z, X).

verbe_term("e",je).
verbe_term("es",tu).
verbe_term("e",il).
verbe_term("e",elle).
verbe_term("ons",nous).
verbe_term("ez",vous).
verbe_term("ent",ils).
verbe_term("ent",elles).

%Verbe Etat
verbeEtat_construct("suis",je).
verbeEtat_construct("es",tu).
verbeEtat_construct("est",il).
verbeEtat_construct("est",elle).
verbeEtat_construct("sommes",nous).
verbeEtat_construct("etes",vous).
verbeEtat_construct("sont",ils).
verbeEtat_construct("sont",elles).


%  PPS

pps_d("je",je,s).
pps_d("tu",tu,s).
pps_d("il",il,s).
pps_d("elle",elle,s).
pps_d("nous",nous,p).
pps_d("vous",vous,p).
pps_d("ils",ils,p).
pps_d("elles",elles,p).

%  NOMS

nom_construct(X,G,N) :- nom_fs(X), G=f, N=s.
nom_construct(X,G,N) :- nom_fp(X), G=f, N=p.
nom_construct(X,G,N) :- nom_ms(X), G=m, N=s.
nom_construct(X,G,N) :- nom_mp(X), G=m, N=p.


nom_fp(X) :- nom_fs(Y), atom_concat(Y,"s",X).
nom_mp(X) :- nom_ms(Y), atom_concat(Y,"s",X).


/* GN TO PPS */

conv_GN_PP(m,s,il).
conv_GN_PP(f,s,elle).
conv_GN_PP(m,p,ils).
conv_GN_PP(f,p,elles).

conv_GN_PP(je,_,je).
conv_GN_PP(tu,_,tu).
conv_GN_PP(il,_,il).
conv_GN_PP(elle,_,elle).
conv_GN_PP(nous,_,nous).
conv_GN_PP(vous,_,vous).
conv_GN_PP(ils,_,ils).
conv_GN_PP(elles,_,elles).

/* EXTRACTION */

extract_rad_verbe(X,Y) :- verbe_rad(Y), verbe_term(Z,_),
    atom_concat(Y, Z, X).

extract_rad_adj(X,Y) :- adj_rad(Y), adj_term(Z,_,_),
    atom_concat(Y,Z,X).
