<div align="center">

# 🧠 DCC024 — Linguagens de Programação

**Meu caderno digital da matéria que mais gostei na faculdade.**

<!-- cores 🎨 -->
![UFMG](https://img.shields.io/badge/UFMG-DCC024-ED1C24?style=for-the-badge)
![Professor](https://img.shields.io/badge/Prof.-Fernando_Quint%C3%A3o_Pereira-1E90FF?style=for-the-badge)
![Idioma](https://img.shields.io/badge/idioma-pt--BR-009C3B?style=for-the-badge)

![SML](https://img.shields.io/badge/Standard_ML-DE3423?style=flat-square&logo=sml&logoColor=white)
![Prolog](https://img.shields.io/badge/Prolog-EF2D5E?style=flat-square&logo=swi-prolog&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![Java](https://img.shields.io/badge/Java-ED8B00?style=flat-square&logo=openjdk&logoColor=white)
![C](https://img.shields.io/badge/C-A8B9CC?style=flat-square&logo=c&logoColor=black)

![Claude Code](https://img.shields.io/badge/Claude_Code-4_skills-D97757?style=flat-square&logo=anthropic&logoColor=white)
![Fumadocs](https://img.shields.io/badge/Fumadocs-Next.js-000000?style=flat-square&logo=nextdotjs&logoColor=white)
![Status](https://img.shields.io/badge/status-em_curso-yellow?style=flat-square)

</div>

---

## 🎯 Objetivo

Este repositório **não é um projeto de software** — é um repositório de **estudo**. O "produto"
aqui sou eu sabendo a matéria.

A ideia é reunir num só lugar tudo que envolve a disciplina **DCC024 — Linguagens de
Programação** da UFMG, lecionada pelo professor **Fernando Magno Quintão Pereira**, e usar o
**Claude Code** como monitor particular para:

- 📚 **estudar os tópicos da ementa** em nível de livro-texto, um de cada vez;
- ✍️ **resolver as listas de exercícios** de forma guiada (dica → minha tentativa → correção),
  já que elas são entregues **manuscritas** e valem nota;
- 🧾 **manter registro honesto do que eu de fato sei** — não o que li e "senti que entendi",
  mas o que consigo reproduzir no papel, sem consulta, no dia da prova;
- 📄 **transcrever os PDFs da disciplina** (listas, provas antigas, slides) para Markdown fiel
  e pesquisável;
- 🖥️ **transformar minhas anotações de aula** num site bonito e navegável.


📎 **Ementa oficial:** <https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/>
&nbsp;·&nbsp; 📖 Livro-texto: *Introduction to Programming Languages*, Adam Webber.

---


## 🤖 Skills do Claude Code

Quatro *skills* (`.claude/skills/`) cobrem todo o fluxo de trabalho. Cada uma é invocada por um
comando de barra e carrega instruções específicas que substituem o comportamento padrão do
Claude.

| Skill | Comando | Para quê |
|---|---|---|
| 📚 **estudar-topico** | `/estudar-topico` | Gerar material de estudo de um tópico da ementa |
| 📝 **resolver-lista** | `/resolver-lista` | Resolver uma lista de exercícios de forma guiada |
| 🗂️ **ajustar-anotacoes** | `/ajustar-anotacoes` | Deixar as anotações de aula consistentes com o material |
| 📄 **transcrever-pdf** | `/transcrever-pdf` | Transcrever um PDF da disciplina para Markdown fiel |

<details>
<summary><b>📚 (1) <code>/estudar-topico</code> — gerar um módulo do handbook</b></summary>

<br>

Produz um **módulo de estudo em nível de livro-texto** para um tópico da ementa. Antes de
escrever, a skill lê `material/ementa.md`, os slides e notas de aula, as provas antigas e os
`learning-records/` — para não reensinar o que eu já domino e aprofundar o que está frágil.

Gera **três arquivos**, porque cada um tem um uso diferente:

| Arquivo | O que é | Quando eu uso |
|---|---|---|
| `handbook/NN-topico.md` | O módulo completo | Uma vez, ao estudar |
| `reference/NN-topico.md` | A essência comprimida (1–2 páginas) | Toda revisão e na véspera |
| `handbook/respostas/NN-topico.md` | Respostas das questões | Só **depois** de eu tentar |

Estrutura obrigatória de cada módulo: introdução → conceitos essenciais → **comparação entre
linguagens** (C/Java/Python/SML/Prolog, em tabelas) → conceitos complementares → trade-offs de
projeto → prós e contras → exemplos de código sintaticamente corretos → diagramas → pegadinhas
→ questões no estilo do professor → checklist de autoavaliação.

**O gate:** terminar o módulo não fecha o tópico. A skill conduz as questões comigo, uma por
vez, e só então classifica cada conceito como **demonstrado**, **frágil** ou **não
demonstrado** em `learning-records/`. Dizer *"entendi"* não fecha nada.

</details>

<details>
<summary><b>📝 (2) <code>/resolver-lista</code> — resolução guiada de exercícios</b></summary>

<br>

As listas são entregues **manuscritas** e valem nota; as provas são **sem consulta**. Então o
objetivo é eu **saber resolver**, nunca receber a resposta pronta de saída.

1. **Diagnóstico:** lê o enunciado em `listas/lista-NN/` (transcreve o PDF para
   `enunciado.md` se preciso) e monta um mapa — qual conceito da ementa cada questão cobra,
   dificuldade, e tipo (conceitual / rastreio / implementação). Cruza com os
   `learning-records/` e sinaliza as questões que tocam pontos **frágeis**.
2. **Fluxo por questão:** reformula o enunciado → aponta o conceito necessário → dá **uma
   dica ou o primeiro passo** → espera minha tentativa → corrige com precisão, atacando o
   **furo conceitual**, não só o resultado.
3. **Se eu travar de vez:** mostra a resolução completa **e em seguida propõe uma variação**
   do mesmo problema para eu resolver sozinho.
4. **Sintaxe:** todo erro meu de sintaxe é apontado, mesmo com a lógica certa — a prova
   desconta.

Ao final grava a versão final em `listas/lista-NN/resolucao.md` e faz o fechamento: onde
tropecei, o que revisar antes da prova (priorizando o que já apareceu em mais de uma lista) e
2–3 questões extras sobre os pontos fracos.

</details>

<details>
<summary><b>🗂️ (3) <code>/ajustar-anotacoes</code> — consertar minhas anotações de aula</b></summary>

<br>

Minhas anotações de aula são bagunçadas. Esta skill acessa **apenas** o `docs/content/docs/`
(o conteúdo do Fumadocs) e deixa as anotações consistentes com:

- as **notas do professor** em `material/professor-notes/` (o roteiro passo a passo que ele
  segue em aula), e
- o **conteúdo das listas**, que mostra o que é importante.

Regra de ouro: **não remove informação** das minhas anotações. Se houver algo errado,
corrige — **mas me avisa**.

</details>

<details>
<summary><b>📄 (4) <code>/transcrever-pdf</code> — PDF da disciplina para Markdown</b></summary>

<br>

Os PDFs são caros de reler e não são pesquisáveis. Esta skill transcreve um PDF (lista,
prova antiga, slides, notas de aula, ementa) para Markdown — e **só transcreve**: não
resolve, não resume, não corrige.

- **Destino fixo por origem:** lista → `listas/lista-NN/enunciado.md`, prova →
  `provas-antigas/`, slides → `material/slides/`, notas → `material/notas-aula/`. Pergunta
  antes de sobrescrever.
- **Fidelidade:** numeração das questões igual ao original, BNF e código em blocos cercados,
  matemática em Unicode legível (`{aⁿbⁿ | n ∈ N}`, `λx.x`), tabelas em Markdown.
- **Figuras** que não dão para transcrever viram um callout `> [!NOTE] Figura (p. X): …`.
- Erro no enunciado? Transcreve como está e **avisa** numa lista à parte.

É a mesma transcrição que a `resolver-lista` e a `ajustar-anotacoes` fazem sob demanda,
agora disponível isolada.

</details>



Além das skills, o repositório tem regras automáticas em `.claude/rules/` — por exemplo
`prolog.md`, que fixa as convenções de Prolog da disciplina (`is` × `=` × `=:=`, negação por
falha, uso de `member/2` e `select/3`, quando discutir modelos de custo).

---

## 🖥️ Fumadocs — as anotações de aula como site

A pasta [`docs/`](docs/) é um app **Next.js + [Fumadocs](https://fumadocs.dev/)** à parte,
usado para **melhorar a visualização** das anotações: cada aula vira uma página navegável,
com busca, índice lateral, syntax highlighting e suporte a **MDX** (Markdown + componentes).

| | |
|---|---|
| 📁 Conteúdo | `docs/content/docs/aula-NN.mdx` — uma página por aula |
| 🏷️ Título | `Aula NN - <tópico>`, seguindo `material/ementa.md` |
| 🧭 Ordem do menu | `docs/content/docs/meta.json` |

```bash
cd docs
npm install
npm run dev      # http://localhost:3000  →  /docs
```

> ⚠️ Este `docs/` roda uma versão de Next.js com breaking changes; os guias ficam em
> `docs/node_modules/next/dist/docs/`. Vale ler antes de mexer no app.



## 🔧 Ambiente

| Linguagem | Abrir o REPL | Carregar um arquivo |
|---|---|---|
| **Prolog** (SWI-Prolog) | `swipl` | `[grammar].` &nbsp;ou&nbsp; `consult('arquivo.pl').` |
| **Standard ML** (SML/NJ) | `sml` | `use "programa.sml";` |

```bash
# rodar um .pl direto pela linha de comando
swipl -g "consult('code/prolog/grammar.pl'), halt."
```

---

<div align="center">

*Se cansar de estudar, o professor recomenda parar tudo e escutar
[Build Me Up Buttercup](https://www.youtube.com/watch?v=iol0B-clFFM). 🎶*

</div>
