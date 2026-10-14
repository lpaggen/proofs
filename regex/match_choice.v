From Regex Require Import matcher char_array.


Definition match_choice
    (m1 m2 : Matcher)
    (xs : State)
    (c : State -> bool) : bool :=
    match m1 xs c with
    | true => true
    | false => m2 xs c
    end.
