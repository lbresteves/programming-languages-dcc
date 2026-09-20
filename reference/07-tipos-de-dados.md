# Referência — Tópico 7: Tipos de Dados

## Definição

Tipo = conjunto de valores + intenção (representação + operações).

## Formas de tipo composto

| Forma | Exemplo | Cardinalidade |
|---|---|---|
| Subconjunto | `enum`, "int divisível por 3" | ≤ do tipo base |
| Produto cartesiano | tupla, `struct`, arranjo | `\|T1\| × \|T2\|` |
| União | `union` (C), `datatype` (SML) | `\|T1\| + \|T2\|` |
| Mapa (função) | `real -> int` | — |

## Quatro eixos independentes

| Eixo | Valor A | Valor B |
|---|---|---|
| Quando verifica | **Estático** (compilação) | **Dinâmico** (execução) |
| Segurança | **Forte** (sem comportamento indefinido por tipo) | **Fraco** (permite mau uso) |
| Equivalência | **Nominal** (mesmo nome) | **Estrutural** (mesma forma) |
| Tamanho do primitivo | **Fixo pela linguagem** (Java) | **Definido pela implementação** (C) |

Os quatro eixos são **ortogonais** — combinações comuns: C = estático + fraco + nominal.
SML = estático + forte + estrutural. Python = dinâmico + forte. JS = dinâmico + fraco.

## Tabela por linguagem

| | C | Java | Python | SML | Prolog |
|---|---|---|---|---|---|
| Estático/dinâmico | Estático | Estático | Dinâmico | Estático (inferência) | Sem tipos estáticos |
| Forte/fraco | Fraco | Forte | Forte | Forte | Forte (sem ponteiros) |
| Equivalência | Nominal (`struct`/`union`/`enum`) | Nominal (classe) | — (duck typing) | Estrutural | Estrutural (unificação) |
| Tamanho primitivo | Implementação | Fixo pela linguagem | N/A | Implementação | N/A |

## Como o compilador descobre tipos (estática)

1. Anotação (`int x;`).
2. Convenção de nome (Fortran: `I`-`N` = inteiro).
3. Inferência (ML, Haskell).

## Glossário

- **Comportamento indefinido**: resultado não garantido pela linguagem, depende de
  implementação/memória. C: `a[3]` fora do `int a[3]`, `union` lida pelo campo errado.
- **BCPL**: ancestral de C, sem tipos — todo valor é uma palavra de máquina.
- **Width subtyping**: subtipo tem **mais** estrutura (não menos elementos) — resolve o
  "paradoxo" `int*int*int <: int*int` em OCaml.

## Pegadinhas (decore)

- `int` de 32 bits só é **garantido** em Java, nunca em C.
- Tipo bem-formado ≠ comportamento definido (`a[3]` compila, é UB).
- `struct` idêntica com `typedef` diferente ≠ mesmo tipo em C (nominal).
- Subtipo "tem menos elementos" só vale para tipos-subconjunto — não para width subtyping.
- Cast de referência em Java é checado em **runtime** (`ClassCastException`), mesmo Java
  sendo estática.
- Cardinalidade de produto **multiplica**; de união, **soma**. `sizeof` soma os tamanhos
  dos campos (é o produto de *representação*, não de cardinalidade lógica de operações).

## Trecho de código para decorar (INT_MAX na unha, C)

```c
unsigned int i = ~0U;
i = i >> 1;   // 2147483647
```
