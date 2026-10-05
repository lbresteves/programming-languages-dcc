# Instruções invisíveis (verificações em tempo de execução)

- **Tópico:** 7 — Tipos (tipagem forte × fraca)
- **Status:** frágil
- **Última verificação:** 2026-09-30

## Evidência

Variação da prova 22, Q2 (`int d = a / b;` e `x.v[i] = 0;` em Java):
- `a / b`: acertou o teste `b != 0`. Errou ao testar se `a` e `b` são nulos (são `int`
  primitivos, que não podem ser nulos). Também propôs verificar em execução se os valores são
  `int`, o que o `javac` já garante estaticamente.
- `x.v[i] = 0`: lembrou só dos limites do índice. Esqueceu `x != null` e `x.v != null`, e não
  separou `i >= 0` de `i < x.v.length`.

## O furo

1. Primitivo (`int`) × referência: só a referência pode ser `null`.
2. Tipagem estática não gera teste de tipo em execução. Sobrecarga e coerção são resolvidas
   na compilação.
3. Cada `.` e cada `[]` num caminho de acesso gera o próprio teste de nulo.

## Como fechar

- Contar os testes de `a.b.c[i][j] = x / y;` sem consulta.
