# Lista 13 — Resolução

## 1.

Cada registro de ativação de uma função aninhada guarda o **link de aninhamento**, que
aponta para o registro da ativação mais recente da função que a envolve no texto do
programa, ou seja, a função um nível acima. A variável está no registro da função de
profundidade *m*. Partindo do registro corrente (profundidade *n*), siga o link de
aninhamento **n − m vezes**: cada salto sobe exatamente um nível, e no fim se chega ao
registro da função de profundidade *m*. Ali a variável está num **deslocamento fixo**,
conhecido em tempo de compilação. Como o escopo é estático, o compilador já conhece *n*,
*m* e o deslocamento, e gera código que faz n − m leituras do link seguidas de um acesso
pelo deslocamento. Se *m* = *n*, a variável é local e não há salto.

O link certo é o de aninhamento, e não o ponteiro para o registro anterior: numa
recursão, quem chamou `bar 2` foi `bar 3`, mas o `n` está em `foo`.

O caso *m* > *n* não precisa de tratamento porque ele nunca acontece numa referência
legítima. Com escopo estático, uma função só enxerga as próprias variáveis e as das
funções que a envolvem, e essas têm profundidade ≤ *n*. Uma variável de profundidade
*m* > *n* seria local a uma função aninhada **dentro** de alguma outra, fora do alcance
de quem faz a referência. O compilador rejeita o programa (variável não ligada), então
esse caso não chega a existir em tempo de execução.

*Raciocínio:* cada link sobe um nível, então são n − m saltos mais um deslocamento fixo.
Escopo léxico garante que m ≤ n.
