# Resolução — Lista 4

## Questão 2 — Tempos de ligação em Java

| Item | Construto | Tempo de ligação |
|---|---|---|
| a | localização de variável local | run time |
| b | localização de campo não estático | run time |
| c | significado de `while` | language definition time |
| d | tamanho em bits do `int` | language definition time |
| e | bytecodes de uma classe | compile time |
| f | definição de `m` chamado em `a.m()` | run time (despacho dinâmico) |
| g | tipo de variável local | compile time |
| h | valores atribuídos a uma variável | run time |
| i | tamanho de uma referência | language implementation time |

**Raciocínio:** endereço e valor de qualquer coisa em memória só existem quando o
programa de fato roda → run time (a, b, h). Despacho de método em Java é dinâmico
(polimorfismo), então a definição usada só se sabe em runtime, mesmo `a.m()`
parecendo uma chamada "fixa" → run time (f). O tipo declarado de uma variável e o
bytecode gerado dependem do programa específico escrito, decididos pelo `javac` →
compile time (e, g). Regras da própria linguagem — sintaxe, semântica de palavras-chave,
tamanho de tipos primitivos — estão fixadas na especificação Java, antes de qualquer
compilador existir → language definition time (c, d). O tamanho de uma referência é a
exceção: a especificação Java deliberadamente não define isso, deixando a cargo de
cada JVM → language implementation time (i).

**⚠️ REVISAR ANTES DA PROVA.** Errei 6 de 9 itens na primeira tentativa — confundi a
sequência clássica (creating/compiling/assembling/linking/loading/running) com os
tempos de ligação, e troquei compile time ↔ run time ↔ language definition time em
vários pares. Detalhe completo em
[`learning-records/0001-tempos-de-ligacao.md`](../../learning-records/0001-tempos-de-ligacao.md).
Lá tem um teste em cascata pra reaplicar e uma variação de 5 itens (C + Java) ainda
pendente de eu resolver sozinha.

---

*Demais questões da lista (1, 3, 4, 5) ainda não resolvidas.*
