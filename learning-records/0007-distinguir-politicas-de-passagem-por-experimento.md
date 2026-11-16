# Distinguir políticas de passagem de parâmetros por experimento

- **Tópico:** passagem de parâmetros (aula 19, lista 19)
- **Status:** não demonstrado
- **Última verificação:** 2026-11-08

## Evidência

Lista 19, q4 (2026-11-08): procurou exemplo nas anotações e nas notas do professor e depois
pediu a resolução da 4(a) e da 4(b) direto, sem tentativa própria.

## O que precisa saber reproduzir

1. Por que o experimento precisa de exceção, laço infinito ou efeito colateral (teorema de
   Plotkin): sem isso, as políticas dão o mesmo resultado.
2. Não é por nome: função que ignora o parâmetro + argumento que explode
   (`myand (false, 1 div 0 = 0)` → `uncaught exception Div`).
3. Não é macro: captura de variáveis (`g` com `val y` local, `f y = g y`): macro daria 20,
   SML dá 11.
4. Ligação com [[0006-problemas-da-expansao-de-macros]]: é a mesma captura da lista 19, q1(b).

## Como fechar

- Variações propostas: 4(a) com laço infinito no lugar de `1 div 0`; 4(b) com `fun g x = let val z = 3 in x * z end; fun f z = g (z + 1); f 2;` (macro × SML, atenção aos parênteses).
