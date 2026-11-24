# Compilado de questões — 2ª prova (finais 22 a 29)

- **8 provas:** final22, 23, 24, 25, 26, 27, 28 e 29.
- **Duplicatas:** nenhuma prova idêntica a outra. As finais 26 e 27 repetem o mesmo trio
  `sublista` → `perm` → `anagram` com enunciados diferentes.
- **Frequência** = provas em que o tópico aparece ÷ 8. Empates: mais provas distintas
  primeiro, depois mais itens.
- Cada item (a, b, c…) está em **um** tópico só. Só enunciados; as respostas em vermelho que
  vieram nos PDFs das finais 27 e 29 estão na seção `# Resolução` dos próprios arquivos.
- **Aula** = a pasta em `docs/content/docs/` (a chave é a lista: Aula 21 = Lista 22,
  Aula 22 = Lista 23, Aula 24 = Lista 25).
- **Revisão:** a aula de revisão é em 23/11; o molde
  `docs/content/docs/aula-revisao-13-24/index.mdx` ainda não tem dicas preenchidas. Depois
  da aula, rode `/compilar-prova 2a-prova` de novo para marcar os ⭐.
- Gerado em 2026-11-22 com `/compilar-prova`.

| # | Tópico | Frequência | Provas | Itens | Aula | Revisão 23/11 |
|---|---|---|---|---|---|---|
| 1 | Implementar predicados Prolog sobre listas (gerar e testar) | 75% | 22, 23, 26, 27, 28, 29 | 21 | 20, 22 | — |
| 2 | Encapsulamento e tradução para Python | 37,5% | 23, 26, 28 | 10 | 14, 16 | — |
| 3 | POO: sobrecarga, chamada virtual, OO × procedural | 37,5% | 22, 24, 28 | 9 | 08, 17 | — |
| 4 | Características das linguagens: execução, tipagem e eficiência | 37,5% | 22, 25, 27 | 9 | 04, 14 | — |
| 5 | História das linguagens e paradigmas | 37,5% | 22, 23, 28 | 8 | 24 | — |
| 6 | Arranjos em C: *layout* na memória e localidade | 25% | 23, 27 | 9 | 07, 15, 21 | — |
| 7 | Recursos funcionais: closures, alta ordem, polimorfismo paramétrico, casamento de padrões | 25% | 22, 29 | 4 | 06, 08, 10, 14 | — |
| 8 | Aritmética em Prolog (`is`, `=:=`) | 25% | 24, 29 | 3 | 22 | — |
| 9 | Áreas de memória: estática, pilha e heap | 12,5% | 25 | 5 | 15 | — |
| 10 | Verificações em tempo de execução e segurança | 12,5% | 29 | 5 | 07, 18 | — |
| 11 | Avaliação preguiçosa e efeitos colaterais | 12,5% | 24 | 4 | 19 | — |
| 12 | Ler e explicar um programa Prolog | 12,5% | 25 | 4 | 20, 21 | — |
| 13 | Recursão de cauda (cauda rasa) | 12,5% | 26 | 3 | 21 | — |

### O que o professor sinalizou na revisão

Ainda não há dicas: preencher depois da aula de 23/11 no molde da revisão.

| Dica | Aula | Tópico | Caiu em |
|---|---|---|---|
| | | | |

---

## Tópico 1 — Implementar predicados Prolog sobre listas (gerar e testar) [aparece em 75% das provas (provas 22, 23, 26, 27, 28 e 29)]

**1.1** (prova 22, Q1a) Nesta questão você deverá implementar um predicado `multset` em Prolog. Para
tanto, você irá implementar dois predicados auxiliares.

(a) (3 Pontos) Implemente um predicado `rangelist(N, S)`, que seja verdade quando `S` for uma lista de
tamanho entre 1 e `N` (inclusive). Por exemplo:

```prolog
?- rangelist(2, [a, b]).
true.

?- rangelist(3, [a, b]).
true.

?- rangelist(1, [a, b]).
false.

?- rangelist(2, L).
L = [].
L = [_G01].
L = [_G01, _G02].
```

**1.2** (prova 22, Q1b) (3 Pontos) Escreva um predicado `submulset(S, L)`, que seja verdadeiro quando
cada elemento de `S` estiver presente em `L`. Por exemplo:

```prolog
?- submulset([a, b, a, b], [a, b]).
true.

?- submulset([a, b, a, b], [a, b, c]).
true.

?- submulset([a, b, c, a, b], [a, b]).
false.
```

**1.3** (prova 22, Q1c) (4 Pontos) Escreva um predicado `multset(N, L, S)`, que seja verdadeiro quando os
dois fatos abaixo forem verdade:

- `S` for uma lista com tamanho entre 1 e `N` elementos (inclusive);
- Cada elemento de `S` é um membro de `L`.

Você pode usar os dois predicados feitos nas questões anteriores para resolver esse exercício. Caso não
os tenha feito, você pode assumir a existência deles.

**1.4** (prova 23, Q1a) É possível representar grafos direcionados em Prolog usando uma relação
`edge(V1, V2)`, que representa a existência de uma aresta do vértice `V1` para o vértice `V2`. A figura
abaixo mostra um exemplo:

```prolog
edge(start, a).
edge(start, d).
edge(a, b).
edge(b, c).
edge(a, c).
edge(b, d).
edge(b, e).
edge(d, e).
edge(e, a).
edge(c, end).
edge(e, end).
```

(Figura: desenho do grafo dirigido descrito pelos fatos acima.)

(a) (3 Pontos) Implemente um predicado `path(L)`, que seja verdade quando `L` for uma lista de vértices
que denote um caminho no grafo. Em outras palavras, se L = v₁, v₂, …, vₙ, então deve existir uma
aresta vᵢ → vᵢ₊₁ para todo i, 1 ≤ i ≤ n − 1. Por exemplo, considerando o grafo acima:

```prolog
path([a, b, e, end]).
true ;
path([b, a, e, end]).
false.
```

Note que uma lista vazia é um caminho. Também é um caminho uma lista com um elemento só.

**1.5** (prova 23, Q1b) (2 Pontos) Implemente um predicado `last(L, E)`, que seja verdade quando `E` for
o último elemento da lista L. Por exemplo:

```prolog
last([a, b, e, end], X).
X = end.
path([a], X).
X = a.
path([], X).
false.
```

**1.6** (prova 23, Q1c) (2 Pontos) Implemente um predicado `cycle(L)`, que seja verdade quando `L` formar
um ciclo, isto é: um caminho tal que exista uma aresta do último para o primeiro elemento. Assuma que
todo ciclo precisa ter no mínimo um vértice, e que não existe ciclo de um vértice v para ele mesmo, a
menos que o predicado edge(v, v) seja verdadeiro. Exemplos:

```prolog
?- cycle([e, a, b]).
true ;
?- cycle([a]).
false.
```

**1.7** (prova 23, Q1d) (2 Pontos) Implemente um predicado `solution(L)`, que seja verdade se: (i) `L` for
uma lista que forme um caminho de vértices; (ii) o primeiro vértice de `L` for `start` e (iii) o último
vértice de `L` for `end`.

Exemplos:

```prolog
?- solution(L).
L = [start, a, b, c, end] ;
?- solution([start, d, e, end]).
true ;
```

**1.8** (prova 26, Q1a) Nesta questão você deverá implementar um predicado `anagram` em Prolog. Para
facilitar este esforço, sua tarefa será dividida nas três partes abaixo:

(a) (3 Pontos) Implemente um predicado `subtext(Text, SubText)`, que seja verdade quando `SubText` for uma
sublista da lista `Text`. Por exemplo:

```prolog
?- subtext([a, n, a], X).
X = [] ;
X = [a] ;
X = [n] ;
X = [n, a] ;
X = [a] ;
X = [a, a] ;
X = [a, n] ;
X = [a, n, a].
```

**1.9** (prova 26, Q1b) (3 Pontos) Escreva um predicado `perm(T, P)`, que seja verdadeiro quando a lista
`P` for uma permutação dos elementos da lista `T`. Por exemplo:

```prolog
?- perm([a, n, a], T).
T = [a, n, a] ;
T = [a, a, n] ;
T = [n, a, a] ;
T = [n, a, a] ;
T = [a, a, n] ;
T = [a, n, a] ;
```

Se quiser, você pode usar `select`:

```prolog
?- select(a, [a, b, c], [b, c]).
true ;
```

**1.10** (prova 26, Q1c) (4 Pontos) Escreva um predicado `anagram(Pattern, Text)`, que seja verdadeiro
houver uma sublista da lista `Text` que seja uma permutação dos elementos da lista `Pattern`. Exemplo:

```prolog
?- anagram([a, b, c, d], [b, f, a, d, b, c]).
true ;
true ;
false. /* Duas respostas possiveis! */

?- anagram([a, b, c, d], [d, b, f, a, d, b, c]).
true ;
true ;
true ;
true ;
false. /* Quatro respostas possiveis! */
```

**1.11** (prova 27, Q2a) As questões a seguir pedem programas que devem ser implementados na linguagem de
programação Prolog.

(a) (3 Pontos) Implemente um predicado `sublist(L, S)` que seja verdade quando `S` for uma sublista de
`L`. Por exemplo:

```prolog
?- findall(L, sublist([a, b, c], L), R).
R = [[a, b, c], [a, b], [a, c], [a], [b, c], [b], [c], []].
```

**1.12** (prova 27, Q2b) (3 Pontos) Implemente um predicado `perm(L, P)` que seja verdade quando `P` for
uma permutação dos elementos da lista `L`. Por exemplo:

```prolog
?- findall(P, perm([a, b, c], P), R).
R = [[a, b, c], [a, c, b], [b, a, c], [b, c, a], [c, a, b], [c, b, a]].
```

Você pode usar o predicado `select`. Por exemplo:

```prolog
?- findall((E, S), select(E, [a, b, c], S), R).
R = [(a, [b, c]), (b, [a, c]), (c, [a, b])].
```

**1.13** (prova 27, Q2c) (4 Pontos) Escreva um predicado `anagram(L, A)`, que seja verdade se a lista `A`
for um anagrama de alguma subsequência da lista `L`. Por exemplo:

```prolog
?- anagram([l, i, v, r, e, s], [s, e, r, v, i, l]).
true.
?- anagram([l, i, v, r, e, s], [s, a, r, v, i, l]).
false.
?- anagram([l, i, v, r, e, s], [s, i, r, e]).
true.
```

**1.14** (prova 28, Q3a) O objetivo desta questão é construir uma agenda de compromissos em Prolog. A base
de conhecimento abaixo representa compromissos de uma pessoa ao longo do dia, relacionando o horário à
descrição (assuma que somente horas inteiras são usadas):

```prolog
compromisso(9,  aula_de_lp).
compromisso(11, reuniao_do_lab).
compromisso(14, escrever_relatorio).
compromisso(16, ginastica).
```

(a) (2 Pontos) Defina um predicado `tem_compromisso(H)` que seja verdadeiro quando houver um compromisso
cadastrado na hora `H`. Por exemplo, `tem_compromisso(11)` deve ser verdadeiro, enquanto
`tem_compromisso(10)` deve ser falso.

**1.15** (prova 28, Q3b) (2 Pontos) Defina um predicado `descricao(Hora, Desc)` que relacione a hora de um
compromisso à sua descrição. Por exemplo, a consulta `descricao(11, D)` deve produzir
`D = reuniao_do_lab`.

**1.16** (prova 28, Q3c) (2 Pontos) Defina um predicado `range(B, E, Lista)` que produza uma lista
contendo todos os inteiros de `B` até `E`, inclusive. Por exemplo, a consulta `range(10, 14, R)` deve
gerar `R = [10, 11, 12, 13, 14]`.

**1.17** (prova 28, Q3d) (2 Pontos) Defina um predicado `compromisso_intervalo(B, E, Hora, Desc)` que seja
verdadeiro quando houver um compromisso na hora `Hora` e essa hora estiver no intervalo entre `B` e `E`,
inclusive. O predicado deve também retornar a descrição `Desc` correspondente ao compromisso. Você pode
usar `range`, mesmo que não tenha feito a questão anterior. Por exemplo:

```prolog
?- compromisso_intervalo(10, 15, Hora, Desc).
Hora = 11,
Desc = reuniao_do_lab ;
Hora = 14,
Desc = escrever_relatorio ;
```

Fique também à vontade para usar o predicado `member(E, L)` em sua resposta.

**1.18** (prova 28, Q3e) (2 Pontos) Defina um predicado `todos_compromissos(B, E, Descs)` que produza, em
`Descs`, a lista contendo as descrições de todos os compromissos agendados entre as horas `B` e `E`. Por
exemplo:

```prolog
?- todos_compromissos(10, 15, Descs).
Descs = [reuniao_do_lab, escrever_relatorio].
```

Fique à vontade para usar `findall(Pattern, Expr, Accumulator)`.

**1.19** (prova 29, Q3a) Considere a soma abaixo:

```
  SEND
+ MORE
------
 MONEY
```

Cada letra representa um dígito decimal **distinto** entre 0 e 9. Letras iguais representam o mesmo
dígito, e letras diferentes representam dígitos diferentes. Além disso, os números `SEND` e `MORE` não
podem começar com o dígito zero. O programa abaixo determina quais dígitos devem ser atribuídos às letras
S, E, N, D, M, O, R e Y para que a soma seja correta:

```prolog
puzzle([S,E,N,D,M,O,R,Y]) :-
    Digits = [ ............ ],                          % (C)
    perm(Digits, [S,E,N,D,M,O,R,Y,_,_]),
    S \= 0,
    M \= 0,
    SEND  is 1000*S + 100*E + 10*N + D,
    MORE  is 1000*M + 100*O + 10*R + E,
    MONEY is 10000*M + 1000*O + 100*N + 10*E + Y,
    SEND + MORE =:= MONEY.                             % (D)
```

(A)

```prolog
?- select(E, [a,b,c], L).
E = a,
L = [b, c] ;
E = b,
L = [a, c] ;
E = c,
L = [a, b].
```

(B)

```prolog
?- perm([a,b,c], X).
X = [a, b, c] ;
X = [a, c, b] ;
X = [b, a, c] ;
X = [b, c, a] ;
X = [c, a, b] ;
X = [c, b, a] ;
```

(a) (3 Pontos) Existe um predicado `select(E, S, L)` na biblioteca padrão de Prolog. Esse predicado é
verdade quando `S` é uma lista que contém pelo menos uma ocorrência do elemento `E`, e `L` é a mesma
lista, porém sem essa ocorrência. Veja o exemplo (A) na figura acima. Implemente esse predicado.

**1.20** (prova 29, Q3b) (3 Pontos) O predicado `puzzle` acima usa um subpredicado `perm(L, X)`, que é
verdade quando a lista `X` é uma permutação da lista `L`. Veja o exemplo (B) na figura acima. Implemente
esse predicado. Você **deve** usar o predicado `select` implementado na questão anterior.

**1.21** (prova 29, Q3c) (2 Pontos) Como você deveria inicializar a variável `Digits` na parte (C) da
figura acima?

`Digits =`

## Tópico 2 — Encapsulamento e tradução para Python [aparece em 37,5% das provas (provas 23, 26 e 28)]

**2.1** (prova 23, Q3, programa 1) Em cada um dos itens abaixo, você devera reescrever, em Python, um
programa mostrado em alguma outra linguagem de programação. Você deve também reconhecer a linguagem em
que está escrito o programa original. Veja que uma tradução perfeita pode não ser possível. Quando for o
caso, busque escrever o programa mais próximo em que puder pensar.

```
- (fn x => fn y => x + y) 2 3;
val it = 5 : int
```

(1 Ponto) Linguagem de origem: ____________________ · (2 Pontos) Código Python:

**2.2** (prova 23, Q3, programa 2)

```c
void foo(int v[], int N) {
  for (int i = 0; i < N/2; i++) {
    int aux = v[i];
    v[i] = v[N-i-1];
    v[N-i-1] = aux;
  }
}
```

(1 Ponto) Linguagem de origem: ____________________ · (2 Pontos) Código Python:

**2.3** (prova 23, Q3, programa 3)

```java
class P {
  private double x, y;
  public P(double x, double y) {
    this.x = x;
    this.y = y;
  }
  public boolean positive() {
    return x > 0 && y > 0;
  }
}
```

(1 Ponto) Linguagem de origem: ____________________ · (2 Pontos) Código Python:

**2.4** (prova 23, Q3, último item) (1 Ponto) O último programa não pode ser traduzido para Python de
forma exata. O que falta em Python nesse caso?

**2.5** (prova 26, Q2a) O encapsulamento de dados é um importante princípio de programação. Várias
linguagens de programação, como `Java`, `C++` e `SML/NJ` suportam o encapsulamento de dados via sintaxe
que permite a programadores definir símbolos visíveis fora dos espaços de nomes em que eles foram
declarados.

(a) (1 Ponto) Quais mecanismos de encapsulamento de dados são fornecidos pela linguagem `C++` ao
programador para diferenciar a visibilidade de símbolos declarados no mesmo espaço de nomes (seja ele
instanciável ou não)?

**2.6** (prova 26, Q2b) (3 Pontos) Quais mecanismos de encapsulamento de dados são fornecidos pela
linguagem `Python` ao programador para diferenciar a visibilidade de símbolos declarados no mesmo espaço
de nomes (seja ele instanciável ou não)?

**2.7** (prova 26, Q2c) (3 Pontos) Quais mecanismos de encapsulamento de dados são fornecidos pela
linguagem `C` ao programador para diferenciar a visibilidade de símbolos declarados no mesmo espaço de
nomes (seja ele instanciável ou não)?

**2.8** (prova 26, Q2d) (3 Pontos) Quais mecanismos de encapsulamento de dados são fornecidos pela
linguagem `SML/NJ` ao programador para diferenciar a visibilidade de símbolos declarados no mesmo espaço
de nomes (seja ele instanciável ou não)?

**2.9** (prova 28, Q1a) Esta questão é sobre a diferença dos mecanismos que Python e C++ oferecem para a
programação orientada a objetos.

(a) (2 Pontos) Considere o programa abaixo, escrito em C++. Use o espaço à direita para traduzir este
programa para Python.

```cpp
class Ponto {
  private:
    int x;
  public:
    Ponto(int v) : x(v) {
    }
    virtual int
    dobro() const {
        return 2 * x;
    }
};
```

**2.10** (prova 28, Q1b) (2 Pontos) Haveria algo equivalente aos modificadores de acesso `public` e
`private` em Python? Justifique a sua resposta com um exemplo, ou com uma explicação sucinta.

## Tópico 3 — POO: sobrecarga, chamada virtual, OO × procedural [aparece em 37,5% das provas (provas 22, 24 e 28)]

**3.1** (prova 22, Q2a) Esta questão refere-se aos dois programas abaixo, que estão escritos na linguagem
de programação Kotlin. Você precisa tentar inferir, seguindo a sua intuição, qual o significado da sintaxe
usada nos códigos abaixo para responder corretamente as perguntas que se seguem.

Código à esquerda:

```kotlin
interface TreeNode {
  fun height(): Int
}

class TreeLeaf: TreeNode {
  override fun height(): Int {
    return 0
  }
}

class TreeValue(val v: Int, val l: TreeNode, val r: TreeNode): TreeNode {
  override fun height(): Int {
    val lHeight = l.height()
    val rHeight = r.height()
    return 1 + if (lHeight > rHeight) lHeight else rHeight
  }
}

fun main(args: Array<String>) {
  val numbers = listOf(2, 5, 3, 8, 1, 29, 43, 2, 15, 6, 1)
  val tree: TreeNode = numbers2Tree(numbers)
  println("Obj Height = " + tree.height())
}
```

Código à direita:

```kotlin
interface TreeNode {
}

class TreeLeaf: TreeNode {
}

class TreeValue(val v: Int, val l: TreeNode, val r: TreeNode): TreeNode {
}

fun height(treeNode: TreeNode): Int {
  return when (treeNode) {
    is TreeLeaf -> 0
    is TreeValue -> 1 + max(height(treeNode.l), height(treeNode.r))
    else -> throw IllegalArgumentException("Unknown type")
  }
}

fun main(args: Array<String>) {
  val numbers = listOf(2, 5, 3, 8, 1, 29, 43, 2, 15, 6, 1)
  val tree: TreeNode = numbers2Tree(numbers)
  println("Obj Height = " + height(tree))
}
```

(a) (1 Ponto) Um desses programas implementa a função `height` de forma claramente orientada a objetos.
O outro, implementa a mesma função de forma claramente procedural. Qual desses códigos é o mais
orientado a objetos. Responda com "código à esquerda" ou "código à direita".

**3.2** (prova 22, Q2b) (3 Pontos) Caso fosse necessário adicionar um novo tipo de nó à árvore, por
exemplo, um nó ternário, qual das versões acima seria mais fácil de alterar? Justifique a sua resposta.

**3.3** (prova 22, Q2c) (3 Pontos) Caso fosse necessário adicionar uma nova operação aos programas acima,
por exemplo, para imprimir o conteúdo de uma árvore, qual dos paradigmas de programação (procedural ou
orientado a objetos) acima seria mais fácil de ser estendido? Novamente, é necessário que você justifique
a sua resposta.

**3.4** (prova 24, Q1a) Essa questão diz respeito ao programa abaixo, implementado em C++.

```cpp
#include <iostream>
int sum(int a, int b) {
  std::cout << "Sum of ints\n";
  return a + b;
}
double sum(double a, double b) {
  std::cout << "Sum of doubles\n";
  return a + b;
}
int main() {
  std::cout << "The sum is " << sum(1, 2) << std::endl;
  std::cout << "The sum is " << sum(1.2, 2.1) << std::endl;
}
```

(a) (2 Pontos) O programa acima ilustra um tipo de polimorfismo conhecido como sobrecarga, ou
*overloading*. Essa forma de polimorfismo seria um tipo de polimorfismo *ad-hoc* (quantidade finita de
tipos) ou universal *quantidade infinita de tipos*? Explique sua resposta

**3.5** (prova 24, Q1b) (3 Pontos) Não existe um análogo perfeito para polimorfismo de sobrecarga em
Python. Por que?

**3.6** (prova 24, Q1c) (5 Pontos) Escreva um programa "equivalente" ao código acima, em Python. Note que
C++ e Python são linguagens diferentes, então—evidentemente—uma equivalência perfeita não será possível.

**3.7** (prova 28, Q1c) (com o programa `Ponto` do item 2.9) (2 Pontos) O que significa a palavra
`virtual` em C++?

**3.8** (prova 28, Q1d) (2 Pontos) O alvo de chamadas virtuais em C++ pode ser resolvido em O(1). Por
que isso não é possível em Python?

**3.9** (prova 28, Q1e) (2 Pontos) Essa ideia de chamadas virtuais surgiu há bastante tempo atrás, nos
idos dos anos 60. Qual linguagem a introduziu?

## Tópico 4 — Características das linguagens: execução, tipagem e eficiência [aparece em 37,5% das provas (provas 22, 25 e 27)]

**4.1** (prova 22, Q3a) Esta questão refere-se à forma como programas são executados em diferentes
linguagens de programação.

(a) (3 Pontos) Programas escritos em `bash` script são puramente interpretados. Isto é, a árvore de
sintaxe deles é interpretada, e código nunca é gerado para alguma máquina alvo. Por que `bash` é
normalmente executada desta forma?

**4.2** (prova 22, Q3b) (3 Pontos) Programas escritos em C normalmente são compilados. Por que C é uma
linguagem normalmente compilada?

**4.3** (prova 22, Q3c) (4 Pontos) Programas escritos em Java são tipicamente virtualizados. Isto é,
código fonte é compilado para uma linguagem de *bytecodes*, e esta linguagem é então interpretada pela
máquina virtual Java. Porque java é executada dessa forma, em vez de ser compilada como em C, ou em vez de
ser puramente interpretada, como em `bash`?

**4.4** (prova 25, Q2a) O gráfico abaixo foi retirado da página "`The Benchmark Game`". Esta página loga
o tempo de execução de soluções de 10 problemas famosos, implementados em linguagens diferentes:

(Figura: *boxplot* do tempo em relação a C (via gcc), escala logarítmica de 1 a 300, das mais eficientes
às menos eficientes: C gcc, Rust, C++ g++, C# .NET, Classic Fortran, Chapel, Julia, Java, F# .NET, Ada
2012 GNAT, Go, Swift, OCaml, Free Pascal, Haskell GHC, Lisp SBCL, Node.js, Dart, Racket, PHP, Erlang,
Ruby yjit, Python 3, VW Smalltalk, Perl, Lua, Matz's Ruby.)

(a) (2 Pontos) Por que o sistema de tipagem de C (e não estou falando da tipagem estática!) permite que
esta linguagem seja tão eficiente?

**4.5** (prova 25, Q2b) (2 Pontos) Dê uma segunda razão, diferente daquela mencionada na questão acima,
que justifique a grande eficiência da linguagem C.

**4.6** (prova 25, Q2c) (2 Pontos) Qual a característica comum de `PHP`, `Python`, `Lua` e `Ruby` que as
tornam tão lentas?

**4.7** (prova 25, Q2d) (2 Pontos) Cite uma característica comum entre `C`, `C++`, `Java` e `C#`.

**4.8** (prova 25, Q2e) (2 Pontos) Cite uma diferença entre estes dois grupos de linguagens: {`C`, `C++`}
e {`Java`, `C#`}.

**4.9** (prova 27, Q3) Ligue as linguagens de programação à esquerda com características que elas possuem
à direita. Você deve estabelecer uma bijeção entre as duas colunas. Cada resposta correta vale um ponto.

| Linguagens | Características |
|---|---|
| C, SML, Prolog | Funções de cauda rasa *(exemplo: já ligados)* |
| C, C++, Fortran | Suporte a closures |
| Python, JavaScript, Prolog | Programação funcional |
| Java, Python, C++ | Execução virtualizada (implementação típica) |
| Rust, C, C++ | Tipagem fraca |
| Python, SML, JavaScript | Polimorfismo paramétrico |
| Java, SML, C++ | Tipagem estática |
| SML, Haskell, ocaml | Tipagem dinâmica |
| Python, Java, JavaScript | Avaliação não estrita |
| C++, Java, SML | Execução via compilação |
| R, Haskell, C macros | Invocação dinâmica |

## Tópico 5 — História das linguagens e paradigmas [aparece em 37,5% das provas (provas 22, 23 e 28)]

**5.1** (prova 22, Q4a) John Backus, quando recebeu o Prêmio Turing, em 1978, fez um discurso que
continha o seguinte trecho:

> My point is this: while it was perhaps natural and inevitable that languages like FORTRAN and its
> successors should have developed out of the concept of the von Neumann computer as they did, the fact
> that such languages have dominated our thinking for twenty years is unfortunate. It is unfortunate
> because their long-standing familiarity will make it hard for us to understand and adopt new
> programming styles which one day will offer far greater intellectual and computational power.

(a) John Backus ganhou o Prêmio Turing por ter inventado a linguagem de programação FORTRAN. FORTRAN,
sendo uma das primeiras linguagens de programação criada, é considerada membro da *Primeira Geração de
Linguagens de Programação*. Cite três outras linguagens que fazem parte, junto com FORTRAN, da primeira
geração de linguagens de programação, tendo sido criadas ainda nos anos 50, e que tiveram mais de 1000
usuários ao longo de sua história: (3 × 1 Ponto)

**5.2** (prova 22, Q4b) (1 Ponto) FORTRAN é uma linguagem que pertence a qual paradigma de programação?

**5.3** (prova 22, Q4c) (2 Pontos) Quais outros dois grandes paradigmas de programação existem, além
daquele ao qual pertence FORTRAN?

**5.4** (prova 22, Q4d) (2 Pontos) visto o discurso de John Backus, é fácil imaginar que o paradigma ao
qual pertence FORTRAN possui algumas desvantagens. Cite uma desvantagem desse paradigma, quando comparado
com os outros dois paradigmas da questão anterior.

**5.5** (prova 23, Q4a) Historicamente, o projeto de linguagens de programação é influenciado por vários
fatores. Nesta questão abordaremos alguns desses fatores.

(a) (5 Pontos) O protocolo HTTP, que permitiu o surgimento da WWW, foi criado no início dos anos 90. A
partir deste protocolo surgiu a rede de computadores hoje conhecida como "Internet". Como o surgimento da
internet influenciou o projeto e implementação de linguagens de programação?

**5.6** (prova 23, Q4b) (5 Pontos) No final da década de 70, e mais notadamente durante a década de 80,
assistimos ao surgimento de programas computacionais muito grandes: `Electric Pencil`, `WordPerfect`,
`Multiplan`, `Lotus 1-2-3`, `MS Excel`, `MS PowerPoint`, `MS Word`, etc. Como o crescimento dos sistemas
computacionais (em termos de números de arquivos e linhas de código) influenciou o projeto e
implementação de linguagens de programação?

**5.7** (prova 28, Q2a) A próxima questão se refere a história de algumas linguagens de programação.

(a) (5 Pontos) Fortran surgiu como a principal linguagem de sistemas nos anos 1950, mas acabou perdendo
espaço, primeiro para C, nos anos 1970, e depois para C++, nos anos 1980. Desde então, C++ se tornou a
linguagem dominante em sistemas como kernels, servidores, jogos eletrônicos, navegadores, entre outros.
Mesmo linguagens muito populares, como Java, não conseguiram deslocar esse domínio. Por que Java não
desbancou C++ como a linguagem de sistemas nos anos 2000, apesar de sua enorme popularidade na época?
Cite ao menos uma razão que torna Java inadequada para programação desses tipos de sistemas
computacionais.

**5.8** (prova 28, Q2b) (5 Pontos) COBOL foi, durante as décadas de 1960 e 1970, a principal linguagem de
negócios, amplamente utilizada em sistemas bancários e corporativos. Esses programas eram caracterizados
por seu grande porte, complexidade, divisão em múltiplos módulos e desenvolvimento por equipes extensas.
A partir dos anos 1990, porém, Java (e, em menor grau, C#) passou a ocupar esse espaço, tornando-se a
linguagem dominante em sistemas corporativos modernos. Mesmo Python, que hoje é mais popular do que Java,
não assumiu esse papel. Por que Python não consegue substituir Java no desenvolvimento desses sistemas
corporativos de grande escala?

## Tópico 6 — Arranjos em C: *layout* na memória e localidade [aparece em 25% das provas (provas 23 e 27)]

**6.1** (prova 23, Q2a) Esta questão refere-se ao programa abaixo, escrito na linguagem de programação C:

```c
01 #include <stdio.h>
02 #include <stdlib.h>
03
04 int foo(int** a, i, j) {
05   return a[i][j];
06 }
07
08 int bar(int b[2][3], i, j) {
09   return b[i][j];
10 }
11 int main() {
12   int** a = (int**)malloc(2 * sizeof(int*));
13   a[0] = (int*)malloc(3 * sizeof(int));
14   a[1] = (int*)malloc(3 * sizeof(int));
15   a[0][0] = 0; a[0][1] = 1; a[0][2] = 2;
16   a[1][0] = 3; a[1][1] = 4; a[1][2] = 5;
17   int b[2][3] = {{0, 1, 2}, {3, 4, 5}};
18   int c[3][2] = {{10, 20}, {30, 40}, {50, 60}};
19   printf("A: %d\n", foo(a, 1, 1));
20   printf("B: %d\n", foo(b, 1, 1));
21   printf("C: %d\n", bar(a, 1, 1));
22   printf("D: %d\n", bar(b, 1, 1));
23   printf("E: %d\n", bar(c, 1, 1));
24 }
```

Para responder as questões seguintes, procure pensar em como seria a implementação das funções `foo` e
`bar` em linguagem de máquina. Você não precisa conhecer linguagem de máquina: basta imaginar como cada
função implementa o acesso à memória usando operações de carregamento de dados.

(a) (2 Pontos) O que imprime a chamada à função `printf` na linha 19?

**6.2** (prova 23, Q2b) (2 Pontos) A chamada à função `printf` na linha 20 causa um erro do tipo "falha
de segmentação". Por que isso ocorre?

**6.3** (prova 23, Q2c) (2 Pontos) Duas execuções diferentes do programa acima podem causar a chamada da
função `printf` na linha 21 a imprimir dois valores diferentes. Em outras palavras, o comportamento da
linha 21 não é bem definido. O que causa esse comportamento indefinido?

**6.4** (prova 23, Q2d) (2 Pontos) O que imprime a chamada à função `printf` na linha 22?

**6.5** (prova 23, Q2e) (2 Pontos) O que imprime a chamada à função `printf` na linha 23? Não responda tão
rápido! Essa linha possui comportamento determinístico, porém é bem possível que esse comportamento não
seja o mais intuitivo.

**6.6** (prova 27, Q1a) Esta questão refere-se à forma como arranjos são implementados em linguagens de
programação imperativas.

(a) (3 Pontos) Linguagens imperativas implementam arranjos de forma que seja possível termos acesso a
qualquer posição em tempo constante; isto é, em O(1). Como isso é possível?

**6.7** (prova 27, Q1b) (3 Pontos) Como seria armazenado em memória uma estrutura como aquela apontada
pelo ponteiro `p` no programa abaixo?

```c
void init(int** p, unsigned N) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j <= i; j++) {
            p[i][j] = 1;
        }
    }
}
```

**6.8** (prova 27, Q1c) (1 Ponto) Qual dos dois programas abaixo deve ser mais eficiente?

Programa 1:

```c
01 int sum = 0;
02 for (i = 0; i < M; i++) {
03     for (j = 0; j < N; j++) {
04         sum += m[i][j];
05     }
06 }
```

Programa 2:

```c
01 int sum = 0;
02 for (j = 0; j < N; j++) {
03     for (i = 0; i < M; i++) {
04         sum += m[i][j];
05     }
06 }
```

**6.9** (prova 27, Q1d) (3 Pontos) Justifique a sua resposta para a questão anterior.

## Tópico 7 — Recursos funcionais: closures, alta ordem, polimorfismo paramétrico, casamento de padrões [aparece em 25% das provas (provas 22 e 29)]

**7.1** (prova 22, Q2d) (com as definições `TreeNode`/`TreeLeaf` do item 3.1) (3 Pontos) É possível
transformar uma lista de números em uma árvore usando o código abaixo:

```kotlin
val numbers = listOf(2, 5, 3, 8, 1, 29, 43, 2, 15, 6, 1)
val initTree: TreeNode = TreeLeaf()
val tree: TreeNode = numbers.fold(initTree) { acc, i -> insert(acc, i) }
```

(No original, `{ acc, i -> insert(acc, i) }` está marcado em cinza.)

Explique o que é a sintaxe marcada em cinza. Mesmo que você jamais tenha visto Kotlin, é esperado que
você possa relacionar tal sintaxe a conceitos já vistos no curso de linguagens de programação. Para
ajudar na resposta, note que a função `insert` recebe uma árvore T e um número N e produz uma nova árvore
T′ = T ∪ {N}.

**7.2** (prova 29, Q1a) Nas últimas duas décadas temos assistido a uma crescente incorporação de
capacidades típicas de linguagens funcionais em linguagens imperativas. A figura abaixo ilustra essa
evolução em Java e C++:

```
1996 (Java 1.0) → 2004 (Java 5: Polimorfismo paramétrico) → 2014 (Java 8: Closures) → 2023 (Java 21: Casamento de Padrões)
1985 (C++1.0)   → 1991 (C++98: Polimorfismo paramétrico)  → 2011 (C++11: Closures)  → 2026 (C++26: Casamento de Padrões)
```

(a) (3 Pontos) Escreva um programa, em C++, que ilustre uma ocorrência de polimorfismo paramétrico.

**7.3** (prova 29, Q1b) (3 Pontos) Escreva um programa, em Python 3.0, que contenha um exemplo de um
*closure*.

**7.4** (prova 29, Q1c) (4 Pontos) Escreva um programa em SML/NJ que mostre um exemplo do uso de
casamento de padrões.

## Tópico 8 — Aritmética em Prolog (`is`, `=:=`) [aparece em 25% das provas (provas 24 e 29)]

**8.1** (prova 24, Q2a) O programa abaixo encontra "Triplas Pitagóricas". Três números A, B e C formam uma
tripla pitagórica caso a seguinte equação seja verdade: C² = A² + B²:

```python
def is_triple(a, b, c):
    return c*c = a*a + b*b

def solve_triple(n):
  for a in range(1, 11): # Note que não incluímos o número 11
    for b in range(1, 11):
      for c in range(1, 11):
        if is_triple(a, b, c):
          print a, b, c
```

(a) (5 Pontos) Implemente, em Prolog, um predicado `is_triple(A, B, C)` que seja verdade quando os
números `A`, `B` e `C` formarem uma tripla pitagórica, sendo `C` o valor da hipotenusa e `A` e `B` o
valor dos catetos. (Escreva numa grade de 3 linhas; é possível implementar o predicado com menos que
cinquenta caracteres!)

**8.2** (prova 24, Q2b) (5 Pontos) Implemente, em Prolog, um predicado `solve_triple(A, B, C)`, similar à
função de mesmo nome implementada em Python logo acima. O predicado `solve_triple(A, B, C)` deve ser
verdadeiro sempre que as seguintes condições forem verdadeiras:

- o predicato `is_triple(A, B, C)` é verdade.
- `A` ∈ {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}.
- `B` ∈ {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}.
- `C` ∈ {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}.

**8.3** (prova 29, Q3d) (com o `puzzle` do item 1.19) (2 Pontos) O predicado `puzzle` contém a igualdade
`SEND + MORE =:= MONEY`. Por que é necessário usar o predicado `=:=` em vez da unificação simples `=`, ou
do operador "`is`"?

## Tópico 9 — Áreas de memória: estática, pilha e heap [aparece em 12,5% das provas (prova 25)]

**9.1** (prova 25, Q3a) Esta questão se refere à alocação de memória em consequência da execução do
programa abaixo:

```python
>>> def new_set(x):  # Linha 1
...   s = set([x])   # Linha 2
...   return s       # Linha 3
>>> a = new_set(1)   # Linha 4
```

Lembre-se: existem três áreas em que valores ficam armazenados: na memória estática, no heap e na pilha.

(a) (2 Ponto) Em qual área de memória fica alocado o conjunto {1}, que é criado pela função `new_set`,
quando ela é chamada com o valor `1` na linha 4?

**9.2** (prova 25, Q3b) (2 Ponto) Em qual área de memória fica alocado a variável `s`, que é declarada na
função `new_set`, na linha 2?

**9.3** (prova 25, Q3c) (2 Pontos) Quando a variável `s` criada na linha 2 é desalocada?

**9.4** (prova 25, Q3d) (2 Pontos) Quando o conjunto criado na linha 2 é desalocado?

**9.5** (prova 25, Q3e) (2 Pontos) Imagine agora que o programa acima fosse escrito em C++:

```cpp
std::set<int>* new_set(int x) {                   # Linha 1
    std::set<int>* s = new std::set<int>();       # Linha 2
    s->insert(x);                                 # Linha 3
    return s;                                     # Linha 4
}                                                 # Linha 5
int main() { std::set<int>* a = new_set(1); }     # Linha 6
```

Quando o objeto criado na linha 2 será desalocado?

## Tópico 10 — Verificações em tempo de execução e segurança [aparece em 12,5% das provas (prova 29)]

**10.1** (prova 29, Q2a) Ada é uma linguagem de programação compilada, fortemente tipada, projetada para
desenvolver sistemas confiáveis, seguros e de alto desempenho por meio de verificações rigorosas em tempo
de compilação e de execução. Ada pode ser compilada em modo seguro, com verificações automáticas de erros
em tempo de execução (como limites de vetores e estouro aritmético), ou em modo inseguro, no qual essas
verificações são desabilitadas para maximizar o desempenho. Essa segurança tem um impacto grande na
eficiência de programas, conforme mostra a figura abaixo:

(Figura: tempo de execução pelo número de iterações; a versão segura chega a ~180 s e a insegura
(`-gnatp`) a ~30 s. "SAFE ADA insere verificações para: limites de arranjos, overflow de aritmética,
verificação de ponteiro nulo, coerções entre classes".)

(a) (2 Pontos) O que seria um "Estouro" ou (*overflow*) aritmético?

**10.2** (prova 29, Q2b) (2 Pontos) O que ocorre quando um programa Java tenta invocar um método sobre um
objeto cuja referência é nula?

**10.3** (prova 29, Q2c) (2 Pontos) O que ocorre quando um programa C++ tenta invocar um método sobre um
objeto apontado por um ponteiro nulo?

**10.4** (prova 29, Q2d) (2 Pontos) É possível acessar um vetor fora dos limites alocados em um programa
Python?

**10.5** (prova 29, Q2e) (2 Pontos) O que seria uma coerção insegura entre `struct`s na linguagem C?

## Tópico 11 — Avaliação preguiçosa e efeitos colaterais [aparece em 12,5% das provas (prova 24)]

**11.1** (prova 24, Q3a) O programa abaixo está escrito na linguagem de programação D. Você não precisa
conhecer essa linguagem para resolver a questão.

Programa escrito na linguagem D (à esquerda):

```d
01 int divBy(int n) {
02     return 1/n;
03 }
04
05 void greetThePlanet(int n) {
06     import std.stdio;
07     writefln("Hello, world!");
08 }
09
10 void main() {
11     greetThePlanet(divBy(0));
12 }
```

Saída: `$> Floating point exception (core dumped)`

Programa escrito na linguagem D com avaliação preguiçosa (à direita):

```d
01 int divBy(int n) {
02     return 1/n;
03 }
04
05 void greetThePlanet(lazy int n) {
06     import std.stdio;
07     writefln("Hello, world!");
08 }
09
10 void main() {
11     greetThePlanet(divBy(0));
12 }
```

Saída: `$> "Hello, world!`

(a) (4 Pontos) O primeiro programa causa uma exceção, enquanto o segundo programa termina sem erro.
Explique qual a semântica da palavra chave "`lazy`" no segundo programa que causa essa diferença de
comportamento.

**11.2** (prova 24, Q3b) (1 Pontos) Escreva o nome de uma linguagem de programação cujo comportamento
padrão seja similar àquele visto na implementação da função `greetThePlanet` do programa da esquerda.

**11.3** (prova 24, Q3c) (1 Pontos) Escreva o nome de uma linguagem de programação cujo comportamento
padrão seja similar àquele visto na implementação da função `greetThePlanet` do programa da direita.

**11.4** (prova 24, Q3d) (4 Pontos) "Efeito colateral" é o nome dado a qualquer ação executada por um
programa que altera o estado do sistema ao qual aquele programa está inserido. Exemplos de efeitos
colaterais são operações de entrada e saída de dados e operações de escrita em memória. A avaliação
preguiçosa de expressões que causam efeitos colaterais poderia modificar a semântica de programas?
Explique sua resposta.

## Tópico 12 — Ler e explicar um programa Prolog [aparece em 12,5% das provas (prova 25)]

**12.1** (prova 25, Q1a) Nesta questão você irá explicar o que faz dois programas Prolog diferentes. Cada
um deles utiliza a função `append`, cuja implementação é dada abaixo:

```prolog
append([], L, L).
append([H|T], L2, [H|R]) :- append(T, L2, R).
```

(a) (2 Pontos) Explique, usando até **dez** palavras, o que faz o seguinte programa Prolog:

```prolog
mystery1([]).
mystery1([_]).
mystery1([H|T]) :- append(Mid, [H], T), mystery1(Mid).
```

**12.2** (prova 25, Q1b) (2 Pontos) Complete a lista `L` para que o predicado abaixo seja verdade:

```prolog
L = [__, __, __, __], mystery1(L).
```

**12.3** (prova 25, Q1c) (2 Pontos) Complete a lista `L` para que o predicado abaixo seja falso:

```prolog
L = [__, __, __, __], mystery1(L).
```

**12.4** (prova 25, Q1d) Considere o predicado abaixo:

```prolog
mystery2([], []).
mystery2([H|T], FlatList) :-
    mystery2(H, FlatH),
    mystery2(T, FlatT),
    append(FlatH, FlatT, FlatList).
mystery2([H|T], [H|FlatT]) :- \+ is_list(H), mystery2(T, FlatT).
```

No que se segue, você deverá escrever três exemplos diferentes deste predicado que sejam verdade.
(i. 2 Pontos; ii. 1 Ponto; iii. 1 Ponto)

## Tópico 13 — Recursão de cauda (cauda rasa) [aparece em 12,5% das provas (prova 26)]

**13.1** (prova 26, Q3a) Uma função recursiva é dita de *cauda rasa* quando a última coisa que ela faz é
chamar-se recursivamente. Re-implemente cada um dos predicados abaixo, para que eles sejam predicados de
cauda rasa:

(a) (3 Pontos) O predicado que soma os elementos de uma lista:

```prolog
sum([], 0).
sum([H|T], X) :- sum(T, XAux), X is XAux + H.
```

**13.2** (prova 26, Q3b) (3 Pontos) O predicado que inverte os elementos de uma lista:

```prolog
myappend([], L, L).
myappend([H|T], L, [H|LAux]) :- myappend(T, L, LAux).

myreverse([], []).
myreverse([H|T], R) :- myreverse(T, RT), myappend(RT, [H], R).
```

**13.3** (prova 26, Q3c) (4 Pontos) Qual a vantagem de implementarmos funções de cauda rasa?
