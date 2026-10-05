# Sistemas de tipos (estático × dinâmico) e tipos de polimorfismo

- **Tópico:** 7–8 — Tipos de dados / Polimorfismo
- **Status:** frágil
- **Última verificação:** 2026-09-30

## Evidência

Prova antiga midterm28, questão 3 (itens a–c):
- Omitiu "estático ou dinâmico" em 3 respostas seguidas, mesmo após correção. Quando
  perguntada diretamente, acertou (b: dinâmico, erro em execução).
- (b): copiou a resposta da (a) sem adaptar ao cenário novo.
- (c): justificou "não é paramétrico" com "verifica antes, logo não é genérico" —
  **confunde tipagem estática com ausência de polimorfismo paramétrico** (SML é contraexemplo).
- (c): marcou coerção, sobrecarga e subtipagem todas como "sim" para o mesmo fato
  (`false + 2 = 2`); não percebe que são explicações alternativas.
- Acertou: coerção ausente/presente, sobrecarga ausente para `bool` na (a)/(b).

Prova 27, Q2b (2026-09-30), depois de ver a resposta:
- Distinguiu sozinha `(op +)` (sobrecarga: "decide como somar pelos tipos") de `foldr`
  (paramétrico: "funciona do mesmo jeito para qualquer tipo"). Critério correto.
  Ainda não demonstrou a inferência de `+` sem anotação (padrão `int`).

Prova 24, Q1 (diagrama de Venn em C, 2026-09-30):
- (1) `return a = c > 10`: só é inválido pela falta de `;`. Achou que atribuição dentro do
  `return` fosse erro de sintaxe (é válida em C).
- (2) `int c = 10 * b` com `bool b`: **passa** nos tipos, porque `bool` em C é inteiro
  (`_Bool`). Esqueceu os `;`.
- (3) Não lembrou de nenhum exemplo (só "o do union").
- (4) Acertou: `int c = a + b` com `double b`, e sabe que envolve coerção.

## O furo

1. Estático × dinâmico é pergunta **independente** de paramétrico.
2. Uma observação não confirma vários mecanismos ao mesmo tempo: escolher o mais
   natural e dizer que os outros não são necessários.
3. Usar a mensagem de erro como evidência, e responder por cenário.

## Como fechar

- Refazer 3(a)–(d) de cabeça, com as quatro categorias + estático/dinâmico em todas.
- Explicar por que `False + 2 == 2` em Python (subtipagem) e em C (coerção).
