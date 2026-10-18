Inductive binding_status :=
| Bound
| Unbound
| MaybeUnbound.

Definition join_status
    (b1 b2 : binding_status)
    : binding_status :=
    match b1, b2 with
    | Bound, Bound => Bound
    | Unbound, Unbound => Unbound
    | _, _ => MaybeUnbound
    end.
