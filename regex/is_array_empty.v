From Stdlib.Lists Require Import List.
Import ListNotations.

From Regex Require Import char_array.

Definition is_empty (xs : State) : bool :=
  match xs with
  | [] => true
  | _ => false
  end.