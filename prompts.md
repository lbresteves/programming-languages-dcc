# Prompts de uso — DCC024 no Claude Code

Prompts prontos para os três fluxos. O `@` puxa o arquivo para o contexto (o Claude Code
autocompleta o caminho quando você digita `@`).

---

## 1. Transcrição e coleta de material

### Setup inicial (uma vez só)

```
Leia @material/ementa.md e baixe todas as 25 listas de exercícios para listas/,
uma pasta por lista: listas/lista-01/enunciado.pdf e assim por diante.
Use zero-padding no nome das pastas.
```

```
Baixe as provas antigas listadas em @material/ementa.md para provas-antigas/,
separando em midterm/, final/ e special/.
```

### A cada aula nova

```
Baixei o slide da aula em material/slides/mpl-06.pdf. Transcreva para
material/slides/07-tipos-de-dados.md, preservando código, tabelas e a descrição
dos diagramas. Ignore as imagens decorativas.
```

```
Baixe as notas de aula de https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson7
e salve como material/notas-aula/07-tipos-de-dados.md.
```

### A cada lista nova

```
Transcreva listas/lista-02/enunciado.pdf para listas/lista-02/enunciado.md.
Numere as questões como no original e preserve o código exatamente como está —
inclusive erros de sintaxe, se houver, porque podem ser propositais.
```

### Análise do corpus de provas (vale fazer uma vez, rende o semestre todo)

```
Leia as provas em provas-antigas/midterm/ e monte uma tabela de frequência:
para cada tópico da ementa, quantas provas o cobraram e em que formato
(conceitual, tabela comparativa, rastreio, implementação).
Salve em provas-antigas/analise-frequencia.md.
```

---

## 2. Estudar um tópico

### Invocação padrão

```
/estudar-topico

Tópico 7 — Tipos de dados.
```

### Com o material da aula em mãos

```
/estudar-topico

Tópico 7 — Tipos de dados. Use @material/slides/07-tipos-de-dados.md e
@material/notas-aula/07-tipos-de-dados.md; o que o professor enfatizou em aula
pesa mais que a ordem da ementa.
```

### Com foco específico

```
/estudar-topico

Tópico 9 — Cálculo Lambda. Estou travando em redução beta e captura de variável.
Puxe essa parte para o início e trate com mais profundidade que o resto.
```

### Continuações dentro da sessão

```
A seção de comparação entre linguagens ficou rasa em Prolog. Reescreva só ela,
com exemplos concretos.
```

```
Me dê só as questões no estilo do professor deste módulo, sem as respostas.
Vou tentar e te mando.
```

```
Compare o que você escreveu em @handbook/07-tipos-de-dados.md com a questão 2 da
@provas-antigas/final/final3.pdf. O módulo prepara para aquela questão? O que falta?
```

### Revisão antes da prova

```
Leia todos os módulos em handbook/ e monte um resumo de uma página por tópico,
só com o que eu preciso conseguir reproduzir de cabeça. Salve em handbook/00-revisao.md.
```

---

## 3. Resolver uma lista

### Abertura

```
/resolver-lista

Lista 2. Enunciado em @listas/lista-02/enunciado.md.
```

### Durante — enviando sua tentativa

```
Questão 3: acho que a gramática é ambígua porque dá para derivar "a + b * c"
de dois jeitos, mas não consegui desenhar a segunda árvore. Minha tentativa:

S -> S + S | S * S | id

Está certo? Onde travei?
```

```
Não faço ideia de como começar a 5. Me dá só a primeira pergunta que eu deveria
estar me fazendo, não a resposta.
```

```
Tentei assim, mas o raciocínio pode estar furado — me diz se o erro é de conceito
ou só de execução: [sua resposta]
```

### Quando travar de vez

```
Travei na 6. Mostra a resolução completa e depois me dá uma variação para eu
resolver sozinho.
```

### Fechamento

```
Terminamos a lista. Faz o fechamento: onde tropecei, o que revisar, e as questões
extras sobre os pontos fracos.
```

```
Salva a versão final em @listas/lista-02/resolucao.md num formato que eu consiga
copiar à mão sem me perder.
```

### Treino com provas antigas

```
Aplica @provas-antigas/midterm/midterm12.pdf em mim como simulado: uma questão por
vez, sem me mostrar a resposta antes de eu tentar. No fim, corrige e dá a nota.
```

---

## Prompts que funcionam mal

**Vago demais** — "me ajuda com LP" ou "explica tipos". Sem tópico e sem arquivo, a
resposta vira genérica e você perde o alinhamento com a ementa do seu professor.

**Pedindo tudo de uma vez** — "gera o handbook inteiro" ou "resolve a lista toda". O
orçamento de resposta se divide e nada sai em profundidade. Um tópico, uma questão.

**Sem apontar o arquivo** — "estuda tipos de dados" em vez de referenciar
`@material/slides/07-...md`. O Claude até acha o arquivo sozinho, mas gasta turnos
procurando o que você já sabe onde está.

**Pedindo a resposta antes de tentar** — funciona, e é exatamente o que te derruba numa
prova sem consulta. Se for fazer, peça a variação depois.

---

## Sugestão: uma terceira skill

Transcrição é o fluxo mais repetitivo dos três e não tem skill. Se você se pegar
reescrevendo os prompts da seção 1 toda semana, vale criar
`.claude/skills/transcrever/SKILL.md` com as convenções fixas (nomenclatura dos arquivos,
o que preservar, o que descartar) e passar a invocar só com o caminho do PDF.