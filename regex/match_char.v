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


Lemma match_char_general :
    forall (expected : ascii) (rest : State) (c : State -> bool),
    match_char expected (expected :: rest) c = c rest.
Proof.
    intros expected rest c.
    simpl.
    rewrite Ascii.eqb_refl.
    reflexivity.
Qed.
