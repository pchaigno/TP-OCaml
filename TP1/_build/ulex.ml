(** [token] is the type of the different lexical units. *)
type token = UL_IDENT of string
	     | UL_ET
	     | UL_OU
	     | UL_EGAL
             | UL_EOF
	     | UL_PAROUV
	     | UL_PARFERM 
	     | UL_DIFF
	     | UL_SUP
	     | UL_INF
	     | UL_SUPEGAL
	     | UL_INFEGAL

(** [is_eof] : token  -> bool
    is_eof tk returns true if the lexical unit represents the end_of file.
*)
let is_eof = function
  | UL_EOF -> true
  | _      -> false

(** [print_token] : out_channel -> token -> unit
    print_token o tk prints on the output channel o the textual representation of the token tk *)
let print_token o = function
  | UL_IDENT ident -> Printf.fprintf o "UL_IDENT %s" ident
  | UL_ET -> Printf.fprintf o "UL_ET"
  | UL_OU -> Printf.fprintf o "UL_OU"
  | UL_EGAL -> Printf.fprintf o "UL_EGAL"
  | UL_PAROUV -> Printf.fprintf o "UL_PAROUV"
  | UL_PARFERM -> Printf.fprintf o "UL_PARFERM"
  | UL_DIFF -> Printf.fprintf o "UL_DIFF"
  | UL_SUP -> Printf.fprintf o "UL_SUP"
  | UL_INF -> Printf.fprintf o "UL_INF"
  | UL_SUPEGAL -> Printf.fprintf o "UL_SUPEGAL"
  | UL_INFEGAL -> Printf.fprintf o "UL_INFEGAL"
  | UL_EOF  -> Printf.fprintf o "UL_EOF"

