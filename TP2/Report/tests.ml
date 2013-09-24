(* Test 1 *)
(* Expression simple, avec commentaire 
(ouverture et fermeture avec une seule étoile) *)
(*
	/* Ceci est un test */ Test
*)
Token: UL_IDENT Test
Token: UL_EOF
DONE

(* Test 2 *)
(* Expression plus complexe (avec parenthèse
et EGAL), ainsi que des étoiles multiples en 
ouverture/fermeture des commentaires *)
(*
	/** Ceci est un autre test **/   
	Si (essai = condition) alors test
*)
Token: UL_IDENT Si
Token: UL_PAROUV
Token: UL_IDENT essai
Token: UL_EGAL
Token: UL_IDENT condition
Token: UL_PARFERM
Token: UL_IDENT alors
Token: UL_IDENT test
Token: UL_EOF
DONE

(* Test 3 *)
(* Inégalités/différences/connecteurs 
logiques, ainsi que de la reconnaissance des chiffres *)
(*
	Si (1 <> 2) ou (3 > 4) alors 2 et 3
*)
Token: UL_IDENT Si
Token: UL_PAROUV
Token: UL_IDENT 1
Token: UL_DIFF
Token: UL_IDENT 2
Token: UL_PARFERM
Token: UL_OU
Token: UL_PAROUV
Token: UL_IDENT 3
Token: UL_SUP
Token: UL_IDENT 4
Token: UL_PARFERM
Token: UL_IDENT alors
Token: UL_IDENT 2
Token: UL_ET
Token: UL_IDENT 3
Token: UL_EOF
DONE