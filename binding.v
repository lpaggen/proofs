From FlowUnion Require Import binding_status abs_value abs_value.

Record binding := {
  bind_status : binding_status;
  bind_value  : abs_value
}.

Definition join_binding
  (b1 b2 : binding)
  : binding := {|
    bind_status :=
      join_status
        (bind_status b1)
        (bind_status b2);
      
    bind_value :=
      join_abs
        (bind_value b1)
        (bind_value b2);
    |}.
