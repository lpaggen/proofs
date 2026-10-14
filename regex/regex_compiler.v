From Regex Require Import matcher regex_type match_choice match_epsilon is_array_empty match_char concat_matcher.

From Stdlib.Strings Require Import Ascii.
From Stdlib.Lists Require Import List.
Import ListNotations.


Fixpoint compile_regex (re : Regex) : Matcher :=
    match re with
    | Epsilon =>
        match_epsilon

    | Literal ch =>
        match_char ch
    
    | Concat re1 re2 =>
        match_concat
            (compile_regex re1)
            (compile_regex re2)
    
    | Choice re1 re2 =>
        match_choice
            (compile_regex re1)
            (compile_regex re2)
    
    | _ =>
        fun _ _ => false
    
    end.


Definition regex_ab : Regex :=
  Concat
    (Literal "a"%char)
    (Literal "b"%char).

Lemma compiled_match_ab_correct :
    compile_regex regex_ab
        ["a"%char; "b"%char]
        is_empty = true.
Proof.
    unfold regex_ab.
    simpl.
    unfold match_concat.
    simpl.
    reflexivity.
Qed.


Definition regex_ab_or_ac : Regex :=
  Choice
    (Concat (Literal "a"%char)
            (Literal "b"%char))
    (Concat (Literal "a"%char)
            (Literal "c"%char)).

Lemma compiled_choice_backtracks :
  compile_regex regex_ab_or_ac
    ["a"%char; "c"%char]
    is_empty = true.
Proof.
    unfold regex_ab_or_ac.
    simpl.
    unfold match_choice.
    simpl.
    unfold match_concat.
    simpl.
    reflexivity.
Qed.
