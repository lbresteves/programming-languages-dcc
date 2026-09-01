# Tempos de ligação (binding times)

- **Tópico:** 4 — Sistemas de Computação
- **Status:** frágil
- **Última verificação:** 2026-08-24

## Evidência

Lista 4, q2 (9 itens, Java): errou 6 de 9 (b não foi confirmado, c, d, e, f, g, h).
Precisou de correção repetida nos mesmos pares de fase, inclusive depois de já ter
recebido a distinção explicada.

## O furo

Várias confusões distintas, não uma só:

1. **Misturou a sequência clássica (creating, compiling, assembling, linking,
   loading, running) com os tempos de ligação** (language definition time,
   language implementation time, compile time, link time, load time, run time).
   São duas classificações diferentes da mesma aula — a primeira descreve
   *ferramentas*, a segunda descreve *quando uma propriedade é fixada*.
2. **Language definition time vs. language implementation time**: não usava o
   teste "isso muda entre implementações Java diferentes, mantendo a mesma
   especificação?" — chutou language implementation time para o tamanho do
   `int` (que é fixo pela especificação, ao contrário de C).
3. **Compile time vs. run time**: chamou de "compile time" o valor atribuído a
   uma variável (que só existe quando a atribuição roda) e de "language
   definition time" o bytecode gerado pelo `javac` (que depende do programa
   específico escrito, logo é compile time).
4. **Despacho dinâmico de método (`a.m()`)**: não reconheceu que a definição do
   método chamado depende da classe real do objeto em runtime — chutou link
   time, uma fase que nem é visível em Java (a JVM funde load+link no
   *class loader*).

## Como fechar

Praticar o teste em cascata sem consultar, para vários exemplos novos (não só
os da lista 4):
1. Fixo antes de qualquer implementação existir? → definição da linguagem.
2. Fixo pela implementação, igual pra todo programa? → implementação da linguagem.
3. Depende do programa específico escrito, decidido ao compilar? → compile time.
4. Só existe quando o código roda de fato? → run time.

Depois, comparar explicitamente com C (onde link time e load time são fases
visíveis e distintas) para não simplesmente empurrar tudo para run time em Java.

Refazer os itens (a)-(i) da questão 2 de cabeça, sem olhar a resolução, e
comparar com o gabarito.
