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

open Parsing;;
# 2 "grammar.mly"
	open Definitions
# 22 "grammar.ml"
let yytransl_const = [|
    0 (* EOF *);
  258 (* BEGIN *);
  259 (* PTVIRG *);
  260 (* END *);
  261 (* VIRG *);
  262 (* INT *);
  263 (* BOOL *);
  264 (* AFFECT *);
  265 (* PLUS *);
  266 (* INF *);
  267 (* AND *);
  268 (* PAROUV *);
  269 (* PARFERM *);
  270 (* ERROR *);
    0|]

let yytransl_block = [|
  257 (* IDENT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\003\000\003\000\005\000\006\000\006\000\004\000\
\004\000\007\000\007\000\008\000\008\000\008\000\008\000\008\000\
\000\000"

let yylen = "\002\000\
\002\000\005\000\001\000\003\000\002\000\001\000\001\000\001\000\
\003\000\001\000\003\000\003\000\003\000\003\000\003\000\001\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\017\000\000\000\006\000\007\000\000\000\
\000\000\000\000\001\000\000\000\000\000\005\000\000\000\010\000\
\000\000\000\000\004\000\000\000\002\000\000\000\016\000\000\000\
\000\000\009\000\000\000\000\000\000\000\000\000\015\000\012\000\
\000\000\000\000"

let yydgoto = "\002\000\
\004\000\016\000\008\000\017\000\009\000\010\000\018\000\025\000"

let yysindex = "\003\000\
\008\255\000\000\013\255\000\000\007\000\000\000\000\000\011\255\
\031\255\026\255\000\000\028\255\013\255\000\000\027\255\000\000\
\033\255\035\255\000\000\255\254\000\000\028\255\000\000\255\254\
\248\254\000\000\015\255\255\254\255\254\255\254\000\000\000\000\
\032\255\022\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\036\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\038\255\000\000\000\000\000\000\000\000\000\000\000\000\
\030\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\002\255\005\255"

let yygindex = "\000\000\
\000\000\039\000\030\000\022\000\000\000\000\000\000\000\249\255"

let yytablesize = 44
let yytable = "\023\000\
\028\000\029\000\030\000\001\000\013\000\013\000\011\000\014\000\
\014\000\003\000\024\000\013\000\013\000\012\000\013\000\014\000\
\027\000\014\000\006\000\007\000\032\000\033\000\034\000\028\000\
\029\000\030\000\014\000\031\000\015\000\003\000\028\000\029\000\
\011\000\011\000\020\000\013\000\021\000\022\000\003\000\005\000\
\028\000\008\000\019\000\026\000"

let yycheck = "\001\001\
\009\001\010\001\011\001\001\000\003\001\004\001\000\000\003\001\
\004\001\002\001\012\001\010\001\011\001\003\001\013\001\011\001\
\024\000\013\001\006\001\007\001\028\000\029\000\030\000\009\001\
\010\001\011\001\001\001\013\001\001\001\002\001\009\001\010\001\
\003\001\004\001\008\001\005\001\004\001\003\001\003\001\001\000\
\009\001\004\001\013\000\022\000"

let yynames_const = "\
  EOF\000\
  BEGIN\000\
  PTVIRG\000\
  END\000\
  VIRG\000\
  INT\000\
  BOOL\000\
  AFFECT\000\
  PLUS\000\
  INF\000\
  AND\000\
  PAROUV\000\
  PARFERM\000\
  ERROR\000\
  "

let yynames_block = "\
  IDENT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'bloc) in
    Obj.repr(
# 19 "grammar.mly"
            (_1)
# 126 "grammar.ml"
               : Definitions.arbabstrait))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'sdecl) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'sinst) in
    Obj.repr(
# 22 "grammar.mly"
                                (Bloc(_2,_4))
# 134 "grammar.ml"
               : 'bloc))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'decl) in
    Obj.repr(
# 25 "grammar.mly"
        ([_1])
# 141 "grammar.ml"
               : 'sdecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'decl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'sdecl) in
    Obj.repr(
# 26 "grammar.mly"
                   (_1::_3)
# 149 "grammar.ml"
               : 'sdecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 29 "grammar.mly"
             (Declaration(_1,_2))
# 157 "grammar.ml"
               : 'decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 32 "grammar.mly"
       (Int)
# 163 "grammar.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 33 "grammar.mly"
        (Bool)
# 169 "grammar.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'inst) in
    Obj.repr(
# 36 "grammar.mly"
        ([_1])
# 176 "grammar.ml"
               : 'sinst))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'inst) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'sinst) in
    Obj.repr(
# 37 "grammar.mly"
                     (_1::_3)
# 184 "grammar.ml"
               : 'sinst))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'bloc) in
    Obj.repr(
# 40 "grammar.mly"
        (_1)
# 191 "grammar.ml"
               : 'inst))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 41 "grammar.mly"
                     (Affectation(_1,_3))
# 199 "grammar.ml"
               : 'inst))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 44 "grammar.mly"
                  (Plus(_1,_3))
# 207 "grammar.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 45 "grammar.mly"
                 (Inf(_1,_3))
# 215 "grammar.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 46 "grammar.mly"
                 (And(_1,_3))
# 223 "grammar.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 47 "grammar.mly"
                       (_2)
# 230 "grammar.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 48 "grammar.mly"
         (Ident(_1))
# 237 "grammar.ml"
               : 'expr))
(* Entry file *)
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
let file (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Definitions.arbabstrait)
