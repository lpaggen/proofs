

Definition match_star
    (fuel : nat)
    (m : Matcher)
    (xs : State)
    (c : State -> bool) : bool :=
    match fuel with
    | 0 => c xs
    | S remaining =>
        if m xs (fun rest => match_star remaining m rest c)
        then true
        else c xs
    end.
