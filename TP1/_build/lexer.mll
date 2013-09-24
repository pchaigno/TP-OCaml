{
  open Ulex (* Ulex contains the type definition of lexical units *)
}
rule token = parse
  | ([' ' '\t' '\n'])+  {token lexbuf}
  (*| "/*" ([^'*'] | "*" [^'/'])* "*"* "*/" {token lexbuf}*)
  | "/*" ([^'*'] | '*'+ [^'/''*'])* '*'* '/' {token lexbuf} 
  | "et"  {UL_ET}
  | "ou"  {UL_OU}
  | ['A'-'Z' 'a'-'z']+ as ident {UL_IDENT ident}
  | ['1'- '9']+ as ident {UL_IDENT ident}
  | ['=']   {UL_EGAL}
  | ['(']   {UL_PAROUV}
  | [')']   {UL_PARFERM}
  | "<>"  {UL_DIFF}
  | ['>']   {UL_SUP}
  | ['<']   {UL_INF}
  | ">="  {UL_SUPEGAL}
  | "<="  {UL_INFEGAL}
  | eof     {UL_EOF}
  | "(*" {comments lexbuf}
and comments = parse
  | "*)" {token lexbuf}
  | eof {UL_EOF}
  | _ {comments lexbuf}

