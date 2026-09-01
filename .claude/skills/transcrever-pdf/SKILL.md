---
name: transcrever-pdf
description: Transcreve um PDF da disciplina (lista, prova antiga, slides, notas de aula, ementa) para Markdown fiel e pesquisável, sem resolver nem resumir. Use quando eu pedir para transcrever um PDF, ou quando eu invocar /transcrever-pdf.
---

# Transcrever PDF para Markdown

Os PDFs da disciplina são caros de reler e não são pesquisáveis. A transcrição em Markdown
é o formato de trabalho: `resolver-lista` e `ajustar-anotacoes` dependem dela. Esta skill
só transcreve — **não resolve, não resume, não corrige**.

## Onde sai cada coisa

| Origem | Destino |
|---|---|
| `listas/lista-NN/*.pdf` | `listas/lista-NN/enunciado.md` |
| Prova antiga | `provas-antigas/<mesmo-nome>.md` |
| Slides de aula | `material/slides/<mesmo-nome>.md` |
| Notas / transparências de aula | `material/notas-aula/<mesmo-nome>.md` |
| Ementa | `material/ementa.md` (já existe — confira antes de sobrescrever) |

Se o destino já existir, mostre o que mudaria e pergunte antes de sobrescrever. O nome
`enunciado.md` é o padrão para listas mesmo quando o PDF se chama `listaN.pdf`.

## Como ler o PDF

Use a ferramenta Read com o parâmetro `pages`. Máximo de 20 páginas por chamada; para PDF
com mais de 10 páginas o `pages` é obrigatório. Percorra o documento inteiro em blocos —
não pare na primeira leitura achando que já viu tudo.

## Regras de fidelidade

- **Transcreva o que está escrito**, na ordem em que está. Nada de reordenar, completar
  lacunas ou "melhorar" o texto.
- **Não resolva** exercícios nem responda perguntas do slide. Só o enunciado.
- **Não resuma.** Todo parágrafo do original vira texto no Markdown.
- Se o enunciado tiver um **erro** (typo, gramática que não fecha, exemplo inconsistente),
  transcreva como está e me avise numa lista "Possíveis erros no original" no fim da sua
  resposta (não dentro do arquivo).
- **Idioma:** mantenha o português do original e a terminologia do professor.

## Formatação

- Numeração das questões e subitens **igual ao original** (`1.`, `(a)`, `(b)`…).
- **Gramáticas BNF, código, expressões de exemplo** → bloco de código cercado. Marque a
  linguagem quando for código real (` ```prolog `, ` ```sml `, ` ```c `); deixe sem
  marcação para BNF e pseudocódigo.
- **Notação matemática** → Unicode legível, como o resto do repositório
  (`{aⁿbⁿ | n ∈ N}`, `λx.x`, `→`, `≤`). Só use LaTeX se o Unicode não der conta.
- **Tabelas** do PDF → tabelas Markdown.
- **Figuras, diagramas, árvores desenhadas, fotos de slide** que não dá para transcrever
  em texto → um callout no lugar exato:
  `> [!NOTE] Figura (p. X): <descrição do que a figura mostra>`.
  Se for um diagrama simples (árvore de sintaxe, pilha), pode reproduzir em ASCII ou
  Mermaid e dizer que foi reconstruído.
- Cabeçalho do arquivo: `# <título do PDF>` na primeira linha.

## Fechamento

Ao terminar, me diga:
- quantas páginas foram transcritas e o caminho do arquivo gerado;
- a lista "Possíveis erros no original", se houver;
- o que virou callout de figura (para eu decidir se preciso olhar o PDF).

Não execute código como rotina. Se eu pedir para conferir uma sintaxe específica da
transcrição, aí sim rode em `rascunho/`.
