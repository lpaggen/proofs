From FlowUnion Require Import identifiers expr types torch_dtype guard.
From Stdlib Require Import ZArith String List.

Scheme All for list.

Inductive stmt :=
| SIf : expr -> stmt -> stmt -> stmt
| SAssign : var -> expr -> stmt
| SSkip
| SSequence : stmt -> stmt
| SReturn : expr -> stmt.
