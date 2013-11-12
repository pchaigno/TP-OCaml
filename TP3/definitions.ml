

type decl = Bool | Int

type arbabstrait =
      Ident of string
   |  Bloc of (arbabstrait list) * (arbabstrait list)
   |  Declaration of decl * string
   |  Plus of arbabstrait * arbabstrait
   |  Inf of arbabstrait * arbabstrait
   |  And of arbabstrait * arbabstrait
   |  Affectation of string * arbabstrait;;  

 type exception = Exception of int * int;;