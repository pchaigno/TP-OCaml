%token <string> IDENT
%token EOF BEGIN PTVIRG END VIRG INT BOOL AFFECT PLUS INF AND PAROUV PARFERM ERROR

%left AND
%left INF
%left PLUS

%type <bool> file

%start file

%%
file:
	| bloc EOF {};

bloc:
	| BEGIN sdecl PTVIRG sinst END {};

sdecl:
	| decl {}
	| decl VIRG sdecl {};

decl:
	| typ IDENT {};

typ:
	| INT {}
	| BOOL {};

sinst:
	| inst {}
	| inst PTVIRG sinst {};

inst:
	| bloc {}
	| IDENT AFFECT expr {};

expr:
	| expr PLUS expr {}
	| expr INF expr {}
	| expr AND expr {}
	| PAROUV expr PARFERM {}
	| IDENT {};