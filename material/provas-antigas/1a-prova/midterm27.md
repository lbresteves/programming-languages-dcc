# Primeira Prova de Linguagens de Programação - DCC024B - Ciência da Computação

Nome: ____________________

"Eu dou minha palavra de honra que não trapacearei neste exame."

Número de matrícula: ____________________

As regras do jogo:

- A prova é sem consulta.
- Quando terminar, não entregue nada além do caderno de provas para o instrutor.
- Quando escrever código, a sintaxe correta é importante.
- Cada estudante tem direito a fazer uma pergunta ao instrutor durante a prova. Traga o caderno de
  provas quando vier à mesa do instrutor. A resposta para a pergunta "*Posso ir ao banheiro*" é sim.
  Deixe seu telefone sobre a mesa quando for ao banheiro durante a prova. A pergunta "*Posso fazer
  uma pergunta*" conta como uma pergunta.
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

**Questão extra (0.5)**: "*Mas as coisas findas, muito mais que lindas, essas* ____________".

---

## Questão 1

1. Esta questão refere-se aos dois programas abaixo:

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

   > [!NOTE] Figura (p. 2): no original os dois programas aparecem lado a lado, em colunas
   > intituladas "Bash" e "SML".

   (a) (2 Pontos) O que será impresso pelo programa escrito em Bash?

   (b) (2 Pontos) O que será impresso pelo programa escrito em SML/NJ?

   (c) (2 Pontos) Qual linguagem (SML/NJ ou Bash) possui escopo estático?

   (d) (2 Pontos) Qual linguagem (SML/NJ ou Bash) possui escopo dinâmico?

   (e) (2 Pontos) Qual a diferença entre escopo estático e dinâmico?

## Questão 2

2. A operação `foldr` em SML/NJ possui o seguinte tipo: `('a * 'b -> 'b) -> 'b -> 'a list -> 'b`.
   Responda às questões abaixo com base nessa observação.

   (a) (6 Pontos) Escreva uma aplicação de `foldr` em que a operação binária, cujo tipo é `('a * 'b ->
   'b)`, seja tal que `'a` ≠ `'b`. Para tanto, você deve completar o código abaixo:

   ```sml
   - val f = fn(x, y) => [________________________]   (* 2 Pontos *)
   - val c = [________________________]               (* 1 Pontos *)
   - val L = [________________________]               (* 1 Pontos *)
   - foldr f c L ;
   ```

   Escreva a resposta da chamada "`foldr f c L`" na área logo abaixo: (2 Pontos)

   [________________________]

   > [!NOTE] Figura (p. 3): cada lacuna acima é uma linha de quadradinhos (uma célula por caractere),
   > com a pontuação escrita acima de cada linha.

   (b) (2 Pontos) O tipo de `foldr` ilustra um exemplo de polimorfismo. Qual tipo de polimorfismo é
   ilustrado nesse caso, dentre os quatro tipos que foram vistos no curso?

   (c) (2 Pontos) A função `foldl` possui o mesmo tipo que `foldr`. Escreva uma aplicação de `foldl` que
   produza um resultado diferente caso a chamada de `foldl` fosse substituída por uma chamada de
   `foldr`. Use somente a área demarcada abaixo.

   > [!NOTE] Figura (p. 3): grade de resposta vazia, 6 linhas × ~32 colunas.

   *Escreva sua resposta na área acima, um caractere por célula (você pode usar somente uma linha :)*

## Questão 3

3. (10 Pontos cada item) Abaixo temos uma lista de características de linguagens de programação. Para
   cada item, informe uma linguagem de programação que possui aquela característica. A mesma
   linguagem pode ser usada múltiplas vezes em diferentes itens.

   (a) Tipagem dinâmica:

   (b) Tipagem estática:

   (c) Tipagem forte:

   (d) Tipagem fraca:

   (e) Equivalência estrutural de tipos:

   (f) Equivalência nominal de tipos:

   (g) Suporte a tipos formados como a união de outros tipos:

   (h) Suporte a *closures*:

   (i) Suporte a espaços de nomes instanciáveis (escrever a palavra chave usada para declarar tais
   espaços de nomes):

   (j) Suporte a espaços de nomes não instanciáveis (escrever a palavra chave usada para declarar tais
   espaços de nomes):
