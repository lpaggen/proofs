From FlowUnion Require Import guarded_alt.

Definition abs_value := list guarded_alt.

Definition join_abs
    (A1 A2 : abs_value)
    : abs_value :=
    List.app A1 A2.
