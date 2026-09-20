# Referência — Tópico 8: Polimorfismo

## Definição

Função/operador polimórfico = tem pelo menos dois tipos possíveis.

| | Quantidade de tipos | Subtipos |
|---|---|---|
| **Ad-hoc** | Finita | Sobrecarga, Coerção |
| **Universal** | (Potencialmente) infinita | Paramétrico, Subtipagem |

## Regra de ouro: sobrecarga × coerção

- **Sobrecarga**: o **tipo do argumento** escolhe a **definição**.
- **Coerção**: a **definição** (tipo esperado) escolhe a **conversão**.

## Por que finito × infinito

| Categoria | Por quê |
|---|---|
| Sobrecarga | Cada tipo exige uma definição escrita à mão |
| Coerção | Cada conversão precisa estar na especificação da linguagem |
| Paramétrico | Infinito universo de tipos pode instanciar a variável de tipo |
| Subtipagem | Sem limite para o número de subtipos de um tipo |

## Tabela por linguagem

| | C | Java | Python | SML | Prolog |
|---|---|---|---|---|---|
| Sobrecarga de função | Não | Sim | Não precisa (dinâmica) | Não (só redefine) | Por aridade, não por tipo |
| Coerção implícita | Sim (`int`→`double`) | Sim (*widening*) | Limitada | Não | Sim (aritmética) |
| Paramétrico | Não (só macro/`void*`) | Genéricos + *type erasure* | Não precisa | Nativo (`'a`) | Trivial (sem tipos) |
| Subtipagem | Só `int*`/`const int*` | Nativo (herança) | Duck typing | Não tem | N/A |

## Glossário

- ***Type erasure*** (Java): genéricos são checados na compilação, mas o tipo concreto
  desaparece do *bytecode* — em runtime, `List<String>` é só `List`.
- **Width subtyping**: subtipo com mais campos/operações que o supertipo (contra-exemplo
  de "subtipo = menos elementos").
- **`op` (SML)**: prefixo que permite usar um símbolo de operador (`+`) como nome de
  função numa definição (`fun op + (a, b) = ...`).

## Pegadinhas (decore)

- `float → double` em Java **ainda é coerção** (perde precisão: `5.6F` → `5.599999904632568`).
- SML **redefine** `+`, não sobrecarrega — só uma implementação existe por vez.
- Sobrecarga desaparece no binário (decidida em compilação); coerção também.
- Subtipo pode ter **mais** elementos (width subtyping) — não é regra universal.
- Overloading + coerção juntos → ambiguidade de qual versão chamar.

## Exemplos-chave para reproduzir de cabeça

```sml
- fun select (a, b, c) = if a then b else c;
val select = fn : bool * 'a * 'a -> 'a
```

```java
class Coercion {
  public static void f(double x) { System.out.println(x); }
  public static void main(String[] args) {
    f((byte)1); f(1); f(1L); f(1.0F); f(1.0);
  }
}
```

```sml
- infix 3 +;
- fun op + (a, b) = a - b;
- 3 + 2;
val it = 1 : int
```
