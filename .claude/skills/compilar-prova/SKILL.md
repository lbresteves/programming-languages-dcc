---
name: compilar-prova
description: Compila as provas antigas de uma pasta (1a-prova ou 2a-prova) num único arquivo de questões agrupadas por tópico, ordenadas do tópico que mais cai para o que menos cai, com uma tabela de frequência no topo. Use quando eu pedir para ver quais tópicos caem mais, para compilar ou agrupar questões de provas antigas, ou quando eu invocar /compilar-prova.
---

# Compilar questões de provas antigas por tópico

O professor repete assuntos (e às vezes provas inteiras). Este compilado mostra onde estão
os pontos: primeiro o que cai em mais provas, com todas as ocorrências juntas para eu
treinar o mesmo formato em sequência.

## Entrada

- Pasta: `material/provas-antigas/<1a-prova|2a-prova>/`. Se eu não disser qual, pergunte.
- Use só os `.md`. Se uma prova só existir em PDF, avise e ofereça `/transcrever-pdf` antes
  (não compile a partir do PDF: o compilado copia enunciados, e o `.md` é a fonte fiel).
- Leia **todos** os arquivos inteiros. Ignore as seções `# Resolução` que eu tenha
  acrescentado: o compilado só tem enunciados.

## Passo 1 — Duplicatas

Compare as provas entre si (`cmp` ou leitura). Provas idênticas contam como provas
separadas na frequência (foram aplicadas de novo, e isso é sinal de que o professor
reaproveita), mas registre a duplicata no cabeçalho e, nos itens, liste as duas origens
juntas em vez de copiar o enunciado duas vezes.

## Passo 2 — Classificar por tópico, no nível do item

A unidade é o **item** (a, b, c…), não a questão inteira: uma mesma questão costuma misturar
tópicos (ex.: "qual o tipo de `max`" e "reescreva `max` linear"). Cada item vai para
**exatamente um** tópico — sem duplicar.

- Nomeie tópicos pelo **formato da pergunta**, como o professor cobra ("Dar o tipo de uma
  função SML", "Funções de alta ordem", "Verificações em tempo de execução"), não pelo
  capítulo do livro.
- Mantenha um item junto do seu contexto quando ele não se sustenta sozinho (ex.: uma
  sequência a→d em que cada parte usa a anterior fica num tópico só).
- Anote a aula correspondente em `material/ementa.md` (use o número da **aula**, e o da
  lista quando houver; lembre que o índice da ementa é furado — confira pelo título).

## Passo 3 — Frequência e ordem

- **Frequência** = nº de provas em que o tópico aparece ÷ nº total de provas da pasta.
  Escreva em porcentagem com vírgula decimal (37,5%).
- **Ordem**: maior frequência primeiro. Empate → mais provas **distintas** (sem contar
  duplicatas) primeiro → mais itens primeiro.

## Passo 4 — Saída

Arquivo `material/provas-antigas/<pasta>/compilado-de-questoes.md`:

1. Cabeçalho curto: quantas provas, quais, duplicatas, critério de contagem, data.
2. **Tabela** no topo: `# | Tópico | Frequência | Provas | Itens | Aula | Revisão`. A
   coluna Revisão vem do Passo 5 (⭐ quando o professor disse que cai).
3. Um bloco por tópico, na ordem da tabela:

   ```markdown
   ## Tópico N — <nome> [aparece em X% das provas (provas 22, 25 e 28)]

   **N.1** (prova 28, Q2a) <enunciado copiado>
   ```

   - Numeração `N.k` contínua dentro do tópico.
   - Enunciado **copiado fielmente** do `.md`, com o código e as figuras (as notas
     `[!NOTE]` de figura podem ser resumidas em uma linha). Inclua o trecho do enunciado-mãe
     que o item precisa para fazer sentido (o código de `max`, a gramática etc.).
   - Não resolva nada. Não inclua a questão extra de cultura geral.

## Passo 5 — Anotações

Verifique se existe alguma anotação de revisão minha, lá provavelmente tem algo que o professor falou que vai cair.

- Onde: `docs/content/docs/aula-revisao-*.mdx` (a da prova em questão), blocos
  **"Ênfase / pode cair"** e a seção "Avisos sobre a prova".
- Cada dica vira ⭐ na coluna Revisão da tabela e o selo abaixo no título do tópico,
  **depois** da frequência (não no lugar dela).
- Abaixo da tabela, uma tabela "O que o professor sinalizou na revisão": dica → aula →
  tópico → em quais provas antigas caiu. Destaque as dicas que caíram pouco ou **nunca**
  caíram: elas valem mais do que a frequência sugere.

```markdown
## Tópico N — <nome> [Altas chances de cair (revisão)]

**N.1** (prova 28, Q2a) <enunciado copiado>
```

## Depois de gerar

No chat, dê só a tabela resumida e duas ou três observações do que o padrão sugere para a
minha revisão, cruzando com `learning-records/` (tópico frequente + conceito frágil =
prioridade). Se o arquivo já existir, regenere-o inteiro, não acrescente.
