module Motor.Tipos where

import Data.Map (Map)

newtype IdSala = IdSala String
  deriving (Eq, Ord, Show, Read)

newtype IdObjeto = IdObjeto String
  deriving (Eq, Ord, Show, Read)

data Direccion = Norte | Sur | Este | Oeste | Arriba | Abajo
  deriving (Eq, Ord, Show, Read, Enum, Bounded)

data Meta
  = LlegarA IdSala
  | LlevarA IdObjeto IdSala
  deriving (Eq, Show, Read)

data Salida = Salida
  { destino  :: IdSala
  , requiere :: Maybe IdObjeto
  }
  deriving (Eq, Show, Read)

data Sala = Sala
  { descSala :: String
  , salidas  :: Map Direccion Salida
  }
  deriving (Eq, Show, Read)

newtype Objeto = Objeto
  { descObjeto :: String
  }
  deriving (Eq, Show, Read)

data Mundo = Mundo
  { titulo     :: String
  , inicio     :: IdSala
  , meta       :: Meta
  , turnos     :: Maybe Int
  , salas      :: Map IdSala Sala
  , objetos    :: Map IdObjeto Objeto
  , colocacion :: Map IdObjeto IdSala
  }
  deriving (Eq, Show, Read)

data Ubicacion
  = EnSala IdSala
  | EnInventario
  deriving (Eq, Show, Read)

data Fase = Jugando | Ganado | SinTiempo | Terminado
  deriving (Eq, Show, Read)

data Estado = Estado
  { mundo           :: Mundo
  , salaActual      :: IdSala
  , ubicaciones     :: Map IdObjeto Ubicacion
  , turnosRestantes :: Maybe Int
  , fase            :: Fase
  }
  deriving (Eq, Show, Read)

data Comando
  = Ir Direccion
  | Mirar
  | Tomar IdObjeto
  | Soltar IdObjeto
  | Examinar IdObjeto
  | Inventario
  | Guardar FilePath
  | Cargar FilePath
  | Ayuda
  | Salir
  deriving (Eq, Show, Read)

data ErrorMundo
  = ErrorSintaxis Int String
  | SalaDuplicada IdSala
  | ObjetoDuplicado IdObjeto
  | SalidaASalaInexistente IdSala Direccion IdSala
  | RequisitoInexistente IdSala Direccion IdObjeto
  | SalidaDuplicada IdSala Direccion
  | ObjetoNoDefinido IdSala IdObjeto
  | ObjetoColocadoVariasVeces IdObjeto [IdSala]
  | InicioInexistente IdSala
  | MetaConSalaInexistente IdSala
  | MetaConObjetoInexistente IdObjeto
  | SalaInalcanzable IdSala
  | ObjetoNoColocado IdObjeto
  deriving (Eq, Show, Read)
