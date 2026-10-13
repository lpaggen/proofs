From Stdlib.Lists Require Import List.
Import ListNotations.
From Stdlib.Strings Require Import Ascii.


From Regex Require Import char_array.
From Regex Require Import is_array_empty.

Definition match_char (expected : ascii) (xs : State) (c : State -> bool) : bool :=
    match xs with
    | [] => false
    | first :: rest => 
        if Ascii.eqb expected first
        then c rest
        else false
    end.
