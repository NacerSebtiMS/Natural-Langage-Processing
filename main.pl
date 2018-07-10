:- [syntaxe].
/* MAIN FUNCTION */
analyse(X) :- split_string(X," ","",L), ph(L,[]).