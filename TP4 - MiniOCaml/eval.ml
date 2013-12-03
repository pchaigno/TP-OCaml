open Ast
open Value
open List

exception Error of string

let eval_unop op arg = let Ml_pair (f, s) = arg in
	match op with
		| Ml_fst -> f
		| Ml_snd -> s
		| _ -> raise (Error "Wrong type")

let eval_binop op arg1 arg2 = match op with
	| Ml_add -> let Val_int a = arg1 in 
				let Val_int b = arg2 in 
				Val_int (a + b)
	| Ml_sub -> let Val_int a = arg1 in 
				let Val_int b = arg2 in 
				Val_int (a - b)
	| Ml_mult -> let Val_int a = arg1 in 
				let Val_int b = arg2 in 
				Val_int (a * b)
	| Ml_eq -> let Val_int a = arg1 in 
				let Val_int b = arg2 in 
				Val_bool (a = b)
	| Ml_less -> let Val_int a = arg1 in 
				let Val_int b = arg2 in 
				Val_bool (a < b)
	| _ -> raise (Error "Wrong type")

let rec pattern_matching pattern value = match (pattern, value) with
	| (Ml_pattern_var id, _) -> [(id, value)]
	| (Ml_pattern_bool v, Val_bool x) -> if v = x then [] else raise (Error "failure")
	| (Ml_pattern_int v, Val_int x) ->  if v = x then [] else raise (Error "failure")
	| (Ml_pattern_pair (patt1, patt2), Val_pair (val1, val2)) -> (pattern_matching patt1 val1)@(pattern_matching patt2 val2)
	| (Ml_pattern_nil, Val_nil) -> []
	| (Ml_pattern_cons (patt1, patt2), Val_cons (v, rest)) -> (pattern_matching patt1 v)@(pattern_matching patt2 rest)
	| _ -> raise (Error "failure")

let rec tryfind f = function
	| [] -> raise Not_found
	| hd::tl -> try f hd with _ -> tryfind f tl

let rec eval env = function
	| Ml_int n -> Val_int n
	| Ml_bool b -> Val_bool b
	| Ml_pair (a, b) -> Val_pair ((eval env a), (eval env b))
	| Ml_nil -> Val_nil
	| Ml_cons (a, b) -> Val_cons ((eval env a), (eval env b))
	| Ml_var id -> assoc id env
	| Ml_unop (op, arg) -> eval env (eval_unop op arg)
	| Ml_binop (op, arg1, arg2) -> eval_binop op (eval env arg1) (eval env arg2)
	| Ml_let (id, arg1, arg2) -> eval ((id, (eval env arg1))::env) arg2
	| Ml_letrec (id, Ml_fun matcheese, arg2) -> let rec env1 = (id, (Val_closure (env1, matcheese)))::env in
												eval env1 arg2
	| Ml_app (expr1, expr2) -> let Val_closure (env1, matcheese) = (eval env expr1) in
								let v = (eval env expr2) in
								let (env2, expr3) = tryfind (function (p, e) -> (pattern_matching p v, e)) matcheese in
								eval (env2@env1) expr3
	| Ml_fun matcheese -> Val_closure (env, matcheese)
	| Ml_if (expr1, expr2, expr3) -> if (eval env expr1) = (Val_bool true) 
										then (eval env expr2) 
										else (eval env expr3)
	| _ -> raise (Error "not implemented yet!")