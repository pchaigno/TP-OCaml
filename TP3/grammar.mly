%{
	open Definitions
	let parse_error = raise Exception (Parsing.symbol_start_pos.pos_lnum, Parsing.symbol_start_pos.pos_cnum);;
%}

%token <string> IDENT
%token EOF BEGIN PTVIRG END VIRG INT BOOL AFFECT PLUS INF AND PAROUV PARFERM ERROR

%left AND
%left INF
%left PLUS

%type <Definitions.arbabstrait> file

%start file

%%
file:
	| bloc EOF {$1};

bloc:
	| BEGIN sdecl PTVIRG sinst END {Bloc($2,$4)};

sdecl:
	| decl {[$1]}
	| decl VIRG sdecl {$1::$3};

decl:
	| typ IDENT {Declaration($1,$2)};

typ:
	| INT {Int}
	| BOOL {Bool};

sinst:
	| inst {[$1]}
	| inst PTVIRG sinst {$1::$3};

inst:
	| bloc {$1}
	| IDENT AFFECT expr {Affectation($1,$3)};

expr:
	| expr PLUS expr {Plus($1,$3)}
	| expr INF expr {Inf($1,$3)}
	| expr AND expr {And($1,$3)}
	| PAROUV expr PARFERM {$2}
	| IDENT {Ident($1)};