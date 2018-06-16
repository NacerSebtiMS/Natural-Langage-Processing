# Natural-Langage-Processing

A project about NLP developed with Prolog

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

You'll need to install SWI-Prolog.
Once done, launch Prolog go to File > Consult then search for the NPL.pl file.

## Running the tests

Now we can go ahead and test the code :

```
?- analyse("le petit chat regarde le chien").
```

This is a correct sentence and as expected thats what the program answers

```
ph( gn( sn( art("le") adj("petit") nom("chat"))) gv( verbe("regarde") cod( sn( art("le") nom("chien")))))
true .
```

The program return the syntax of the sentence.

Let's now try the auto-correct :

```
?- analyse("le petite chat regarde le chien").

ph( gn( sn( art("le") * adj(petit)* nom("chat"))) gv( verbe("regarde") cod( sn( art("le") nom("chien")))))
true .
```

You can notice that the program corrected "petite" to "petit".

Also note that the program can't correct all the mistakes, but still will detect them all :

```
?- analyse("le petite chatte regarde le chien").
ph( gn( sn( art("le") * adj(petit)* sn( gn(
false.
```

Here there was an attempt to correct the sentence, but it failed, so the program returns false.

## Change the dictionnary

My program doesn't have a rich dictionary, but you can add your own words.
For example, if you want to add an adjective change this :

```
adj_rad(X) :- member(X,["joli",
                        "grand",
                        "petit"
                       ]).
```
to this :
```
adj_rad(X) :- member(X,["joli",
                        "grand",
                        "petit",
                        "ravissant"
                       ]).
```
The same goes for names where you have to put then in the feminine and masculine form.
For verbs you have to put the radical for example : 'jouer' becomes 'jou'
