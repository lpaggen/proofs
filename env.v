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

Definition join_env
    (e1 e2 : env)
    : env :=
    fun x =>
        match e1 x, e2 x with
        
        | Some b1, Some b2 =>
            Some (join_binding b1 b2)
        
        | Some b1, None => 
            Some {|
                bind_status := MaybeUnbound;
                bind_value := bind_value b1
            |}
        
        | None, Some b2 =>
            Some {|
                bind_status := MaybeUnbound;
                bind_value := bind_value b2
            |}
        
        | None, None =>
            None
        
        end.
