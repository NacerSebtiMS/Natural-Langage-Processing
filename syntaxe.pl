:- [conj].

/* PHRASE */
ph(P,R) :- write("ph("),gn(P,S,G,N), conv_GN_PP(G,N,PP), gv(S,R,PP),write(")").

/* GN */
gn(P,R,G,N) :- write(" gn("),sn(P,R,G,N),write(")").
gn([X|Z],Z,G,N) :- write(" gn("),pps(X,G,N),write(")").

/* GV */
gv([X|Z],R,PP) :- write(" gv("),verbe(X,PP), gv2(Z,R,PP),write(")").
gv([X|Z],R,PP) :- write(" gv("),verbeEtat(X,PP), gv5(Z,R,PP),write(")").

gv([X|Z],R,PP) :- write(" gv("), extract_rad_verbe(X,Rad), verbe_term(Y,PP),atom_concat(Rad,Y,W), write("*"),verbe(W,PP),write("*"), gv2(Z,R,PP), write(")").

gv2(P,R,PP) :- cod(P,S,_,_),gv3(S,R,PP).
gv2(P,R,PP) :- gv3(P,R,PP).

gv3(P,R,PP) :- coi(P,S,_,_),gv4(S,R,PP).
gv3(P,R,PP) :- gv4(P,R,PP).

gv4(P,P,_).
gv4(P,R,PP) :- ccirc(P,S,_,_), gv4(S,R,PP).

gv5(P,R,PP) :- att(P,S,_,_), gv4(S,R,PP).
gv5(P,R,PP) :- gv4(P,R,PP).

/* SN */
sn([X|Z],R,G,N) :- write(" sn("),art(X,G,N), sn2(Z,R,G,N),write(")").

% sn([X|Z],R,G,N) :- write(" sn("),switch_art(X,G,N,Y), write("*"),
% art(Y,G,N), write("*"), sn2(Z,R,G,N),write(")").

sn(P,R,G,N) :- write(" sn("),sn2(P,R,G,N),write(")").

sn2([X|Z],R,G,N) :- adj(X,G,N), sn2(Z,R,G,N).

sn2([X|Z],R,G,N) :- extract_rad_adj(X,Rad), adj_term(Y,G,N), atom_concat(Rad,Y,W), write(" *"), adj(W,G,N), write("*"), sn2(Z,R,G,N).


sn2([X|Z],R,G,N) :- nom(X,G,N), sn3(Z,R,G,N).

sn3(P,P,_,_).
sn3(P,R,G,N) :- cnom(P,R,G,N).
sn3([X|Z],R,G,N) :- adj(X,G,N), sn3(Z,R,G,N).

/* CNOM */
cnom(["de"|Z],R,G,N) :- write(" cnom( 'de' "),sn(Z,R,G,N),write(")").

/* COD */
cod(P,R,G,N) :- write(" cod("),sn(P,R,G,N),write(")").

/* ATTRIBUT */
att([X|Z],Z,G,N) :- write(" att("),adj(X,G,N),write(")").
att(P,R,G,N) :- write(" att("),sn(P,R,G,N),write(")").

/* COI */
coi(["à"|Z],R,G,N) :- write(" coi( 'à' "),sn(Z,R,G,N),write(")").

/* CCIRC */
ccirc([X|Z],R,G,N) :- write(" ccirc("),prep(X), sn(Z,R,G,N),write(")").

/* Printers */
nom(X,G,N) :- nom_construct(X,G,N),write(" nom("),  print(X), write(")").
adj(X,G,N) :- adj_construct(X,G,N), write(" adj("),  print(X), write(")").
art(X,G,N) :- art_d(X,G,N),write(" art("),  print(X), write(")").
prep(X) :-  prep_d(X),write(" art("), print(X), write(")").

verbe(X,PP) :-  verbe_construct(X,PP),write(" verbe("), print(X), write(")").

verbeEtat(X,PP) :-  verbeEtat_construct(X,PP),write(" verbeEtat("), print(X), write(")").
pps(X,G,N) :- pps_d(X,G,N), write(" pps("), print(X), write(") ").


/* CORRECTEURS */

% adj(X,G,N) :- extract_rad_adj(X,Rad), adj_term(Y,G,N),
% atom_concat(Rad,Y,W), write("*"),adj_construct(W,G,N), write(" adj("),
% print(W), write(")"),write("*").

switch_art("le",f,s,"la").
switch_art("le",_,p,"les").

switch_art("la",m,s,"le").
switch_art("la",_,p,"les").

switch_art("les",f,s,"la").
switch_art("les",m,s,"le").

switch_art("un",f,s,"une").
switch_art("un",_,p,"des").

switch_art("une",m,s,"un").
switch_art("une",_,p,"des").

switch_art("des",f,s,"une").
switch_art("des",m,s,"un").