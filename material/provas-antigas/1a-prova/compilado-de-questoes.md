# Compilado de questões — 1ª prova (midterms 22 a 29)

- **8 provas:** midterm22, 23, 24, 25, 26, 27, 28 e 29.
- **Duplicata:** a **midterm25 é idêntica à midterm23**. Ela conta como prova separada na
  frequência (foi aplicada de novo), mas o enunciado aparece uma vez só, com as duas origens.
- **Frequência** = provas em que o tópico aparece ÷ 8. Empates: mais provas distintas
  primeiro, depois mais itens.
- Cada item (a, b, c…) está em **um** tópico só. Só enunciados; as resoluções ficam nos
  próprios arquivos das provas.
- Gerado em 2026-09-30 com `/compilar-prova`.

| # | Tópico | Frequência | Provas | Itens | Aula | Revisão 28/09 |
|---|---|---|---|---|---|---|
| 1 | Funções de alta ordem (`map`, `foldr`, `foldl`, predicados) | 50% | 22, 27, 28, 29 | 7 | 10 | ⭐ Lista 10 inteira |
| 2 | Verificações em tempo de execução e comportamento indefinido | 37,5% | 22, 24, 28 | 9 | 7 | Lista 7, Q1–Q2 |
| 3 | Registros de ativação e *closures* | 37,5% | 22, 26, 27 | 8 | 13 | — |
| 4 | Dar o tipo de uma função SML | 37,5% | 24, 28, 29 | 6 | 5–8 | ⭐ "dar uma função e perguntar o tipo" |
| 5 | Implementar funções SML sobre listas e tuplas | 37,5% | 22, 24, 29 | 6 | 5–6 | ⭐ "fazer alguma coisa em SML" |
| 6 | Gramáticas: ambiguidade, precedência, associatividade | 37,5% | 23, 25, 29 | 9 | 2–3 | ⭐⭐ gramática em Prolog "com certeza vai cair" |
| 7 | `max` exponencial → linear e `match nonexhaustive` | 37,5% | 23, 25, 28 | 7 | 6 | complexidade assintótica |
| 8 | Sistemas de tipos e polimorfismo | 25% | 27, 28 | 12 | 7–8 | Listas 7 (Q3) e 8 |
| 9 | Traduzir um programa C/Python para SML | 25% | 24, 26 | 6 | 5, 6, 10 | — |
| 10 | Formas de execução: compilação, interpretação, *bytecode* | 25% | 23, 25 | 5 | 4 | ⭐ JIT |
| 11 | Cardinalidade de tipos | 12,5% | 26 | 8 | 7, 12 | — |
| 12 | Escopo estático × dinâmico e espaços de nomes | 12,5% | 27 | 7 | 11 | ⭐ "quanto imprime esse programa em SML?" |
| 13 | Paradigmas e modelos computacionais | 12,5% | 22 | 5 | 1 | — |
| 14 | Cálculo lambda: booleanos de Church | 12,5% | 29 | 3 | 9 | — |

### O que o professor sinalizou na revisão de 28/09

Fonte: `docs/content/docs/aula-revisao-01-12.mdx`, blocos "Ênfase / pode cair". A coluna
**Revisão 28/09** da tabela marca com ⭐ o que ele disse que cai; sem estrela, é só a lista
que a revisão indicou para o tema.

| Dica do professor | Aula | Tópico aqui | Nas provas antigas |
|---|---|---|---|
| Gramáticas em Prolog: "**com certeza vai cair**" | 3 | 6 | só na 29 (Q2d–e) |
| Associatividade, comutatividade | 2–3 | 6 | 29 (Q2b) |
| Dar uma função e perguntar qual o tipo dela | 5 | 4 | 24, 28, 29 |
| Fazer alguma coisa em SML, talvez resolver um problema | 6 | 5, 9 | quase todas |
| Funções de uma linha com `map`, `foldr`, `foldl` (Lista 10) | 10 | 1 | 22, 27, 28, 29 |
| "Quanto imprime esse programa em SML?" (escopo) | 11 | 12 | só na 27 |
| *Just-in-time*, complexidade assintótica | 1 | 10, 7 | 23/25; `max` em 23/25 e 28 |
| Se `-O1` chama otimizações, por que existem `-O2`, `-O3`? | 4 | — | **nunca caiu** nas provas antigas |

Em resumo: dois temas que caíram pouco no passado ganharam destaque do professor, e valem
mais do que a frequência sugere.
- **Gramáticas em Prolog** (29 Q2d–e): o professor disse que é certo.
- **Escopo, "quanto imprime"** (27 Q1): ele citou na revisão.

E um tema **nunca caiu** mas foi citado: os níveis de otimização `-O1`/`-O2`/`-O3` do `gcc`
(Lista 4).

---

## Tópico 1 — Funções de alta ordem [aparece em 50% das provas (provas 22, 27, 28 e 29)] [Altas chances de cair (revisão)]

**1.1** (prova 22, Q3c) O objetivo desta questão é implementar uma busca em lista que retorna
a primeira posição da lista em que certa condição ocorra.

(3 Pontos) Escreva a função `find_aux`, de tipo `('a -> bool) -> (int * 'a) list -> int`, que
receba um predicado (uma função que retorna um boleano) e uma lista indexada (uma lista de
pares (i, e), em que i é o índice do elemento e), e retorne o índice i do primeiro elemento e que
torna verdadeiro o predicado. Exemplos:

```sml
- find_aux (fn x => x mod 2 <> 0) [(0,2),(1,3),(2,5)];
val it = 1 : int
- find_aux (fn x => x > 4) [(0,2),(1,3),(2,5)];
val it = 2 : int
- find_aux (fn x => x > 6) [(0,2),(1,3),(2,5)];
val it = ~1 : int
```

**1.2** (prova 22, Q3d) (2 Ponto) Escreva uma função `find`, de tipo `('a -> bool) -> 'a list -> int`,
tal que `find f L` retorne o índice do primeiro elemento de `L` que seja verdadeiro para o
predicado `f`. Exemplos:

```sml
- find (fn x => size(x) > 2) ["Eu", "amo", "voce"];
val it = 1 : int
find (fn x => x mod 2 = 0) [1, 3, 4, 5];
val it = 2 : int
```

Dica: use `find_aux`. Você pode assumir que a função existe, caso não a tenha feito
anteriormente. (A função `count : 'a list -> (int * 'a) list`, da questão 5.2, também pode
ser usada.)

**1.3** (prova 27, Q2a) A operação `foldr` em SML/NJ possui o seguinte tipo:
`('a * 'b -> 'b) -> 'b -> 'a list -> 'b`. Responda às questões abaixo com base nessa observação.

(6 Pontos) Escreva uma aplicação de `foldr` em que a operação binária, cujo tipo é
`('a * 'b -> 'b)`, seja tal que `'a` ≠ `'b`. Para tanto, você deve completar o código abaixo:

```sml
- val f = fn(x, y) => [________________________]   (* 2 Pontos *)
- val c = [________________________]               (* 1 Pontos *)
- val L = [________________________]               (* 1 Pontos *)
- foldr f c L ;
```

Escreva a resposta da chamada "`foldr f c L`" na área logo abaixo: (2 Pontos)
[________________________]

**1.4** (prova 27, Q2c) (2 Pontos) A função `foldl` possui o mesmo tipo que `foldr`. Escreva uma
aplicação de `foldl` que produza um resultado diferente caso a chamada de `foldl` fosse
substituída por uma chamada de `foldr`. Use somente a área demarcada abaixo. *(uma linha)*

**1.5** (prova 28, Q2e) Considere a função `max` abaixo, implementada em SML:

```sml
fun max [e] = e
  | max (h::t) = if max t > h then max t else h
```

(2 Pontos) Escreva uma função `maxL` <u>de uma linha</u>, que receba uma lista de listas, e
retorne o máximo de cada lista. Exemplo:

```sml
maxL [[2, 3], [3, 4, 5]];
val it = [3,5] : int list
```

**1.6** (prova 29, Q3c) Nesta questão você deverá implementar, em SML/NJ, a função `len` que
calcula o número de elementos presentes em uma lista usando diferentes técnicas de programação.

(2 Pontos) Implemente a função `len2:'a list -> int` usando a função `foldr`. Lembre-se: o tipo
de `foldr` é `('a * 'b -> 'b) -> 'b -> 'a list -> 'b`. Sua implementação deve ter uma linha e
não pode usar `map`.

**1.7** (prova 29, Q3d) (2 Pontos) Implemente a função `len3:'a list -> int` usando uma
combinação de `foldr` e `map:('a -> 'b) -> 'a list -> 'b list`. A operação de redução deve ser
`(op +)`. Sua implementação deve ter uma linha.

---

## Tópico 2 — Verificações em tempo de execução e comportamento indefinido [aparece em 37,5% das provas (provas 22, 24 e 28)]

**2.1** (prova 22, Q2a) Uma linguagem de programação é dita *fortemente tipada* caso programas
escritos nessa linguagem não fiquem em estado indefinido. Note que esse conceito, de tipagem
fraca ou forte, não é binário: uma linguagem pode ser mais ou menos fortemente tipada que outra:
a linguagem mais fortemente tipada terá menos situações que geram comportamento indefinido.

(1 Pontos) Uma forma de garantir a ausência de comportamento indefinido é via *verificações em
tempo de execução*. Essas verificações são testes condicionais *implícitos*. O programa abaixo
mostra um teste desse tipo, que é inserido em SML/NJ:

O que o programador escreveu:

```sml
fun first L = hd L
```

O que o compilador produziu:

```sml
fun first L =
  if null L
  then raise Empty
  else hd L
```

Exemplos de execução:

```sml
- first ["oi"];
val it = "oi" : string
```

O código mais a direita é um exemplo de programa que usa a função `first`. Escreva um programa
diferente que usa `first` que poderia chegar a um estado indefinido caso a verificação implícita
no código produzido pelo compilador não existisse.

**2.2** (prova 22, Q2b) (3 Pontos) O compilador java (`javac`) vai inserir um teste implícito no
programa abaixo, a fim de evitar que o programa chegue a um estado indefinido. O que verifica esse
teste?

```java
void testImplicitIsNull(Element e) {
  System.out.println(e.toString());
}
```

**2.3** (prova 22, Q2c) O compilador java (`javac`) vai inserir três testes implícitos no programa
abaixo, a fim de evitar que o programa chegue a um estado indefinido. O que verifica cada um
desses testes?

```java
int boundsCheck(int[] array, int index) {
  return array[index];
}
```

i. (2 Pontos) Teste 1:
ii. (2 Pontos) Teste 2:
iii. (2 Pontos) Teste 3:

**2.4** (prova 24, Q1) Um programa é uma sequência de caracteres. Se tal sequência é reconhecida
pela gramática de uma linguagem de programação, então o programa é sintaticamente válido naquela
linguagem. Porém, nem todo programa sintaticamente válido é semanticamente válido. O diagrama
abaixo ilustra essas relações de validade para a linguagem de programação C. Complete as caixas
com exemplos de programas que pertencem à cada categoria marcada no Diagrama de Venn.

> Figura: Diagrama de Venn com quatro retângulos aninhados dentro de "*Todas as sentenças que
> usam caracteres ASCII*", do mais externo ao mais interno:

| Categoria | Exemplo |
|---|---|
| (2 Pontos) Sentenças que não são sintaticamente válidas em C. | |
| (2 Pontos) Sentenças sintaticamente válidas que não passam na verificação de tipos. | |
| (3 Pontos) Sentenças que passam na verificação de tipos, mas que causam comportamento indefinido quando executam. | |
| (3 Pontos) Sentenças que passam na verificação de tipos, e que executam sem causar comportamento indefinido. | |

**2.5** (prova 28, Q1) Linguagens de programação frequentemente usam "instruções invisíveis".
Essas são instruções usadas para prevenir erros em tempo de execução. Por exemplo, a operação de
divisão, em SML gera a exceção `Div [divide by zero]`. Cada operação de divisão é guardada por um
condicional que verifica se o dividendo é zero. Caso o seja, a exceção aritmética é lançada.
Quanto mais dinâmica a linguagem, mais instruções invisíveis ela possui. Python usa muitas
instruções desse tipo. C, por outro lado, não as usa.

(a) (2 Pontos) Dê exemplo de alguma outra operação, além da divisão vista acima, que é guardada
por condicionais invisíveis em SML/NJ.

(b) (2 Pontos) Dê exemplo de alguma operação em Java que seja guardada por condicionais
invisíveis.

(c) (3 Pontos) A linguagem C não usa instruções invisíveis. Há vantagens nessa abordagem. Cite
uma vantagem **usando somente uma palavra**:

(d) (1 Pontos) Há, contudo, várias desvantagens na abordagem de C. Cite uma dessas desvantagens.

(e) (2 Pontos) Use um exemplo que ilustre a desvantagem mencionada no item anterior.

---

## Tópico 3 — Registros de ativação e *closures* [aparece em 37,5% das provas (provas 22, 26 e 27)]

**3.1** (prova 22, Q4) Essa questão diz respeito ao programa escrito em SML/NJ que aparece na
parte esquerda da figura abaixo.

```sml
fun f1 n1 =
  let
    fun f2 n2 =
      let
        fun f3 n3
          = n1+n2+n3
      in
        f3 3   (* <- Momento em que o snapshot da memória foi obtido *)
      end
  in
    f2 5
  end
f1 1
```

> Figura: à direita do código, a "Memória alocada na pilha" com os registros de ativação `f1`
> (embaixo), `f2` e `f3` (no topo). O registro de `f1` tem três campos ligados a linhas de
> resposta "(1 Ponto) Nome do ponteiro." e "(1 Ponto) Aponta para código ou para dados?". Na
> "Memória alocada fora da pilha" há caixas `f1:` e `f2:`, apontadas por campos de `f3` e `f2`;
> a caixa `f2:` aponta para a caixa `f1:`.

(a) (6 Pontos) A figura mostra o registro de ativação das diferentes funções chamadas para
calcular `f1 1`. A foto da memória (*snapshot*) foi tirada quando a chamada `f3 3` ocorreu. Os
registros de ativação das diferentes funções contém a mesma estrutura: espaços para alocar os
dados que cada função precisa para executar corretamente. Dentre esses dados, SML/NJ aloca ao
menos três ponteiros em cada registro de ativação. Pede-se que você escreva o nome desses três
ponteiros, e indique, para cada ponteiro, se ele aponta para uma área de código (para algum
endereço de instrução de máquina) ou para uma área de dados (uma região que contém os dados que o
programa precisa para funcionar: pilha, *heap*, etc). Caso você não saiba o nome do ponteiro, não
se preocupe, você pode usar o espaço abaixo para explicar para quê aquele ponteiro serve.

(b) Os registros de ativação são alocados em um espaço de dados que funciona como uma pilha: o
último registro alocado será o primeiro a ser desalocado, tão logo a função que o criou retorne.
Contudo, em SML/NJ alguns dados de registro de ativação não podem ser alocados na pilha: eles
podem ser necessários após a função que os alocou retornar.

i. (2 Pontos) Quais dados de uma função não podem ser alocados na pilha?

ii. (2 Pontos) Escreva um programa (simples) que demonstra que dados podem ser necessários após a
função que os criou retornar.

**3.2** (prova 26, Q2) (0.5 Pontos cada) Registros de ativação são regiões de memória que guardam
as informações necessárias à ativação de funções. Registros de ativação incluem diferentes tipos
de dados, dependendo de como a linguagem é implementada. Exemplos de dados armazenados em
registros de ativação incluem: endereço de retorno da função, valor dos parâmetros, valor de
retorno, valor das variáveis locais, ponteiro para o registro de ativação da função anteriormente
ativa (`Prev-Record`), ponteiro para o registro de ativação da função aninhadora (`Nesting-Link`),
ponteiro para a tabela de variáveis livres na função (`Closure-Table`). Em cada figura abaixo,
diga quais dessas informações devem estar presentes no registro de ativação de cada linguagem de
programação.

**A linguagem Fortran 66, que somente possuia alocação estática de memória**

```fortran
FUNCTION ADDITION(X, Y)
REAL X, Y, ADDITION
ADDITION = X + Y
RETURN
END
```

**A linguagem ANSI C padrão, que não permite funções aninhadas.**

```c
int main(int argc, char** argv) {
  int x = argc - 1;
  printf("Number of args = %d\n", x);
  return 0;
}
```

**A linguagem C compilada pelo compilador gcc, que suporta funções aninhadas:**

```c
int outerFunction(int a) {
  int innerFunction(int b) {
    return b * 2;
  }
  return innerFunction(a);
}
```

**A linguagem SML/NJ que vimos em sala de aula, que permite retornar funções aninhadas.**

```sml
fun funToAddX x =
  let
    fun addX y = y + x
  in
    addX
  end
```

Para cada linguagem, a mesma tabela:

| S/N | Informação |
|---|---|
| | Valor dos parâmetros e variáveis locais |
| | Endereço de retorno |
| | `Prev-Record` |
| | `Nesting-Link` |
| | `Closure-Table` |

Em cada caso acima, escreva no retângulo correspondente a uma informação a letra <u>S</u>, caso a
informação esteja presente no registro de ativação, ou a letra <u>N</u>, caso aquela informação
não esteja presente.

**3.3** (prova 27, Q3h) (10 Pontos cada item) Abaixo temos uma lista de características de
linguagens de programação. Para cada item, informe uma linguagem de programação que possui aquela
característica. A mesma linguagem pode ser usada múltiplas vezes em diferentes itens.

(h) Suporte a *closures*:

---

## Tópico 4 — Dar o tipo de uma função SML [aparece em 37,5% das provas (provas 24, 28 e 29)] [Altas chances de cair (revisão)]

**4.1** (prova 24, Q2c) A função `xch` troca de lugar o primeiro e o terceiro elementos de uma
tupla de três elementos. Exemplos:

```sml
- xch ("oi", true, 1);
val it = (1,true,"oi") : int * bool * string
- xch (3.14, #"a", false);
val it = (false,#"a",3.14) : bool * char * real
```

(2 Pontos) Qual é o tipo da função `xch`?

**4.2** (prova 24, Q2d) (2 Pontos) qual é o resultado da seguinte chamada?

```sml
xch (3.14, #"a", false, 314);
```

**4.3** (prova 28, Q2a) Considere a função `max` abaixo, implementada em SML:

```sml
fun max [e] = e
  | max (h::t) = if max t > h then max t else h
```

(2 Pontos) Qual o tipo da função `max`?

**4.4** (prova 29, Q1b) A questão abaixo envolve a construção de funções lambda em SML/NJ.
Podemos definir booleanos no cálculo lambda usando a codificação de Church:

```sml
val T = fn x => fn y => x
val F = fn x => fn y => y
```

A função `print` transforma um booleano de Church em um booleano de SML/NJ
(`print T` dá `true`, `print F` dá `false`).

(2 Pontos) Qual o tipo da função `print` que você escreveu acima?

**4.5** (prova 29, Q1d) (2 Pontos) O tipo da função `AND` deve ser
`('a -> ('b -> 'c -> 'c) -> 'd) -> 'a -> 'd`. Este construtor de tipos possui quantos
parâmetros?

**4.6** (prova 29, Q3e) (2 Pontos) O tipo de `len0` deve ser `''a list -> int`, e o tipo de
`len1` é `'a list -> int`. Qual a diferença entre esses tipos polimórficos?

---

## Tópico 5 — Implementar funções SML sobre listas e tuplas [aparece em 37,5% das provas (provas 22, 24 e 29)] [Altas chances de cair (revisão)]

**5.1** (prova 22, Q3a) (3 Pontos) Escreva uma função `index`, de tipo
`int -> 'a list -> (int * 'a) list`, tal que `index n L` cria uma lista `L'` de tuplas indexadas
a partir de `n`. Por exemplo:

```sml
- index 2 ["a", "b", "c"];
val it = [(2,"a"),(3,"b"),(4,"c")] : (int * string) list
- index 0 ["a", "b", "c"];
val it = [(0,"a"),(1,"b"),(2,"c")] : (int * string) list
```

Note que cada elemento de `L'` é um par (i, e), sendo i o índice do elemento e de `L`.

**5.2** (prova 22, Q3b) (2 Pontos) Escreva uma função `count`, de tipo
`'a list -> (int * 'a) list`, que transforme uma lista `L` em uma lista de tuplas indexadas a
partir de zero (fique à vontade para usar a função `index` da questão anterior. Caso não a tenha
feito, assuma sua existência). Exemplos:

```sml
- count [2, 3, 5, 7];
val it = [(0,2),(1,3),(2,5),(3,7)] : (int * int) list
- count [true, false];
val it = [(0,true),(1,false)] : (int * bool) list
- count ["a", "b", "c"];
val it = [(0,"a"),(1,"b"),(2,"c")] : (int * string) list
```

**5.3** (prova 24, Q2a) Nesta questão você deverá escrever diferentes programas em SML/NJ.
Lembre-se que a correta sintaxe é importante. Para cada programa, você precisa usar o número de
linhas e colunas especificado.

(3 Pontos) Escreva uma função `inv`, cujo tipo é `'a list -> 'a list`, que inverta pares de
caracteres dentro de uma lista. Exemplos:

```sml
inv [1, 2, 3, 4];
val it = [2,1,4,3] : int list
inv ["a", "b", "c"];
val it = ["b","a","c"] : string list
inv nil:int list;
val it = [] : int list
```

*(grade de resposta: 3 linhas × ~40 colunas)*

Veja que `inv` inverte os caracteres em pares, isso é, nas posições 2n e 2n + 1, n ≥ 0. A função
`inv` não inverte os caracteres nas posições 2n + 1 e 2n + 2, n ≥ 0.

**5.4** (prova 24, Q2b) (3 Pontos) Escreva uma função `xch`, que troque de lugar o primeiro e o
terceiro elementos de uma tupla de três elementos. Exemplos:

```sml
- xch ("oi", true, 1);
val it = (1,true,"oi") : int * bool * string
- xch (3.14, #"a", false);
val it = (false,#"a",3.14) : bool * char * real
```

*(grade de resposta: 1 linha × ~40 colunas)*

**5.5** (prova 29, Q3a) Nesta questão você deverá implementar, em SML/NJ, a função `len` que
calcula o número de elementos presentes em uma lista usando diferentes técnicas de programação.

(2 Pontos) Implemente, em uma linha somente, a função `len0` sem usar casamento de padrões e sem
usar `foldr` ou `foldl`. Você pode usar a função `tl: 'a list -> 'a list`.
**Importante:** O tipo de sua função deve ser `''a list -> int`:

**5.6** (prova 29, Q3b) (2 Pontos) Implemente a função `len1` usando casamento de padrões, em duas
linhas. O tipo de sua implementação deve ser `'a list -> int`:

---

## Tópico 6 — Gramáticas: ambiguidade, precedência, associatividade [aparece em 37,5% das provas (provas 23, 25 e 29)] [Altas chances de cair (revisão)]

**6.1** (provas 23 e 25, Q2 — enunciado idêntico) Esta questão refere-se à gramática abaixo, que
representa uma linguagem muito simples de expressões booleanas:

```
<E> ::= <E> and <E>
      | <E> or <E>
      | not <E>
      | true
      | false
```

(a) (4 Pontos) A gramática acima é ambígua. Demonstre esse fato.

(b) (2 Pontos) O que é a "*precedência relativa*" entre os operadores de uma gramática?

(c) (1 Ponto) Quais operadores têm precedência maior: aqueles gerados por produções mais próximas
do símbolo de partida da gramática, ou aqueles gerados por produções mais distantes? Note que a
"*distância*", neste caso, é o número de regras de produção expandidas até que um símbolo seja
gerado.

(d) (3 Pontos) Modifique a gramática, para que a operação `and` tenha precedência maior que a
operação `or`. Não é necessário modificar a precedência dos outros termos que aparecem na
linguagem.

**6.2** (prova 29, Q2) Considere a seguinte gramática para expressões booleanas:

```
e ::= b and e | b or e | b
b ::= 0 | 1
```

Responda aos itens abaixo, justificando sempre que necessário:

(a) (2 pontos) A gramática acima é ambígua? Se sim, apresente um exemplo de sentença com duas
derivações distintas usando o espaço à direita.

(b) (2 pontos) Qual é a associatividade das operações `and` e `or` nessa gramática?

(c) (2 pontos) Modifique a gramática de modo que a operação `and` tenha precedência maior que
`or`.

(d) (2 pontos) Escreva a **gramática original** em Prolog, utilizando a sintaxe de gramáticas
lógicas.

(e) (2 pontos) Estenda a gramática em Prolog com atributos (argumentos) para calcular o valor
lógico das expressões reconhecidas. Para este item, desconsidere precedência e associatividade:
assuma que as operações são comutativas e possuem a mesma precedência.

---

## Tópico 7 — `max` exponencial → linear e `match nonexhaustive` [aparece em 37,5% das provas (provas 23, 25 e 28)]

**7.1** (provas 23 e 25, Q1 — enunciado idêntico) Esta questão diz respeito à complexidade
computacional da função abaixo, implementada em SML/NJ:

```sml
fun max [e] = e
  | max (h::t) = if max t > h then max t else h
```

(a) (3 Pontos) A compilação da função `max` produz o seguinte aviso:
"`Warning: match nonexhaustive`". Por que?

(b) (1 Pontos) Considere as duas chamadas de `max` abaixo. Qual delas terminaria mais
rapidamente, a primeira chamada, ou a segunda?

```sml
- max [9, 8, 7, 6, 5, 4, 3, 2, 1] (* Primeira chamada *)
- max [1, 2, 3, 4, 5, 6, 7, 8, 9] (* Segunda chamada *)
```

(c) (2 Pontos) Explique sua resposta para a questão (b) acima. Procure indicar quantas chamadas da
função `max` ocorrem em cada caso. Caso seja difícil encontrar o número exato, indique a
quantidade de chamadas em função de N, o número de elementos da lista.

(d) (4 Pontos) Ré-escreva a função `max`, de modo que ela possua complexidade linear no número de
elementos da lista de entrada, independente do conteúdo da lista. Note que tanto o melhor quanto
o pior caso de complexidade da função implementada deve ser O(N), sendo N o número de elementos
da lista de entrada.

*(grade de resposta: 7 linhas × ~40 colunas, um caracter por célula)*

**7.2** (prova 28, Q2b–d) Considere a função `max` abaixo, implementada em SML:

```sml
fun max [e] = e
  | max (h::t) = if max t > h then max t else h
```

(b) (2 Pontos) A função `max` possui um pior caso exponencial. Como deve ser a entrada (assumindo
uma lista com n elementos) para forçar o caso O(2ⁿ)?

(c) (2 Pontos) Reescreva a função `max`, para que ela seja linear no número n de elementos da
lista de entrada.

(d) (2 Pontos) A função `max`, ao ser compilada, provoca um aviso do tipo `match nonexhaustive`.
Por que?

---

## Tópico 8 — Sistemas de tipos e polimorfismo [aparece em 25% das provas (provas 27 e 28)]

**8.1** (prova 27, Q2b) A operação `foldr` em SML/NJ possui o seguinte tipo:
`('a * 'b -> 'b) -> 'b -> 'a list -> 'b`.

(2 Pontos) O tipo de `foldr` ilustra um exemplo de polimorfismo. Qual tipo de polimorfismo é
ilustrado nesse caso, dentre os quatro tipos que foram vistos no curso?

**8.2** (prova 27, Q3a–g) (10 Pontos cada item) Abaixo temos uma lista de características de
linguagens de programação. Para cada item, informe uma linguagem de programação que possui aquela
característica. A mesma linguagem pode ser usada múltiplas vezes em diferentes itens.

(a) Tipagem dinâmica:
(b) Tipagem estática:
(c) Tipagem forte:
(d) Tipagem fraca:
(e) Equivalência estrutural de tipos:
(f) Equivalência nominal de tipos:
(g) Suporte a tipos formados como a união de outros tipos:

**8.3** (prova 28, Q3) Esta questão refere-se ao programa abaixo, implementado em uma linguagem de
programação hipotética, cuja sintaxe é baseada em Python:

```
def f(x) = x + 2
def h(g) = g(false)
h(f)
```

Explique como seria o sistema de tipagem da linguagem hipotética considerando cada um dos casos
de tentativa de execução do programa acima. Especificamente, identifique se o sistema de tipagem é
estático ou dinâmico e se há presença de algum dentre os seguintes tipos de polimorfismo:
coerção, sobrecarga, paramétrico e/ou subtipagem. Justifique suas respostas.

(a) (2 Pontos) O programa não compila com o erro:

```
$> Linha 2. Tipo esperado: 'int'. Tipo encontrado: 'bool'
```

(b) (3 Pontos) O programa compila, mas durante a execução ele termina de modo anormal, com a
mensagem:

```
$> Atribuição inválida. Tipo esperado: 'int * int'. Tipo encontrado: 'bool * int'
```

(c) (2 Pontos) O programa original compila, e retorna o valor 2. Porém, o programa abaixo não
compila:

```
def f(x) = x + 2
def h(g) = g(f)
h(f)
```

(d) (3 Pontos) O programa original compila e retorna o valor 2. O programa abaixo também compila:

```
def f(x) = x + 2
def h(g) = g(f)
h(f)
```

Contudo, o programa acima termina de forma anômala, com a mensagem:

```
$> Operador +: int*int -> int não definido para type<fun>.
```

---

## Tópico 9 — Traduzir um programa C/Python para SML [aparece em 25% das provas (provas 24 e 26)]

**9.1** (prova 24, Q3) A questão abaixo refere-se ao seguinte programa, implementado em C. Você
precisa entender o que o programa faz. O desafio da questão consiste em simular esse programa em
SML/NJ. O programa análogo, em SML/NJ, não vai ser exatamente igual ao programa em C. Por
exemplo, em vez de usar um arranjo, usaremos uma lista, e o tamanho do arranjo não será um
parâmetro da nova função.

```c
int incs(int* v, int N) {
  int sum = 0;
  for (int i = 1; i < N; i++) { if (v[i] > v[i-1]) { sum++; } }
  return sum;
}
```

(a) (4 Pontos) Implemente uma função `zip`, que receba duas listas, `L0` e `L1`, e retorne uma
lista de pares formados com os elementos em posições correspondentes de `L0` e `L1`. O tipo de
`zip` deve ser `'a list -> 'b list -> ('a * 'b) list`. Exemplos:

```sml
- zip ["a", "b"] [1, 2, 3];
val it = [("a",1),("b",2)] : (string * int) list
- zip [true, false, true] (nil:int list);
val it = [] : (bool * int) list
```

(b) (3 Pontos) Implemente uma função `toIncs`, de tipo `int list -> int list`, que mapeia uma
lista de inteiros `L` para uma lista `B`, de booleanos. O elemento n de `B` é `true` se o
elemento na posição n de `L` for maior que o elemento na posição n − 1, n > 0 de `L`. Você pode
reusar a função `zip`. Se não a tiver feito, você pode assumir sua existência. Você também pode
reusar a função `tl`, vista em sala de aula. Exemplos:

```sml
- toIncs [3, 2, 3, 3, 1, 4];
val it = [false,true,false,false,true] : bool list (* 3 < 2, 2 < 3, 3 < 3, ..., 1 < 4 *)
- toIncs [];
exception match non exhaustive (* nao se preocupe com o erro. *)
- toIncs [1];
val it = [] : bool list
```

(c) (3 Pontos) Escreva uma função `incs`, de tipo `int list -> int`, que retorne quantas vezes o
elemento n de uma lista de inteiros `L` é maior que o elemento n − 1. Você pode assumir a
existência da função `toIncs` da questão anterior, caso não a tenha feito. Exemplo:

```sml
- incs (nil:int list);
exception match non exhaustive (* nao se preocupe com o erro. *)
- incs [1];
val it = 0 : int
- incs [1,2];
val it = 1 : int
- incs [1, 2, 1, 2, 2, 1, 2];
val it = 3 : int
```

**9.2** (prova 26, Q3) O cálculo da mediana é uma maneira de encontrar um valor central em um
conjunto de dados. Existe um algoritmo linear para encontrar a mediana de uma lista de números:
(1) Escolha um elemento *pivot*. (2) Particione a lista em dois subconjuntos: um contendo
elementos menores que o *pivot* e outro contendo elementos maiores. (3) Se o índice do *pivot*
for a mediana, retorne o valor do *pivot*. (4) Caso contrário, recorra no subconjunto apropriado
com base na relação entre o índice da mediana e o índice do *pivot*. Abaixo temos uma
implementação deste algoritmo em Python. Nesta questão, você deve traduzir o algoritmo em Python
para um conjunto de três funções equivalentes (`split`, `select` e `median`) em SML/NJ.

3 Pontos

```python
def split(lst, pivot):
    small = [x for x in lst if x < pivot]
    large = [x for x in lst if x > pivot]
    return small, large
```

3 Pontos

```python
def select(k, lst):
    if len(lst) == 1:
        return lst[0]
    pivot = lst[0]
    small, large = split(lst[1:], pivot)
    s_len = len(small)
    if k == s_len:
        return pivot
    elif k < s_len:
        return select(k, small)
    else:
        return select(k - s_len - 1, large)
```

4 Pontos

```python
def median(lst):
    n = len(lst)
    if n % 2 == 1:
        return select(n // 2, lst)
    else:
        left = select(n // 2 - 1, lst)
        right = select(n // 2, lst)
        return (left + right) / 2

# Example (não precisa traduzir esta parte):
>>> lst = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
>>> median(lst) == 5
True
```

**Cheat Sheet**

| Python | SML/NJ |
|---|---|
| `len(L)` | `length L` |
| `a // b` | `a div b` |
| `a % b` | `a mod b` |

---

## Tópico 10 — Formas de execução: compilação, interpretação, *bytecode* [aparece em 25% das provas (provas 23 e 25)] [Altas chances de cair (revisão)]

**10.1** (provas 23 e 25, Q3 — enunciado idêntico) Existem várias formas de executar um programa:

- Compilá-lo para linguagem de máquina.
- Interpretar sua árvore de sintaxe abstrata.
- Compilar o programa para *bytecodes* e interpretar os *bytecodes*.

Essas formas de execução são determinadas, em última instância, por qual representação do
programa é usada durante a sua execução. A figura abaixo, retirada do livro "*Crafting
Interpreters*", indica essas várias possibilidades de execução. Indique uma linguagem de
programação que é *majoritariamente* executa em algum dos caminhos indicados na figura.

> Figura: a "montanha" do *Crafting Interpreters*: SOURCE CODE → *Scanning* → TOKENS →
> *Parsing* → SYNTAX TREE → *Analysis* → INTERMEDIATE REPRESENTATION(S) → *Code Generation* →
> BYTECODE (VIRTUAL MACHINE) ou MACHINE CODE; há também TREE-WALK INTERP. e *Transpiling*.

(2 Pontos):____________________________ (→ SYNTAX TREE)
(2 Pontos):____________________________ (→ BYTECODE)
(2 Pontos):____________________________ (→ MACHINE CODE)

(2 Pontos) Virtualmente toda linguagem de programação popular que é usada hoje possui o passo
chamado "*parsing*", visto na figura acima. Porque?

(2 Pontos) Algumas linguagens tendem a ser compiladas, enquanto outras tendem a ser
interpretadas. Indique uma razão que faça com que uma linguagem seja normalmente compilada, em
vez de ser interpretada.

---

## Tópico 11 — Cardinalidade de tipos [aparece em 12,5% das provas (prova 26)]

**11.1** (prova 26, Q1) A "cardinalidade" de um tipo é o número de instâncias daquele tipo. Em
cada questão abaixo, informe a cardinalidade do tipo `T`. Você pode usar a cardinalidade dos
tipos constituintes em sua resposta (a cardinalidade do tipo `int`, do tipo `bool`, etc).

(a) (1.25 Pontos) Em SML/NJ: `datatype T = I of int | R of real`
(b) (1.25 Pontos) Em SML/NJ: `type T = int * real`
(c) (1.25 Pontos) Em SML/NJ: `type T = bool list`
(d) (1.25 Pontos) Em SML/NJ: `datatype 'a T = NONE | SOME of 'a`
(e) (1.25 Pontos) Em SML/NJ: `datatype T = Sat | Sun`
(f) (1.25 Pontos) Em C: `typedef struct { int i; char c; } T;`
(g) (1.25 Pontos) Em C: `typedef union { int i; char c; } T;`
(h) (1.25 Pontos) Em C: `enum T { LOW, MEDIUM, HIGH };`

---

## Tópico 12 — Escopo estático × dinâmico e espaços de nomes [aparece em 12,5% das provas (prova 27)] [Altas chances de cair (revisão)]

**12.1** (prova 27, Q1) Esta questão refere-se aos dois programas abaixo:

Bash:

```bash
x=99
foo() {
  echo "x = $x"
}
bar() {
  local x=42
  foo
}
bar
```

SML:

```sml
val x = 99
fun foo() =
  print ("x = " ^ Int.toString x ^ "\n")
fun bar() =
  let val x = 42
  in
    foo()
  end
bar()
```

(a) (2 Pontos) O que será impresso pelo programa escrito em Bash?
(b) (2 Pontos) O que será impresso pelo programa escrito em SML/NJ?
(c) (2 Pontos) Qual linguagem (SML/NJ ou Bash) possui escopo estático?
(d) (2 Pontos) Qual linguagem (SML/NJ ou Bash) possui escopo dinâmico?
(e) (2 Pontos) Qual a diferença entre escopo estático e dinâmico?

**12.2** (prova 27, Q3i–j) (10 Pontos cada item) Para cada item, informe uma linguagem de
programação que possui aquela característica.

(i) Suporte a espaços de nomes instanciáveis (escrever a palavra chave usada para declarar tais
espaços de nomes):
(j) Suporte a espaços de nomes não instanciáveis (escrever a palavra chave usada para declarar
tais espaços de nomes):

---

## Tópico 13 — Paradigmas e modelos computacionais [aparece em 12,5% das provas (prova 22)]

**13.1** (prova 22, Q1) Existem vários *paradigmas de programação*. Diferentes autores inclusive
defendem listas diferentes. Contudo, a maior parte dos teóricos da área de linguagem de
programação entende que existe um paradigma imperativo e um paradigma funcional.

(a) (1 Ponto) Qual o modelo computacional que fundamenta o paradigma imperativo? Um modelo
computacional é uma abstração que determina quais algoritmos podem ser escritos naquele
paradigma, como esses algoritmos poderiam ser escritos e qual a complexidade assintótica desses
algoritmos. A título de exemplo, diferentes modelos computacionais já foram usados para mostrar
que o "*Problema da Parada*" não possui solução computacional.

(b) (1 Ponto) Qual o modelo computacional que fundamenta o paradigma de programação funcional?

(c) (2 Pontos) Por que o paradigma imperativo possui esse nome?

(d) (2 Pontos) Cite uma característica importante do paradigma funcional que o distingue do
paradigma imperativo.

(e) (4 Pontos) O paradigma de programação é uma característica da linguagem de programação ou dos
programas que são escritos naquela linguagem? Defenda seu ponto de vista.

---

## Tópico 14 — Cálculo lambda: booleanos de Church [aparece em 12,5% das provas (prova 29)]

**14.1** (prova 29, Q1a, c, e) A questão abaixo envolve a construção de funções lambda em SML/NJ.
Podemos definir booleanos no cálculo lambda usando a codificação de Church:

```sml
val T = fn x => fn y => x
val F = fn x => fn y => y
```

(a) (2 Pontos) Escreva uma função `print` em SML/NJ, que transforme um booleano de Church em um
booleano de SML/NJ:

```sml
- print T;
val it = true : bool
- print F;
val it = false : bool
```

(c) (2 Pontos) Escreva uma função `AND` que produza a conjunção lógica de booleanos de Church:

```sml
- print (AND T F);
val it = false : bool
- print (AND T T);
val it = true : bool
```

(e) (2 Pontos) Escreva uma função `OR` que produza a disjunção lógica de booleanos de Church:

```sml
- print (OR T F);
val it = true : bool
- print (OR F F);
val it = false : bool
```

*(Os itens b e d desta questão, sobre tipos, estão no Tópico 4.)*
