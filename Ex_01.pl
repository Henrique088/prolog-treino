pai(ivo,eva).
pai(gil,rai).
pai(gil,clo).
pai(gil,ary).
pai(any,gal).
pai(rai,noe).
pai(ary,gal).

mae(ana,eva).
mae(eva,noe).
mae(bia,rai).
mae(bia,clo).
mae(lia,gal).

homem(ivo).
homem(gil).
homem(rai).
homem(any).
homem(noe).

mulher(ana).
mulher(eva).
mulher(bia).
mulher(clo).
mulher(lia).
mulher(gal).

gerou(X,Y) :- pai(Y,X).
gerou(X,Y) :- mae(Y,X).

filho(X,Y) :- pai(Y,X), homem(X).
filho(X,Y) :- mae(Y,X), homem(X).

filha(X,Y) :- pai(Y,X), mulher(X).
filha(X,Y) :- mae(Y,X), mulher(X).

tio(X,Y) :- pai(Z,Y), pai(W,Z), pai(W,_), homem(X).
tia(X,Y) :- mae(Z,Y), mae(W,Z), mae(W,_), mulher(X).

primo(X,Y) :- pai(Z,X), pai(W,Z), pai(K,Y), pai(W,K), homem(X).
prima(X,Y) :- pai(Z,X), pai(W,Z), pai(K,Y), pai(W,K), mulher(X).

avo(X,Y) :- pai(Z,Y), pai(X,Z); mae(V,Y), pai(X,V).
avO(X,Y) :- pai(Z,Y), mae(X,Z); mae(V,Y), mae(X,V).

tem_filho_e_feliz(X) :- pai(X,_), write('Esse ser tem filho ou filha e é feliz').

casal(X,Y) :- pai(X,Z), mae(Y,Z); mae(X,Z), pai(Y,Z).



país(brasil, 9, 130).
país(china, 12, 1800).
país(eua, 9, 230).
país(índia, 3, 450).

%calculo da densidade demográfica
%país(brasil,Y,K), K IS Z/Y, write(K).

%calculo da diferença da china e índia
%país(china,_,X), país(índia,_,Y), K is X-Y, write(K).

%verificação para saber se brasil e eua tem a mesma quantidade de area
%país(brasil,X,_), país(eua,Y,_), X=:=Y.

%verificação se a população do eua é maior do que a da india
%país(eua,_,X),país(índia,_,Y), X>Y.


funcionário(1,ana,1000.90,ary).
funcionário(2,bia,1200.00,_).
funcionário(3,ivo,903.50,[raí,eva]).

%dependentes de ivo
%funcionário(_,ivo,_,[X,Y].

%quem é dependente da ana
%funcionário(_,X,_,ana).

a :- funcionário(_,_,X,Z), X<950, write(Z).

%funcionários que não tem pedentes
%funcionários(_,Y,_,X), _ @< X, write(Y).

joga(ana,volei).
joga(bia,tenis).
joga(ivo,basquete).
joga(eva,volei).
joga(leo,tenis).

%encontra um parceiro para jogar com leo
%joga(leo,X),joga(Y,X),write(Y: ('é um ótimo parceiro(a)')).

