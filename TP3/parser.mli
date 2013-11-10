type token =
  | IDENT of (string)
  | EOF
  | BEGIN
  | PTVIRG
  | END
  | VIRG
  | INT
  | BOOL
  | AFFECT
  | PLUS
  | INF
  | AND
  | PAROUV
  | PARFERM
  | ERROR

val file :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> bool
