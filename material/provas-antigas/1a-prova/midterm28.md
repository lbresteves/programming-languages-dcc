# Primeira Prova de Linguagens de Programação - DCC024B - Sistemas de Informação

Nome: ____________________

"Eu dou minha palavra de honra que não trapacearei neste exame."

Número de matrícula: ____________________

As regras do jogo:

- A prova é sem consulta.
- Quando terminar, não entregue nada além do caderno de provas para o instrutor.
- Quando escrever código, a sintaxe correta é importante.
- Cada estudante tem direito a fazer uma pergunta ao instrutor durante a prova. Isso inclui "Quanto
  tempo falta para acabar a prova". Para a pergunta: "Posso ir ao banheiro", a resposta é sim (deixe o
  telefone celular sobre a mesa para ir ao banheiro).
- A prova termina uma hora e quarenta minutos após seu início.
- Seja honesto e lembre-se: **você deu sua palavra de honra**.

Alguns conselhos:

1. Escreva sempre algo nas questões, a fim de ganhar algum crédito parcial.
2. Se não entender a questão, e já tiver gasto sua pergunta, escreva a sua interpretação da questão junto
   à resposta.
3. A prova não é difícil, ela é divertida, então aproveite!

Tabela 1: Pontos acumulados (para uso do instrutor)

| Questão 1 | Questão 2 | Questão 3 | Extra |
|---|---|---|---|
| | | | |

**Questão extra (0.5)**: O disco "*Acabou Chorare*" foi considerado, pela revista *Rolling Stones*, como o
album mais importante da Música Brasileira até 2007. A qual cantor ou banda pertence o disco?

---

## Questão 1

1. Linguagens de programação frequentemente usam "instruções invisíveis". Essas são instruções usadas
   para prevenir erros em tempo de execução. Por exemplo, a operação de divisão, em SML gera a exceção
   `Div [divide by zero]`. Cada operação de divisão é guardada por um condicional que verifica se o
   dividendo é zero. Caso o seja, a exceção aritmética é lançada. Quanto mais dinâmica a linguagem,
   mais instruções invisíveis ela possui. Python usa muitas instruções desse tipo. C, por outro lado, não
   as usa.

   (a) (2 Pontos) Dê exemplo de alguma outra operação, além da divisão vista acima, que é guardada
   por condicionais invisíveis em SML/NJ.

   (b) (2 Pontos) Dê exemplo de alguma operação em Java que seja guardada por condicionais invisíveis.

   (c) (3 Pontos) A linguagem C não usa instruções invisíveis. Há vantagens nessa abordagem. Cite
   uma vantagem **usando somente uma palavra**:

   ------------------------------------

   (d) (1 Pontos) Há, contudo, várias desvantagens na abordagem de C. Cite uma dessas desvantagens.

   (e) (2 Pontos) Use um exemplo que ilustre a desvantagem mencionada no item anterior.

## Questão 2

2. Considere a função `max` abaixo, implementada em SML:

   ```sml
   fun max [e] = e
     | max (h::t) = if max t > h then max t else h
   ```

   (a) (2 Pontos) Qual o tipo da função `max`?

   (b) (2 Pontos) A função `max` possui um pior caso exponencial. Como deve ser a entrada (assumindo
   uma lista com n elementos) para forçar o caso O(2ⁿ)?

   (c) (2 Pontos) Reescreva a função `max`, para que ela seja linear no número n de elementos da lista de
   entrada.

   (d) (2 Pontos) A função `max`, ao ser compilada, provoca um aviso do tipo `match nonexhaustive`. Por
   que?

   (e) (2 Pontos) Escreva uma função `maxL` <u>de uma linha</u>, que receba uma lista de listas, e retorne o
   máximo de cada lista. Exemplo:

   ```sml
   maxL [[2, 3], [3, 4, 5]];
   val it = [3,5] : int list
   ```

   ------------------------------------------------------------------------------------------

## Questão 3

3. Esta questão refere-se ao programa abaixo, implementado em uma linguagem de programação
   hipotética, cuja sintaxe é baseada em Python:

   ```
   def f(x) = x + 2
   def h(g) = g(false)
   h(f)
   ```

   Explique como seria o sistema de tipagem da linguagem hipotética considerando cada um dos casos
   de tentativa de execução do programa acima. Especificamente, identifique se o sistema de tipagem é
   estático ou dinâmico e se há presença de algum dentre os seguintes tipos de polimorfismo: coerção,
   sobrecarga, paramétrico e/ou subtipagem. Justifique suas respostas.

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
---

# Resolução

> Resolvida em 2026-09-30. Tente de cabeça antes de ler. Os blocos **⚠️ Meu erro** marcam
> onde eu errei na primeira tentativa: são os pontos a revisar.

**Questão extra:** Novos Baianos.

## Questão 1 — instruções invisíveis

Ideia central: toda operação que pode ficar **impossível dependendo do valor** em tempo de
execução é candidata a um `if` invisível inserido pelo compilador. Teste: *existe entrada
válida no tipo que torne a operação impossível?* `hd []` sim; `explode ""` não (dá `[]`).
Ver `docs/content/docs/aula-07.mdx`, seção "Estático × dinâmico".

**(a)** `hd []` (ou `tl []`): antes de pegar a cabeça, SML verifica se a lista é vazia e,
se for, lança a exceção `Empty`. Também vale: casamento de padrões não exaustivo, que lança
`Match` quando nenhum padrão casa.

> ⚠️ Meu erro: citei também `explode` e `implode`. Elas não têm o que verificar: toda
> string vira lista e toda lista de `char` vira string.

**(b)** Acesso a vetor. Em

```java
int[] lista = new int[2];
lista[3] = 999;
```

Java verifica **em tempo de execução** se `0 <= i < lista.length`. Como não está, lança
`ArrayIndexOutOfBoundsException`. O `javac` compila normalmente, porque o índice poderia
ser uma variável. Também vale: chamar método em referência `null`, que lança
`NullPointerException`.

> ⚠️ Meu erro: respondi só "dá erro". É preciso dizer **qual** erro e **quando** ele
> acontece.

**(c)** **Eficiência** (ou desempenho, ou velocidade). Nenhum `if` é executado a cada
acesso a vetor, divisão ou ponteiro.

> ⚠️ Meu erro: respondi "determinismo". É o contrário: sem as verificações, C tem
> **comportamento indefinido** (*undefined behavior*) e o resultado depende do que estiver
> na memória.

**(d)** Falta de segurança (de memória): um acesso inválido não é detectado e pode
corromper dados silenciosamente ou derrubar o programa.

**(e)**

```c
int lista[5];
lista[10] = 42;
```

O vetor só tem as posições 0 a 4. C não verifica o índice e grava 42 num endereço fora do
vetor, que pode pertencer a outra variável. O programa pode seguir com um valor corrompido
sem avisar, ou terminar com *segmentation fault*. Em Java, a mesma linha lançaria
`ArrayIndexOutOfBoundsException`; em Python, `IndexError`.

> ⚠️ Meu erro: escrevi só o código, sem dizer o que acontece, e esqueci o `;` na segunda
> linha.

| `v[i]` com `i` fora do vetor | C | Java | Python | SML |
|---|---|---|---|---|
| Verificação invisível? | não | sim | sim | sim |
| O que acontece | comportamento indefinido | `ArrayIndexOutOfBoundsException` | `IndexError` | exceção `Subscript` (`Array.sub`, `List.nth`) |

## Questão 2 — `max`

```sml
fun max [e] = e
  | max (h::t) = if max t > h then max t else h
```

**(a)** `int list -> int`.

O argumento é lista, pelos padrões `[e]` e `h::t`, e o resultado é elemento (`e`, `h`). O
`>` é **sobrecarregado**: vale para `int`, `real`, `string` e `char`, mas não para qualquer
`'a`. Sem outra pista, SML escolhe o padrão, que é `int`, pelo mesmo motivo que
`fun cube x = x * x * x` sai `int -> int`.

> ⚠️ Meu erro: respondi `'a list -> 'a`. Regra: sem operação, o tipo é `'a`; com operador
> sobrecarregado e sem pista, o tipo é `int`; com pista (`2.0`, `(x : real)`), é o tipo
> da pista.

**(b)** Lista em **ordem crescente**, como `[1, 2, 3, ..., n]`.

`max t` só é chamado duas vezes quando `max t > h` é verdadeiro, isto é, quando a cabeça é
menor que o máximo do resto. Se isso vale em **todo** nível, cada chamada gera duas, e o
total é O(2ⁿ). Em ordem decrescente a condição é sempre falsa, e a função é linear.

> ⚠️ Meu erro: disse só "ordenada", sem o sentido. Ordem decrescente é o melhor caso.

**(c)** Calcula `max t` **uma vez**, guarda num nome com `let` e reutiliza. É uma chamada
recursiva por nível, portanto O(n).

```sml
fun max [e] = e
  | max (h::t) =
      let
        val m = max t
      in
        if m > h then m else h
      end;
```

**Linear** significa que o tempo cresce proporcionalmente a n: cada elemento é visitado uma
vez. Mesma técnica do `fastFib` (`docs/content/docs/aula-06.mdx`, "Fibonacci: de
exponencial a linear").

> ⚠️ Meu erro: coloquei o `let` na cláusula `max [e]`, onde `h` e `t` não existem (dá
> `unbound variable`), e apaguei o caso base. Só o corpo da **segunda** cláusula muda, e
> ela começa com `|` e repete o nome da função.

**(d)** Nenhum padrão casa com a lista vazia `[]`: ela não é `[e]` (exatamente um elemento)
nem `h::t` (lista não vazia). O compilador avisa, e `max []` lança a exceção `Match` em
tempo de execução. É mais uma instrução invisível, como na questão 1.

**(e)**

```sml
fun maxL L = map max L;
```

`map` aplica `max` a cada lista de dentro:
`map max [[2,3],[3,4,5]] = [max [2,3], max [3,4,5]] = [3,5]`.

Conferindo pelos tipos: `map : ('a -> 'b) -> 'a list -> 'b list` e
`max : int list -> int`, então `'a = int list` e `'b = int`. Resultado:
`maxL : int list list -> int list`.

> ⚠️ Meu erro (de estilo): escrevi
> `fun maxL L = map (fn LMap => (foldl (fn (x, acc) => if x > acc then x else acc) ~1073741824 LMap)) L`.
> Funciona nos casos comuns, mas ignora o `max` que a questão acabou de dar. Além disso,
> `~1073741824` não é o menor `int` do SML/NJ (63 bits), e `maxL [[]]` devolve esse número
> em silêncio em vez de dar erro.

## Questão 3 — tipagem e polimorfismo

Para cada item, responder **sempre as cinco coisas**: estático ou dinâmico, coerção,
sobrecarga, paramétrico e subtipagem, cada uma com o porquê, usando a **mensagem de erro
como evidência**.

Regras de leitura:
- **Não compila** → estático. **Compila e falha na execução** → dinâmico.
- **Estático e paramétrico são independentes.** SML é estático **e** paramétrico.
- Coerção, sobrecarga e subtipagem são **explicações alternativas** para `false + 2 = 2`.
  Basta uma. Escolha a mais natural (coerção, como em C) e diga que as outras não são
  necessárias. Não afirme as três ao mesmo tempo.

**(a)** Não compila: `Linha 2. Tipo esperado: 'int'. Tipo encontrado: 'bool'`

- **Tipagem estática**: o erro é detectado na compilação.
- **Coerção: não.** `false` não é convertido em `int`.
- **Sobrecarga: não.** Não existe versão de `+` que aceite `bool`.
- **Paramétrico: não.** O erro aparece na **linha 2**, dentro de `h`, então o compilador já
  fixou `g : int -> int` (o tipo de `f`). Se `h` fosse genérica (`('a -> 'b) -> 'b`, como
  em SML), a linha 2 seria válida, e o erro só poderia aparecer na linha 3.
- **Subtipagem: não.** `bool` não é aceito onde se espera `int`.

**(b)** Compila, falha na execução: `Tipo esperado: 'int * int'. Tipo encontrado: 'bool * int'`

- **Tipagem dinâmica**: compila, e o erro de tipo só aparece na execução.
- **Coerção: não.** O `+` recebeu `(false, 2)` e parou, em vez de converter `false`.
- **Sobrecarga: não para `bool`.** A mensagem mostra que `+` só aceita `int * int`.
- **Paramétrico: sim (implícito).** `h` aceita qualquer `g`: seu código não depende do tipo
  de `g`, e a linha 2 não foi rejeitada.
- **Subtipagem: não.** `bool` não é aceito no lugar de `int`.

**(c)** O original devolve `2`; `h(g) = g(f)` não compila.

- **Tipagem estática**: o segundo programa é rejeitado na compilação.
- **Coerção: sim.** `false + 2 = 2` se explica por `false` virar `0`, como em C.
- **Sobrecarga e subtipagem: não são necessárias** para explicar o `2`. Uma alternativa
  seria `bool` ser subtipo de `int`, como em Python, onde `bool` é subclasse de `int`.
- **Paramétrico: não dá para concluir.** O segundo programa faz `h(f)`, depois `f(f)`,
  depois `f + 2`: soma uma função com um número. Isso é erro em qualquer sistema estático,
  paramétrico ou não.

**(d)** O original devolve `2`; `h(g) = g(f)` compila, mas falha com
`Operador +: int*int -> int não definido para type<fun>`

- **Tipagem dinâmica**: compila, e o erro de tipo só aparece na execução.
- **Coerção: sim, limitada.** O original dá `2`, então `false` vira `0`. Funções não são
  convertidas, e o `+` falha com `type<fun>`.
- **Sobrecarga: não.** A mensagem mostra que `+` só tem a versão `int*int -> int`.
- **Paramétrico: sim (implícito).** `g(f)` não foi rejeitado na compilação, então `h`
  aceita qualquer `g`.
- **Subtipagem: não é necessária.** A coerção já explica o `2`.

| Item | Tipagem | Coerção | Paramétrico |
|---|---|---|---|
| (a) | estática | não | não |
| (b) | dinâmica | não | sim |
| (c) | estática | sim | não dá para concluir |
| (d) | dinâmica | sim (limitada) | sim |

> ⚠️ Meus erros: (1) omiti "estático ou dinâmico" em três itens seguidos; (2) na (b),
> copiei a resposta da (a) sem olhar o cenário; (3) na (c), justifiquei "não paramétrico"
> com "verifica antes, logo não é genérico", mas estático não exclui paramétrico;
> (4) na (c) e na (d), afirmei coerção **e** subtipagem juntas ("convertido" e "sem
> conversão" ao mesmo tempo).
