---
name: estudar-topico
description: Gera um módulo completo do handbook de estudo de LP (DCC024) para um tópico da ementa, em nível de livro-texto. Use quando eu pedir para estudar, aprender ou aprofundar um tópico da disciplina, ou quando eu invocar /estudar-topico.
---

# Gerar módulo do handbook

Produz um módulo de estudo em nível de livro-texto para um tópico da ementa de DCC024.

## Antes de escrever

1. Leia `material/ementa.md` e localize a seção do tópico. A lista de "Conceitos que devem
   ser entendidos" é o escopo mínimo obrigatório — cubra **todos** os itens.
2. Leia os slides e notas de aula correspondentes em `material/`, se existirem. O que o
   professor enfatizou em aula pesa mais que a ordem da ementa.
3. Verifique `provas-antigas/` para ver como o tópico já foi cobrado.
4. Leia `learning-records/` e filtre por este tópico. Se houver registro de que eu já
   domino algo, não reensine — cite e siga. Se houver registro de fragilidade, essa parte
   entra com mais profundidade e mais exemplos.
5. Se o tópico não foi indicado, sugira o próximo pendente em `handbook/`.

## Três arquivos de saída

Módulos são lidos uma vez; folhas de referência são revisitadas até a véspera da prova.
Por isso a saída é separada:

| Arquivo | O que é | Quando eu uso |
|---|---|---|
| `handbook/NN-topico.md` | O módulo completo, nível livro-texto | Uma vez, ao estudar |
| `reference/NN-topico.md` | A essência comprimida, 1–2 páginas | Toda revisão, e na véspera |
| `handbook/respostas/NN-topico.md` | Respostas das questões | Só depois de eu tentar |

**A folha de referência não é um resumo do módulo.** É o que eu preciso ter na memória e
não consigo derivar na hora: tabelas de sintaxe, a tabela comparativa entre linguagens, os
passos do algoritmo, o glossário dos termos do professor, as pegadinhas. Sem prosa
explicativa — se precisa de parágrafo para justificar, fica no módulo.

## Estrutura obrigatória

Todo módulo segue esta estrutura, sem pular seções e sem placeholders:

- **Introdução** — o que é e por que é crítico dentro da disciplina.
- **Conceitos essenciais** — o indispensável. Cubra explicitamente cada item da lista
  "Conceitos que devem ser entendidos" da ementa para esta aula.
- **Comparação entre linguagens** — como o conceito aparece (ou não existe) em C, Java,
  Python, SML e Prolog. Use tabelas. Esta seção é o eixo do curso: quase toda questão de
  prova contrasta duas ou mais linguagens.
- **Conceitos complementares** — avançado ou casos-limite.
- **Trade-offs e decisões de projeto** — por que um projetista escolheria cada alternativa,
  e o que ele perde ao escolher.
- **Prós e contras** — análise das abordagens dentro do tópico.
- **Exemplos de código** — completos e sintaticamente corretos, na(s) linguagem(ns) que o
  tópico pedir. Eles ficam no próprio módulo; é o código que eu vou memorizar e reproduzir
  à mão, então precisa estar certo.
- **Diagramas** — Mermaid ou ASCII para árvores de sintaxe, pilha de registros de ativação,
  layout de heap, árvores de prova, passos de redução lambda.
- **Pegadinhas** — confusões que derrubam aluno em prova. Ex.: `is` vs. `=` vs. `=:=` em
  Prolog; passagem por referência vs. ponteiro passado por valor; `foldr` vs. `foldl`.
- **Questões no estilo do professor** — 5 a 8 questões que imitem o estilo real das provas.
  Inclua as "Questões para discutir" que a ementa traz para esta aula. **Só os enunciados**
  — as respostas vão para o arquivo separado (ver "O gate" abaixo).
- **Checklist de autoavaliação** — lista curta de "eu sei explicar X sem consultar nada?".

## O gate

Terminado o módulo, o tópico **não está fechado**. Conduza as questões comigo, uma por vez,
antes de qualquer coisa ir para `learning-records/`.

Regras:

- **Nunca mostre a resposta junto do enunciado.** Elas ficam em
  `handbook/respostas/NN-topico.md`, e você não abre esse arquivo enquanto eu não tentar.
- Uma questão por vez. Espere minha resposta.
- Se eu responder vago ("acho que é por causa do escopo"), **não aceite** — peça o
  mecanismo. A prova não dá ponto por intuição.
- Se eu disser "ok, entendi", "faz sentido" ou "obrigado" sem ter respondido, o gate
  continua aberto. Reformule e peça de novo.
- Ao final, para cada conceito, classifique: **demonstrado**, **frágil** ou **não
  demonstrado**, e escreva o registro em `learning-records/` (formato abaixo).

O objetivo é retenção, não fluência. Ler o módulo e sentir que entendeu é fluência, e some
em uma semana. O que vale é conseguir reproduzir no papel, sem consulta, em setembro.

## Formato de `learning-records/`

Um arquivo por conceito, não por tópico: `learning-records/NNNN-nome-do-conceito.md`.

```markdown
# Redução beta e captura de variável

- **Tópico:** 9 — Cálculo Lambda
- **Status:** frágil
- **Última verificação:** 2026-08-20

## Evidência
Reduzi (λx.λy.x) y sem renomear, e o y livre foi capturado.

## O furo
Não é distração: eu não estava checando se a variável do corpo já ocorre livre no
argumento antes de substituir.

## Como fechar
Refazer três reduções com captura antes de 28/09.
```

Atualize o registro existente em vez de criar um novo quando o mesmo conceito reaparecer —
o histórico de status é o que mostra se algo está de fato consolidando.

## Tom

Informal porém tecnicamente rigoroso, direto, de programador para programador. Sem encher
linguiça.

Quando o conceito for abstrato — cálculo lambda, unificação, semântica operacional — mostre
a mecânica passo a passo **antes** da definição formal. Use contraexemplos.

Referência de estilo: os slides do professor, que são socráticos (abrem com uma pergunta e
depois constroem a resposta), e a clareza didática do livro do Webber.

Um tópico por vez. Não resuma, não trunque.