/* DICTIONNAIRE */


adj_rad(X) :- member(X,["joli",
                        "grand",
                        "petit"
                       ]).


art_d(X,m,s) :- member(X,["le","un"]).
art_d(X,f,s) :- member(X,["la","une"]).
art_d(X,_,p) :- member(X,["les","des"]).

prep_d(X) :- member(X,["dans",
                       "par",
                       "avec",
                       "sur"
                      ]).

nom_fs(X) :- member(X,["femme",
                       "chienne",
                       "chatte"
                      ]).

nom_ms(X) :- member(X,["homme",
                       "chien",
                       "chat"
                      ]).


verbe_rad(X) :- member(X,["regard",
                          "mont",
                          "gard",
                          "frapp",
                          "lav",
                          "caress"
                         ]).