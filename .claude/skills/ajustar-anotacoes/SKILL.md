---
name: ajustar-anotacoes
description: Acessa o content/docs folder e ajusta as anotações de aula para que fiquem consistentes com o handbook, as notas do professor, as listas e as provas antigas, com um adendo nos assuntos que caem em muitas provas. Use quando eu pedir para ajustar anotações de aula, ou quando eu invocar /ajustar-anotacoes.
---

Minhas anotações de aula são um pouco bagunçadas. Ajuste as anotações para que fiquem consistentes com o as notas de aula, mas não altere o conteúdo de outros arquivos, o unico arquivo a ser alterado é o do content/docs que é do fuma docs.

Use as notas do professor em material/professor-notes, elas são notas que o professor usa como roteiro para as aulas e seguem um passo a passo, então as minhas notas provavelmente seguem mais ou menos a mesma ordem das notas do professor.

Cada aula tem um id (01, 02, 03,...)

Quero que deixe consistente as minhas notas e por isso voce pode acessar outras notas e também o conteúdo das listas, pois o conteudo das listas mostram o queé importante. Então consulte os dois, tanto a lista quanto as notas do profesor.

Lembre-se para ler um pdf seja de lista ou de conteúdo, leia o enunciado em `listas/lista-NN/`. Se só houver PDF, transcreva para `enunciado.md` primeiro — fica pesquisável e barato de reler. Se já houver `enunciado.md`, apenas abra e leia.

Não retire informações das minhas anotações bagunçadas, se houver coisa errada, corrija mas me avise no terminal, não escreva nos mds, nos mds já deve estar correto.

## Provas antigas

Além das notas do professor e das listas, avalie também as provas antigas em
`material/provas-antigas/` (`1a-prova/` para as aulas até a revisão de 23/09, `2a-prova/`
para o resto). Elas mostram o que o professor de fato cobra e **como** cobra.

- Comece pelo `compilado-de-questoes.md` da pasta, se existir: ele já traz a frequência de
  cada tópico e as questões agrupadas. Se não existir, leia os `.md` das provas e me sugira
  rodar `/compilar-prova` (não gere o compilado aqui: esta skill só altera `content/docs`).
- Para cada aula, veja quais tópicos dela caíram, em quantas provas e em que formato (dar o
  tipo, rastrear, implementar, tabela comparativa, "por quê").
- Se a anotação não cobre algo que as provas cobram, complete a explicação na seção
  correspondente, no mesmo estilo do resto da página.

### Adendo quando o assunto cai em muitas provas

Quando um assunto explicado na aula cai em **muitas provas** (em 25% ou mais das provas da
pasta, ou marcado com ⭐ / "Altas chances de cair" no compilado), acrescente um adendo logo
depois da explicação desse assunto:

```mdx
<Callout title="Cai em prova: 37,5% (provas 24, 28 e 29)" type="warn">
  Formato: dar uma função e perguntar o tipo dela. Exemplo: prova 28, Q2a (tipo de `max`).
  Pegadinha recorrente: o `>` sobrecarregado força `int`. Ver Tópico 4 do
  `material/provas-antigas/1a-prova/compilado-de-questoes.md`.
</Callout>
```

- O título diz a frequência e as provas; o corpo diz o **formato** da pergunta, **uma**
  questão de exemplo (prova e número) e, se houver, a pegadinha que se repete.
- Não copie o enunciado inteiro nem a resolução: o adendo aponta para o compilado.
- Um adendo por assunto. Se já existir um callout de prova sobre aquilo (ex.: "Prova 28,
  Q1"), atualize-o em vez de criar outro.
- No terminal, liste os adendos que criou ou atualizou, com a aula e o assunto.

