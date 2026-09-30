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

## O furo

1. Estático × dinâmico é pergunta **independente** de paramétrico.
2. Uma observação não confirma vários mecanismos ao mesmo tempo: escolher o mais
   natural e dizer que os outros não são necessários.
3. Usar a mensagem de erro como evidência, e responder por cenário.

## Como fechar

- Refazer 3(a)–(d) de cabeça, com as quatro categorias + estático/dinâmico em todas.
- Explicar por que `False + 2 == 2` em Python (subtipagem) e em C (coerção).
