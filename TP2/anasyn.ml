open List;;

type vt = UL_EOF
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
	  | UL_FSI;;

type vn = FILE
	  | EXPR
	  | SUITEEXPR
	  | TERMB
	  | SUITETERMB
	  | FACTEURB
	  | RELATION
	  | OP;;

type v = Vt of vt | Vn of vn;;

type arbre_concret = Leaf of vt | Node of vn * arbre_concret list;;

type arbre_abstrait =
  | Cond of arbre_abstrait * arbre_abstrait * arbre_abstrait
  | Comp of string * vt * string
  | Ou of arbre_abstrait * arbre_abstrait
  | Et of arbre_abstrait * arbre_abstrait;;

exception DerivationException of vn * vt;;
exception MatchException of arbre_concret;;

let derivation = function
  | (FILE, _) -> [Vn EXPR; Vt UL_EOF]
  | (EXPR, (UL_PAROUV | UL_SI | UL_IDENT _)) -> [Vn TERMB; Vn SUITEEXPR]
  | (SUITEEXPR, UL_OU) -> [Vt UL_OU; Vn EXPR]
  | (SUITEEXPR, (UL_EOF | UL_ALORS | UL_SINON | UL_FSI)) -> []
  | (TERMB, (UL_PAROUV | UL_SI | UL_IDENT _)) -> [Vn FACTEURB; Vn SUITETERMB]
  | (SUITETERMB, UL_ET) -> [Vt UL_ET; Vn TERMB]
  | (SUITETERMB, (UL_OU | UL_EOF | UL_ALORS | UL_SINON | UL_FSI)) -> []
  | (FACTEURB, UL_PAROUV) -> [Vt UL_PAROUV; Vn EXPR; Vt UL_PARFERM]
  | (FACTEURB, UL_SI) -> [Vt UL_SI; Vn EXPR; Vt UL_ALORS; Vn EXPR; Vt UL_SINON; Vn EXPR; Vt UL_FSI]
  | (FACTEURB, UL_IDENT _) -> [Vn RELATION]
  | (RELATION, UL_IDENT x) -> [Vt (UL_IDENT x); Vn OP; Vt (UL_IDENT x)]
  | (OP, ((UL_EGAL | UL_DIFF | UL_SUP | UL_INF | UL_SUPEGAL | UL_INFEGAL) as x)) -> [Vt x]
  | (x, y) -> raise(DerivationException(x, y));;

let rec analyse_caractere = function
  | ((Vt _), p::r) -> (Leaf p, r)
  | (Vn nterm, p::r) -> let listeTerm = derivation (nterm, p) in
			let (listeV, listeUL) = analyse_mot(listeTerm, p::r) in
			((Node (nterm, listeV)), listeUL)
  | (_, []) -> raise (Failure "analyse_caractere")
and analyse_mot = function
  | ([], liste) -> [], liste
  | (pTerm::rTerm, listeUL) -> let (ac, newList) = analyse_caractere(pTerm, listeUL) in
                               let (suiteListeV, newList) = analyse_mot(rTerm, newList) in
                               (ac::suiteListeV, newList);;

let (arbConc, listeVide) = analyse_caractere (Vn FILE, [UL_IDENT "t"; UL_SUP; UL_IDENT "y"; UL_ET; UL_IDENT "x"; UL_EGAL; UL_IDENT "y"; UL_EOF]);;
let (arbConc1, listeVide1) = analyse_caractere (Vn FILE, [UL_IDENT "t"; UL_SUP; UL_IDENT "y"; UL_ET; UL_IDENT "t"; UL_SUP; UL_IDENT "y"; UL_EOF]);;

let rec abstraire = function
  | Node (FILE, [a; Leaf UL_EOF]) -> abstraire a
  | Node (EXPR, [a; Node (SUITEEXPR, [Leaf UL_OU; b])]) -> Ou (abstraire a, abstraire b)
  | Node (EXPR, [a; Node (SUITEEXPR, [])]) -> abstraire a
  | Node (TERMB, [a; Node (SUITETERMB, [Leaf UL_ET; b])]) -> Et (abstraire a, abstraire b)
  | Node (TERMB, [a; Node (SUITETERMB, [])]) -> abstraire a
  | Node (RELATION, [Leaf (UL_IDENT ident_a); Node(OP, [Leaf op]); Leaf (UL_IDENT ident_b)]) -> Comp(ident_a, op, ident_b)
  | Node (FACTEURB, [Leaf UL_PAROUV; a; Leaf UL_PARFERM]) -> abstraire a
  | Node (FACTEURB, [a]) -> abstraire a
  | Node (FACTEURB, [Leaf UL_SI; a; Leaf UL_ALORS; b; Leaf UL_SINON; c; Leaf UL_FSI]) -> Cond(abstraire a, abstraire b, abstraire c)
  | x -> raise(MatchException x);; 

let arbAbs = abstraire arbConc1;;
