(*#use "parser.ml";;
#use "lexer.ml";;*)

(* si le fichier "test" contient un code à analyser *)
(*main get_token (Lexing.from_channel (open_in "test"));;*)

(* pour de tous petits tests *)
(*main get_token (Lexing.from_string "begin int a ; a <- b + c end");;

(* La suite est utile pour tester l'analyseur lexical tout seul. *)
(* Il faut juste déclarer le type token. Normalement il est déclaré au début du *)
(* fichier parser.ml et provient des %token qui se trouvent dans l'en-tête de *)
(* parser.mly. *)
let lexbuf = Lexing.from_channel (open_in "test");;
(* ou *)
(* let lexbuf = Lexing.from_string "begin int a ; a <- b + c end";; *)

get_token lexbuf;; (* donne la prochaine unité lexicale *)
*)