# Link de aninhamento (nesting link) e acesso a variáveis não locais

- **Tópico:** 13 — Registros de ativação
- **Status:** não demonstrado
- **Última verificação:** 2026-10-05

## Evidência

Lista 13, q1 (2026-10-05): achou o tópico difícil e pediu a resolução direto, sem tentar
os passos guiados (contar os saltos no exemplo `f1`/`f2`/`f3`, generalizar para n − m,
explicar por que m > n não ocorre). Ainda não há tentativa própria.

Lista 13, q1, depois da resolução (2026-10-05):
- (a) Deu as profundidades (f1 = 1, f2 = 2, f3 = 3) em vez do número de saltos
  (n3 = 0, n2 = 1, n1 = 2). Confunde profundidade com distância.
- (b) Acertou n − m, mas com dúvida ("seria...?").
- (c) **Respondeu que uma função externa pode enxergar a variável local de uma função
  aninhada dentro dela.** Errado: o escopo é só para dentro, e os links só apontam para
  cima. É exatamente o furo da segunda pergunta da Q1 (m > n).

## O que precisa saber reproduzir

1. Link de aninhamento (estático, segue o texto do programa) × ponteiro para o registro
   anterior (dinâmico, segue as chamadas). Variável não local se acha pelo **primeiro**.
2. As 3 regras para montar o link (de fora: `NULL`; externa → interna: registro de quem
   chamou; interna → interna: link de quem chamou).
3. Da profundidade n até a m: n − m saltos, mais um deslocamento fixo de compilação.
4. Com escopo estático, m ≤ n sempre. Referência a uma profundidade maior é erro de
   compilação.

## Como fechar

- Variação proposta na q1 (programa `a`/`b`/`c`/`d` de 4 níveis): contar os saltos e
  desenhar os registros sem consulta.
- As Q3 e Q6 da lista 13 usam o mesmo conceito e servem de reteste.
