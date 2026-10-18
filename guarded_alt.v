From FlowUnion Require Import guard types.

Record guarded_alt := {
  alt_guard : guard;
  alt_type  : ty
}.
