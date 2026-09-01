---
name: resolver-lista
description: Conduz a resolução guiada de uma lista de exercícios de LP (DCC024), uma questão por vez, com dica → tentativa do aluno → correção. Use quando eu pedir ajuda com uma lista, com um exercício da disciplina, ou quando eu invocar /resolver-lista.
---

# Resolução guiada de lista

As listas são entregues manuscritas e valem nota, e as provas são sem consulta. O objetivo
é eu **saber resolver**, não ter a resolução pronta.

## Diagnóstico (primeiro passo, sempre)

Leia o enunciado em `listas/lista-NN/`. Se só houver PDF, transcreva para `enunciado.md`
primeiro — fica pesquisável e barato de reler. Se já houver `enunciado.md`, apenas abra e leia.

Produza um mapa da lista: para cada questão, identifique
(a) qual conceito da ementa está sendo cobrado,
(b) a dificuldade,
(c) o tipo — conceitual, rastreio de execução, ou implementação.

Cheque se existe o módulo correspondente em `handbook/`. Se não existir e a lista depender
dele, avise antes de começar.

Leia `learning-records/` e cruze com o mapa: se alguma questão toca um conceito marcado
como **frágil** ou **não demonstrado**, sinalize antes de começarmos. Essas questões são as
que mais importam — não são as mais difíceis da lista, são as que já me pegaram antes.

## Fluxo por questão

Uma questão por vez. **Espere minha resposta antes de seguir para a próxima.**

1. **Reformule o enunciado** com suas palavras. Muita questão desta disciplina é difícil só
   porque o enunciado é denso.
2. **Aponte o conceito necessário.** Se eu não demonstrar dominá-lo, revise em poucas linhas.
3. **Dê uma dica ou o primeiro passo** e me peça para tentar.
4. **Corrija com precisão.** O que está certo, o que está errado, e principalmente *por que*
   está errado. Se meu raciocínio tiver furo conceitual, ataque o furo, não só o resultado.
5. **Se eu travar de vez ou pedir**, mostre a resolução completa — e em seguida proponha uma
   variação do mesmo problema para eu resolver sozinho.

## Código

A resposta final é escrita à mão, então não há rotina de execução. O que importa:

- **Aponte erro de sintaxe meu sempre**, mesmo que a lógica esteja certa — a prova desconta.
- O código que você me mostrar precisa estar correto, porque é o que eu vou reproduzir no
  papel. Se você não tiver certeza de uma construção, diga em vez de chutar.
- Se eu pedir para conferir alguma sintaxe específica, aí sim rode em `rascunho/`.
- Prefira o legível ao esperto.

## Registro

Grave a versão final em `listas/lista-NN/resolucao.md`, com a resposta e uma linha sobre o
raciocínio de cada questão. Caso eu não tenha pedido a lista inteira, grave apenas as questões que resolvemos juntos. Se eu pedir, você pode gerar a versão final de toda a lista, mesmo que não tenhamos resolvido todas as questões.

### learning-records

Cada questão que eu errei ou resolvi com dificuldade gera ou atualiza um arquivo em
`learning-records/NNNN-nome-do-conceito.md`. Um arquivo por **conceito**, não por questão —
se eu errei duas questões pelo mesmo furo, é um registro só.

Atualize o registro existente quando o conceito reaparecer, mantendo o histórico de status.
Um conceito que oscila entre frágil e demonstrado ao longo de três listas não está
consolidando, e isso precisa aparecer.

### Fechamento

Ao fechar a lista, me dê:
- os conceitos em que eu tropecei, com o status que cada um recebeu;
- o que revisar antes da prova, priorizando o que já apareceu em mais de uma lista;
- duas ou três questões extras no estilo do professor sobre os pontos fracos.