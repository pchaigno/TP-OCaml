{
	open Parser
	let keyword_table = Hashtbl.create 53
	let _ = List.iter (fun (kwd, tok) -> Hashtbl.add keyword_table kwd tok)
		[
			"let", LET;
			"in", IN;
			"true", TRUE;
			"false", FALSE;
			"fun", FUN;
			"function", FUN;
			"if", IF;
			"else", ELSE;
			"then", THEN
		]
}

let space = [' ' '\t']

let letter = ['A'-'Z' 'a'-'z' '_']

let digit = ['0'-'9']

rule get_token = parse
	| "//" [^'\n']* '\n'? { get_token lexbuf }
	| "/*" ([^'*']|('*'+[^'*''/']))* '*'+ '/' { get_token lexbuf}
	| ['\n' '\r'] { Lexing.new_line lexbuf; get_token lexbuf }
	| ";;" { END_OF_EXPRESSION }
	| space { get_token lexbuf }
	| digit+ as v { INT (int_of_string v) }
	| letter+ as i { try Hashtbl.find keyword_table i with Not_found -> IDENT i }
	| "=" { EGAL }
	| "+" { PLUS }
	| "*" { MULT }
	| "-" { MOINS }
	| "(" { PAROUV }
	| ")" { PARFERM }
	| "<" { INF }
	| "->" { ARROW }
	| "|" { PIPE }
	| "," { VIRG }
	| "::" { CONCAT }
	| "[]" { NIL }
	| eof { EOF }
