{
	open Grammar
}

let id = ['a'-'z'] ['a'-'z' '0'-'9']*

rule scanner = parse 
	| "begin" {BEGIN}
	| ";" {PTVIRG}
	| "end" {END}
	| "," {VIRG}
	| "int" {INT}
	| "bool" {BOOL}
	| "<-" {AFFECT}
	| "+" {PLUS}
	| "<" {INF}
	| "and" {AND}
	| "(" {PAROUV}
	| ")" {PARFERM}
	| id as ident {IDENT ident}
	| [' ' '\t' '\n'] {scanner lexbuf}
	| eof {EOF}
	| _ {ERROR}

