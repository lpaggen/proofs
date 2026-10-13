From Stdlib.Lists Require Import List.
Import ListNotations.
From Stdlib.Strings Require Import Ascii.


From Regex Require Import char_array.
From Regex Require Import is_array_empty.
From Regex Require Import match_char.


Definition match_ab (xs : State) : bool :=
    match_char "a"%char xs (
        fun rest => match_char "b"%char rest is_empty
    ).


Lemma match_ab :
    forall (rest : State),
    match_ab ("a"%char :: "b"%char :: rest) = is_empty rest.
Proof.
    intros rest.
    unfold match_ab.
    simpl.
    reflexivity.
Qed.
