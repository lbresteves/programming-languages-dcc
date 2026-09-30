---
name: completar-lista
description: Gera a resolução completa de uma lista de exercícios de LP (DCC024), questão por questão, com o assunto, a resposta e o porquê, e no fim as questões de provas antigas relacionadas. Publica como subtópico da aula no Fumadocs (docs/content/docs/aula-NN/lista-NN.mdx). Também resolve provas antigas como subtópicos da aula de revisão. Use quando eu pedir a resolução completa de uma lista ou prova, ou quando eu invocar /completar-lista.
---

# Resolução completa de lista (e de prova antiga)

A `/resolver-lista` é o modo **guiado** (dica → minha tentativa → correção). Esta skill é o
modo **gabarito**: resolve a lista inteira, explicando o porquê, para eu revisar e conferir
o que fiz à mão. Como a prova é sem consulta, a página é montada para eu **tentar antes de
ler**: a resposta de cada questão fica recolhida.

## Entrada

- `/completar-lista NN` → uma lista. `/completar-lista 1a-prova` → todas as listas da 1ª
  prova (Listas 1–12) e as provas antigas de `material/provas-antigas/1a-prova/`.
- Enunciado: `listas/lista-NN/enunciado.md`. Se só houver PDF, transcreva primeiro (mesmas
  regras da `/transcrever-pdf`). Se nem o PDF existir, baixe de
  `https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/listaN.pdf`.

## Antes de resolver, leia

1. As minhas anotações da aula (`docs/content/docs/aula-NN/index.mdx`) e as notas do
   professor (`material/professor-notes/`): a resposta usa a terminologia e os exemplos de
   aula.
2. `listas/lista-NN/resolucao.md`, se existir: é o registro das sessões guiadas. Não
   contradiga o que já foi corrigido ali; traga os meus erros para a página (bloco
   "⚠️ Meu erro").
3. `learning-records/`: questão que toca conceito **frágil** ganha um aviso.
4. `material/provas-antigas/<pasta>/compilado-de-questoes.md`: para ligar cada assunto às
   provas (seção final da página).

## Chave aula × lista

Use o número da **lista** como chave (a numeração de aulas da ementa é furada). Na 1ª prova,
a aula NN corresponde à lista NN (01–12). A Lista 13 (registros de ativação, aula de 30/09)
é **depois** da 1ª prova e entra na 2ª.

## Onde publicar (Fumadocs)

Cada aula é uma pasta com a anotação como índice e as resoluções como subtópicos:

```
docs/content/docs/
  aula-05/
    index.mdx        ← minhas anotações (antes aula-05.mdx; a URL /docs/aula-05 não muda)
    lista-05.mdx     ← esta skill
    meta.json        ← { "title": "Aula 05 - …", "pages": ["lista-05"] }
  aula-revisao-01-12/
    index.mdx
    prova-22.mdx …   ← provas antigas resolvidas
    meta.json
```

- Se a aula ainda for um arquivo solto, mova com `git mv aula-NN.mdx aula-NN/index.mdx`.
  Não liste `index` em `pages`: o Fumadocs usa o `index.mdx` como página da própria pasta.
- O `meta.json` da raiz continua listando `aula-NN` (agora é a pasta).
- Frontmatter: `title: Lista NN - Resolução` e `description:` com o tema da lista.
- No fim da `index.mdx` da aula, um link para a resolução, se ainda não houver.

## Formato de cada questão

```mdx
## Questão 3 — `fourth`

**Assunto:** casamento de padrões com `::` (Aula 06) · **Tipo:** implementação

> Enunciado resumido em uma ou duas linhas, com o código que a questão dá.

<details>
<summary>Resposta</summary>

```sml
fun fourth (_ :: _ :: _ :: t :: _) = t;
```

**Por quê:** o raciocínio em poucas linhas, com o conceito que decide a questão.

</details>
```

- **Assunto** = conceito + aula. **Tipo** = conceitual, rastreio ou implementação.
- **Por quê** é obrigatório: é o que a prova cobra ("por que X é assim nesta linguagem").
  Quando o conceito existir em outras linguagens, contraste com C, Java, Python, SML e
  Prolog, mas só quando ajudar, sem virar tabela obrigatória.
- Código **sintaticamente correto**: é o que eu vou decorar. Curto e legível, nunca esperto.
  Se não houver como executar e houver dúvida, diga na própria resposta.
- Questões "execute e diga o que imprime" que dependem da máquina (endereços, `gcc` antigo):
  dê o resultado típico e explique **o mecanismo**, que é o que cai.
- Questão aberta (quine, opinião, pesquisa): uma resposta possível e o critério de uma boa
  resposta.
- Erros no enunciado original: resolva o que a questão claramente quer e avise numa linha.

## Fim da página

1. **Questões de prova relacionadas:** para cada assunto da lista que caiu em prova antiga,
   a prova e a questão, o formato da pergunta e um link para a resolução
   (`/docs/aula-revisao-01-12/prova-NN`). Use a frequência do compilado.
2. **Para treinar:** duas ou três variações das questões centrais, sem resposta.

## Provas antigas (subtópicos da aula de revisão)

Mesmo formato, uma página por prova (`prova-NN.mdx`). Uma prova idêntica a outra (ex.: 25 =
23) vira uma página só, com as duas no título. Se a prova já tiver `# Resolução` no `.md`,
use-a como base (inclusive os blocos "⚠️ Meu erro"). No fim, em vez de "questões de prova
relacionadas", aponte as **listas** onde o mesmo assunto foi treinado.

## Depois de gerar

- Compile as páginas MDX para garantir que o site continua gerando (o `@mdx-js/mdx` de
  `docs/node_modules` serve).
- No terminal: as páginas criadas, as listas/provas sem enunciado, os erros de enunciado
  encontrados e o que não pôde ser verificado executando.
