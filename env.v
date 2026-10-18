From FlowUnion Require Import binding identifiers binding_status.


Definition env := var -> option binding.

Definition update
    (E : env)
    (x : var)
    (b : binding) : env :=
    fun y =>
        if String.eqb x y
        then Some b
        else E y.
