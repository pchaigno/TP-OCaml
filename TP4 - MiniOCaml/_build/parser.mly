%{
  open Ast
%}

%token <int> INT
%token LET IN EGAL PLUS MOINS MULT PAROUV PARFERM TRUE FALSE INF FUN ARROW VIRG CONCAT NIL PIPE IF THEN ELSE
%token <string> IDENT
%token EOF END_OF_EXPRESSION

/* Priorite des operateurs */
%left END_OF_EXPRESSION
%left EGAL INF
%left PLUS MOINS
%left MULT

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
	| LET IDENT EGAL expr IN expr { Ml_let ($2, $4, $6) }
	| expr PLUS expr { Ml_binop (Ml_add, $1, $3) }
	| expr MOINS expr { Ml_binop (Ml_sub, $1, $3) }
	| expr MULT expr { Ml_binop (Ml_mult, $1, $3) }
	| expr EGAL expr { Ml_binop (Ml_eq, $1, $3) }
	| expr INF expr { Ml_binop (Ml_less, $1, $3) }
	| PAROUV expr PARFERM { $2 }
	| function { $1 }
	| IF expr THEN expr ELSE expr { Ml_if ($2, $4, $6) }

function:
	| FUN debut_pattern suite_pattern { Ml_fun ($2::$3) }

simple_expr:
	| INT { Ml_int $1 }
	| TRUE { Ml_bool true }
	| FALSE { Ml_bool false }
	| IDENT { Ml_var $1 }
	| PAROUV simple_expr VIRG simple_expr PARFERM {Ml_pair ($2, $4) }
	| list { $1 }

list:
	| simple_expr CONCAT simple_expr { Ml_cons ($1, $3) }
	| simple_expr CONCAT IDENT { Ml_cons ($1, (Ml_var $3)) }
	| NIL { Ml_nil }


debut_pattern:
	| pattern ARROW expr { ($1, $3) }
	| PIPE pattern ARROW expr { ($2, $4) }

suite_pattern:
	| PIPE pattern ARROW expr suite_pattern { ($2, $4)::$5 }
	| { [] }

pattern:
	| pattern_simple_expr { $1 }
	| pattern_list { $1 }

pattern_list:
	| pattern_simple_expr CONCAT pattern_simple_expr { Ml_pattern_cons ($1, $3) }
	| pattern_simple_expr CONCAT IDENT { Ml_pattern_cons ($1, (Ml_pattern_var $3)) }
	| NIL { Ml_pattern_nil }

pattern_simple_expr:
	| INT { Ml_pattern_int $1 }
	| TRUE { Ml_pattern_bool true }
	| FALSE { Ml_pattern_bool false }
	| IDENT { Ml_pattern_var $1 }
	| PAROUV pattern_simple_expr VIRG pattern_simple_expr PARFERM {Ml_pattern_pair ($2, $4) }
	| pattern_list { $1 }