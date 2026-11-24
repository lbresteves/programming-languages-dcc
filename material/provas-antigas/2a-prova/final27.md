# Segunda Prova de Linguagens de Programação - DCC024 - Ciência da Computação

Nome: ____________________

"Eu dou minha palavra de honra que não trapacearei neste exame."

Número de matrícula: ____________________

As regras do jogo:

- A prova é sem consulta.
- Quando terminar, não entregue nada além do caderno de provas para o instrutor.
- Quando escrever código, a sintaxe correta é importante.
- Cada estudante tem direito a fazer uma pergunta ao instrutor durante a prova. Traga o caderno de
  provas quando vier à mesa do instrutor. São perguntas: "Posso fazer uma pergunta?" ou "Quanto
  tempo falta?"
- Você pode ir ao banheiro, mas deve deixar seu telefone celular sobre a mesa quando o fizer (e lembre-se
  do trato feito para esta prova).
- A prova termina uma hora e quarenta minutos após seu início.
- Seja honesto e lembre-se: **você deu sua palavra de honra**.

Alguns conselhos:

- Escreva sempre algo nas questões, a fim de ganhar algum crédito parcial.
- Se não entender a questão, e já tiver gasto sua pergunta, escreva a sua interpretação da questão junto
  à resposta.
- A prova não é difícil, ela é divertida, então aproveite!

Tabela 1: Pontos acumulados (para uso do instrutor)

| Questão 1 | Questão 2 | Questão 3 | Extra |
|---|---|---|---|
| | | | |

Questão Extra (0.5 Pontos): O que poderia demandar o joelho de um menino que cresceu? A exemplo do que
pediu o *Joelho Juvenal*?

> [!NOTE] Este PDF tem respostas escritas em vermelho (gabarito). Elas estão transcritas na seção
> `# Resolução` no fim deste arquivo, separadas do enunciado.

---

## 1.

Esta questão refere-se à forma como arranjos são implementados em linguagens de programação imperativas.

(a) (3 Pontos) Linguagens imperativas implementam arranjos de forma que seja possível termos acesso a
qualquer posição em tempo constante; isto é, em O(1). Como isso é possível?

(b) (3 Pontos) Como seria armazenado em memória uma estrutura como aquela apontada pelo ponteiro `p` no
programa abaixo?

```c
void init(int** p, unsigned N) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j <= i; j++) {
            p[i][j] = 1;
        }
    }
}
```

> [!NOTE] Figura (p. 2): ao lado do código, um retângulo vertical (o arranjo de ponteiros) com setas
> para quatro retângulos horizontais (as linhas).

(c) (1 Ponto) Qual dos dois programas abaixo deve ser mais eficiente?

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

(d) (3 Pontos) Justifique a sua resposta para a questão anterior.

## 2.

As questões a seguir pedem programas que devem ser implementados na linguagem de programação Prolog.

(a) (3 Pontos) Implemente um predicado `sublist(L, S)` que seja verdade quando `S` for uma sublista de
`L`. Por exemplo:

```prolog
?- findall(L, sublist([a, b, c], L), R).
R = [[a, b, c], [a, b], [a, c], [a], [b, c], [b], [c], []].
```

(b) (3 Pontos) Implemente um predicado `perm(L, P)` que seja verdade quando `P` for uma permutação dos
elementos da lista `L`. Por exemplo:

```prolog
?- findall(P, perm([a, b, c], P), R).
R = [[a, b, c], [a, c, b], [b, a, c], [b, c, a], [c, a, b], [c, b, a]].
```

Você pode usar o predicado `select`. Por exemplo:

```prolog
?- findall((E, S), select(E, [a, b, c], S), R).
R = [(a, [b, c]), (b, [a, c]), (c, [a, b])].
```

(c) (4 Pontos) Escreva um predicado `anagram(L, A)`, que seja verdade se a lista `A` for um anagrama de
alguma subsequência da lista `L`. Por exemplo:

```prolog
?- anagram([l, i, v, r, e, s], [s, e, r, v, i, l]).
true.
?- anagram([l, i, v, r, e, s], [s, a, r, v, i, l]).
false.
?- anagram([l, i, v, r, e, s], [s, i, r, e]).
true.
```

## 3.

Ligue as linguagens de programação à esquerda com características que elas possuem à direita. Você deve
estabelecer uma bijeção entre as duas colunas. Cada resposta correta vale um ponto.

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

> *Era uma vez um joelho que se chamava Juvenal. Juvenal tinha um problema, coitado: vivia todo
> escalavrado. Também, quem mandou o Juvenal ser o joelho de um menino levado? Juvenal queria muito
> aprender língua de menino só pra dizer assim: "Menino, tem dó de mim!" Mas, quando o esfolado sarava,
> Juvenal bem que gostava de correr e de saltar. E ele se desdobrava e se dobrava outra vez todo alegre,
> pois sabia que, indo e vindo, fazia o menino feliz.* (**Ziraldo**)

---

# Resolução

Transcrição das respostas em vermelho que vieram no próprio PDF.

- **Extra:** "Que o menino fizesse furinhos na calça, para ele poder enxergar".
- **Q1a:** "Por que memória é contígua e o tamanho de cada célula é conhecido. Então o acesso acontece
  via base e offset".
- **Q1c:** "O da esquerda" (Programa 1).
- **Q1d:** "C armazena arranjos por linha. Então o programa da esquerda possui melhor localidade de
  referência."
- **Q2a:**

  ```prolog
  sublist([], []).
  sublist([H|T], [H|L]) :- sublist(T, L).
  sublist([_|T], L) :- sublist(T, L).
  ```

- **Q2b:**

  ```prolog
  nperm([], []).
  nperm([H|T], L) :- nperm(T, Lx), select(H, L, Lx).

  perm([], []).
  perm(T, [H|LL]) :- select(H, T, L1), perm(L1, LL).
  ```

- **Q2c:**

  ```prolog
  anagram(L, A) :- sublist(L, S), perm(S, A).
  ```

- **Q3** (ligações desenhadas em vermelho):

  | Linguagens | Característica |
  |---|---|
  | C, C++, Fortran | Tipagem fraca |
  | Python, JavaScript, Prolog | Tipagem dinâmica |
  | Java, Python, C++ | Invocação dinâmica |
  | Rust, C, C++ | Execução via compilação |
  | Python, SML, JavaScript | Suporte a closures |
  | Java, SML, C++ | Polimorfismo paramétrico |
  | SML, Haskell, ocaml | Programação funcional |
  | Python, Java, JavaScript | Execução virtualizada (implementação típica) |
  | C++, Java, SML | Tipagem estática |
  | R, Haskell, C macros | Avaliação não estrita |
