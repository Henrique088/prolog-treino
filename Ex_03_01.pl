%saber se uma comida é típica brasileira
italiana(pizza).
italiana(calzone).
italiana(lazanha).
mineira(tutu).
mineira(feijoada).
gaucha(churrascada).
uruguaia(churrascada).
argentina(churrascada).
paraguaia(churrascada).

brasileira(X) :- gaucha(X); mineira(X).



nota_freq(alberto,logica,9.0,60.0).
nota_freq(juca,logica,7.0,95.0).
nota_freq(maria,logica,4.0,75.0).

somas(X, T) :- nota_freq(_, _, I, _), somas(X, R), T is (I + R).

%retornar o nome e a nota dos alunos.

%nota_freq(X,_,Y,_).

aprovado(X) :- nota_freq(X,_,Y,Z), Y>=7, Z>=75.
reprovado(Y) :- nota_freq(Y,_,X,_), X=<6; nota_freq(Y,_,_,Z), Z=<74.

%verifica aprovamento independente de qualquer disciplina
%nota_freq(X,_,Y,Z), Y>=7, Z>=75.

%Busca pelos aprovados em logica
%nota_freq(X,logica,Z,W), Z>=7, W>=75.


jogo_velha_a(o,x,o).
jogo_velha_b(o,o,x).
jogo_velha_c(o,x,x).

vencedor(X) :- jogo_velha_a(X,_,_), jogo_velha_b(X,_,_), jogo_velha_c(X,_,_); jogo_velha_a(_,X,_), jogo_velha_b(_,X,_), jogo_velha_c(_,X,_); jogo_velha_1(_,_,X), jogo_velha_2(_,_,X), jogo_velha_3(_,_,X).

vencedor(X) :- jogo_velha_a(X,X,X);jogo_velha_b(X,X,X);jogo_velha_c(X,X,X).

vencedor(X) :-
jogo_velha_a(X,_,_), jogo_velha_b(_,X,_), jogo_velha_c(_,_,X).

vencedor(X) :-
jogo_velha_a(_,_,X), jogo_velha_b(_,X,_), jogo_velha_c(X,_,_).




%regioes fronteiras com cores diferentes adjacentementes

seleciona_cor(A,B,C,D) :- random(1,4,A), random(1,4,B), A =\=B, random(1,4,C), C=\=A, C=\=B,  D =A; seleciona_cor(A,B,C,D).
 
 
conexao(a,b).
conexao(a,d).
conexao(a,c).
conexao(c,e).
conexao(c,f).
conexao(f,g).
conexao(h,i).

%pega conexao direta e indireta
direta(X,Y) :- conexao(X,Y).
direta(X,Y) :- conexao(X,K), direta(K,Y).
%      a,g             a,P11=c      c,g
%onde eu consigo chegar a partir de certa cidade



come(urso,peixe).
come(peixe,peixinho).
come(peixinho,alga).
come(peixe,alga).
come(urso,raposa).
come(veado,grama).
come(peixe,minhoca).
come(urso,guaxinim).
come(raposa,coelho).
come(urso,veado).
come(lince,veado).
come(planta_carnívora,mosca).
come(veado,planta_carnívora).
animal(urso).
animal(peixe).
animal(raposa).
animal(veado).
animal(minhoca).
animal(lince).
animal(coelho).
animal(guaxinim).
animal(mosca).
animal(peixinho).
planta(grama).
planta(alga).
planta(planta_carnívora).

%retorna quem come peixe
come_peixe(X) :- come(X,peixe).

%retorna os animais
% animal(X) 

%relação come

comem(X) :- come(X,_).

%carnivoro

carnivoro(X) :- come(X,Y), animal(Y).

%herbivoro
herbivoro(X) :- come(X,Y), planta(Y).

%predador

predador(X) :- carnivoro(X), animal(X).

%presa 

presa(X) :- predador(Y), come(Y,X), animal(X).


dia_semana(segunda).
dia_semana(terca).
dia_semana(quarta).
dia_semana(quinta).
dia_semana(sexta).
fim_semana(sabado).
fim_semana(domingo).

dia_fim(X) :- dia_semana(X), write('dia da semana' ); fim_semana(X), write('fim de semana' ).


homem(pedro).
homem(marcos).
homem(ze).
mulher(maria).
mulher(joana).
idade(ze,30).
idade(maria,40).
idade(marcos,20).
idade(pedro,25).
idade(joana,28).
gosta(ze,aventura).
gosta(maria,comedia).
gosta(joana,romance).
gosta(marcos,terror).
gosta(marcos,romance).
gosta(pedro,romance).
gosta(maria,romance).
opcao(ze,20,40).
opcao(pedro,25,55).
opcao(marcos,20,21).
opcao(maria,25,55).
opcao(joana,28,30).

%mesmo gosto

afinidade_filme(X,Y) :- gosta(X,Z), gosta(Y,Z), format("~w tem afinidade com ~w~n",[X,Y]).

casal() :- homem(X), mulher(Y), format("~w forma casal com ~w",[X,Y]).


exclui(X, [X|Tail], Tail).
exclui(X, [Y| Tail], [Y | Tail1]) :- exclui(X, Tail, Tail1), write(Tail), write(Tail1).




%pega os dois primeiros elementos da lista

dois_primeiros([X,Y|_], X,Y).

%verifica se duas listas tem o mesmo tamanho.

tam([],[]).
tam([_|Tail1], [_|Tail2]) :- tam(Tail1, Tail2).


%pega o ultimo elemento de uma lista.

ultimo_ele([X],X).
ultimo_ele([_|Tail],X) :-  ultimo_ele(Tail,X).

%verfica se um elemento está na lista

pertence(X, [Y|Tail]) :- Y==X; pertence(X, Tail).

%verifica se são consecutivos.

conse(X,Y, [X,Y|_]).
conse(X,Y, [T,R|Tail]) :- X==R, Y==T; conse(X,Y,Tail).


%Somar elementos de uma lista
soma([],0).
soma([A|Tail], T) :- soma(Tail, T1), T is T1 + A.

%n-esimo termo
enésimo(1, X, [X | _]).
enésimo(N, X, [_ | Y]) :- enésimo(M, X, Y), N is M+1.

%pega o indice de uma lista e coloca o resultado em outra lista
lista_re([], _ , []).
lista_re([P|Tail], L, [R|Tail2]) :- enésimo(P, R, L), lista_re(Tail, L, Tail2).

%duplica uma lista
duasVezes([],[]).
duasVezes([H|Tail],S) :- duasVezes(Tail,S1), S=[H,H|S1].

%inserir na primeira posição da lista.

inse(X,[T|Tail],R) :- R =[X,T|Tail].

%concaternar duas listas.

conc([], L, L).
conc([X | L1], L2, [X | L3]) :-
conc(L1, L2, L3).



