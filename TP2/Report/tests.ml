(* Test 1 : t < y et x = y *)
let (arbConc1, listeVide) = analyse_caractere (Vn FILE, [UL_IDENT "t"; UL_SUP; UL_IDENT "y"; UL_ET; UL_IDENT "x"; UL_EGAL; UL_IDENT "y"; UL_EOF]);;
(*
val arbConc1 : arbre_concret =
  Node (Fichier,
   [Node (Expr,
     [Node (Termb,
       [Node (Facteurb,
         [Node (Relation,
           [Leaf (UL_IDENT "t"); Node (Op, [Leaf UL_INF]); Leaf (UL_IDENT "y")])]);
        Node (SuiteTermb,
         [Leaf UL_ET;
          Node (Termb,
           [Node (Facteurb,
             [Node (Relation,
               [Leaf (UL_IDENT "x"); Node (Op, [Leaf UL_EGAL]);
                Leaf (UL_IDENT "y")])]);
            Node (SuiteTermb, [])])])]);
      Node (SuiteExpr, [])]);
    Leaf UL_EOF])
val listeVide : vt list = []
*)

(* Test 2 : On essaye d’avoir l’arbre abstrait correspondant à l’expression précédente *)
let arbAbstr = construit_arbre_abstrait(arbConc1);;
(*
#     val arbAbstr : arbre_abstrait =
  Et (Comp ("t", UL_SUP, "t"), Comp ("x", UL_EGAL, "y"))
*)

(* Test 3 : On essaye d’avoir l’arbre concret d’une expression volontairement fausse (manque du Fsi) :  Si a Alors b Sinon c *)
let (arbConc2, listeVide) = analyse_caractere (Vn FILE, [UL_SI; UL_IDENT "a"; UL_ALORS; UL_IDENT "b"; UL_SINON; UL_IDENT "c"; UL_EOF]);;
(*
Exception : Failure
*)

(* Test 4 : (a <= b) ou a = c *)
let (arbConc3, listeVide) =  analyse_caractere(Vn FICHIER,[UL_PAROUV; UL_IDENT "a"; UL_INFEGAL; UL_IDENT "b"; UL_PARFERM; UL_OU; UL_IDENT "a"; UL_EGAL; UL_IDENT "c"; UL_EOF]);;
(*
#           val arbConc : arbre_concret =
  Node (FILE,
   [Node (Expr,
     [Node (Termb,
       [Node (Facteurb,
         [Leaf UL_PAROUV;
          Node (Expr,
           [Node (Termb,
             [Node (Facteurb,
               [Node (Relation,
                 [Leaf (UL_IDENT "a"); Node (Op, [Leaf UL_INFEGAL]);
                  Leaf (UL_IDENT "b")])]);
              Node (SuiteTermb, [])]);
            Node (SuiteExpr, [])]);
          Leaf UL_PARFERM]);
        Node (SuiteTermb, [])]);
      Node (SuiteExpr,
       [Leaf UL_OU;
        Node (Expr,
         [Node (Termb,
           [Node (Facteurb,
             [Node (Relation,
               [Leaf (UL_IDENT "a"); Node (Op, [Leaf UL_EGAL]);
                Leaf (UL_IDENT "c")])]);
            Node (SuiteTermb, [])]);
          Node (SuiteExpr, [])])])]);
    Leaf UL_EOF])
val listeVide : unite_lexicale list = []
*)

(* Test 5 : On essaye d’avoir l’arbre abstrait correspondant à l’expression précédente *)
let arbAbstr = construit_arbre_abstrait(arbConc3);;
(*
#     val arbAbstr : arbre_abstrait =
     Ou (Comp ("a", UL_INFEGAL, "b"), Comp ("a", UL_EGAL, "c"))
*)

(* Test 6 : On essaye d’avoir l’arbre concret d’une expression volontairement fausse (deux OU à suivre) :  a ou ou b et c *)
let (arbConc2, listeVide) = analyse_caractere (Vn FILE, [UL_IDENT "a"; UL_OU; UL_OU; UL_IDENT "b"; UL_ET; UL_IDENT "c"; UL_EOF]);;
(*
Exception : Failure
*)