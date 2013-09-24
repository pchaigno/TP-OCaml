(*******************************************************************************)
(*			TP2. Analyseur syntaxique			       *)
(* 									       *)
(*   Interface de la librairie analex.cma, l'analyseur lexical de secours      *)
(*									       *)
(* 									       *)
(*   NOTE : N'utilisez cette librairie que si l'analyseur construit au Tp 1    *)
(*     n'est pas termin� ou contient des bugs que vous n'arrivez pas �	       *)
(*     corriger! La r�utilisation de l'analyseur lexical construit au TP1      *)
(*     sera consid�r�e comme un "plus" par les correcteurs.		       *)
(*									       *)
(*									       *)
(*									       *)
(*	Der. Rev. : 03 Oct. 08		par : Beno�t Boyer		       *)
(*									       *)
(*******************************************************************************)


(** Unit�s lexicales reconnues et renvoy�es par l'analyseur lexical *)
type unite_lexicale =
  | UL_IDENT of string
  | UL_PAROUV
  | UL_PARFERM
  | UL_SUP
  | UL_INF
  | UL_EGAL
  | UL_DIFF
  | UL_SUP_EG
  | UL_INF_EG
  | UL_ET
  | UL_OU
  | UL_SI
  | UL_ALORS
  | UL_SINON
  | UL_FSI
  | UL_EOF
  | UL_ERR of string

(** Un lex�me est une cha�ne de caract�res *)
type lexeme = string

val get_token : in_channel -> unite_lexicale * lexeme
(** Scanner incr�mental : [get_token] lit et renvoie un lex�me ainsi que
    l'unit� lexicale associ�e, � partir d'un fichier ouvert en lecture. *)

val scanner2 : in_channel -> unite_lexicale list
(** Lit un fichier ouvert en lecture et renvoie la liste des unit�s lexicales
    lues. Les erreurs lexicales sont affich�es sur la sortie d'erreurs. *)
