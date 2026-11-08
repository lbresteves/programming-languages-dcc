fun member (_, []) = false
    | member (e, h::t) = (e = h) orelse member (e, t);

fun less (_, []) = []
    | less (e, h::t) =  
        if h < e then [h] @ less(e,t)
        else less(e,t);

fun repeats [] = false
    | repeats [_] = false
    | repeats (h :: x :: t) = (h = x) orelse repeats (x :: t);

fun eval (P, x: real) =
    let
        fun aux ([], _, acc) = acc
          | aux (c :: cs, pwr, acc) = aux (cs, pwr * x, acc + c * pwr)
    in
        aux (P, 1.0, 0.0)
    end;

fun partition (pivot, nil) = (nil, nil)
  | partition (pivot, first::others) = 
    let
        val (smalls, bigs) = partition (pivot, others)
    in
        if first < pivot then (first::smalls, bigs) else (smalls, first::bigs)
    end

fun qsort nil = nil
  | qsort (first::rest) = 
    let
        val (smalls, bigs) = partition (first, rest)
    in
        qsort smalls @ [first] @ qsort bigs
    end