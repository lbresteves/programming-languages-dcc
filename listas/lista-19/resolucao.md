# Lista 19 — Resolução

## 1.

**(a)** Depois do pré-processamento, o `#define` some e a chamada é trocada pelo texto do corpo:

```c
int main(int argc, char** argv) {
  printf("sum = %d\n", (argc) + (argv[0][0]));
}
```

*Raciocínio:* o pré-processador só substitui texto (`X` → `argc`, `Y` → `argv[0][0]`); os
parênteses vêm do corpo da macro.

**(b)** Captura de variáveis:

```c
#include "stdio.h"
#define SWAP(X,Y) {int temp=X; X=Y; Y=temp;}
int main() {
  int a = 2;
  int temp = 17;
  printf("%d, temp = %d\n", a, temp);
  SWAP(a, temp);
  printf("%d, temp = %d\n", a, temp);
}
```

`SWAP(a, temp)` expande para `{int temp=a; a=temp; temp=temp;}`. Imprime `2, temp = 17` duas
vezes: a troca não acontece.

*Raciocínio:* o `temp` local da macro tem o mesmo nome do argumento e o esconde dentro do
bloco; o `temp` do chamador nunca é tocado.

**(c)** Múltipla avaliação de parâmetros:

```c
#include <stdio.h>
#define MAX(X, Y) ((X) >= (Y) ? (X) : (Y))
int main() {
  int a = 2, b = 3;
  int c = MAX(++a, b);
  printf("a = %d, b = %d, c = %d\n", a, b, c);
}
```

Expande para `((++a) >= (b) ? (++a) : (b))` e imprime `a = 4, b = 3, c = 4`. Se `MAX` fosse
função, `++a` rodaria uma vez: `a = 3, c = 3`.

*Raciocínio:* o argumento aparece duas vezes no corpo, então o efeito colateral acontece
duas vezes. Evitar `DOBRO(++a)`: `(++a) + (++a)` é comportamento indefinido e não prova nada.

## 4.

**(a)** Uma função que não usa o segundo parâmetro, chamada com um argumento que explode:

```sml
fun myand (a, b) = if a then b else false;
myand (false, 1 div 0 = 0);
```

Por nome, `b` só seria avaliado se fosse usado; como `a` é `false`, o resultado seria
`false`. SML responde `uncaught exception Div`: avaliou `1 div 0` antes da chamada, então
não passa por nome (passa por valor).

*Raciocínio:* pelo teorema de Plotkin, sem exceção, laço infinito ou efeito colateral as
políticas dão o mesmo resultado; o `1 div 0` é o que torna a diferença visível.

**(b)** Captura de variáveis:

```sml
fun g x =
  let val y = 10
  in x + y
  end;

fun f y = g y;

f 1;
```

Por expansão de macros, `g y` dentro de `f` vira `let val y = 10 in y + y end`: o `y` local
de `g` captura o `y` de `f`, e `f 1` daria `20`. SML responde `val it = 11 : int`, porque `x`
recebe o valor `1` antes de entrar em `g`.

*Raciocínio:* sem efeito colateral, o único jeito de a macro dar resultado diferente é a
captura; por isso `g` declara um nome local igual ao argumento usado por `f`.
