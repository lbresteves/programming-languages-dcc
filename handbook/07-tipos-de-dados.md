# Tópico 7 — Tipos de Dados

## Introdução

Até aqui (sintaxe, parsing, casamento de padrões) a disciplina tratou de *como o texto de
um programa vira estrutura*. Tipos de dados são a primeira barreira que olha para o
*significado*: existem programas sintaticamente perfeitos que não fazem sentido nenhum —
somar um inteiro com uma função, por exemplo. A verificação de tipos é a fase que corta
esses programas, e ela é o pré-requisito direto para entender **Polimorfismo** (tópico 8):
antes de perguntar "essa função aceita mais de um tipo?" é preciso primeiro saber
responder "o que é um tipo, e quando dois tipos são o mesmo tipo?".

Esse tópico é também o mais citado em prova de forma indireta: qualquer questão de
rastreio de execução em C que "dá numero estranho" está testando tipos de dados, mesmo
sem perguntar isso diretamente.

## Conceitos essenciais

### O que é um tipo

Um **tipo é um conjunto de valores**, mais uma **intenção**: uma representação de baixo
nível e uma coleção de operações válidas sobre esses valores. `int` em C não é só "os
números entre -2³¹ e 2³¹-1" — é isso mais "32 bits em complemento de dois" mais "`+`,
`-`, `*` funcionam, `strlen` não".

Os usos de um tipo: **documentação** (o tipo diz ao leitor o que uma variável pode
guardar), **segurança** (impede operações sem sentido), **eficiência** (o compilador
escolhe a representação e as instruções certas) e **correção** (evita comportamento
indefinido).

### Primitivos versus compostos

- **Primitivos**: conjuntos indivisíveis. Algumas linguagens definem os primitivos
  **exatamente** (Java: `int` é sempre 32 bits, em qualquer JVM); outras deixam a cargo do
  compilador (C: `int` "geralmente" tem 32 bits, mas a linguagem não garante).
- **Compostos** (*constructed*): conjuntos construídos a partir de outros. Existem
  exatamente quatro formas:
  1. **Subconjunto** — enumerações, ou tipos "refinados" (ex.: "inteiros divisíveis por
     3").
  2. **Produto cartesiano** — tuplas, `struct`, vetores/arranjos/listas (um arranjo é um
     produto de coisas **iguais**; uma tupla, de coisas possivelmente **diferentes**).
  3. **União** — o mesmo espaço de memória guarda valores de tipos diferentes,
     em momentos diferentes.
  4. **Mapas** — tipos de função, ex. `real -> int`.

<Callout title="Cardinalidade" type="idea">
  A cardinalidade de um tipo composto segue a operação que o constrói:
  - Produto: `|T1 * T2| = |T1| × |T2|` (multiplica).
  - União: `|T1 ∪ T2| = |T1| + |T2|` (soma).

  Em C, `struct { double rp; double ip; }` tem cardinalidade `|double| × |double| ≈ 2⁶⁴ ×
  2⁶⁴ = 2¹²⁸`, e ocupa `sizeof(double) × 2 = 16` bytes — o tamanho em memória soma, a
  cardinalidade multiplica.
</Callout>

### Estático versus dinâmico

Uma linguagem é **estaticamente tipada** quando o tipo de cada expressão é resolvido em
**tempo de compilação**; **dinamicamente tipada**, quando é resolvido em **tempo de
execução**. Um jeito de enxergar isso: quanto mais `if-then-else` **invisível** o
compilador/*runtime* precisa inserir para descobrir um tipo na hora, mais dinâmica é a
linguagem.

Como o compilador descobre tipos numa linguagem estática — três estratégias:
1. **Anotação** explícita (`int x;` em C/Java).
2. **Convenção de nome** (Fortran antigo: variável começando com `I`-`N` é inteira por
   default).
3. **Inferência de tipos** (ML, Haskell, Scala, C# 3.0+): o compilador deduz o tipo sem
   anotação.

Isso não é preto no branco: linguagens estáticas fazem checagens **dinâmicas** também
(ver Pegadinhas), e linguagens dinâmicas usam um pouco de inferência internamente.

### Forte versus fraco

- **Fortemente tipada**: garante que um valor **sempre** será usado de acordo com o tipo
  declarado. Não tem programas com **comportamento indefinido** por causa de tipo.
- **Fracamente tipada**: permite usar um valor como se tivesse um tipo diferente do
  declarado — e isso é exatamente a porta de entrada para comportamento indefinido.

Repare que "forte/fraco" é **ortogonal** a "estático/dinâmico": SML é estática e forte; C é
estática e fraca; Python é dinâmica e forte; JavaScript é dinâmica e mais fraca ainda
(coerções agressivas em `==`).

### Equivalência de tipos: nominal versus estrutural

Quando dois tipos, declarados separadamente, são "o mesmo tipo"?

- **Equivalência nominal**: dois tipos são iguais se, e somente se, têm o **mesmo nome**
  (a mesma declaração). C, Java e C++ seguem essa regra para `struct`/`class`.
- **Equivalência estrutural**: dois tipos são iguais se têm a **mesma estrutura**,
  independente do nome. SML segue essa regra.

```c
// C — equivalência nominal: T0 e T1 têm campos idênticos, mas são tipos DIFERENTES
typedef struct { int a; float b; } T0;
typedef struct { int a; float b; } T1;
void foo(T1 s) { printf("%d, %f\n", s.a, s.b); }
int main() {
  T0 x;
  T1 y;
  foo(y);   // ok
  foo(x);   // ERRO de compilação — T0 não é T1, mesmo com a mesma estrutura
}
```

```sml
(* SML — equivalência estrutural: T0 e T1 são intercambiáveis, mesmo com nomes diferentes *)
- type T0 = int * real;
type T0 = int * real
- type T1 = int * real;
type T1 = int * real
- fun foo (s:T1) = #1 s;
val foo = fn : T1 -> int
- val x:T0 = (1, 3.14);
val x = (1,3.14) : T0
- foo x;
val it = 1 : int   (* funciona: T0 e T1 têm a mesma estrutura *)
```

- Um sistema **nominal** é melhor para **documentar**: o nome do tipo carrega intenção
  (`Metros` e `Segundos` não se confundem, mesmo que os dois sejam `float` por dentro).
- Um sistema **estrutural** é mais vantajoso para **reutilizar**: qualquer função que
  espera "um par de `int`" aceita qualquer tipo com essa estrutura, sem precisar declarar
  relação de parentesco entre os tipos.

## Comparação entre linguagens

### Tipos primitivos

| | C | Java | Python | SML | Prolog |
|---|---|---|---|---|---|
| Primitivos | `char`, `short`, `int`, `long` (+ `unsigned`), `float`, `double` | `boolean`, `byte`(8b), `char`(16b Unicode), `short`(16b), `int`(32b), `long`(64b), `float`(32b), `double`(64b) | `int` (precisão arbitrária), `float` (double-precisão), `bool`, `str`, `NoneType` | `int`, `real`, `bool`, `char`, `string` | não há primitivos "de linguagem": só **termos** (átomos, números, variáveis, termos compostos) |
| Tamanho fixado pela linguagem? | **Não** — depende do compilador/plataforma | **Sim** — exatamente esses bits em qualquer JVM | N/A (objetos no heap) | Sim, mas implementação-dependente para `int` (`Int.maxInt`) | N/A |

### Estático × dinâmico × verificação de tipo

| | C | Java | Python | SML | Prolog |
|---|---|---|---|---|---|
| Quando resolve tipo | Compilação | Compilação (+ checagens pontuais em runtime) | Execução | Compilação (por inferência) | **Nunca**, no sentido clássico — um termo carrega sua "forma" (átomo, número, composto) e isso só é testado em runtime, via predicados como `integer/1`, `atom/1` |
| Como descobre o tipo | Anotação | Anotação | — (dinâmico) | **Inferência** | — (não tipado) |

### Forte × fraco

| | C | Java | Python | SML | Prolog |
|---|---|---|---|---|---|
| Forte ou fraco | **Fraco** — `union`, casts de ponteiro, aritmética de ponteiro fora do limite | **Forte** — casts entre referências são checados em runtime (`ClassCastException`) | **Forte** — operação com tipo errado lança `TypeError`, nunca reinterpreta bits | **Forte** — não existe operação de "reinterpretar bits" na linguagem base | **Forte**, no sentido de que um termo nunca é mal-interpretado como outro tipo de termo por acidente de memória (não há ponteiros nem *casts*) |

### Equivalência de tipos

| | C | Java | Python | SML | Prolog |
|---|---|---|---|---|---|
| Nominal ou estrutural | **Nominal** para `struct`/`union`/`enum` (por *tag*); estrutural "de fato" para tipos primitivos e ponteiros | **Nominal** (por classe — duas classes com os mesmos campos são tipos diferentes, a menos que uma **herde** da outra) | Não há verificação estática — na prática, **estrutural em runtime** ("*duck typing*": se responde aos métodos certos, serve) | **Estrutural** | **Estrutural** — a unificação de termos *é*, literalmente, um teste de igualdade estrutural |

<Callout title="Cai na prova: o paradoxo do OCaml" type="warn">
  Em sistemas **estruturais** com subtipagem por largura (*width subtyping* — comum em
  OCaml para *records* e tuplas), `int * int * int` é **subtipo** de `int * int`. Isso
  parece quebrar a regra "subtipo tem **menos** elementos" ensinada em Polimorfismo — mas
  não quebra: aquela regra vale para tipos-**subconjunto** (ex.: "divisível por 3" ⊂
  "inteiro"). Subtipagem estrutural é definida por **substituibilidade de operações**, não
  por cardinalidade: em toda posição onde se espera "algo com pelo menos 2 componentes"
  (`#1`, `#2`), uma tripla serve — ela tem *mais* estrutura, não menos, mas ainda assim é
  o subtipo, porque cumpre (e excede) o contrato do supertipo. A generalização correta do
  princípio de Liskov não é "conjunto menor", é "aceito em todo lugar onde o supertipo é
  aceito" — a intuição de conjunto menor é só um caso particular (o de tipos-subconjunto).
</Callout>

## Conceitos complementares

### Comportamento indefinido × bem definido

- **Indefinido** (C, C++, Pascal): o resultado depende de detalhes de implementação —
  memória alocada, compilador, otimizações. O caso mais comum em C é escrever fora dos
  limites de um arranjo.
- **Bem definido** (Java, JavaScript, Python): todo valor carrega um rótulo com seu tipo
  em runtime; operações inválidas lançam exceção em vez de ler memória lixo.

Um programa pode passar pela verificação de tipos e **ainda assim** ter comportamento
indefinido (ex.: acessar `a[3]` de um `int a[3]` em C — os índices são válidos
sintaticamente, o *type checker* não pega isso).

### Sem tipos: BCPL

BCPL, ancestral da família de chaves `{ }` (incluindo C), **não tinha tipos**: todo valor
era uma palavra de máquina, e não havia sequer suporte nativo a ponto flutuante. Serve como
contraponto para "para que servem tipos, afinal?".

### `if-then-else` invisível, e verificação dinâmica dentro do estático

Mesmo em Java (estática), um *cast* de referência é checado em **tempo de execução**:

```java
class Pencil { public int p; }
public class Battleship {
  public int p;
  public static void main(String[] args) {
    Object p = new Pencil();
    Battleship b = (Battleship) p; // ClassCastException aqui, em RUNTIME
  }
}
```

O compilador aceita o *cast* (sintaticamente é um `Object` virando `Battleship`, ambos
subtipos de `Object`); só a JVM, ao executar, descobre que o objeto real é um `Pencil` e
lança a exceção. Isso é uma checagem dinâmica **dentro** de uma linguagem estaticamente
tipada.

### `while` e a distinção int/bool

```c
// C: qualquer int != 0 é "verdadeiro" num teste
int fact(int n) {
  int f = n;
  while (--n)   // decrementa e testa o int resultante como condição
    f *= n;
  return f;
}
```

Em Java isso **não compila**: `while` exige uma expressão `boolean`, e Java não converte
`int` para `boolean` implicitamente. É um exemplo direto de "Java distingue inteiros de
booleanos" onde C não distingue.

### Descobrir o maior inteiro

```c
#include <limits.h>
printf("%d\n", INT_MAX);
```

```c
unsigned int i = ~0U;   // todos os bits em 1
i = i >> 1;              // 2147483647 — descobre o máximo "na mão"
```

```sml
- Int.maxInt;
val it = SOME 1073741823 : int option

(* versão "artesanal": dobra o incremento até estourar, depois refina *)
fun maxInt current inc = maxInt (current + inc) (inc * 2)
    handle Overflow => if inc = 1 then current else maxInt current 1
```

A versão SML usa `handle Overflow` para "sentir" o limite em vez de uma constante — cresce
exponencialmente (`inc` dobra a cada chamada) até estourar, e então recomeça com
incremento `1` a partir do último valor seguro, repetindo o processo em uma escala menor.

## Trade-offs e decisões de projeto

| Decisão | Ganha | Perde |
|---|---|---|
| Estática | Erros cedo (compilação), eficiência, suporte de ferramentas (autocomplete), tipo como documentação | Flexibilidade — mais difícil escrever código genérico |
| Dinâmica | Reúso — a mesma função aceita qualquer tipo compatível | Erros só aparecem em execução; mais lento (checagem de tipo embutida em cada operação) |
| Nominal | Documentação — o nome comunica intenção | Reúso — dois tipos "iguais por fora" continuam incompatíveis |
| Estrutural | Reúso — qualquer coisa com a forma certa serve | Documentação — perde a distinção semântica entre tipos com a mesma forma (ex.: `Metros` vs. `Segundos`, ambos `real`) |
| Tamanho de primitivo fixo pela linguagem (Java) | Portabilidade — o mesmo programa se comporta igual em qualquer JVM | Pode desperdiçar espaço/desempenho numa arquitetura onde o tipo nativo é menor/maior |
| Tamanho de primitivo definido pela implementação (C) | Aproveita o hardware nativo, mais rápido/compacto | Programa muda de comportamento entre plataformas/compiladores |

## Prós e contras

**Fortemente tipada.** Prós: elimina uma classe inteira de bugs (comportamento
indefinido por tipo); facilita depuração (erro aparece perto da causa). Contras: exige
mais cerimônia (declarar tipos, ou pelo menos estrutura consistente); dificulta alguns
truques de baixo nível (reinterpretar bits para otimizar).

**Fracamente tipada.** Prós: dá acesso direto à representação em memória — útil para
código de sistema, serialização, parsers binários. Contras: qualquer engano vira
comportamento indefinido, não um erro claro; o comportamento pode variar por
compilador/plataforma (ver Pegadinhas).

## Diagramas

```
Fase do compilador:     Léxica  >>  Sintática  >>  Tipos  >>  Execução
Nível de Chomsky:         T3          T2           T1         T0
Custo:                   O(n)        O(n³)          —          —
```

```
        Tipo (conjunto de valores + intenção)
        /                              \
  Primitivo                        Composto (constructed)
  (indivisível)                    /      |       |       \
                             Subconjunto Produto União    Mapa
                             (enum)     (tupla/  (memória (função)
                                        struct)   sobreposta)
```

## Pegadinhas

- **"`int` sempre tem 32 bits"** — falso em geral. Só é garantido em Java. Em C, depende
  do compilador; não existe `int` "oficial" de 32 bits na linguagem.
- **Tipo bem-formado ≠ comportamento definido.** `a[3]` num `int a[3]` passa pela
  verificação de tipos (índice inteiro, tudo certo sintaticamente) e ainda assim é
  comportamento indefinido.
- **Struct != struct, mesmo idênticas (C).** Duas `struct` com os mesmos campos, mas
  `typedef`s diferentes, **não** são o mesmo tipo em C — equivalência nominal por *tag*,
  não estrutural.
- **Subtipo nem sempre é "menos elementos".** Vale para tipos-subconjunto (Polimorfismo,
  tópico 8), mas não para subtipagem estrutural por largura (ver o paradoxo do OCaml
  acima) — lá, "mais estrutura" é que garante o subtipo.
- **"Compilação" e "definição da linguagem" não são a mesma fase.** O tamanho de `int` em
  C não é decidido na compilação de *um programa específico* — é decidido pela
  *implementação* (o compilador/plataforma), antes de qualquer programa existir. Não
  confundir com *compile time* (que depende do programa que você escreveu).
- **`union` bem tipada não existe.** Escrever num campo e ler por outro é sempre
  comportamento indefinido em C, mesmo que "pareça funcionar" — nenhuma gramática livre de
  contexto detecta isso, e nem toda checagem em tempo de execução detectaria sem uma tag
  extra guardando qual campo foi escrito por último.

## Questões no estilo do professor

1. Dê um exemplo de tipagem fraca em C que **não** envolva `union`.
2. Compare verificação de tipos dinâmica e estática: em que momento cada uma pega o
   erro, e o que isso custa/economiza?
3. Compare equivalência estrutural e nominal com um exemplo concreto de cada, em duas
   linguagens diferentes.
4. Em equivalência estrutural (ex.: OCaml), `int * int * int` é subtipo de `int * int` —
   explique esse paradoxo à luz do princípio de substituição de Liskov.
5. É verdade que toda linguagem fortemente tipada elimina comportamento indefinido em
   **todos** os casos? Justifique com um contraexemplo, se houver.
6. Dado `struct { int a; double b; }`, calcule a cardinalidade do tipo e o `sizeof`
   esperado. Explique por que essas duas contas usam operações diferentes (produto vs.
   soma de tamanhos).
7. Um compilador de C compila `int a[3]; printf("%d", a[3]);` sem erro. Isso quer dizer
   que o compilador "não sabe" fazer verificação de tipos? Explique a diferença entre o
   que a verificação de tipos garante e o que ela não garante.

## Checklist de autoavaliação

- [ ] Eu sei explicar "tipo = conjunto + intenção" sem consultar nada, com um exemplo.
- [ ] Eu sei listar as quatro formas de tipo composto e dar um exemplo de cada, em pelo
      menos duas linguagens.
- [ ] Eu sei dizer, para C, Java, Python, SML e Prolog, se são estática ou
      dinamicamente tipadas, e fortemente ou fracamente tipadas — de cabeça, sem tabela.
- [ ] Eu sei explicar por que `int * int * int` é subtipo de `int * int` em OCaml sem
      recorrer a "subtipo tem menos elementos".
- [ ] Eu sei dar um exemplo de comportamento indefinido em C que passa pela verificação
      de tipos.
- [ ] Eu sei explicar por que Java, sendo estaticamente tipada, ainda faz uma checagem em
      tempo de execução num *cast*.
