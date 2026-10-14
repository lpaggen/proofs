From Regex Require Import char_array.


Definition Matcher :=
    State -> (State -> bool) -> bool.
