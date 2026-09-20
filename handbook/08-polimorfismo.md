# Tópico 8 — Polimorfismo

## Introdução

Se o Tópico 7 respondeu "o que é um tipo, e quando dois tipos são iguais?", Polimorfismo
responde a pergunta seguinte: "o que acontece quando uma função **não** tem só um tipo?".
É o tópico onde a tensão entre tipagem estática (segurança, documentação) e tipagem
dinâmica (reúso) aparece de forma mais concreta — cada tipo de polimorfismo é, no fundo,
uma estratégia diferente para dar reúso a uma linguagem estaticamente tipada sem abrir mão
da verificação de tipos.

## Conceitos essenciais

**Definição.** Uma função (ou operador) é **polimórfica** se tem **pelo menos dois tipos
possíveis**. A partir daí, a classificação depende de **quantos** tipos ela aceita:

- **Ad-hoc** — quantidade **finita** de tipos:
  - **Sobrecarga** (*overloading*) — várias definições distintas, uma para cada tipo.
  - **Coerção** — uma definição só, mas o compilador converte o argumento para o tipo
    esperado.
- **Universal** — quantidade **infinita** (ou potencialmente infinita) de tipos:
  - **Paramétrico** — uma definição só, genérica, que funciona para qualquer tipo que o
    programador escolher instanciar.
  - **Subtipagem** — uma definição só, que aceita qualquer subtipo do tipo declarado.

<Callout title="Por que ad-hoc é finito e universal é infinito" type="idea">
  - **Sobrecarga:** cada tipo aceito exige uma definição separada, escrita à mão — o
    número de tipos aceitos é, no máximo, o número de definições que existem.
  - **Coerção:** toda conversão possível precisa estar prevista na especificação da
    linguagem — também limitado a um conjunto finito de regras.
  - **Paramétrico:** infinito, contanto que o universo de tipos que pode instanciar a
    variável de tipo seja infinito (é o caso normal — sempre dá para inventar mais um
    tipo).
  - **Subtipagem:** infinito, contanto que não haja limite para o número de subtipos de um
    tipo (também o caso normal — sempre dá para declarar mais uma subclasse).
</Callout>

### O termômetro: o exemplo do `select`

Comparar quantos tipos uma mesma ideia aceita em linguagens diferentes é o fio condutor do
tópico:

```python
def select(a, b, c):
    return b if a else c
```

Em Python, aceita **qualquer** combinação de tipos para `b` e `c` — infinitas formas, sem
nenhuma restrição entre eles.

```c
int select(int a, int b, int c) {
    return a ? b : c;
}
```

Em C, só aceita `int` — com `int` de 32 bits, isso é `2^96` combinações de entrada, um
número grande mas **finito**.

```sml
- fun select (a, b, c) = if a then b else c;
val select = fn : bool * 'a * 'a -> 'a
- select (2 < 3, 1, "2");
(* erro de tipo: 'a foi instanciado como int no 2º argumento, *)
(* e precisa ser o MESMO 'a no 3º -- string não serve *)
```

Em SML, `b` e `c` podem ser **qualquer** tipo — infinitas formas, como Python — mas
precisam ser do **mesmo** tipo entre si, o que Python não exige. É polimorfismo
paramétrico "no meio do caminho": infinito, mas restrito.

## Comparação entre linguagens

| | C | Java | Python | SML | Prolog |
|---|---|---|---|---|---|
| Sobrecarga de função | Não (só operadores embutidos: `+`, `*`) | Sim (`resolvida em compilação, por assinatura) | Não precisa — tipagem dinâmica já aceita qualquer tipo | Só *redefinição* (não overloading — só uma implementação de `+` existe por vez) | Clareamento por *aridade*: `foo/2` e `foo/3` coexistem, mas não é dispatch por tipo |
| Coerção implícita | Sim (`int` → `double` em expressões mistas) | Sim (*widening* numérico: `byte`→`short`→`int`→`long`→`float`→`double`) | Limitada (`int` → `float` em aritmética) | **Não** — sem conversões implícitas na linguagem base | Sim, em aritmética (`is/2` mistura `int`/`float`) |
| Paramétrico | Não tem — só macros de pré-processador ou `void*` (sem checagem de tipo) | Genéricos, com **type erasure** (o tipo concreto não existe mais em *bytecode*) | Não precisa — dinâmica já é "genérica" por natureza | **Nativo**, via variáveis de tipo (`'a`) e inferência | Todo predicado é "genérico" por padrão — não há tipos para restringir |
| Subtipagem | Só entre ponteiros com qualificadores (`int*`/`const int*`) | **Nativo**, via herança (`extends`/`implements`) | Duck typing dinâmico faz o papel de subtipagem | Não tem herança nem subtipagem nominal | N/A (sem hierarquia de tipos) |

## Sobrecarga (overloading)

Em C, `*` e `+` já são sobrecarregados nos **operadores embutidos**: o mesmo símbolo se
comporta diferente para `int` e para `float`/`double` — dá para confirmar isso no
assembly gerado com `gcc -S`. Esse polimorfismo existe só para o **programador** (no
código-fonte); no executável, o compilador já escolheu a instrução certa para cada caso —
não sobra nenhuma decisão em runtime. C **não permite** sobrecarregar funções definidas
pelo programador.

```cpp
// C++ já permite sobrecarga de funções, escolhida em tempo de compilação
int sum(int a, int b) { return a + b; }
double sum(double a, double b) { return a + b; }
```

Sobrecarga de **operadores** existe em C++, Python e JavaScript:

```python
class Interval:
    def __init__(self, a, b):
        self.a = a
        self.b = b
    def __add__(self, other):
        return Interval(self.a + other.a, self.b + other.b)
    def __gt__(self, other):
        return self.a < other.a and self.b > other.b
```

**Vantagem:** reúso — o mesmo símbolo serve para vários tipos. **Desvantagem:** quebra
propriedades que o programador espera por hábito (`2+3==3+2` é `True`, mas `"2"+"3" ==
"3"+"2"` é `False` — a sobrecarga de `+` para `string` não é comutativa) e prejudica
**legibilidade** (`a << 1` em C++ pode ser deslocamento de bits ou envio a um *stream*; só
o tipo de `a` decide).

<Callout title="Sobrecarga × redefinição em SML" type="warn">
  Em SML dá para **redefinir** o que um símbolo como `+` significa, mas não dá para ter
  duas implementações **coexistindo** com o mesmo nome — não é sobrecarga de verdade, é
  sobrescrita:

  ```sml
  - infix 3 +;
  - fun op + (a, b) = a - b;
  val + = fn : int * int -> int
  - 3 + 2;
  val it = 1 : int
  ```
</Callout>

## Coerção

Coerção é a conversão (implícita ou explícita) de um valor de um tipo para outro.
**Regra de ouro para distinguir de sobrecarga:** a sobrecarga usa o **tipo** do argumento
para escolher a **definição**; a coerção usa a **definição** (o tipo esperado) para
escolher a **conversão**.

```c
1 + 1.0;   // o inteiro 1 é implicitamente convertido (coagido) para double
```

```java
class Coercion {
    public static void f(double x) { System.out.println(x); }
    public static void main(String args[]) {
        f((byte)1);   // cast explícito int->byte; byte->double é coerção implícita
        f('1');       // char -> double: implícita
        f(1);         // int -> double: implícita
        f(1L);        // long -> double: implícita
        f(1.0F);      // float -> double: ainda implícita (widening)
        f(1.0);       // já é double: nenhuma coerção
    }
}
```

<Callout title="Coerção também custa precisão" type="idea">
  `f(5.6F)` imprime `5.599999904632568`, não `5.6`. O `float` já guarda uma aproximação
  imprecisa de `5.6`; ao ser coagido para `double`, a imprecisão só ganha mais casas
  decimais visíveis. Prova de que `float -> double` é uma coerção de verdade, não uma
  "promoção sem efeito".
</Callout>

Muitas linguagens não deixam combinar sobrecarga com coerção livremente: fica **ambíguo**
qual versão sobrecarregada chamar quando o argumento pode ser coagido para casar com mais
de uma assinatura.

## Polimorfismo paramétrico

A assinatura do `select` de SML, `bool * 'a * 'a -> 'a`, tem `'a` como **variável de
tipo** — não é, ela mesma, um tipo (não dá para declarar um valor de tipo `'a`; `"string"`
é um tipo, `'a` é um **modelo** para tipos). Essa assinatura tem um único parâmetro de
tipo, usado **três vezes**: por isso o 2º argumento, o 3º argumento e o retorno precisam
ser, todos, do mesmo tipo concreto em cada chamada.

O mesmo mecanismo em C++, com *templates*:

```cpp
template <class T> T GetMax(T a, T b) {
  T result;
  result = (a > b) ? a : b;
  return result;
}
int main() {
  int k = GetMax<int>(5, 6);
  long n = GetMax<long>(10L, 5L);
}
```

`T` só existe como *placeholder* dentro do `template`; vira um tipo de verdade só quando
**instanciado**.

<Callout title="Pergunta da ementa: paramétrico em Java × ML" type="idea">
  Em **Java**, genéricos (`List<String>`) são implementados com ***type erasure***: o
  compilador checa os tipos na compilação, mas no *bytecode* gerado a informação some — em
  runtime, `List<String>` e `List<Integer>` são a mesma classe `List`, tratando tudo como
  `Object` internamente (com *casts* inseridos pelo compilador nos pontos de leitura).
  Em **ML**, o polimorfismo paramétrico é resolvido por **inferência de tipos**: não há
  necessidade de "apagar" nada porque o compilador nunca gera código específico por tipo —
  a mesma função compilada serve para qualquer instanciação de `'a`. A diferença de fundo:
  Java tenta emular polimorfismo paramétrico dentro de um modelo de objetos com herança
  única de `Object`; ML tem polimorfismo paramétrico como mecanismo nativo do sistema de
  tipos.
</Callout>

## Polimorfismo de subtipagem

Existe polimorfismo de subtipagem quando vale o **princípio de substituição de Liskov**:
se uma função espera um supertipo, deve ser possível passar um subtipo no lugar. Um
**subtipo** tem, em geral, **menos elementos** (menos valores possíveis) mas **mais
propriedades** (mais operações) do que o supertipo — exceto no caso de subtipagem
estrutural por largura, ver Tópico 7.

```java
public class Sub {
    public static void print(Object o) { System.out.println(o); }
    public static void main(String[] a) {
        print(new String("dcc024"));
        print(new Integer(42));
        print(new Character('a'));
    }
}
```

`String`, `Integer` e `Character` são todos subtipos de `Object`: a mesma função aceita
todos, sem ser sobrecarga (só existe **uma** versão de `print`).

## Trade-offs e decisões de projeto

| Decisão | Ganha | Perde |
|---|---|---|
| Permitir sobrecarga de operadores | Reúso, notação natural (`+` para vetores, intervalos, etc.) | Legibilidade — o significado do símbolo depende do tipo, nem sempre óbvio no local de uso |
| Permitir coerção implícita | Menos código boilerplate (`1 + 1.0` "só funciona") | Resultados sutis e imprecisos (`float`→`double`); pode mascarar erro de tipo real |
| Paramétrico via type erasure (Java) | Compatibilidade com bytecode/JVM pré-genéricos | Perde informação de tipo em runtime — não dá para checar `instanceof List<String>` |
| Paramétrico via inferência (ML) | Sem "apagamento" — o sistema de tipos é uniforme | Exige uma linguagem desenhada para inferência desde o início |
| Subtipagem nominal (Java) | Hierarquia explícita, documentada, checada em compilação | Rígida — só dá para reusar código entre tipos com relação de herança declarada |

## Prós e contras

**Ad-hoc (sobrecarga/coerção).** Prós: previsível (cada caso tem uma regra fixa), fácil de
implementar num compilador simples. Contras: cresce mal — cada tipo novo exige nova
definição (sobrecarga) ou nova regra de conversão (coerção) na especificação da
linguagem.

**Universal (paramétrico/subtipagem).** Prós: escala para qualquer tipo futuro, sem tocar
a definição da função. Contras: mais difícil de implementar corretamente (erasure,
variância de subtipos); mensagens de erro de tipo mais difíceis de interpretar.

## Diagramas

```
                   Polimorfismo
             /                    \
         Ad-hoc                  Universal
      (finito)                  (infinito)
       /      \                  /        \
  Sobrecarga  Coerção      Paramétrico   Subtipagem
```

## Pegadinhas

- **Sobrecarga ≠ coerção, mesmo quando parecem resolver o mesmo problema.** Teste: quem
  decide, o **tipo do argumento** (sobrecarga) ou a **definição/parâmetro esperado**
  (coerção)?
- **SML "sobrecarrega" `+`? Não.** Só redefine — a versão antiga desaparece. Sobrecarga de
  verdade exige as duas versões **coexistindo**.
- **`float -> double` ainda é coerção**, mesmo sendo uma conversão "que sempre cabe" — a
  prova é a perda de precisão visível (`5.6F` → `5.599999904632568`).
- **Sobrecarga desaparece no executável.** Em C, o polimorfismo de `+`/`*` só existe no
  código-fonte — o binário já tem instruções diferentes para cada tipo, decididas na
  compilação.
- **Type erasure não é falta de polimorfismo.** Java genérico é polimorfismo paramétrico
  de verdade em tempo de **compilação** — só a *implementação* (erasure) descarta a
  informação depois.
- **Subtipo com mais elementos existe** (ver o paradoxo do Tópico 7) — não generalize
  "subtipo = menos elementos" para todo sistema de tipos.

## Questões no estilo do professor

1. Como o polimorfismo facilita a programação? Dê um exemplo concreto de reúso que
   dependeria de reescrever código sem ele.
2. Compare polimorfismo paramétrico em Java e em ML — cite explicitamente o papel de
   *type erasure*.
3. Classifique o polimorfismo em cada situação abaixo como sobrecarga, coerção,
   paramétrico ou subtipagem: (a) `sum(int,int)` e `sum(double,double)` em C++; (b)
   `f(1)` chamando `void f(double x)` em Java; (c) `List<T> reverse(List<T> l)`; (d)
   `void print(Object o)` recebendo uma `String`.
4. Por que overloading é considerado polimorfismo **finito**, mas subtipagem é
   considerada **infinita**? A resposta não pode citar só "porque sim" — dê o mecanismo.
5. Em SML, por que `fun op + (a, b) = a - b;` não é um exemplo de sobrecarga do operador
   `+`?
6. Um colega diz: "coerção e sobrecarga são a mesma coisa, só que uma é implícita e a
   outra é explícita." O que está errado nessa frase?
7. Dado o programa Python com a classe `Interval` (`__add__`, `__gt__`), explique por que
   `i0 + i1` não quebra a tipagem mesmo Python sendo dinamicamente tipada, e que tipo de
   polimorfismo isso é.

## Checklist de autoavaliação

- [ ] Eu sei classificar qualquer exemplo de polimorfismo em ad-hoc/sobrecarga,
      ad-hoc/coerção, universal/paramétrico ou universal/subtipagem, sem hesitar.
- [ ] Eu sei explicar, com um mecanismo (não "porque sim"), por que ad-hoc é finito e
      universal é infinito.
- [ ] Eu sei dizer a regra que separa sobrecarga de coerção quando as duas parecem
      resolver o mesmo problema.
- [ ] Eu sei por que SML não tem sobrecarga de operadores de verdade.
- [ ] Eu sei explicar *type erasure* em Java e comparar com a abordagem de ML.
- [ ] Eu sei explicar por que `float -> double` em Java ainda é coerção.
