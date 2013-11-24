open Ast
open Value
open List

exception Error of string

let eval_unop op arg = let Ml_pair (f,s) = arg in
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

let rec pattern_matching pattern value = raise (Error "not implemented yet!")

let rec tryfind f = function
	| [] -> raise Not_found
	| hd :: tl -> try f hd with _ -> tryfind f tl

let rec eval env = function
	| Ml_int n -> Val_int n
	| Ml_bool b -> Val_bool b
	| Ml_var var -> assoc var env
	| Ml_binop (op, arg1, arg2) -> eval_binop op (eval env arg1) (eval env arg2)
	| Ml_let (id, arg1, arg2) ->  eval ((id, (eval env arg1))::env) arg2
	| _ -> raise (Error "not implemented yet!")