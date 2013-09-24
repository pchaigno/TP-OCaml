
type stream = {cont:string; mutable pos:int ; mutable mark:int }

exception End_of_Flux


type tree = Node of data * tree list

exception ParseError of (string * int * int)


let read s =
  if (s.pos < String.length s.cont) then
    let c = String.get s.cont s.pos in
      s.pos <- s.pos + 1;
      c
  else
    begin
      s.pos <- s.pos + 1;
      raise End_of_Flux
    end

let backward s =
  if (s.pos > 0) then
    s.pos <- s.pos - 1
  else
    ()

let reset_mark s = s.mark <- s.pos

let stream_of_string str = {cont=str; pos=0; mark=0}

type op = Add | Mul

type char = SPC | DGT | NEG | SYM | BRA | EOF | ANY

type state = Init | Neg | Numb | Symb | Ko | Eof

type data = 
  | Op of op
  | Int of int
  | LB | RB | End


exception LexError of (string * int * int)

let get_token input =
  let symbol = function
    | "(" -> LB
    | ")" -> RB
    | "+" -> Op Add
    | "*" -> Op Mul
    | _ as str -> raise (LexError (str, input.mark+1, input.pos+1))
  and integer n = Int (int_of_string n) in
    reset_mark input;
    match lex_input input Init "" with
      | Symb, str -> symbol str
      | Numb, str -> integer str
      | Eof, _ -> End
      | Ko, str -> raise (LexError (str, input.mark+1, input.pos+1))
      | _ -> assert false

let rec lex_input input state acc =
  let c, chr = try 
    let c = read input in 
      c, match c with
	| ' ' | '\t' | '\n' | '\r' -> SPC
	| '0'..'9' -> DGT
	| '+' | '*' -> SYM
	| '-' -> NEG
	| '(' | ')' -> BRA
	| _ -> ANY
  with End_of_Flux -> ' ', EOF
  in
    match state with
      | Init ->
	  begin
	    match chr with
	      | SPC -> lex_input input Init acc
	      | NEG -> lex_input input Neg "-"
	      | DGT -> lex_input input Numb (Char.escaped c)
	      | SYM -> lex_input input Symb (Char.escaped c)
	      | BRA -> Symb, (Char.escaped c)
	      | EOF -> Eof, ""
	      | ANY -> Ko, (Char.escaped c)
	  end
      | Ko ->
	  failwith "Invalid expression: unexpected character found"
      | _ ->
	  invalid_arg "lex_input";;


let first = lexer input
  
parse lexer input [0] first []


