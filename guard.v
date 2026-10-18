From FlowUnion Require Import identifiers.

Inductive pred :=
| PBoolVar : var -> pred.

Inductive guard :=
| GTrue
| GFalse
| GPred : pred -> guard
| GNot  : guard -> guard
| GAnd  : guard -> guard -> guard
| GOr   : guard -> guard -> guard.
