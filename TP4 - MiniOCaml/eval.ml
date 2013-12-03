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

let rec pattern_matching pattern value = 
	| Ml_pattern_var var -> 
	| Ml_pattern_bool val -> 
	| Ml_pattern_int val -> 
	| Ml_pattern_pair (pattern, pattern) -> 
	| Ml_pattern_nil -> 
	| Ml_pattern_cons (pattern, pattern) -> 
	| _ -> raise (Error "not implemented yet!")

let rec tryfind f = function
	| [] -> raise Not_found
	| hd::tl -> try f hd with _ -> tryfind f tl

let rec eval env = function
	| Ml_int n -> Val_int n
	| Ml_bool b -> Val_bool b
	| Ml_pair pair -> Val_pair pair
	| Ml_nil -> Val_nil
	| Ml_cons (a, b) -> Val_cons (a, (eval env b))
	| Ml_var var -> assoc var env
	| Ml_unop (op, arg) -> eval_unop op (eval env arg)
	| Ml_binop (op, arg1, arg2) -> eval_binop op (eval env arg1) (eval env arg2)
	| Ml_let (id, arg1, arg2) -> eval ((id, (eval env arg1))::env) arg2
	| Ml_app (expr1, expr2) -> 
	| Ml_fun matches -> Val_closure env matches
	| Ml_if (expr1, expr2, expr3) -> if (eval env expr1) == (Val_bool true) 
										then (eval env expr2) 
										else (eval env expr3)
	| _ -> raise (Error "not implemented yet!")