# Ementa — DCC024 Linguagens de Programação

Transcrição de [https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/), capturada em 16/08/2026.
Links recuperados das anotações do PDF (238 URLs).

Livro-texto: [Introduction to Programming Languages](http://en.wikibooks.org/wiki/Introduction_to_Programming_Languages) (Adam Webber) —
[slides do livro](http://www.webber-labs.com/mpl/lectures/index.html).

## Mapa de aulas × listas

O índice publicado lista 24 aulas, mas o corpo da ementa tem 25 seções: a aula de
**Unificação** aparece no corpo e some do índice. **Use o número da lista como chave.**
Note também que a numeração `lessonN` das notas de aula do site pula de 13 para 17.

| Data | Tópico | Lista | Notas de aula |
|---|---|---|---|
| 10/08 | Introdução — A grande diversidade | [1](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista1.pdf) | [lesson1](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson1) |
| 12/08 | Sintaxe | [2](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista2.pdf) | [lesson2](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson2/) |
| 17/08 | Mais sobre árvores de sintaxe | [3](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista3.pdf) | [lesson3](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson3) |
| 19/08 | Sistemas de Computação | [4](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista4.pdf) | [lesson4](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson4) |
| 24/08 | Introdução a ML | [5](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista5.pdf) | [lesson5](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson5) |
| 26/08 | Casamento de padrões em ML | [6](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista6.pdf) | [lesson6](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson6) |
| 31/08 | Tipos de dados | [7](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista7.pdf) | [lesson7](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson7) |
| 02/09 | Polimorfismo | [8](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista8.pdf) | [lesson8](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson8) |
| 12/09 (sáb) | O cálculo lambda | [9](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista9.pdf) | [lesson9](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson9) |
| 14/09 | Funções de alta ordem | [10](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista10.pdf) | [lesson10](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson10) |
| 16/09 | Escopo de variáveis | [11](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista11.pdf) | [lesson11](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson11) |
| 21/09 | Tipos algébricos | [12](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista12.pdf) | [lesson12](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson12) |
| 23/09 | **Aula de revisão** | — | — |
| **28/09** | **Primeira avaliação** | — | — |
| 30/09 | Registros de ativação | [13](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista13.pdf) | [lesson13](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson13) |
| 05/10 | Introdução à linguagem Python | [14](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista14.pdf) | [lesson17](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson17) |
| 07/10 | Gerenciamento de memória | [15](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista15.pdf) | [lesson18](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson18) |
| 19/10 | Tipos abstratos de dados | [16](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista16.pdf) | [lesson19](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson19) |
| 21/10 | Programação orientada a objetos | [17](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista17.pdf) | [lesson20](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson20) |
| 26/10 | Tratamento de erros | [18](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista18.pdf) | [lesson21](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson21) |
| 28/10 | Passagem de parâmetros | [19](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista19.pdf) | [lesson22](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson22) |
| 04/11 | Introdução à linguagem Prolog | [20](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista20.pdf) | [lesson23](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson23) |
| — | **Unificação** (ausente do índice) | [21](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista21.pdf) | [lesson24](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson24) |
| 09/11 | Modelos de Custos | [22](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista22.pdf) | [lesson25](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson25) |
| 11/11 | Predicados numéricos em Prolog | [23](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista23.pdf) | [lesson26](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson26) |
| 16/11 | Semântica Formal | [24](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista24.pdf) | [lesson27](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson27) |
| 18/11 | História das linguagens de programação | [25](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/listas/lista25.pdf) | [lesson28](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson28) |
| 23/11 | **Aula de revisão** | — | — |
| **25/11** | **Segunda avaliação** | — | — |
| 30/11 | Prova Suplementar | — | — |
| 02/12 | Exame Especial | — | — |

**Primeira avaliação** — 90 min, 30 pontos, sem consulta. Toda a matéria até a aula de revisão.
**Segunda avaliação** — 90 min, 40 pontos, sem consulta. Todo o curso, ênfase na 2ª metade.

Todas as listas: *"Para ser entregue. Lembre-se: respostas escritas à mão."*
Cada aula traz também um **P.O.F.** (exercício não-técnico).

---

## 1. Introdução — A grande diversidade

**Conceitos.** Existem linguagens imperativas, funcionais e lógicas; a fronteira entre esses
paradigmas não é bem definida. Diferentes paradigmas facilitam diferentes tipos de aplicação.

**Questões para discutir.** Por que existem linguagens de programação? Existe uma linguagem
mais "poderosa"? Por que existem tantas? Por que algumas são mais populares que outras? Por
que algumas são mais eficientes? O que é uma boa linguagem de programação? Por que é
importante aprender sobre linguagens de programação? Considere sua linguagem favorita: há
algo que você adicionaria ou mudaria? Pense em aplicações mais facilmente implementadas em
cada um dos três paradigmas principais.

**Leitura.**
- [Introdução à Linguagens de Programação](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/readingMat/IntroLecture.pdf) (slides da aula)
- [Página do Laboratório de Compiladores](http://lac.dcc.ufmg.br/)
- [A pesquisa em compiladores na UFMG](https://homepages.dcc.ufmg.br/~fernando/projects/CompilerResearchUFMG.pdf)
- [Why you should learn other languages](http://www.joelonsoftware.com/articles/ThePerilsofJavaSchools.html) (Joel Spolsky, *The Perils of Java Schools*)
- **Importante: Capítulo 1** do [livro](http://en.wikibooks.org/wiki/Introduction_to_Programming_Languages)

---

## 2. Sintaxe

**Conceitos.** A sintaxe e a estrutura léxica determinam a *aparência* dos programas; a
semântica determina o *significado* de cada construto. Como escrever uma gramática simples.

**Questões para discutir.** Haveria outro jeito de descrever uma linguagem de programação?
Qual o problema de representar os tokens dentro da gramática?

**Leitura.**
- [Sintaxe de Linguagens de Programação](http://www.cs.uiowa.edu/~slonnegr/plf/Book/Chapter1.pdf), seções 1.1, 1.2 e 1.3 (Slonneger, cap. 1)
- [O triângulo de Sierpinski](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/readingMat/sierpinski.pdf), como motivação
- [LinF](http://www.dcc.ufmg.br/~fernando/projects/LinF), uma linguagem que gera sistemas-L
- [minijava](http://compilers.cs.ucla.edu/cs132/project/minijava.html), exemplo de gramática — subconjunto de Java usado em trabalhos práticos
- **Importante: Capítulo 2** do livro

---

## 3. Mais sobre árvores de sintaxe

**Conceitos.** Precedência entre operadores. Associatividade. Gramáticas ambíguas permitem
construir duas árvores de sintaxe diferentes para o mesmo texto. Árvores de sintaxe abstrata.

**Questões para discutir.** Quantos níveis de precedência tem sua linguagem favorita? O que
significa o trecho C `a = b < c ? * p + b * c : 1 << d ()`? Qual é a história das gramáticas
em linguagens de programação?

**Leitura.**
- [Sintaxe de Linguagens de Programação](http://www.cs.uiowa.edu/~slonnegr/plf/Book/Chapter1.pdf), seção 1.4
- [Gramáticas em Prolog](http://www.cs.uiowa.edu/~slonnegr/plf/Book/Chapter2.pdf), páginas 46 (Prolog Grammar Rules) a 50
- [A história de Métodos de Parsing](https://jeffreykegler.github.io/personal/timeline_v3)
- [Tabela de precedência em Java](https://introcs.cs.princeton.edu/java/11precedence/)
- [Tabela de precedência em C](http://www.ime.usp.br/~pf/algoritmos/apend/precedence.html)
- **Importante: Capítulo 3** do livro

---

## 4. Sistemas de Computação

**Conceitos.** Pré-processadores (`gcc -E`), compiladores (`cc1`; ver `gcc -S` para o
assembly), montadores (`as`), ligadores (`ld`), carregadores (`./a.out`), interpretadores
(`bash`), máquinas virtuais (JavaVM), depuradores (`gdb`), compiladores just-in-time
(Mozilla lendo JavaScript).

Tempo de ligação: durante a definição da linguagem · durante a implementação da linguagem ·
durante a compilação · durante a ligação (link time) · durante o carregamento (load time) ·
durante a execução (run time).

**Questões para discutir.** O que acontece ao digitar `gcc main.c ; ./a.out`? E
`javac Main.java ; java Main`? O que acontece quando o navegador executa uma applet Java?
Como funciona o gdb? Quais as vantagens de um compilador sobre um interpretador, e vice-versa?

**Leitura.**
- [Compiladores](http://en.wikipedia.org/wiki/Compiler)
- [Debugadores](http://en.wikipedia.org/wiki/Debugger) · [tutorial sobre gdb](http://www.cs.cmu.edu/~gilpin/tutorial/)
- [Interpretadores](http://en.wikipedia.org/wiki/Interpreter_(computing))
- [Máquinas virtuais](http://en.wikipedia.org/wiki/Virtual_machine)
- [Compilador just-in-time](http://en.wikipedia.org/wiki/Just_in_time_compiler)
- **Importante: Capítulo 4** do livro

**Exercícios.** Lista 4 — para o exercício 2, ver os [slides do livro](http://www.webber-labs.com/wp-content/uploads/2015/08/mpl-04.pdf).

---

## 5. Introdução à ML

**Conceitos.** Máquina de Turing versus Cálculo Lambda. ML é uma linguagem funcional. O
conceito de referência não é definido em ML básica. Tuplas e listas são tipos de dados em
ML. Construtores de tipos, por exemplo `*`, `->` e `list`. Recursividade de cauda.

**Questões para discutir.** Quais as semelhanças entre ML e Java? E as diferenças? Quais as
vantagens de usar uma linguagem sem referências para dados mutáveis?

**Leitura.**
- [SML](http://en.wikipedia.org/wiki/Standard_ML)
- [Tutorial sobre SML](http://homepages.inf.ed.ac.uk/stg/NOTES/) (contribuição do Wladston)

---

## 6. Casamento de Padrões em ML

**Conceitos.** Casamento de padrões é típico de linguagens funcionais.

**Questões para discutir.** Por que linguagens como C ou Java não possuem casamento de padrões?

**Leitura.**
- [Casamento de padrões](http://en.wikipedia.org/wiki/Pattern_matching)

**Exercícios.** Lista 6 — consultar os [slides do livro](http://www.webber-labs.com/wp-content/uploads/2015/08/mpl-07.pdf).

---

## 7. Tipos de dados

**Conceitos.** Um tipo de dado é um conjunto. Existem tipos primitivos e compostos.
Linguagens fortemente tipadas versus fracamente tipadas. Verificação de tipos dinâmica
versus estática. Equivalência de tipos estrutural versus nominal.

**Questões para discutir.** Encontre exemplos de tipagem fraca em C. Compare verificação
dinâmica versus estática. Compare equivalência estrutural versus nominal. Em equivalência
estrutural (ex.: OCaml), `int * int * int` é subtipo de `int * int` — explique este paradoxo.

**Leitura.**
- [Tipos de dados](http://en.wikipedia.org/wiki/Type_system)
- [What to know before debating about types](http://blogs.perl.org/users/ovid/2010/08/what-to-know-before-debating-type-systems.html)
- **Importante: Capítulo 7 (Types)** do livro

**Exercícios.** Lista 7 — consultar os [slides do livro](http://www.webber-labs.com/wp-content/uploads/2015/08/mpl-06.pdf).

---

## 8. Polimorfismo

**Conceitos.** Uma função é polimórfica se tem pelo menos dois tipos diferentes.
Polimorfismo ad-hoc (número finito de variações): sobrecarga (overloading) e coerção.
Polimorfismo universal (número potencialmente infinito): paramétrico e de subtipagem.

**Questões para discutir.** Como o polimorfismo facilita a programação? Compare polimorfismo
paramétrico em Java e ML.

**Leitura.**
- [Polimorfismo de tipos](http://en.wikipedia.org/wiki/Polymorphism_(computer_science))
- [Polimorfismo em linguagens orientadas a objetos](http://en.wikipedia.org/wiki/Polymorphism_in_object-oriented_programming#Parametric_Polymorphism)

---

## 9. O Cálculo Lambda

**Conceitos.** O Cálculo Lambda é uma notação para descrever computações tão poderosa quanto
a máquina de Turing. Variáveis livres. Funções currificadas. Reduções lambda: alfa, beta e
eta. Existem diferentes estratégias de redução.

**Questões para discutir.** Por que Máquinas de Turing são usadas no ensino de fundamentos
de computação, em vez do Cálculo Lambda?

**Leitura.**
- [O Cálculo Lambda](https://www.irif.fr/~mellies/mpri/mpri-ens/biblio/Selinger-Lambda-Calculus-Notes.pdf), capítulos 1–3 (notas de Peter Selinger)
- [Representando números e valores booleanos usando lambdas](https://en.wikipedia.org/wiki/Church_encoding)
- [O cálculo Lambda para desenvolvedores](https://www.simonholywell.com/post/the-lambda-calculus-for-developers/)
- [Slides para a aula](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/readingMat/lambdaHistory.pdf)

---

## 10. Funções de Alta Ordem

**Conceitos.** Uma função que não usa outra função como parâmetro ou valor de retorno tem
ordem zero. Uma que usa tem ordem n+1, onde n é a mais alta ordem entre as funções usadas.
`map`, `foldr` e `foldl` são funções de alta ordem.

**Questões para discutir.** Como são funções de alta ordem em C? E em Java? Por que essas
funções demoraram tanto para aparecer em Java?

**Leitura.**
- [Funções de alta ordem](http://en.wikipedia.org/wiki/Higher-order_function)
- **Importante: Capítulo 11 (High-Order Functions)** do livro

---

## 11. Escopo

**Conceitos.** O escopo de uma definição é a parte do programa onde aquela definição é
válida. Linguagens usam blocos e espaços de nomes para criar escopos. Escopo estático versus
dinâmico. Closures.

**Questões para discutir.** Qual a vantagem de linguagens com escopo dinâmico? Quais os
mecanismos usados por sua linguagem favorita para criar escopos?

**Leitura.**
- [Structs e Signatures em SML](http://people.cs.umass.edu/~creichen/csci3155-s07/handout-F.pdf)
- [Escopo](http://en.wikipedia.org/wiki/Scope_(programming))
- [Closures](http://en.wikipedia.org/wiki/Closure_(computer_science))

**P.O.F.** tribal — vale 0,5 ponto por membro do grupo que cumprir todas as
[regras](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/pofs/group.html), até 07/06/2026.

---

## 12. Tipos Algébricos

**Conceitos.** Em ML, novos tipos de dados são definidos com a palavra `datatype`. `Bool` e
`list` são tipos algébricos. Construtores de tipos: simples, com valores-parâmetros, e
recursivos.

**Questões para discutir.** Compare a implementação de árvores de dados em ML e em Java.
Quais os aspectos mais interessantes de ML? Por que linguagens funcionais são pouco populares?

**Leitura.**
- [Tipos de dados algébricos](http://en.wikipedia.org/wiki/Algebraic_data_type)
- [Datatypes em SML](http://www2.imm.dtu.dk/courses/02153/fun/chapter7.4.pdf)
- [Por que linguagens funcionais não são tão populares](http://portal.acm.org/citation.cfm?id=286387)

---

## 13. Registros de ativação

**Conceitos.** As variáveis de um programa precisam ser armazenadas em algum lugar.
Registros de ativação (activation record): estático e dinâmico. Ponteiro de aninhamento
(nesting link). Variáveis estáticas.

**Questões para discutir.** Como a recursão de cauda é otimizada? O que existe em um registro
de ativação?

**Leitura.**
- [Pilha de Memória (stack frame)](http://en.wikipedia.org/wiki/Call_stack)
- [Registro de ativação](http://www.cs.princeton.edu/courses/archive/spring04/cos320/notes/7-1.pdf)
- [Slides sobre o assunto da aula](http://www.webber-labs.com/wp-content/uploads/2015/08/mpl-12.pdf)

---

## Aula de revisão (23/09)

Dicas do professor: entenda as notas e exemplos dados em aula; leia os
[slides do livro](http://www.webber-labs.com/mpl/lectures/index.html); faça as listas de
exercícios; faça todos os P.O.F's. Se cansarem, ele recomenda parar tudo para escutar
[Build Me Up Buttercup](http://www.youtube.com/watch?v=iol0B-clFFM).

**Provas anteriores (primeira avaliação):**
[1](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm1.pdf) ·
[2](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm2.pdf) ·
[3](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm3.pdf) ·
[4](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm4.pdf) ·
[5](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm5.pdf) ·
[6](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm6.pdf) ·
[7](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm7.pdf) ·
[8](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm8.pdf) ·
[9](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm9.pdf) ·
[10](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm10.pdf) ·
[11](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm11.pdf) ·
[12](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm12.pdf) ·
[13](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm13.pdf) ·
[14](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm14.pdf) ·
[15](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm15.pdf) ·
[16](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm16.pdf) ·
[17](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm17.pdf) ·
[18](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm18.pdf) ·
[19](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm19.pdf) ·
[20](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm20.pdf) ·
[21](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm21.pdf) ·
[22](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm22.pdf) ·
[23](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm23.pdf) ·
[24](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm24.pdf) ·
[25](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm25.pdf) ·
[26](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm26.pdf) ·
[27](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm27.pdf) ·
[28](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm28.pdf) ·
[29](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/midterm29.pdf)

---

## 14. Introdução à Linguagem Python

**Conceitos.** Linguagens imperativas. Referências. Comandos e iterações. Efeitos colaterais
(side effects). Linguagens dinâmicas: tipagem dinâmica, execução de código carregado
dinamicamente, alocação dinâmica de memória. Máquinas virtuais e interpretadores.

**Questões para discutir.** Qual o porquê dos princípios de programação que norteiam o
projeto de Python? Em que outras linguagens esses princípios são vistos? Quais as vantagens
e desvantagens de máquinas virtuais?

**Leitura.**
- [Site oficial de Python](http://www.python.org/)
- [Python wiki](http://en.wikipedia.org/wiki/Python_%28programming_language%29)
- [O tutorial definitivo sobre Python](http://docs.python.org/tutorial/)

---

## 15. Gerenciamento de memória

**Conceitos.** Memory heap versus memory stack: função e forma de implementação. O
gerenciamento do heap: como encontrar novos blocos vagos (first-fit e best-fit),
fragmentação e coalescing. Coleta de lixo: marcação e varredura (mark and sweep), cópia e
coleta, contagem de referências. Erros por mau uso de memória: vazamentos (memory leak) e
ponteiro cego (dangling pointer).

**Questões para discutir.** Como programadores gerenciam memória em C/C++? Valgrind.

**Leitura.**
- [Diversas técnicas de gerenciamento de memória](http://www.ibm.com/developerworks/linux/library/l-memory/)
- [Coleta de Lixo](http://en.wikipedia.org/wiki/Garbage_collection_(computer_science))
- [Valgrind](http://en.wikipedia.org/wiki/Valgrind)

**Exercícios.** Lista 15 — a classe [HeapManager.py](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/srcs/l15/HeapManager.py) será necessária.

---

## 16. Tipos Abstratos de Dados

**Conceitos.** Um TAD é um tipo definido pelas operações e dados, e não como um conjunto de
valores. Diferentes linguagens oferecem recursos diferentes:

- **C**: interfaces em header files, implementações em arquivos `.c`.
- **SML**: `signatures` para interfaces, `structs` para implementações.
- **Python**: classes sem mecanismos de encapsulação.
- **Java**: `interfaces` para interfaces, classes para implementações; encapsulação de propriedades.

Algumas linguagens, como Python, provêem herança múltipla (mas isso traz problemas).

**Questões para discutir.** Herança múltipla: bom ou ruim? Como simular herança múltipla?
Como simular polimorfismo paramétrico?

**Leitura.**
- [Tipos abstratos de dados](http://en.wikipedia.org/wiki/Abstract_data_type)
- [Herança Múltipla](http://en.wikipedia.org/wiki/Multiple_inheritance)
- [Mixins](http://en.wikipedia.org/wiki/Mixin)

**Exercícios.** Lista 16 — as classes em
[List.py](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/srcs/l16/List.py) e
[Worklist.py](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/srcs/l16/Worklist.py) serão necessárias.

---

## 17. Programação Orientada a Objetos

**Conceitos.** POO não é exatamente um paradigma de linguagens de programação; é mais uma
filosofia, um estilo de programação. Visão antropomórfica de objetos: um objeto sabe como
executar ações em si mesmo. Funcionalidades comuns: objetos, métodos, subtipagem.

**Questões para discutir.** Por que a programação orientada por objetos é tão popular na
indústria?

**Leitura.**
- [Programação Orientada à Objetos](http://en.wikipedia.org/wiki/Object-oriented_programming)
- [POO em Python](http://www.ibiblio.org/g2swap/byteofpython/read/oops.html)
- [POO em Java](http://java.sun.com/docs/books/tutorial/java/concepts/)

**Exercícios.** Lista 17 — [estas classes](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/srcs/l17/) podem facilitar o trabalho.

---

## 18. Tratamento de Erros

**Conceitos.** Exceções são eventos anormais que podem ocorrer durante a execução.

- **SML**: disparar com `raise`, declarar com `exception`, capturar com `handle`.
- **Python**: blocos `try` e `except`; não é necessário estender uma classe em particular; `finally`.
- **Java**: blocos `try` e `catch`; declarações `throws` e classes `throwable`; `finally` e
  `finalize`. Exceções podem ser verificáveis (checked) ou não-verificáveis (unchecked).

**Questões para discutir.** Qual o papel das exceções em garantir a forte tipagem de
linguagens como Python, Java e ML? Quais as vantagens e desvantagens entre exceções checked
e unchecked?

**Leitura.**
- [Como exceções são implementadas em C++](https://stackoverflow.com/questions/490773/how-is-the-c-exception-handling-runtime-implemented)
- [10 boas dicas para o tratamento de exceções](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Java-Exception-handling-best-practices)
- [Tratamento de exceções em linguagens de programação](http://en.wikipedia.org/wiki/Exception_handling)
- [Exceções em Python](http://docs.python.org/tutorial/errors.html)
- [Mais exceções em Java](http://java.sun.com/docs/books/tutorial/essential/exceptions/)
- [Exceções checked e unchecked](http://www.javapractices.com/topic/TopicAction.do?Id=129)

**Exercícios.** Lista 18 — talvez seja útil usar as classes em
[Emp.py](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/srcs/l18/Emp.py).

---

## 19. Passagem de parâmetros

**Conceitos.** Parâmetros formais versus reais.

Correspondência **posicional** — parâmetros formais casados com reais pela posição na
chamada (quase todas as linguagens). Correspondência **nominal** — parâmetros anexados a
nomes que os identificam na invocação (ex.: Ada).

Tipos de passagem:

- **Por valor** — o parâmetro é como uma variável local no registro de ativação da função
  chamada, iniciada com o valor do parâmetro no momento da chamada.
- **Por resultado** — como uma variável local, porém não inicializada; antes do retorno, um
  valor é copiado no endereço do parâmetro.
- **Por valor e resultado** — mistura das duas: inicializada com o valor do parâmetro real
  antes da chamada, e um novo valor pode ser copiado nela antes do término.
- **Por referência** — o endereço do parâmetro real é computado antes da chamada; dentro do
  método esse endereço é usado como endereço do parâmetro formal, que vira um *alias* do real.
- **Por expansão de macros** — o corpo da macro é computado no contexto em que a função é
  chamada; cada ocorrência do parâmetro formal é avaliada antes de ser usada.
- **Por nome** — cada parâmetro real é avaliado no contexto da chamada, toda vez que um
  parâmetro formal é usado.
- **Por necessidade** — como por nome, mas somente na primeira vez que o parâmetro formal é
  usado; o resultado é armazenado para otimizar usos subsequentes.

**Questões para discutir.** Quais as formas de passagem de parâmetros em Python, Java e C?
Quais as vantagens e desvantagens da passagem por referência?

**Leitura.**
- [Passagem de parâmetros](http://en.wikipedia.org/wiki/Call-by-value#Call_by_value)
- [Passagem de parâmetros em linguagens funcionais](http://www.dcs.ed.ac.uk/home/stg/NOTES/node71.html)
- **Importante: Capítulo 20 (Parameter Passing)** do livro

**P.O.F.** Escreva a lista das 100 melhores coisas do mundo — a
[lista do professor](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/pofs/100coisas.html) como referência.

---

## 20. Introdução à linguagem Prolog

**Conceitos.** Prolog é uma linguagem de programação lógica. Programas consistem em termos;
há três tipos: constantes (ou átomos), variáveis e termos compostos. Programas são
executados via *queries* — uma query pergunta ao interpretador se ele é capaz de provar
alguma coisa. Regras definem uma relação lógica: `A :- B, C` significa que, se o
interpretador consegue provar que B e C são verdade, então A também é. Prolog é declarativa.
Os nomes de átomos não têm significado particular para o interpretador — servem só para
humanos entenderem os programas. Assim como em ML, listas são estruturas importantes.
Negação em Prolog é provada como a falha da query inversa.

**Questões para discutir.** Prolog é uma boa linguagem para que tipos de aplicações? Quais as
vantagens e desvantagens entre linguagens procedurais e declarativas?

**Leitura.**
- [A linguagem Prolog](http://en.wikipedia.org/wiki/Prolog)
- [O manual SWI Prolog](http://www.swi-prolog.org/pldoc/refman/) — ambiente que provavelmente será usado
- [Programação Lógica em Prolog](http://www.cs.uiowa.edu/~slonnegr/plf/Book/AppendixA.pdf) (Slonneger, apêndice A)

**Exercícios.** Lista 20 — para os exercícios 1 a 6, usar
[estas relações](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/srcs/l20/relations.txt).

---

## 21. Unificação

> Esta aula aparece no corpo da ementa mas não no índice.

**Conceitos.** A essência de Prolog é um algoritmo chamado
[unificação](http://en.wikipedia.org/wiki/Unification). **Importante: nesta aula o aluno
deve entender como representar uma query como uma árvore de busca.** Prolog escolhe sempre o
unificador mais geral (MGU — most general unifier) para unificar dois termos; U é mais geral
que S se S é uma instância de U, mas o contrário não ocorre — por exemplo,
`parent(fred, Y)` é mais geral que `parent(fred, mary)`. Não se pode unificar termos de
sintaxe diferente que incluem a mesma variável dos lados direito e esquerdo. Árvores de
prova (clause-trees ou proof-trees).

**Questões para discutir.** O que é mais complicado a respeito de Prolog, quando comparado
com outras linguagens?

**Leitura.**
- [Tutorial sobre unificação em Prolog](http://www.amzi.com/AdventureInProlog/a10unif.htm) — *faça os exercícios*

---

## 22. Modelos de Custo

**Conceitos.** Um modelo de custos descreve a complexidade das operações providas por uma
linguagem, em tempo de execução e espaço. Alguns modelos fazem parte da especificação da
linguagem (ex.: armazenamento de arranjos em C); outros dependem da implementação (ex.:
arranjos em Ada). Em Prolog e ML, ler o primeiro elemento de uma lista é O(1); reverter a
lista ou concatenar duas é O(n). Recursão de cauda é uma otimização aplicada a funções
recursivas em que a chamada recursiva é a última operação do corpo. Arranjos são armazenados
em sequências de linhas, de colunas, ou como vetores de vetores — o acesso sequencial é
sempre preferível. Buscas em Prolog apresentam caráter exponencial; às vezes o reordenamento
de cláusulas melhora o programa.

**Questões para discutir.** Até que ponto um programador deve conhecer a especificação de uma
linguagem? Existem operações inerentemente mais eficientes em linguagens que possuem arranjos?

**Leitura.**
- [Chamada de cauda](http://en.wikipedia.org/wiki/Tail_call)
- [Array programming](http://www.vector.org.uk/archive/v223/smill222.htm)
- [Recursão de cauda](http://en.wikipedia.org/wiki/Tail_recursion)
- **Importante: Capítulo sobre Cost Models** do livro

---

## 23. Predicados numéricos em Prolog

**Conceitos.** Prolog tem vários testes de igualdade:

- `is` — `X is Y` avalia Y e unifica o resultado com X. `3 is 1+2` é verdade, mas `1+2 is 3`
  não é. `X is 1+Y` produz exceção se Y não estiver associada a nenhum valor.
- `=` — `X = Y` unifica X e Y. Unificação não causa avaliação de valores numéricos, então
  `3 = 1+2` não é verdade, nem `1+2 = 3`.
- `=:=` — `X =:= Y` avalia tanto X quanto Y e sucede caso tenham o mesmo valor. Tanto
  `3 =:= 1+2` quanto `1+2 =:= 3` são verdade.

Prolog é dinamicamente tipada. É uma boa linguagem para formular soluções de problemas
NP-completos — ver, por exemplo, a cláusula `findall`.

**Questões para discutir.** A linguagem Prolog deveria ser parte da ementa de linguagens de
programação?

**Leitura.**
- [Existem empregos que requerem Prolog?](http://www.cs.kuleuven.ac.be/~dtai/projects/ALP/newsletter/archive_93_96/net/world/jobs.html)
- [99 Problemas em Prolog](https://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/)
- [Aplicações escritas em Prolog](https://arxiv.org/abs/1802.07284) — artigo *Logic Programming Applications: What Are the Abstractions and Implementations?*
- **Importante: Capítulo sobre Math in Prolog** do livro

**Exercícios.** Lista 23 — predicados de apoio do autor do livro:
[oito-rainhas (simples)](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/srcs/l23/eightqueens1.txt) ·
[oito-rainhas (complicada)](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/srcs/l23/eightqueens2.txt) ·
[problema da mochila](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/srcs/l23/knapsack.txt)

---

## 24. Semântica Formal

**Conceitos.** Enquanto a sintaxe define a aparência de uma linguagem, a semântica define seu
significado. Um jeito de definir a semântica formal de uma linguagem L1 é construir um
interpretador de L1 usando uma linguagem L2 de semântica bem definida — mas como definir a
semântica de L2? Existem notações formais para definir semântica: operacional, axiomática e
denotacional. A semântica operacional especifica, passo a passo, o que ocorre com o programa
enquanto ele é executado.

**Questões para discutir.** Até que ponto um programador deve conhecer a semântica da
linguagem que usa? Como ter certeza de que o programa faz o que se supõe que ele faça?

**Leitura.**
- [Semântica operacional](http://www.cs.uiowa.edu/~slonnegr/plf/Book/Chapter8.pdf), seções 8.5
  (não é preciso ler sobre "completeness and consistency") e 8.6
- **Importante: Capítulo sobre Semantics** do livro

**Exercícios.** Lista 24 — interpretadores disponibilizados pelo autor do livro:
[escopo dinâmico](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson27/val3.txt) ·
[escopo estático](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/lesson27/val4.txt)

---

## 25. História das Linguagens de Programação

**Conceitos.** Algoritmos surgiram muito antes dos transístores. Entre as primeiras
linguagens, citam-se Plankalkul, Fortran, Lisp e Algol. Smalltalk popularizou orientação por
objetos. SML, Prolog e Java vieram depois.

**Questões para discutir.** Pela lei de Moore, a velocidade do hardware dobra a cada 18
meses — existe alguma lei semelhante para a produtividade dos programadores? Para onde estão
indo as linguagens de programação?

**Leitura.**
- [A História das Linguagens de Programação](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/readingMat/historyPL.pdf) (slides)
- [A história das linguagens de programação](http://en.wikipedia.org/wiki/History_of_programming_languages)
- [Uma linha do tempo publicada pela O'Reilly](http://oreilly.com/news/languageposter_0504.html)
- [Mais linha do tempo (a original)](http://www.levenez.com/lang/lang.pdf)
- [How to shoot yourself in the foot using any programming language](http://www.thealmightyguru.com/Humor/Docs/ShootYourselfInTheFoot.html)
- [Beating the Average](http://www.paulgraham.com/avg.html), de Paul Graham

---

## Aula de revisão (23/11)

Mesmas dicas da primeira revisão. A matéria agora é muito maior: conceitos da primeira
metade podem ser cobrados novamente, mas a ênfase será sobre a segunda metade. Se cansarem,
desta vez o professor recomenda [Dancing in the Moonlight](http://www.youtube.com/watch?v=hMc8naeeSS8).

**Provas anteriores (segunda avaliação):**
[1](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final1.pdf) ·
[2](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final2.pdf) ·
[3](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final3.pdf) ·
[4](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final4.pdf) ·
[5](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final5.pdf) ·
[6](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final6.pdf) ·
[7](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final7.pdf) ·
[8](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final8.pdf) ·
[9](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final9.pdf) ·
[10](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final10.pdf) ·
[11](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final11.pdf) ·
[12](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final12.pdf) ·
[13](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final13.pdf) ·
[14](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final14.pdf) ·
[15](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final15.pdf) ·
[16](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final16.pdf) ·
[Online 1](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final_online1.pdf) ·
[Online 2](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final_online2.pdf) ·
[Online 3](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final_online3.pdf) ·
[Online 4](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final_online4.pdf) ·
[19](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final19.pdf) ·
[20](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final20.pdf) ·
[21](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final21.pdf) ·
[22](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final22.pdf) ·
[23](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final23.pdf) ·
[24](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final24.pdf) ·
[25](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final25.pdf) ·
[26](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final26.pdf) ·
[27](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final27.pdf) ·
[28](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final28.pdf) ·
[29](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/final29.pdf)

**Vídeos da segunda metade do curso:**
[Aulas 14 e 15](https://youtu.be/u-sDOExCjh4) ·
[Aulas 16 e 17](https://youtu.be/rtvWwLGVWEM) ·
[Aulas 18 e 19](https://youtu.be/zL8xCk9VPCA) ·
[Aulas 20 e 21](https://youtu.be/V0XJLyCh7X0) ·
[Aulas 22 e 23](https://youtu.be/p66fSPT5aGY) ·
[Aula 24](https://youtu.be/v2JoijH78Jo)

---

## Exame Especial

[Prova 1](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/special1.pdf) ·
[Prova 2](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/special2.pdf) ·
[Prova 3](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/special3.pdf) ·
[Prova 4](https://homepages.dcc.ufmg.br/~fernando/classes/dcc024/ementa/exams/special4.pdf)