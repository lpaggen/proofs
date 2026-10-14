From Regex Require Import char_array.


Definition match_epsilon
    (xs : State)
    (c : State -> bool) : bool :=
    c xs. 

Lemma match_epsilon_correct :
    forall (xs : State) (c : State -> bool),
    match_epsilon xs c = c xs.
Proof.
    simpl.
    reflexivity.
Qed.
