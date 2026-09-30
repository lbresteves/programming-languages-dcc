# Resolução — Lista 5

## Conceitos-base (valem para as questões 3 e 6)

### Cabeça × cauda

```sml
hd : 'a list -> 'a         (* cabeça: um ELEMENTO *)
tl : 'a list -> 'a list    (* cauda: SEMPRE uma lista *)
```

- **`tl` anda pela lista, `hd` pega o elemento.** Nenhuma quantidade de `tl` produz um
  elemento; se o resultado tem que ser elemento, a última operação é `hd`.
- A cabeça só é lista se os elementos forem listas: `hd [[1,2],[3]] = [1,2] : int list`.
  Isso vem do dado, não do `hd`.

### `[ ]`, `( )` e `::` em padrões

| Sintaxe | O que é | Casa com |
|---|---|---|
| `[p1, ..., pn]` | lista de padrões | lista de **exatamente n** elementos |
| `p1 :: p2` | cons de padrões | lista **não vazia**; `p1` = cabeça (elemento), `p2` = cauda (lista) |
| `( p )` | agrupamento | o mesmo que `p` |

- **Colchetes não agrupam.** `[p]` é uma lista de **um** elemento. Se `p` for padrão de
  lista, o argumento vira lista de listas.
- **`::` associa à direita.** `a :: b :: c :: t` = `a :: (b :: (c :: t))`, então `t` está na
  posição de cauda e é `'a list`. Para `t` ser elemento: `a :: b :: c :: t :: _`.

| Padrão | Aceita | Rejeita (`Match`) | Tipo de `t` |
|---|---|---|---|
| `[a, b, c, t]` | `[1,2,3,4]` | `[1,2,3]`, `[1,2,3,4,5]` | `'a` |
| `a :: b :: c :: t` | `[1,2,3]` (`t = []`), `[1,2,3,4,5]` (`t = [4,5]`) | `[1,2]` | `'a list` |
| `a :: b :: c :: t :: _` | `[1,2,3,4]`, `[1,2,3,4,5]` | `[1,2,3]` | `'a` |

### Tipo do parâmetro vem do uso, não do nome

O SML não sabe que `s` "é string". Leia de dentro para fora o que cada função **exige**
do argumento:

```sml
fun h s = explode (hd s);
```

1. `hd s` exige `s : 'a list`.
2. `explode (hd s)` exige `hd s : string`, logo `'a = string`.
3. Resultado: `h : string list -> char list`.

E `list` sozinho **não é tipo**: sempre `char list`, `int list`, `'a list`...

---

## Questão 1 — `cube : int -> int`

```sml
fun cube x = x * x * x;
```

**Raciocínio:** `*` é sobrecarregado (serve para `int` e `real`). Sem nenhuma outra
pista de tipo, o SML escolhe o padrão `int`, então sai `int -> int` sem anotação.

## Questão 2 — `cuber : real -> real`

```sml
fun cuber (x : real) = x * x * x;
```

**Raciocínio:** mesma função, mas o padrão do `*` é `int`, então sem anotação daria
`int -> int`. Basta anotar o tipo em **um** lugar (o parâmetro) e a inferência propaga
o resto. SML não converte `int` ↔ `real` automaticamente (ao contrário de C/Java).

---

## Questão 3 — `fourth : 'a list -> 'a`

```sml
fun fourth (_ :: _ :: _ :: t :: _) = t;
```

**Raciocínio:** parênteses só agrupam; o padrão casa com qualquer lista de 4+ elementos,
e `t` está em posição de elemento (tem `:: _` depois), então `t : 'a`. Gera
`Warning: match nonexhaustive`, permitido pelo enunciado.

As tentativas abaixo mostram por que colchetes e a posição de `t` mudam o tipo:

Tentativas e por que cada uma tem o tipo que tem:

```sml
- fun fourth [_ :: _ :: _ :: t :: _] = t;
val fourth = fn : 'a list list -> 'a
```

`[ ]` de fora = lista de **um** elemento; esse elemento casa com `_ :: _ :: _ :: t :: _`,
então é uma lista (4+ elementos). Argumento vira lista de listas; `t` é o 4º elemento da
lista interna. `fourth [[1,2,3,4,5]] = 4`.

```sml
- fun fourth [_ :: _ :: _ :: t] = t;
val fourth = fn : 'a list list -> 'a list
```

Mesma lista de um elemento, mas `t` está em posição de cauda: é o resto depois dos três
primeiros. `fourth [[1,2,3,4,5]] = [4,5]`.

```sml
- fun fourth [_, _, _, t] = t;
val fourth = fn : 'a list -> 'a
```

Tipo certo, mas a lista de padrões só casa com listas de **exatamente** 4 elementos:
`fourth [1,2,3,4,5]` levanta `Match`.

**Exercícios pendentes (sem rodar):** tipo de `fun f [x :: _] = x` e de `fun g [x, _] = x`.

---

## Questão 4 — `min3 : int * int * int -> int`

```sml
fun min3 (a, b, c) =
  if a <= b andalso a <= c then a
  else if b <= c then b
  else c;
```

**Raciocínio:** o parâmetro é **uma** tupla, desmontada por casamento de padrões
`(a, b, c)`. O `<=` com `int` fixa o tipo. `<=` (e não `<`) evita pensar em empates;
com `<` também funciona, mas é preciso conferir os casos de igualdade. Em SML o "e" lógico
é `andalso` (não `and`, que é outra coisa, e não `&&`).

## Questão 5 — `red3 : 'a * 'b * 'c -> 'a * 'c`

```sml
fun red3 (a, _, c) = (a, c);
```

**Raciocínio:** padrão de tupla com `_` no campo descartado. Como nenhuma operação é
aplicada aos campos, nada restringe os tipos, e a inferência dá o tipo mais geral
(polimórfico) com três variáveis distintas `'a`, `'b`, `'c`.

---

## Questão 6 — `thirds : string -> char`

```sml
fun thirds s = hd (tl (tl (explode s)));
```

Alternativa com casamento de padrões:

```sml
fun thirds s =
  let
    val (_ :: _ :: c :: _) = explode s
  in
    c
  end;
```

**Raciocínio:** `string` não é lista, então primeiro `explode` para `char list`
(`firstChar s = hd (explode s)` é o modelo da aula 5). Os dois `tl` descartam os dois
primeiros caracteres (resultado ainda é lista); o `hd` final extrai o elemento. No
padrão, o padrão fica no `val` (o parâmetro é string, não dá para casar `::` nele) e `c`
precisa estar em posição de elemento (`c :: _`), não de cauda.

Rastreio com `"hello"`:

| Expressão | Valor | Tipo |
|---|---|---|
| `explode s` | `[#"h",#"e",#"l",#"l",#"o"]` | `char list` |
| `tl (tl (explode s))` | `[#"l",#"l",#"o"]` | `char list` |
| `hd (tl (tl (explode s)))` | `#"l"` | `char` |

**⚠️ REVISAR.** Primeira tentativa foi `tl (tl (explode s))`, de tipo `string -> char list`:
faltou o `hd`. Mesmo furo da questão 3 (confundir elemento com cauda).

### Variação (a) — dar o tipo

| Função | Minha resposta | Correto |
|---|---|---|
| `fun f s = tl (explode s);` | `string -> char list` ✅ | `string -> char list` |
| `fun g s = hd (explode s);` | `string -> char` ✅ | `string -> char` |
| `fun h s = explode (hd s);` | `string -> list` ❌ | `string list -> char list` |

Erro em `h`: assumi `s : string` pelo nome, mas `hd s` exige que `s` seja lista, e
`explode` exige que `hd s` seja string → `s : string list`. Além disso, `list` sozinho
não é um tipo.

### Variação (b) — `drop3 : string -> string`

Minha versão (lógica certa, **faltou um `)`**: abrem 4, fechavam 3):

```sml
fun drop3 s = implode (tl (tl (tl (explode s)));
```

Correta:

```sml
fun drop3 s = implode (tl (tl (tl (explode s))));
```

`drop3 "hello" = "lo"`. `implode` é o inverso de `explode`.

**Exercício pendente (sem rodar):** tipo de `fun p x = hd (hd x);` e de
`fun q x = implode (tl x);`.

---

## Questão 7 — `cycle1 : 'a list -> 'a list`

```sml
fun cycle1 (h :: t) = t @ [h];
```

**Raciocínio:** casa a lista com `h :: t` (parênteses, não colchetes) e concatena a cauda
com a cabeça no fim. Como `@` exige lista dos dois lados, a cabeça `h` (elemento) vira
`[h]`. `cycle1 [1,2,3,4]`: `h = 1`, `t = [2,3,4]`, `[2,3,4] @ [1] = [2,3,4,1]`.

| Operador | Esquerda | Direita | Exemplo |
|---|---|---|---|
| `::` | elemento | lista | `1 :: [2,3] = [1,2,3]` |
| `@` | lista | lista | `[1] @ [2,3] = [1,2,3]` |

`::` só põe elemento **na frente**; para pôr no **fim**, `@` com o elemento embrulhado.

**⚠️ REVISAR.** Primeira tentativa: `fun cycle1 [h::t] = t @ h`. Dois erros:
1. `[h::t]` — colchetes não agrupam; seria lista de **um** elemento que é lista (mesmo
   erro da q3).
2. `t @ h` — `h : 'a` à direita do `@` exige `'a = 'a list` → erro de circularidade
   (*circularity*).

**Variação pendente:** `swapEnds : 'a list -> 'a list`, move o último para o início
(`swapEnds [1,2,3,4] = [4,1,2,3]`). Dica: `rev`.
