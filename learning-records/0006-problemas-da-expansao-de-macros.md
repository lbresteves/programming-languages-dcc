# Problemas da expansão de macros: captura de variáveis e múltipla avaliação de parâmetros

- **Tópico:** passagem de parâmetros (aula 19, lista 19)
- **Status:** frágil (marcado pela própria aluna para revisar)
- **Última verificação:** 2026-11-08

## Evidência

Lista 19, q1 (2026-11-08):
- (a) Acertou a expansão de `SUM(argc, argv[0][0])` sozinha, com dúvida ("basta substituir?").
- (b) Captura: propôs primeiro `SWAP(a, b)`, que **funciona** e não ilustra o problema.
  Pediu o que o exemplo certo (`SWAP(a, temp)`) imprime; não fez a expansão à mão.
  A anotação da aula tinha a expansão errada (`{int temp=temp; ...}`), já corrigida.
- (c) Múltipla avaliação: pediu o exemplo direto, sem tentativa.
- Pediu para revisar os dois conceitos depois.

## O que precisa saber reproduzir

1. Expandir uma macro à mão, letra por letra (`SWAP(a, temp)` →
   `{int temp=a; a=temp; temp=temp;}`) e rastrear: imprime `2, temp = 17` duas vezes.
2. Captura: o nome do argumento é interpretado no contexto da macro, não do chamador.
   A passagem por nome não tem esse problema.
3. Múltipla avaliação: exemplo com expansão + saída com macro + saída se fosse função
   (`MAX(++a, b)` → `a = 4, c = 4`; como função seria `a = 3, c = 3`).
4. Não usar `DOBRO(++a)` como prova: `(++a) + (++a)` é comportamento indefinido.

## Como fechar

- Variação proposta: `#define QUAD(X) ((X) * (X))` com `QUAD(i++)` (segura ou indefinida?)
  e uma chamada que prove a múltipla avaliação sem comportamento indefinido.
- Bônus da 1(b): qual chamada gera `{int temp=temp; temp=a; a=temp;}`?
- Refazer 1(b) e 1(c) no papel, sem consulta.
