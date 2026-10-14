From Regex Require Import char_array.
From Regex Require Import matcher.
From Regex Require Import match_epsilon.
From Regex Require Import match_char.
From Regex Require Import is_empty.

From Stdlib.Lists Require Import List.
Import ListNotations.
From Stdlib Require Import Ascii.


Definition match_concat 
    (m1 m2 : Matcher)
    (xs : State)
    (c : State -> bool) : bool :=
    m1 xs (fun rest => m2 rest c).

Lemma concat_epsilon_left :
    forall (m : Matcher) (xs : State) (c : State -> bool),
    match_concat match_epsilon m xs c = m xs c.
Proof.
    intros m xs c.
    unfold match_concat.
    unfold match_epsilon.
    reflexivity.
Qed.


Definition match_ab_concat (xs : State) : bool :=
    match_concat
        (match_char "a"%char)
        (match_char "b"%char)
        xs
        is_empty.

Lemma match_ab_correct :
    match_ab_concat ["a"%char; "b"%char] = true.
Proof.
    unfold match_ab_concat.
    unfold match_concat.
    unfold match_char.
    simpl.
    reflexivity.
Qed.
