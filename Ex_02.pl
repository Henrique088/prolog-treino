%verifica se as duas listas tem o mesmo tamanho.
verifi([],[]).
verifi([_|T1],[_|T2]) :- verifi(T1,T2).


%Pega o segundo elemento da lista.
segundoelemento(X,[_,T|_]) :- X=:=T.


%verifica se duas listas são iguais exceto pelo dois primeiros termos que devem serem iguais porem trocados.


primeirostermos([X,Y|Lista1],[T,Z|Lista2]) :- X =:= Z, Y=:=T, verificaresto(Lista1,Lista2).

verificaresto([],[]).
verificaresto([A|Rest1],[B|Rest2]) :- A=:=B, verificaresto(Rest1,Rest2).


%bonecas russas.

bonecas(katarina,olga).
bonecas(olga,natasha).
bonecas(natasha,irina).

diretamente(X,Y) :- bonecas(Y,X).
%diretamente(X,Y) :- bonecas(T,X), bonecas(I,T), Y=I.
%diretamente(X,Y) :- bonecas(T,X), bonecas(I,T),bonecas(R,I),R=Y.

diretamente(X,Y) :- bonecas(Z,X), diretamente(Z,Y).

%listatrain([eins,neun,zwei],X). deve retornar: X = [um,nove,dois].
train(eins,um).
train(zwei,dois).
train(drei,tres).
train(vier,quatro).
train(fuenf,cinco).
train(sechs,seis).
train(sieben,sete).
train(acht,oito).
train(neun,nove).

listatrain([],[]).
listatrain([H|Tail],S) :- train(H,Port), listatrain(Tail,S1), S =[Port|S1].

duasVezes([],[]).
duasVezes([H|Tail],S) :- duasVezes(Tail,S1), S=[H,H|S1].


%duplica uma lista
duasVezes([],[]).
duasVezes([H|Tail],S) :- duasVezes(Tail,S1), S=[H,H|S1].














