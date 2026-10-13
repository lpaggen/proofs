From Stdlib.Lists Require Import List.
Import ListNotations.
From Stdlib.Strings Require Import Ascii.


From Regex Require Import char_array.


Definition is_empty (xs : State) : bool :=
  match xs with
  | [] => true
  | _ => false
  end.


Lemma is_empty_general :
  forall (first : ascii) (rest : State),
  is_empty (first :: rest) = false.
Proof.
  intros first rest.
  simpl.
  reflexivity.
Qed.
