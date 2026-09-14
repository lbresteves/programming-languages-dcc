fun sum nil = 0
    |sum(h::t) = h + sum t;


fun range 1 = []
    | range num = (num :: range (num - 1));

fun inv nil l2 = l2
  | inv (h :: t) l2 = inv t (h :: l2);
