<div align="center">

# 🧠 DCC024 — Linguagens de Programação

**Caderno digital da matéria**

<!-- cores 🎨 -->
![UFMG](https://img.shields.io/badge/UFMG-DCC024-ED1C24?style=for-the-badge)
![Professor](https://img.shields.io/badge/Prof.-Fernando-1E90FF?style=for-the-badge)
![Idioma](https://img.shields.io/badge/idioma-pt--BR-009C3B?style=for-the-badge)

![SML](https://img.shields.io/badge/Standard_ML-DE3423?style=flat-square&logo=sml&logoColor=white)
![Prolog](https://img.shields.io/badge/Prolog-EF2D5E?style=flat-square&logo=swi-prolog&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![Java](https://img.shields.io/badge/Java-ED8B00?style=flat-square&logo=openjdk&logoColor=white)
![C](https://img.shields.io/badge/C-A8B9CC?style=flat-square&logo=c&logoColor=black)

![Claude Code](https://img.shields.io/badge/Claude_Code-5_skills-D97757?style=flat-square&logo=anthropic&logoColor=white)
![Fumadocs](https://img.shields.io/badge/Fumadocs-Next.js-000000?style=flat-square&logo=nextdotjs&logoColor=white)
![Status](https://img.shields.io/badge/status-em_curso-yellow?style=flat-square)

<br>

[![Ler as anotações online](https://img.shields.io/badge/📖_ler_as_anota%C3%A7%C3%B5es-online-000000?style=for-the-badge&logo=vercel&logoColor=white)](https://programming-languages-dcc.vercel.app/docs)

</div>

---

## 🎯 Objetivo

Este repositório **não é um projeto de software** — é um repositório de **estudo** pra facilitar minha vida. O "produto"
aqui sou eu sabendo a matéria.

Todas as anotações foram feitas por mim, então se houver algum erro, eu assumo. 

A ideia é reunir num só lugar tudo que envolve a disciplina **DCC024 — Linguagens de
Programação** da UFMG, lecionada pelo professor **Fernando**, e usar o
**Claude Code** como monitor particular para:

- 📚 **estudar os tópicos da ementa** em nível de livro-texto, um de cada vez;
- ✍️ **resolver as listas de exercícios** de forma guiada (dica → minha tentativa → correção);
- 📄 **transcrever os PDFs da disciplina** (listas, provas antigas, slides) para Markdown pra facilitar minha vida e gastar menos token;
- 📊 **descobrir o que mais cai nas provas**, agrupando as questões antigas por tópico;
- 🖥️ **transformar minhas anotações de aula** num site bonito e navegável.


📎 **Ementa oficial:** <https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/>
&nbsp;·&nbsp; 📖 Livro-texto: *Introduction to Programming Languages*, Adam Webber.

---


## 🤖 Skills do Claude Code

As *Skills* (`.claude/skills/`) cobrem todo o fluxo de trabalho. Cada uma é invocada por um
comando de barra e carrega instruções específicas que substituem o comportamento padrão do
Claude.

| Skill | Comando | Para quê |
|---|---|---|
| 📚 **estudar-topico** | `/estudar-topico` | Gerar material de estudo de um tópico da ementa |
| 📝 **resolver-lista** | `/resolver-lista` | Resolver uma lista de exercícios de forma guiada |
| 🗂️ **ajustar-anotacoes** | `/ajustar-anotacoes` | Deixar as anotações de aula consistentes com o material |
| 📄 **transcrever-pdf** | `/transcrever-pdf` | Transcrever um PDF da disciplina para Markdown fiel |
| 📊 **compilar-prova** | `/compilar-prova` | Agrupar as questões das provas antigas por tópico, do que mais cai ao que menos cai |

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
- o **conteúdo das listas**, que mostra o que é importante, e
- as **provas antigas** (de preferência pelo `compilado-de-questoes.md`), que mostram o que
  ele de fato cobra e como.

Quando um assunto da aula cai em **25% ou mais das provas** (ou o professor disse na revisão
que cai), a skill acrescenta um **adendo** logo depois da explicação: um callout
`Cai em prova: 37,5% (provas 24, 28 e 29)` com o formato da pergunta, uma questão de exemplo
e a pegadinha que se repete.

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

<details>
<summary><b>📊 (5) <code>/compilar-prova</code> — o que mais cai nas provas</b></summary>

<br>

O professor repete assuntos, e às vezes provas inteiras (a midterm25 é cópia da midterm23).
Esta skill lê todos os `.md` de `material/provas-antigas/1a-prova/` ou `2a-prova/` e gera
`compilado-de-questoes.md` na mesma pasta:

- **Tabela no topo** com cada tópico, a frequência (provas em que caiu ÷ total), as provas,
  o número de itens e a aula correspondente.
- **Um bloco por tópico**, do que mais cai para o que menos cai:
  `## Tópico 4 — Dar o tipo de uma função SML [aparece em 37,5% das provas (provas 24, 28 e 29)]`,
  com as questões numeradas (`4.3 (prova 28, Q2a)`) e os enunciados copiados fielmente.
- **Um item, um tópico:** a classificação é por item (a, b, c…), não por questão inteira,
  porque uma mesma questão costuma misturar assuntos.
- **Dicas da revisão:** cruza com a aula de revisão (`aula-revisao-*.mdx`, blocos "Ênfase /
  pode cair") e marca com ⭐ e **[Altas chances de cair (revisão)]** o que o professor disse
  que cai, inclusive o que nunca caiu antes.

Só copia enunciados, sem resolver nada. No chat, cruza a tabela com os `learning-records/`:
tópico frequente + conceito frágil = prioridade de revisão.

</details>



Além das skills, o repositório tem regras automáticas em `.claude/rules/` — por exemplo
`prolog.md`, que fixa as convenções de Prolog da disciplina (`is` × `=` × `=:=`, negação por
falha, uso de `member/2` e `select/3`, quando discutir modelos de custo).

---

## 🖥️ Fumadocs — as anotações de aula como site

A pasta [`docs/`](docs/) é um app **Next.js + [Fumadocs](https://fumadocs.dev/)** à parte,
usado para **melhorar a visualização** das anotações: cada aula vira uma página navegável,
com busca, índice lateral, syntax highlighting e suporte a **MDX** (Markdown + componentes).

🔗 **No ar:** <https://programming-languages-dcc.vercel.app/docs>

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
