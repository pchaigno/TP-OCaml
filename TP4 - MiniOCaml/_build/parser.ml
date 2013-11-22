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

open Parsing;;
# 2 "parser.mly"
  open Ast
# 31 "parser.ml"
let yytransl_const = [|
  258 (* LET *);
  259 (* IN *);
  260 (* EGAL *);
  261 (* PLUS *);
  262 (* MOINS *);
  263 (* MULT *);
  264 (* PAROUV *);
  265 (* PARFERM *);
  266 (* TRUE *);
  267 (* FALSE *);
  268 (* INF *);
  269 (* FUN *);
  270 (* ARROW *);
  271 (* VIRG *);
  272 (* CONCAT *);
  273 (* NIL *);
  274 (* PIPE *);
  275 (* IF *);
  276 (* THEN *);
  277 (* ELSE *);
    0 (* EOF *);
  279 (* END_OF_EXPRESSION *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  278 (* IDENT *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\004\000\003\000\003\000\
\003\000\003\000\003\000\003\000\007\000\007\000\007\000\005\000\
\005\000\006\000\006\000\008\000\008\000\010\000\010\000\010\000\
\009\000\009\000\009\000\009\000\009\000\009\000\000\000"

let yylen = "\002\000\
\001\000\002\000\001\000\001\000\006\000\003\000\003\000\003\000\
\003\000\003\000\003\000\001\000\006\000\003\000\001\000\001\000\
\001\000\001\000\005\000\001\000\003\000\003\000\001\000\003\000\
\004\000\005\000\000\000\001\000\001\000\003\000\003\000\001\000\
\001\000\001\000\001\000\001\000\005\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\003\000\015\000\000\000\000\000\016\000\017\000\
\000\000\023\000\000\000\018\000\001\000\039\000\000\000\000\000\
\012\000\020\000\000\000\000\000\000\000\033\000\000\000\034\000\
\035\000\032\000\000\000\036\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\
\000\000\011\000\000\000\000\000\038\000\000\000\000\000\014\000\
\000\000\000\000\000\000\000\000\000\000\000\000\008\000\000\000\
\000\000\018\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\031\000\000\000\000\000\000\000\000\000\019\000\000\000\
\000\000\000\000\000\000\000\000\037\000\000\000\000\000\026\000"

let yydgoto = "\002\000\
\014\000\015\000\016\000\017\000\029\000\048\000\018\000\030\000\
\031\000\032\000"

let yysindex = "\005\000\
\001\000\000\000\000\000\000\000\246\254\064\255\000\000\000\000\
\003\255\000\000\064\255\000\000\000\000\000\000\227\255\002\255\
\000\000\000\000\015\255\039\000\036\255\000\000\016\255\000\000\
\000\000\000\000\016\255\000\000\004\255\026\255\028\255\000\000\
\241\255\064\255\064\255\064\255\064\255\064\255\000\000\077\255\
\064\255\000\000\081\255\039\255\000\000\034\255\016\255\000\000\
\064\255\094\255\064\255\179\255\056\255\056\255\000\000\179\255\
\081\255\000\000\002\255\030\000\255\254\016\255\064\255\053\255\
\057\000\000\000\028\255\231\255\036\255\064\255\000\000\000\255\
\057\000\064\255\064\255\057\000\000\000\020\000\057\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\124\255\
\000\000\000\000\000\000\000\000\048\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\134\255\000\000\057\255\046\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\038\255\147\255\157\255\000\000\170\255\
\000\000\000\000\103\255\000\000\000\000\000\000\000\000\000\000\
\178\255\000\000\105\255\000\000\000\000\000\000\000\000\000\000\
\186\255\000\000\000\000\194\255\000\000\207\255\202\255\000\000"

let yygindex = "\000\000\
\000\000\250\255\252\255\000\000\000\000\248\255\000\000\232\255\
\240\255\243\255"

let yytablesize = 325
let yytable = "\020\000\
\013\000\021\000\046\000\022\000\033\000\001\000\044\000\071\000\
\077\000\045\000\023\000\019\000\024\000\025\000\040\000\050\000\
\022\000\040\000\041\000\026\000\027\000\047\000\064\000\023\000\
\028\000\024\000\025\000\052\000\053\000\054\000\055\000\056\000\
\026\000\067\000\060\000\059\000\045\000\028\000\061\000\049\000\
\009\000\009\000\065\000\050\000\068\000\072\000\009\000\063\000\
\045\000\009\000\043\000\040\000\069\000\062\000\050\000\009\000\
\073\000\009\000\009\000\029\000\009\000\038\000\037\000\076\000\
\004\000\005\000\074\000\078\000\079\000\080\000\028\000\006\000\
\000\000\007\000\008\000\000\000\009\000\004\000\000\000\000\000\
\010\000\004\000\011\000\000\000\057\000\012\000\007\000\008\000\
\057\000\000\000\007\000\008\000\000\000\010\000\022\000\000\000\
\000\000\010\000\058\000\000\000\000\000\023\000\012\000\024\000\
\025\000\021\000\021\000\021\000\021\000\021\000\026\000\021\000\
\000\000\030\000\021\000\066\000\000\000\021\000\030\000\030\000\
\021\000\000\000\021\000\021\000\000\000\021\000\004\000\004\000\
\004\000\004\000\004\000\000\000\004\000\000\000\000\000\004\000\
\027\000\027\000\027\000\027\000\027\000\004\000\027\000\004\000\
\004\000\027\000\004\000\000\000\000\000\006\000\006\000\006\000\
\006\000\027\000\027\000\006\000\027\000\000\000\006\000\007\000\
\007\000\007\000\007\000\000\000\006\000\007\000\006\000\006\000\
\007\000\006\000\000\000\000\000\010\000\010\000\007\000\000\000\
\007\000\007\000\010\000\007\000\024\000\010\000\000\000\035\000\
\036\000\037\000\024\000\010\000\025\000\010\000\010\000\000\000\
\010\000\000\000\025\000\024\000\005\000\024\000\024\000\000\000\
\024\000\000\000\005\000\025\000\013\000\025\000\025\000\000\000\
\025\000\027\000\013\000\005\000\000\000\005\000\005\000\027\000\
\005\000\000\000\000\000\013\000\000\000\013\000\013\000\000\000\
\013\000\000\000\027\000\027\000\000\000\027\000\034\000\035\000\
\036\000\037\000\034\000\035\000\036\000\037\000\038\000\000\000\
\000\000\000\000\038\000\000\000\034\000\035\000\036\000\037\000\
\000\000\039\000\000\000\075\000\038\000\000\000\000\000\000\000\
\003\000\004\000\005\000\000\000\051\000\000\000\000\000\000\000\
\006\000\000\000\007\000\008\000\000\000\009\000\000\000\000\000\
\000\000\010\000\000\000\011\000\000\000\000\000\012\000\034\000\
\035\000\036\000\037\000\000\000\000\000\000\000\000\000\038\000\
\070\000\034\000\035\000\036\000\037\000\047\000\000\000\000\000\
\000\000\038\000\034\000\035\000\036\000\037\000\000\000\042\000\
\000\000\000\000\038\000\004\000\004\000\004\000\004\000\000\000\
\004\000\000\000\000\000\004\000\034\000\035\000\036\000\037\000\
\000\000\000\000\000\000\000\000\038\000"

let yycheck = "\006\000\
\000\000\006\000\027\000\001\001\011\000\001\000\023\000\009\001\
\009\001\023\000\008\001\022\001\010\001\011\001\016\001\016\001\
\001\001\016\001\004\001\017\001\018\001\018\001\047\000\008\001\
\022\001\010\001\011\001\034\000\035\000\036\000\037\000\038\000\
\017\001\050\000\041\000\040\000\050\000\022\001\043\000\014\001\
\003\001\004\001\049\000\016\001\051\000\062\000\009\001\014\001\
\062\000\012\001\015\001\016\001\057\000\015\001\016\001\018\001\
\063\000\020\001\021\001\014\001\023\001\016\001\007\001\070\000\
\001\001\002\001\014\001\074\000\075\000\078\000\014\001\008\001\
\255\255\010\001\011\001\255\255\013\001\001\001\255\255\255\255\
\017\001\001\001\019\001\255\255\008\001\022\001\010\001\011\001\
\008\001\255\255\010\001\011\001\255\255\017\001\001\001\255\255\
\255\255\017\001\022\001\255\255\255\255\008\001\022\001\010\001\
\011\001\003\001\004\001\005\001\006\001\007\001\017\001\009\001\
\255\255\009\001\012\001\022\001\255\255\015\001\014\001\015\001\
\018\001\255\255\020\001\021\001\255\255\023\001\003\001\004\001\
\005\001\006\001\007\001\255\255\009\001\255\255\255\255\012\001\
\003\001\004\001\005\001\006\001\007\001\018\001\009\001\020\001\
\021\001\012\001\023\001\255\255\255\255\003\001\004\001\005\001\
\006\001\020\001\021\001\009\001\023\001\255\255\012\001\003\001\
\004\001\005\001\006\001\255\255\018\001\009\001\020\001\021\001\
\012\001\023\001\255\255\255\255\003\001\004\001\018\001\255\255\
\020\001\021\001\009\001\023\001\003\001\012\001\255\255\005\001\
\006\001\007\001\009\001\018\001\003\001\020\001\021\001\255\255\
\023\001\255\255\009\001\018\001\003\001\020\001\021\001\255\255\
\023\001\255\255\009\001\018\001\003\001\020\001\021\001\255\255\
\023\001\003\001\009\001\018\001\255\255\020\001\021\001\009\001\
\023\001\255\255\255\255\018\001\255\255\020\001\021\001\255\255\
\023\001\255\255\020\001\021\001\255\255\023\001\004\001\005\001\
\006\001\007\001\004\001\005\001\006\001\007\001\012\001\255\255\
\255\255\255\255\012\001\255\255\004\001\005\001\006\001\007\001\
\255\255\023\001\255\255\021\001\012\001\255\255\255\255\255\255\
\000\001\001\001\002\001\255\255\020\001\255\255\255\255\255\255\
\008\001\255\255\010\001\011\001\255\255\013\001\255\255\255\255\
\255\255\017\001\255\255\019\001\255\255\255\255\022\001\004\001\
\005\001\006\001\007\001\255\255\255\255\255\255\255\255\012\001\
\003\001\004\001\005\001\006\001\007\001\018\001\255\255\255\255\
\255\255\012\001\004\001\005\001\006\001\007\001\255\255\009\001\
\255\255\255\255\012\001\004\001\005\001\006\001\007\001\255\255\
\009\001\255\255\255\255\012\001\004\001\005\001\006\001\007\001\
\255\255\255\255\255\255\255\255\012\001"

let yynames_const = "\
  LET\000\
  IN\000\
  EGAL\000\
  PLUS\000\
  MOINS\000\
  MULT\000\
  PAROUV\000\
  PARFERM\000\
  TRUE\000\
  FALSE\000\
  INF\000\
  FUN\000\
  ARROW\000\
  VIRG\000\
  CONCAT\000\
  NIL\000\
  PIPE\000\
  IF\000\
  THEN\000\
  ELSE\000\
  EOF\000\
  END_OF_EXPRESSION\000\
  "

let yynames_block = "\
  INT\000\
  IDENT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 21 "parser.mly"
       ( Printf.printf "\nbye"; exit 0 )
# 243 "parser.ml"
               : Ast.ml_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 22 "parser.mly"
                          ( _1 )
# 250 "parser.ml"
               : Ast.ml_expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 23 "parser.mly"
         (
    let bol = (Parsing.symbol_start_pos ()).Lexing.pos_bol in
    failwith ("parsing: line " ^ 
		 (string_of_int ((Parsing.symbol_start_pos ()).Lexing.pos_lnum)) ^ 
		 " between character " ^
		 (string_of_int (Parsing.symbol_start () - bol)) ^
		 " and " ^
		 (string_of_int ((Parsing.symbol_end ()) + 1 - bol)))
 )
# 264 "parser.ml"
               : Ast.ml_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 34 "parser.mly"
               ( _1 )
# 271 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 35 "parser.mly"
                               ( Ml_let (_2, _4, _6) )
# 280 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 36 "parser.mly"
                  ( Ml_binop (Ml_add, _1, _3) )
# 288 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 37 "parser.mly"
                   ( Ml_binop (Ml_sub, _1, _3) )
# 296 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 38 "parser.mly"
                  ( Ml_binop (Ml_mult, _1, _3) )
# 304 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 39 "parser.mly"
                  ( Ml_binop (Ml_eq, _1, _3) )
# 312 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 40 "parser.mly"
                 ( Ml_binop (Ml_less, _1, _3) )
# 320 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 41 "parser.mly"
                       ( _2 )
# 327 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'function) in
    Obj.repr(
# 42 "parser.mly"
            ( _1 )
# 334 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 43 "parser.mly"
                               ( Ml_if (_2, _4, _6) )
# 343 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'debut_pattern) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'suite_pattern) in
    Obj.repr(
# 46 "parser.mly"
                                   ( Ml_fun (_2::_3) )
# 351 "parser.ml"
               : 'function))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 49 "parser.mly"
       ( Ml_int _1 )
# 358 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 50 "parser.mly"
        ( Ml_bool true )
# 364 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 51 "parser.mly"
         ( Ml_bool false )
# 370 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 52 "parser.mly"
         ( Ml_var _1 )
# 377 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'simple_expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'simple_expr) in
    Obj.repr(
# 53 "parser.mly"
                                               (Ml_pair (_2, _4) )
# 385 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'list) in
    Obj.repr(
# 54 "parser.mly"
        ( _1 )
# 392 "parser.ml"
               : 'simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'simple_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'simple_expr) in
    Obj.repr(
# 57 "parser.mly"
                                  ( Ml_cons (_1, _3) )
# 400 "parser.ml"
               : 'list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'simple_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 58 "parser.mly"
                            ( Ml_cons (_1, (Ml_var _3)) )
# 408 "parser.ml"
               : 'list))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "parser.mly"
       ( Ml_nil )
# 414 "parser.ml"
               : 'list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'pattern) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 63 "parser.mly"
                      ( (_1, _3) )
# 422 "parser.ml"
               : 'debut_pattern))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'pattern) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 64 "parser.mly"
                           ( (_2, _4) )
# 430 "parser.ml"
               : 'debut_pattern))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'pattern) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'suite_pattern) in
    Obj.repr(
# 67 "parser.mly"
                                         ( (_2, _4)::_5 )
# 439 "parser.ml"
               : 'suite_pattern))
; (fun __caml_parser_env ->
    Obj.repr(
# 68 "parser.mly"
   ( [] )
# 445 "parser.ml"
               : 'suite_pattern))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'pattern_simple_expr) in
    Obj.repr(
# 71 "parser.mly"
                       ( _1 )
# 452 "parser.ml"
               : 'pattern))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'pattern_list) in
    Obj.repr(
# 72 "parser.mly"
                ( _1 )
# 459 "parser.ml"
               : 'pattern))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'pattern_simple_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'pattern_simple_expr) in
    Obj.repr(
# 75 "parser.mly"
                                                  ( Ml_pattern_cons (_1, _3) )
# 467 "parser.ml"
               : 'pattern_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'pattern_simple_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 76 "parser.mly"
                                    ( Ml_pattern_cons (_1, (Ml_pattern_var _3)) )
# 475 "parser.ml"
               : 'pattern_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "parser.mly"
       ( Ml_pattern_nil )
# 481 "parser.ml"
               : 'pattern_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 80 "parser.mly"
       ( Ml_pattern_int _1 )
# 488 "parser.ml"
               : 'pattern_simple_expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 81 "parser.mly"
        ( Ml_pattern_bool true )
# 494 "parser.ml"
               : 'pattern_simple_expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 82 "parser.mly"
         ( Ml_pattern_bool false )
# 500 "parser.ml"
               : 'pattern_simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 83 "parser.mly"
         ( Ml_pattern_var _1 )
# 507 "parser.ml"
               : 'pattern_simple_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'pattern_simple_expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'pattern_simple_expr) in
    Obj.repr(
# 84 "parser.mly"
                                                               (Ml_pattern_pair (_2, _4) )
# 515 "parser.ml"
               : 'pattern_simple_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'pattern_list) in
    Obj.repr(
# 85 "parser.mly"
                ( _1 )
# 522 "parser.ml"
               : 'pattern_simple_expr))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.ml_expr)
