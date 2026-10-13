From Stdlib Require Import ZArith.
From Stdlib Require Import ZArith.
From Stdlib Require Import Lia.
Open Scope Z_scope.

Definition Even (n : Z) : Prop := exists k : Z, n = 2 * k.

Lemma ex2_even_square : forall n : Z, Even n -> Even (n * n).
Proof.
    intros n Hn.
    unfold Even.
    unfold Even in Hn.
    destruct Hn as [k Hn].
    exists(2 * k * k).
    lia.
Qed.
