# Elemento × cauda em listas SML (hd/tl, `::`, `[ ]`)

- **Tópico:** SML — casamento de padrões e listas (aula 6)
- **Status:** frágil
- **Última verificação:** 2026-09-29

## Evidência

Lista 5, q3 (`fourth`): tentou `[_ :: _ :: _ :: t :: _]` e `[_ :: _ :: _ :: t]`, obtendo
`'a list list -> ...`. Não entendia por que o tipo virava lista de listas nem por que
`t` virava `'a list` no segundo caso. Perguntou se "todo hd é uma lista".

Lista 5, q6 (`thirds`): escreveu `tl (tl (explode s))` — tipo `string -> char list`.
Não soube corrigir sozinha; precisou da resolução.

## O furo

1. **`tl` sempre devolve lista; `hd` devolve elemento.** Não percebe que para obter um
   elemento a última operação tem que ser `hd`.
2. **Em `x :: y`, `y` é sempre cauda (lista).** O último nome de uma cadeia de `::` sem
   `:: _` no fim é lista.
3. **`[ ]` não agrupa.** `[p]` é lista de um elemento; usar colchetes no lugar de
   parênteses acrescenta um nível de `list` ao tipo.

## Como fechar

- Dar o tipo de expressões com `hd`/`tl`/`explode` de cabeça (variação proposta na q6).
- Escrever `fourth : 'a list -> 'a` com `::` e parênteses (pendente da q3).
- Dar o tipo de `fun f [x :: _] = x` e `fun g [x, _] = x` sem rodar (pendente).
- Explicação e tabelas em `docs/content/docs/aula-06.mdx`, seção "Listas e cons".

## Histórico

- **2026-09-29 (variação da q6):** acertou `tl (explode s) : string -> char list` e
  `hd (explode s) : string -> char` → distinção hd/tl aplicada corretamente. Errou
  `explode (hd s)`: respondeu `string -> list`. Dois furos novos:
  - escreveu `list` sem argumento (não é tipo; precisa ser `char list`, `'a list`...);
  - assumiu o tipo do parâmetro pelo nome `s`, em vez de inferir pelo uso (`hd s` exige
    lista → `s : string list`).
  `drop3` com lógica certa, mas faltou um `)` — sintaxe de parênteses aninhados.
  Status continua **frágil**: hd/tl ok, inferência de tipo do parâmetro não.
- **2026-09-29 (lista 5, q7 `cycle1`):** escreveu `fun cycle1 [h::t] = t @ h`. Reincidiu
  nos dois furos: `[ ]` no lugar de `( )` (mesmo erro da q3, já explicado) e `h` usado
  como lista à direita do `@` (erro de circularidade `'a = 'a list`). Não diferencia `::`
  (elemento :: lista) de `@` (lista @ lista). Terceira questão seguida com o mesmo
  furo → **frágil, não consolidando**. Prioridade de revisão antes da prova.
- **2026-09-29 (exercício de tipos a/b/c/d):** acertou `(x :: y)` → `'a list -> 'a list`.
  Reconheceu lista de listas em `[x :: y]`, mas escreveu `'a list 'a list` de novo
  (2ª vez; notação de tipo, não conceito). Errou `[x, y] = y` → respondeu `int`
  (certo: `'a`) e `(x, y) = y` → respondeu `tuple -> int` (certo: `'a * 'b -> 'b`).
  Furos novos: (1) atribui `int` a valores sem restrição — não aplica "sem operação,
  tipo fica polimórfico"; (2) não sabe escrever tipo de tupla com `*` (`tuple` não é tipo).
  Distinção `( )` agrupar × `(a, b)` tupla × `[ ]` lista: **demonstrada**.
- **2026-09-30 (midterm28, q2):** tipo de `max` respondido `'a list -> 'a` — notação
  certa (progresso), mas ignorou que `>` sobrecarregado força `int` (certo:
  `int list -> int`). Oscila: ontem pôs `int` sem operação, hoje `'a` com operação.
  2(b): "ordenada" sem dizer crescente. 2(c): pôs o `let` na cláusula `[e]` (h, t não
  ligados) e apagou o caso base — **pendente**.
