module Motor.Mundo where

import Data.Char (toLower)
import Data.List (intercalate)
import Motor.Tipos

leerMundo :: String -> Either [ErrorMundo] Mundo
leerMundo _ = Left []

mostrarError :: ErrorMundo -> String
mostrarError e = "Error: " ++ texto e
  where
    texto (ErrorSintaxis n msg) =
      "línea " ++ show n ++ ": " ++ msg
    texto (SalaDuplicada s) =
      "la sala " ++ sala s ++ " está definida más de una vez."
    texto (ObjetoDuplicado o) =
      "el objeto " ++ objeto o ++ " está definido más de una vez."
    texto (SalidaASalaInexistente s d t) =
      "la salida " ++ direccion d ++ " de la sala " ++ sala s
        ++ " lleva a la sala " ++ sala t ++ ", que no existe."
    texto (RequisitoInexistente s d o) =
      "la salida " ++ direccion d ++ " de la sala " ++ sala s
        ++ " requiere el objeto " ++ objeto o ++ ", que no existe."
    texto (SalidaDuplicada s d) =
      "la sala " ++ sala s ++ " tiene más de una salida hacia " ++ direccion d ++ "."
    texto (ObjetoNoDefinido s o) =
      "la sala " ++ sala s ++ " contiene el objeto " ++ objeto o ++ ", que no está definido."
    texto (ObjetoColocadoVariasVeces o ss) =
      "el objeto " ++ objeto o ++ " está colocado más de una vez (en "
        ++ intercalate ", " (map sala ss) ++ ")."
    texto (InicioInexistente s) =
      "INICIO indica la sala " ++ sala s ++ ", que no existe."
    texto (MetaConSalaInexistente s) =
      "META indica la sala " ++ sala s ++ ", que no existe."
    texto (MetaConObjetoInexistente o) =
      "META indica el objeto " ++ objeto o ++ ", que no existe."
    texto (SalaInalcanzable s) =
      "la sala " ++ sala s ++ " no es alcanzable desde INICIO."
    texto (ObjetoNoColocado o) =
      "el objeto " ++ objeto o ++ " se necesita, pero no está colocado en ninguna sala."

    sala (IdSala s) = s
    objeto (IdObjeto o) = o
    direccion = map toLower . show
