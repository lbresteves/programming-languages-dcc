sentence --> expr_nominal, predicado.

expr_nominal --> artigo, nome.
expr_nominal --> artigo, nome, expr_preposicional.

predicado --> verbo.
predicado --> verbo, expr_nominal.
predicado --> verbo, expr_nominal, expr_preposicional.

expr_preposicional --> preposicao, expr_nominal.

nome --> [menina]; [pato]; [pena].
preposicao --> [com]; [ate].
verbo --> [viu]; [esta]; [e]; [canta]; [toca]; [come].
artigo --> [a]; [o]; [um]; [uma].
