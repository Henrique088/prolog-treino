
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
direta(X,Y) :- conexao(K,X), conexao(V,Y),K==V.

%onde eu consigo chegar a partir de certa cidade

%onde_chega(X,_) :- conexao(X,Y),write(Y), conexao(Y,Z), write(Z), conexao(Z,W),write(W).

onde_chega(X,_) :- conexao(X,Y),write(Y), conexao(Y,Z),write(Z).
