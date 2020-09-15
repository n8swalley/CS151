%% This is a comment.

%% Instructions for how to use SWI Prolog:
%% You have to type use_module(library(clpfd)).
%% If for some reason the above line doesn't work, try ensure_loaded(library(clpfd)).
%% You must type this ONCE only at the start of your session.
%% The use_module command is needed for different parts of the project.

%% use_module(library(clpfd)).

%% To load or reload this file, you would type consult(project1sample).

%% Some useful things to know: (similar things also work)
%% digit(X) will make sure that X is an integer [0,9] because of facts below
%% A is B + C adds B and C and binds it to A
%% >= is greater than or equal
%% <  is less than



digit(0).
digit(1).
digit(2).
digit(3).
digit(4).
digit(5).
digit(6).
digit(7).
digit(8).
digit(9).

%% Write your program here.

coladd(X, Y, Z) :- digit(X), digit(Y), Z is (X+Y), Z >= 10, Z is Z - 10 . 

coladd(X, Y, Z) :- digit(X), digit(Y), Z is (X+Y), digit(Z). 

threedigitnocarry(A,B,C, D,E,F, X,Y,Z) :-
	coladd(A, D, X),
	coladd(B, E, Y),
	coladd(C, F, Z).
	
fourdigitnocarry(A,B,C,D, E,F,G,H, W,X,Y,Z) :-
	coladd(A, E, W),
	coladd(B, F, X),
	coladd(C, G, Y),
	coladd(D, H, Z).
	
prob1(A,B,C) :- 
	threedigitnocarry(0,0,A,0,0,B,0,0,C), 
	all_distinct([A, B, C]).
	
prob2(B,C,D,F,G,H,X,Y,Z) :- 
	fourdigitnocarry(0,B,C,D, 0,F,G,H, 0,X,Y,Z), 
	all_distinct([B,C,D, F,G,H, X,Y,Z]).

prob3(A,B,C,D, E,F,G,H, X,J,K,L,M) :- 
   fourdigitcarry(A,B,C,D, E,F,G,H, X,J,K,L,M), 
   all_distinct([A,B,C,D,E,F,G,H,J,K,L,M]).
   
prob4(A,B,C,D, E,F,G,H, X,G,H,J,K) :- 
   fourdigitcarry(A,B,C,D, E,F,G,H, X,G,H,J,K ), 
   all_distinct([A,B,C,D,E,F,G,H,J,K]).
   
prob5(M,O,T,H, T,E,A,R, X,H,M,M,M,M) :- 
   fivedigitcarry(0,M,O,T,H, 0,T,E,A,R, X,H,M,M,M,M), 
   all_distinct([M,O,T,H,E,A,R]).

rcoladdcarry(Top, Bottom, Ones, Carry) :- 
	digit(Top), digit(Bottom),
	Ones is mod(Top + Bottom, 10), 
	Carry is ((Top + Bottom) - mod(Top + Bottom, 10))/10. 

mcoladdcarry(Backcarry, Top, Bottom, Ones, Forwardcarry) :- 
	digit(Top), digit(Bottom), digit(Backcarry), 
	Ones is mod(Top + Bottom + Backcarry, 10), 
	Forwardcarry is ((Top + Bottom + Backcarry) - mod(Top + Bottom + Backcarry, 10))/10.
	
fourdigitcarry(A,B,C,D, E,F,G,H, V,W,X,Y,Z) :-  
	rcoladdcarry(D,H,Z,C1), 
	mcoladdcarry(C1,C,G,Y,C2), 
	mcoladdcarry(C2,B,F,X,C3), 
	mcoladdcarry(C3,A,E,W,V). 

fivedigitcarry(A,B,C,D,E, F,G,H,I,J, U,V,W,X,Y,Z) :- 
	rcoladdcarry(E,J,Z,C1), 
	mcoladdcarry(C1,D,I,Y,C2), 
	mcoladdcarry(C2,C,H,X,C3), 
	mcoladdcarry(C3,B,G,W,C4), 
	mcoladdcarry(C4,A,F,V,U).


	