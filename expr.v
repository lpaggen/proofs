From FlowUnion Require Import identifiers types torch_dtype guard.
From Stdlib Require Import ZArith List.

Scheme All for list.

Parameter op : Type.

Inductive expr :=
| EInt    : Z -> expr
| EBool   : bool -> expr
| EVar    : var -> expr
| ETensor : list Z -> dtype -> expr
| EOp     : op -> list expr -> expr
| ECall   : fname -> list expr -> expr.
