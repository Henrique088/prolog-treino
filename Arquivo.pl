% Autor:
% Data: 23/03/2022

:-dynamic agenda/2.

start :- write('Digite o valor de X: '),
         nl, read(X), nl,
         atom(X),nl,
         write(X), nl.
         
start2(X) :- atom(X),nl,write(X), nl.



%homem(bruno).
ceu(azul).
ceu(rosa).
%funcionario(nome, codigo do departamento)
%funcionario(bruno,1).

%departamento(codigo, nome).
%departamento(1,professor).

mulher(pan).
mulher(liz).
mulher(ann).
mulher(pat).
homem(tom).
homem(bob).
homem(jim).
genitor(pan,bob).
genitor(tom,bob).
genitor(tom,liz).
genitor(bob,ann).
genitor(bob,pat).
genitor(pat,jim).

filho(X, Y) :- genitor(Y,X).

mae(X,Y) :-  genitor(X,Y),mulher(X).

avo(X,Y) :-  genitor(Z,Y),genitor(X,Z).


descendente(X, Y) :- genitor(Y,X).
descendente(X, Y) :- genitor(Y,Z),descendente(X,Z).


aluno(joao, calculo).
aluno(maria, calculo).
aluno(joel, programacao).
aluno(joel, estrutura).
frequenta(joao, puc).
frequenta(maria, puc).
frequenta(joel, ufrj).
professor(carlos, calculo).
professor(ana_paula, estrutura).
professor(pedro, programacao).
funcionario(pedro, ufrj).
funcionario(ana_paula, puc).
funcionario(carlos, puc).

%Quem são os alunos do professor X
ehProfessorDe(X) :- professor(X,Materia),
                    aluno(Aluno,Materia),
                    write(Aluno),nl.

%Quem são as pessoas que estão associadas a uma universidade X? (alunos e professores)
%ehVinculaddasAUniversidade(X) :-

/*
0 => 1
5 => 5 * 4 * 3 * 2 * 1

fatorial(5) = fatorial(4) * 5
            = (fatorial(3) * 4) * 5
            = ((fatorial(2) * 3) * 4) * 5
            = (((fatorial(1)* 2) * 3) * 4) * 5
            = ((((fatorial(0)*1)* 2) * 3) * 4) * 5
            = ((((1*1)* 2) * 3) * 4) * 5
            = (((1* 2) * 3) * 4) * 5
            = ((2 * 3) * 4) * 5
            = (6 * 4) * 5
            = 24 * 5
            = 120
 */
 
 fatorial(0,1).
 fatorial(N,F) :- N > 0,
                  N1 is N -1,
                  fatorial(N1,Result),
                  F is N * Result.
 
animal(peixinho).
animal(lince).
animal(coelho).
animal(veado).
animal(raposa).
animal(urso).
animal(guaxinim).
animal(peixe).
planta(alga).
planta(grama).
come(guaxinim,peixe).
come(peixinho,alga).
come(peixe,peixinho).
come(urso,peixe).
come(raposa,coelho).
come(lince,veado).
come(coelho,grama).
come(urso,raposa).
come(veado,grama).
come(urso,veado).
come(urso,guaxinim).

pertence-cadeia(X,Y) :- animal(X), come(Y,X).
pertence-cadeia(X,Y) :- animal(X), come(Y,Z), pertence-cadeia(X,Z).

rec(1,2).
rec(N,Result) :- N > 1,
                 N1 is N - 1,
                 rec(N1, Result1),
                 Result is Result1 - 3 * (N * N).


a(1).
b(2).
c(1).
p(X) :- c(X).
p(X) :- a(X) , ! , b(X).

/*
repeat,
lerDados,
processarDados,
condiçãoDeParada
*/

adivinha :- N is random(5)+1,
            repeat,
            ler_dados(G),
            processarDados(G,N).
            
ler_dados(G) :-
            write('Entre com um número (1-5)'),nl,
            read(G).

processarDados(G,G) :- write('você ganhou').
processarDados(G,N) :- G \= N,
                       write('tente novamente'),
                       fail.
                       
repete :- repeat,
          write('Digite um termo'),nl,
          read(G),
          ( G = stop -> !
                ;
            (process(G),fail)
          ).

process(G) :- write(G).


%Descobrir se um elemento pertence a uma lista
%pertence(a,Lista).
pertence(X,[X|_]).
pertence(X,[_|Tail]) :- pertence(X,Tail).

%Descobrir se um elemento é o último da lista
%ultimo(X,Lista).

ultimo(X,[X]).
ultimo(X,[_|Tail]) :- ultimo(X,Tail).

%Crie uma regra para descobrir se dois
%elementos são consecutivos em uma lista
% [1,2,3,4,5,7,9,12] -> 1,2 true
consecutivos(X,Y,[X,Y|_]).
consecutivos(X,Y,[_|Z]):-consecutivos(X,Y,Z).

%Crie uma regra para descobrir o tamanho da lista
%tamanho(Lista,Tam).
tamanho([],0).
tamanho([_|Tail],Tam)
          :- tamanho(Tail,T),Tam is T + 1.
          
%prefixo(Lista1, Lista2).
%prefixo(L1,L2) :- L1=L2.
prefixo([],_).
prefixo([X|Tail1],[X|Tail2]) :-
                     prefixo(Tail1,Tail2).

%sufixo(Lista1, Lista2).
sufixo(L1,L2) :- L1 = L2.
sufixo(L1,[_|Tail2]) :- sufixo(L1,Tail2).

%numerosPares(Lista,Resultado).
%numerosPares([1,2,3,4],[2,4]).

nPares([],[]).
nPares([Head|Tail],S) :- nPares(Tail,S1),
               ((Head mod 2) =:= 0
                  -> S = [Head|S1]
                   ; S = S1
               ).
               
% todas_a([a,b,c,d,e]).  false
% todas_a([a,a,a]).  true

todas_a([a]).
todas_a([a|Tail]) :- todas_a(Tail) .

%contem_1
%contem_1([1]).
%contem_1([1|_]).
%contem_1([_|Tail]) :- contem_1(Tail).

contem_1([1]).
contem_1([H|Tail]) :- (H = 1, !) ; contem_1(Tail).


traducao(one,um).
traducao(two,dois).
traducao(three,tres).
traducao(four,quatro).
traducao(five,cinco).
traducao(six,seis).
traducao(seven,sete).
traducao(eight,oito).
traducao(nine,nove).
traducao(ten,dez).
% traduzir([one,two,nine],X).
traduzir([],[]).
%traduzir([H|Tail],S) :- traducao(H,Port),
%                        traduzir(Tail,S1),
%                        S = [Port | S1].
traduzir([H|Tail], [Port |S1]) :-
                        traducao(H,Port),
                        traduzir(Tail,S1).



enumerar(N,M,_,[]) :- N >= M.
enumerar(N,M,P,L) :- N < M,
                     L = [N| S1],
                     N1 is N + P,
                     enumerar(N1,M,P,S1).
                     
                     
%remover elemnto duplicado
% se eu achar o elemento da cabeça de novo, eu elimino a cabeça, se não achar
% nós mantemos a cabeça.
remove([],[]).
remove([H|Tail],S) :- (
                         (procura(H,Tail),!, remove(Tail,S1), S = S1) ;
                                          ( remove(Tail,S1), S = [H|S1] )
                       ).



 amplia(Figura, Fator, NovaFigura) :- Figura =.. [Tipo | Parametros],
                                       multiplica(Parametros, Fator, NovosParametros),
                                       NovaFigura =.. [Tipo | NovosParametros].

multiplica([], _, []).
multiplica([X | L], Fator, [X1 | L1]) :- X1 is X * Fator,
                                        multiplica(L,Fator, L1).


classe(u,vog).
classe(a,vog).
classe(b,con).
classe(c,con).
classe(d,con).
classe(e,vog).
classe(a,vog).

leitura1 :- open('/home/henrique/Documentos/Backup/Paradigmas/nomes.txt',read,F),
           read(F,N1),
           read(F,N2),
           read(F,N3),
           read(F,N4),
           close(F),
           write([N1,N2,N3,N4]).
           
           
leitura2 :- open('/home/henrique/Documentos/Backup/Paradigmas/obras.ods',read,F),
            lerDados(F,Dados),
            close(F),
            write(Dados).
            
lerDados(F,[]) :- at_end_of_stream(F),!.
lerDados(F,[X|Resto]) :- read(F,X),
                         lerDados(F,Resto).


vendas(NomeCliente) :-   open('c:\\teste\\loja.txt',read,Entrada),
                         open('c:\\teste\\saida.txt',write,Saida),
                         write(Saida,NomeCliente),write('\n'),
                         lerDados2(Entrada,Saida,NomeCliente),
                         close(Entrada),
                         close(Saida),
                         write('encerrado').

lerDados2(Entrada,_,_) :- at_end_of_stream(Entrada),!.
lerDados2(Entrada,Saida,NomeCliente) :-  read(Entrada,venda(Cod,Prod,Valor,NomeCliente)),!,
                                         write(Saida,venda(Cod,Prod,Valor)),
                                         write(Saida,'\n'),
                                         lerDados2(Entrada,Saida,NomeCliente).
                                        
lerDados2(Entrada,Saida,NomeCliente) :-  lerDados2(Entrada,Saida,NomeCliente).
                                        
