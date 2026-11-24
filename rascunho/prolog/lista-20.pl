% Lista 20 - pratica (sem respostas: escreva cada predicado embaixo do enunciado)
%
% Como rodar, num terminal novo, dentro desta pasta:
%   swipl lista-20.pl
% No prompt ?- :
%   mother(X, kim).      <- consulta; ';' pede a proxima resposta, Enter para
%   make.                <- recarrega o arquivo depois de editar e salvar
%   halt.                <- sai
%
% Para ver a busca passo a passo:  trace, descendant(X, margaret).   (notrace. desliga)
% A resolucao esta no site: /docs/aula-20/lista-20

parent(kim, holly).
parent(margaret, kim).
parent(margaret, kent).
parent(esther, margaret).
parent(herbert, margaret).
parent(herbert, jean).
greatgrandparent(GGP, GGC) :-
  parent(GGP, GP), parent(GP, P), parent(P, GGC).

% A base nao diz o sexo de ninguem; as questoes 1-4 precisam destes fatos.
female(esther).
female(margaret).
female(jean).
female(kim).
female(holly).
male(herbert).
male(kent).

% 1. mother(X, Y): X e mae de Y.

% 2. father(X, Y): X e pai de Y.

% 3. sister(X, Y): X e irma de Y (ninguem e irma de si mesma).

% 4. grandson(X, Y): X e neto de Y.

% 5. firstCousin(X, Y): X e primo primeiro de Y (nao de si mesmo, nem irmaos).

% 6. descendant(X, Y): X e descendente de Y.

% 7. third(X, Y): Y e o terceiro elemento da lista X (um fato).

% 8. firstPair(X): X tem >= 2 elementos e o primeiro e igual ao segundo (um fato).

% 9. del3(X, Y): Y e X sem o terceiro elemento (um fato).

% 10. dupList(X, Y): dupList([1,2,3], Y) da Y = [1,1,2,2,3,3]; funciona nos dois sentidos.

% 11. isDuped(Y): 1o = 2o, 3o = 4o, ...

% 12. oddSize(X): tamanho impar, sem aritmetica.

% 13. evenSize(X): tamanho par.

% 14. prefix(X, Y): X e prefixo de Y; prefix(X, [1,2,3]) gera todos.

% 15-20: conjuntos como listas sem repeticao. NAO vale usar member, append etc.

% 15. isMember(X, Y)

% 16. isUnion(X, Y, Z)

% 17. isIntersection(X, Y, Z)

% 18. isEqual(X, Y): mesmos elementos, em qualquer ordem.

% 19. powerSet(X, Y): powerSet([1,2], Y) da Y = [[1,2],[1],[2],[]].

% 20. isDifference(X, Y, Z): Z = X - Y, com Z em qualquer ordem.
