open Ast
open Value

exception Error of string

let eval_unop op arg = raise (Error "not implemented yet!")

let eval_binop op arg1 arg2 = raise (Error "not implemented yet!")

let rec pattern_matching pattern value = raise (Error "not implemented yet!")

let rec tryfind f = function
  | [] -> raise Not_found
  | hd :: tl -> try f hd with _ -> tryfind f tl

let rec eval env = function
  | Ml_int n -> Val_int n
  | _ -> raise (Error "not implemented yet!")
