# Respostas — Tópico 8: Polimorfismo

> Não abrir antes de tentar. Ver `handbook/08-polimorfismo.md` para as perguntas.

## 1. Como o polimorfismo facilita a programação?

Permite escrever **uma** função que serve para vários tipos, em vez de duplicar código
para cada tipo. Exemplo: sem sobrecarga, C++ precisaria de `sumInt`, `sumDouble`,
`sumFloat`... cada uma com nome diferente, e o programador teria que lembrar/escolher o
nome certo manualmente a cada chamada.

## 2. Paramétrico em Java × ML

Em Java, genéricos são checados em compilação mas o compilador aplica **type erasure**:
no *bytecode*, `List<String>` vira `List` puro, tratando os elementos como `Object` e
inserindo *casts* automáticos nos pontos de leitura. Em ML, a variável de tipo (`'a`)
nunca é apagada porque nunca existiu como informação "extra" — o compilador infere o tipo
e a mesma função compilada funciona para qualquer instanciação, sem gerar código
específico por tipo nem precisar descartar nada depois.

## 3. Classificação

(a) `sum(int,int)`/`sum(double,double)` — **sobrecarga** (duas definições, escolha pelo
tipo do argumento).
(b) `f(1)` chamando `f(double x)` — **coerção** (uma definição, `int` convertido para
`double`).
(c) `List<T> reverse(List<T> l)` — **paramétrico** (`T` é variável de tipo).
(d) `print(Object o)` recebendo `String` — **subtipagem** (`String` é subtipo de
`Object`).

## 4. Por que overloading é finito e subtipagem é infinita

Overloading: o número de tipos aceitos é **exatamente** o número de definições que o
programador escreveu — cada tipo novo exige uma definição nova, escrita à mão, então o
total é sempre um número fixo e finito (o que já foi declarado). Subtipagem: o número de
tipos aceitos é o número de subtipos existentes, e **não há limite de linguagem** para
quantas subclasses/implementações podem ser criadas — a mesma função (`print(Object o)`)
aceita automaticamente qualquer subtipo criado no futuro, sem precisar de nova definição.

## 5. Por que `fun op + (a, b) = a - b;` não é sobrecarga

Sobrecarga exige que **duas ou mais implementações coexistam**, escolhidas pelo tipo do
argumento. Em SML, essa definição **substitui** o significado anterior de `+` — depois
dela, só existe uma implementação de `+` no escopo (a nova), e a antiga é inacessível.
Não há despacho por tipo: é redefinição/sombreamento de nome, não polimorfismo ad-hoc.

## 6. O erro na frase "coerção e sobrecarga são a mesma coisa, uma implícita outra explícita"

Erra o critério de distinção: a diferença não é "implícita vs. explícita" (aliás, existe
coerção **explícita**, como um *cast*, e a sobrecarga sempre é "implícita" no sentido de
que o programador não escolhe manualmente qual versão roda). A diferença real é **quem
decide o quê**: sobrecarga escolhe **qual definição** rodar, olhando o tipo do argumento;
coerção escolhe **qual conversão** aplicar, olhando o tipo esperado pela definição (única)
que já foi escolhida.

## 7. `Interval.__add__`/`__gt__` em Python

Python é dinamicamente tipada, então normalmente "tipagem" nem é decidida antes de rodar
— mas isso não significa ausência de tipos: `i0 + i1` funciona porque, em tempo de
execução, o interpretador vê que `i0` é uma instância de `Interval` e despacha para o
método especial `__add__` definido naquela classe. Isso é polimorfismo **ad-hoc por
sobrecarga de operador**: o símbolo `+` tem uma implementação diferente por tipo
(`int.__add__`, `str.__add__`, `Interval.__add__`, ...), e o interpretador escolhe qual
rodar olhando o tipo do objeto à esquerda do operador — só que essa escolha acontece em
**runtime**, e não em compilação, porque Python não tem fase de compilação com
verificação de tipos.
