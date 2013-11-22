%{
	open Ast
%}

%token <int> INT
%token LET
%token EOF END_OF_EXPRESSION
%start main
%type <Ast.ml_expr> main
%%

main:
	| EOF { Printf.printf "\nbye"; exit 0 }
	| expr END_OF_EXPRESSION { $1 }
	| error {
		let bol = (Parsing.symbol_start_pos ()).Lexing.pos_bol in
		failwith ("parsing: line " ^ 
		(string_of_int ((Parsing.symbol_start_pos ()).Lexing.pos_lnum)) ^ 
		" between character " ^
		(string_of_int (Parsing.symbol_start () - bol)) ^
		" and " ^
		(string_of_int ((Parsing.symbol_end ()) + 1 - bol)))
	}

expr:
	| simple_expr { $1 }

simple_expr:
	| INT { Ml_int $1 }
