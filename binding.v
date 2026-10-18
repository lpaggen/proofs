From FlowUnion Require Import binding_status.

Record binding := {
  bind_status : binding_status;
  bind_value  : abs_value
}.
