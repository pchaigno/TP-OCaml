{
  open Ulex (* Ulex contains the type definition of lexical units *)
}

type vt = 
	| UL_EOF
	| UL_ERR 
	| UL_IDENT of string
	| UL_PAROUV
	| UL_PARFERM
	| UL_ET
	| UL_OU
	| UL_EGAL
	| UL_DIFF
	| UL_SUP
	| UL_INF
	| UL_SUPEGAL
	| UL_INFEGAL
	| UL_SI
	| UL_ALORS
	| UL_SINON
	| UL_FSI
;;

type vn = 
	| EXPR
	| SUITEEXPR
	| TERMB
	| SUITETERMB
	| FACTEURB
	| RELATION
	| OP
;;

type v = vt | vn;;

type arbre_concret = vt | v * arbre_concret list;;

let derivation = 
	| (EXPR, _) -> [TERMB; SUITEEXPR]
	| (SUITEEXPR, UL_OU) -> [UL_OU; TERMB; SUITEEXPR]
	| (SUITEEXPR, _) -> []
	| (TERMB, _) -> [FACTEURB; SUITETERMB]
	| (SUITETERMB, UL_ET) -> [UL_ET; FACTEURB; SUITETERMB]
	| (SUITETERMB, _) -> []
	| (FACTEURB, UL_PAROUV) -> [UL_PAROUV; EXPR; UL_PARFERM]
	| (FACTEURB, UL_SI) -> [UL_SI; EXPR; UL_ALORS; EXPR; UL_SINON; EXPR; UL_FSI]
	| (FACTEURB, _) -> [RELATION]
	| (RELATION, _) -> [UL_IDENT; OP; UL_IDENT]
	| (OP, (UL_EGAL | UL_DIFF | UL_SUP | UL_INF | UL_SUPEGAL | UL_INFEGAL) as x) -> [x];;

let analyse_caractere = 
	
and analyse_mot = 