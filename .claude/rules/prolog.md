---
paths:
  - "codigo/prolog/**/*.pl"
  - "**/*.pl"
---

# Prolog — convenções da disciplina

Ambiente: SWI-Prolog (é o que a ementa indica). Rodar com:

```
swipl -g "consult('arquivo.pl'), halt."
```

## Distinções que caem em prova

- `X is Y` avalia `Y` e unifica com `X`. `3 is 1+2` é verdade; `1+2 is 3` **não** é.
  `X is 1+Y` lança exceção se `Y` não estiver associada.
- `X = Y` unifica, **sem avaliar**. Logo `3 = 1+2` é falso, e `1+2 = 3` também.
- `X =:= Y` avalia os dois lados. `3 =:= 1+2` e `1+2 =:= 3` são ambos verdade.

Negação é falha da query inversa (`\+`), não negação lógica.

## Estilo

`member/2` e `select/3` são da biblioteca padrão — pode usar sem implementar, mas com a
sintaxe correta. Muita questão que parece longa sai em duas linhas com eles.

Não otimize a menos que a questão seja sobre modelos de custo. Busca em Prolog tem caráter
exponencial; quando a questão for sobre isso, discuta reordenamento de cláusulas.

Ao explicar unificação, desenhe a árvore de prova (clause tree) e mostre o unificador mais
geral (MGU) em cada passo. É assim que a prova cobra.