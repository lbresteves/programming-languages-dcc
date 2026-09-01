%    <exp>     ::= <mulexp> + <exp>
%                | <mulexp>
%    <mulexp>  ::= <rootexp> * <mulexp>
%                | <rootexp>
%    <rootexp> ::= ( <exp> )
%                | <number>

exp(V) --> mulexp(V1), [+], exp(V2), {V is V1 + V2}.
exp(V) --> mulexp(V).

mulexp(V) --> rootexp(V1), [*], mulexp(V2), {V is V1 * V2}.
mulexp(V) --> rootexp(V).

rootexp(V) --> ['('], exp(V), [')'].
rootexp(N) --> [N], { number(N) }.