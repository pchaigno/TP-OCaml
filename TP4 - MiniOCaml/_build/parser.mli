type token =
  | INT of (int)
  | LET
  | IN
  | EGAL
  | PLUS
  | MOINS
  | MULT
  | PAROUV
  | PARFERM
  | TRUE
  | FALSE
  | INF
  | FUN
  | ARROW
  | VIRG
  | CONCAT
  | NIL
  | PIPE
  | IF
  | THEN
  | ELSE
  | IDENT of (string)
  | EOF
  | END_OF_EXPRESSION

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.ml_expr
