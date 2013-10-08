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
  | (SUITEEXPR, UL_OU) -> [Vt UL_OU; Vn TERMB; Vn SUITEEXPR]
  | (SUITEEXPR, (UL_EOF | UL_ALORS | UL_SINON | UL_FSI)) -> []
  | (TERMB, (UL_PAROUV | UL_SI | UL_IDENT _)) -> [Vn FACTEURB; Vn SUITETERMB]
  | (SUITETERMB, UL_ET) -> [Vt UL_ET; Vn FACTEURB; Vn SUITETERMB]
  | (SUITETERMB, (UL_OU | UL_EOF | UL_ALORS | UL_SINON | UL_FSI)) -> []
  | (FACTEURB, UL_PAROUV) -> [Vt UL_PAROUV; Vn EXPR; Vt UL_PARFERM]
  | (FACTEURB, UL_SI) -> [Vt UL_SI; Vn EXPR; Vt UL_ALORS; Vn EXPR; Vt UL_SINON; Vn EXPR; Vt UL_FSI]
  | (FACTEURB, UL_IDENT _) -> [Vn RELATION]
  | (RELATION, UL_IDENT x) -> [Vt (UL_IDENT x); Vn OP; Vt (UL_IDENT x)]
  | (OP, ((UL_EGAL | UL_DIFF | UL_SUP | UL_INF | UL_SUPEGAL | UL_INFEGAL) as x)) -> [Vt x]
  | (OP, x) -> raise(DerivationException(OP, x));;

let rec analyse_caractere = function
  | ((Vt _), p::r) -> (Leaf p, r)
  | (Vn nterm, p::r) -> let listeTerm = derivation (nterm, p) in
			let (listeV, listeUL) = analyse_mot(listeTerm, p::r) in
			((Node (nterm, listeV)), listeUL)
and analyse_mot = function
  | ([], liste) -> [], liste
  | (pTerm::rTerm, listeUL) -> let (ac, newList) = analyse_caractere(pTerm, listeUL) in
                               let (suiteListeV, newList) = analyse_mot(rTerm, newList) in
                               (ac::suiteListeV, newList);;

let (arbConc, listeVide) = analyse_caractere(Vn FILE, [UL_IDENT "t"; UL_SUP; UL_IDENT "y"; UL_ET; UL_IDENT "x"; UL_EGAL; UL_IDENT "y"; UL_EOF]);;

let rec construire_arbre_abstrait = function
  | Node (FILE, [a; Leaf UL_EOF]) -> construire_arbre_abstrait a
  | Node (FACTEURB, [Leaf UL_PAROUV; a; Leaf UL_PARFERM]) -> construire_arbre_abstrait a
  | Node (FACTEURB, [a]) -> construire_arbre_abstrait a
  | Node (TERMB, [a; Node (SUITETERMB, [])]) -> construire_arbre_abstrait a
  | Node (EXPR, [a; Node (SUITEEXPR, [])]) -> construire_arbre_abstrait a
  | Node (EXPR, [a; Node (SUITEEXPR, [Leaf UL_OU; b])]) -> Ou (construire_arbre_abstrait a, construire_arbre_abstrait b)
  | Node (TERMB, [a; Node (SUITETERMB, [Leaf UL_ET; b])]) -> Et (construire_arbre_abstrait a, construire_arbre_abstrait b)
  | Node (RELATION, [Leaf (UL_IDENT ident_a); Node(OP, [Leaf op]); Leaf (UL_IDENT ident_b)]) -> Comp(ident_a, op, ident_b)
  | Node (FACTEURB, [Leaf UL_SI; a; Leaf UL_ALORS; b; Leaf UL_SINON; c; Leaf UL_FSI]) -> Cond(construire_arbre_abstrait a, construire_arbre_abstrait b, construire_arbre_abstrait c)
  | x -> raise(MatchException x);; 

let arbAbs = construire_arbre_abstrait arbConc;;