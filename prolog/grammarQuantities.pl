sentenca(W) --> expr_nominal(W1), predicado(W2), {W is W1 + W2}.

expr_nominal(2) --> artigo, nome.
expr_nominal(W) --> artigo, nome, expr_preposicional(WW), {W is WW + 2}.

predicado(1) --> verbo.
predicado(W) --> verbo, expr_nominal(WW), {W is WW + 1}.
predicado(W) --> verbo, expr_nominal(W1), expr_preposicional(W2), {W is W1 + W2 + 1}.

expr_preposicional(W) --> preposicao, expr_nominal(WW), {W is WW + 1}.

nome --> [menino] ; [menina] ; [pato] ; [telescopio] ; [musica] ; [pena].

preposicao --> [ate] ; [com].

verbo --> [e] ; [viu] ; [esta] ; [toca] ; [conta] ; [surpre...].  

artigo --> [o] ; [a] ; [um] ; [uma].