From Stdlib.Strings Require Import Ascii.


Inductive Regex : Type :=
    | Epsilon : Regex
    | Literal : ascii -> Regex
    | AnyChar : Regex
    | Concat : Regex -> Regex -> Regex
    | Choice : Regex -> Regex -> Regex
    | Star : Regex -> Regex
    | Optional : Regex -> Regex
    | Plus : Regex -> Regex
    | StartAnchor : Regex
    | EndAnchor : Regex.
