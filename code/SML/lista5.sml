fun min3 (a, b, c) = 
    if a <=b andalso a <= c then a
    else if b <= c then b
    else c;

fun red3 (a, _, c) = (a, c);

fun thirds s =
    let
        val ( _ :: _ :: c :: _) = explode s;
    in
        c
    end;

fun cycle1 [] = []
    | cycle1 (h::t) = t @ [h];

fun insert (x: real, []) = [x]
    | insert (x, y :: ys) = if x <= y then x :: y :: ys else y :: insert (x, ys);

fun sort3(a,b,c) = insert(a, insert(b, insert (c,[])));

fun del3 [a, b, _] = [a, b];

fun sqsum 0 = 0
    |sqsum (n: int) = (n * n) + sqsum(n -1); 

fun cycle (L, 0) = L
    | cycle ([], _) = []
    |cycle (h :: t, n) = cycle ( t @ [h], n - 1);