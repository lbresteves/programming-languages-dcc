# DCC024 — Linguagens de Programação (UFMG)

Repositório de estudo, não de software. O "produto" aqui sou eu sabendo a matéria.

## A disciplina

- Professor: Fernando Magno Quintão Pereira.
- Livro-texto: *Introduction to Programming Languages*, Adam Webber.
- Linguagens usadas: SML, Prolog, Python, Java, C.
- Ementa completa em `material/ementa.md` — é a fonte de verdade sobre o que cai.

## Avaliações

| Data | Peso | Conteúdo | Modo |
|---|---|---|---|
| 28/09 | 30 pts | Até a aula de revisão de 23/09 (Listas 1–13) | Sem consulta, 90 min |
| 25/11 | 40 pts | Todo o curso, ênfase na 2ª metade | Sem consulta, 90 min |

Listas de exercícios são **entregues manuscritas** e valem nota.

## Convenções

- **Idioma: português do Brasil.** Use a terminologia do professor ("casamento de padrões",
  "registros de ativação", "recursão de cauda", "árvore de prova"). Termo em inglês entre
  parênteses na primeira ocorrência.
- **Sintaxe é avaliada.** Todo código que você me mostrar precisa estar sintaticamente
  correto, porque é o que eu vou decorar e reproduzir à mão. Não é preciso executar nada
  como rotina; se eu pedir para conferir uma sintaxe específica, aí sim rode.
- **Prefira soluções curtas e legíveis a soluções espertas.** A resposta é escrita à mão.
  Em Prolog, duas linhas com `member`/`select` valem mais que dez linhas otimizadas.
- **Não otimize sem ser pedido.** Exceção: os tópicos de modelos de custo e recursão de
  cauda, onde eficiência é o assunto.
- A numeração de aulas no índice da ementa está furada (a aula de Unificação some do índice).
  **Use sempre o número da lista como chave**, nunca o número da aula.

## Layout

```
material/      ementa.md, slides/ e notas-aula/ transcritos em Markdown
listas/        lista-NN/ com enunciado.pdf, enunciado.md e resolucao.md
handbook/      módulos de estudo (lidos uma vez) + respostas/ das questões
reference/     folhas comprimidas por tópico (revisitadas até a véspera)
learning-records/ um arquivo por conceito: demonstrado / frágil / não demonstrado
provas-antigas/ provas dos semestres anteriores
rascunho/      opcional, para experimentar código quando eu quiser rodar algo
docs/          site Fumadocs com minhas anotações de aula (content/docs/aula-NN.mdx)
```

`docs/` é um app Next.js à parte (`npm install` + `npm run dev` dentro da pasta). Cada
aula é uma página `content/docs/aula-NN.mdx`, título `Aula NN - <tópico>` seguindo
`material/ementa.md`.

`learning-records/` é a memória do que eu de fato sei. Consulte antes de ensinar ou de
resolver: não reensine o que está *demonstrado*, e aprofunde o que está *frágil*.

## Como me ajudar

Duas habilidades cobrem o trabalho: `/estudar-topico` para gerar material de estudo e
`/resolver-lista` para as listas de exercícios.

**Nas listas, nunca me entregue a resposta pronta de saída.** Resolução guiada: dica,
minha tentativa, correção. Se eu pedir a solução direto, dê — mas em seguida proponha uma
variação para eu resolver sozinho. Prova sem consulta só aceita o que eu reconstruir de
cabeça.

**Retenção, não fluência.** Ler e sentir que entendeu é fluência, e some em uma semana. O
que conta é reproduzir no papel, sem consulta. Na prática isso significa: enunciado antes
de resposta, minha tentativa antes da correção, e "entendi" não fecha nada — só fecha
quando eu demonstro.

## Estilo do professor

As provas quase nunca perguntam "o que é X". Perguntam **por que** X é assim numa linguagem
e não em outra. Os formatos recorrentes:

- Tabela comparativa a preencher (ex.: Java vs. Python vs. ∅ para cada funcionalidade).
- "Por que o projetista da linguagem tomou essa decisão?"
- Rastreio de execução, ou explicar por que uma otimização do compilador não se aplica.
- Implementar um predicado/função curta com sintaxe correta.

Ao explicar qualquer conceito, sempre mostre como ele se manifesta — ou deixa de existir —
em C, Java, Python, SML e Prolog. Esse contraste é o eixo real do curso.