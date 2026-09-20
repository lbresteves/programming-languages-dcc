# Respostas — Tópico 7: Tipos de Dados

> Não abrir antes de tentar. Ver `handbook/07-tipos-de-dados.md` para as perguntas.

## 1. Tipagem fraca em C sem `union`

Reinterpretar um `struct` via *cast* de ponteiro (ex.: `(struct DateType*)p` onde `p`
aponta para um `ThreeDPoint`), ou acessar um arranjo fora do limite (`a[3]` de `int
a[3]`). Em ambos os casos, C deixa o programador usar um valor como se tivesse um tipo/
tamanho diferente do declarado, sem checagem.

## 2. Dinâmica × estática

Estática pega o erro **antes de rodar**, na compilação — mais rápido em execução (sem
checagem embutida) e o erro aparece de graça, sem precisar do caminho de execução que o
expõe. Dinâmica só pega o erro **quando aquele trecho específico roda** — cada operação
carrega uma checagem de tipo em runtime (custo de desempenho), mas permite escrever
código genérico sem anotações.

## 3. Estrutural × nominal, com exemplo

Nominal (Java): `class A { int x; }` e `class B { int x; }` são tipos diferentes, mesmo
com campos idênticos — não dá para atribuir um `A` a uma variável `B`.
Estrutural (SML): `type T0 = int * real; type T1 = int * real;` são o **mesmo tipo** por
baixo — um valor anotado como `T0` pode ser usado onde se espera `T1`.

## 4. O paradoxo do OCaml

A regra "subtipo tem menos elementos" é sobre tipos-**subconjunto** (refinamento: X ⊂ Z
porque todo X também é Z, com uma restrição a mais). Subtipagem estrutural por largura
segue outra regra: um tipo é subtipo de outro se **cumpre todas as operações** exigidas
pelo supertipo — e uma tripla cumpre tudo que um par cumpre (`#1`, `#2`), e mais (`#3`).
Não há contradição: as duas usam a mesma ideia-mãe (substituição de Liskov — "posso usar
Y em todo lugar que espera X?"), mas a "regra de bolso" de contar elementos só é válida
no caso de subconjunto; no caso estrutural, o critério é a compatibilidade da interface,
e mais estrutura só pode ajudar a cumprir esse contrato, nunca atrapalhar.

## 5. Fortemente tipada sempre elimina UB?

Não necessariamente **todo** comportamento indefinido — só o que vem de **mau uso de
tipo**. Uma linguagem fortemente tipada ainda pode ter UB de outras naturezas (ex.: uma
race condition em código concorrente, ou dividir por zero dependendo da linguagem). O que
"fortemente tipada" garante é que um valor nunca será *reinterpretado* como se tivesse
outro tipo.

## 6. Cardinalidade × `sizeof`

`struct { int a; double b; }`: cardinalidade `|int| × |double| ≈ 2³² × 2⁶⁴ = 2⁹⁶`.
`sizeof` esperado: `sizeof(int) + sizeof(double)` (+ possível *padding* de alinhamento) =
tipicamente `4 + 8 = 12`, arredondado para `16` por alinhamento de 8 bytes na maioria dos
compiladores de 64 bits. Cardinalidade multiplica porque cada combinação de valores dos
dois campos é um valor distinto do tipo composto; `sizeof` soma porque os campos ficam
lado a lado na memória, cada um com seu próprio espaço.

## 7. `a[3]` compila — a verificação de tipos falhou?

Não. A verificação de tipos garante que os **tipos** dos operandos fazem sentido
(`a[3]` é `int` indexado por `int`, resultando em `int` — sintaticamente e
semanticamente "bem tipado"). Ela **não** garante que o **valor** do índice está dentro
dos limites válidos do arranjo — isso é uma propriedade sobre valores em tempo de
execução, não sobre tipos, e detectar isso exigiria análise além do que uma gramática
livre de contexto (ou mesmo a verificação de tipos, que é T1/sensível ao contexto) resolve
sem rodar o programa.
