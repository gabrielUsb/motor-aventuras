# aventura: motor de aventuras de texto en Haskell

Proyecto 1 de CI-3661 (Laboratorio de Lenguajes de Programacion I)

## Integrantes

| Nombre | Carnet |
|---|---|
| Gabriel | 15-11278 |
| Alejandro | 17-10684 |

## Variante

```
1511278 + 1710684 = 3221962
3221962 mod 4 = 2  →  Variante 2: Turnos
```

## Requisitos

- GHC (probado con 9.12.2) y cabal-install (3.14)
## Compilar

```
cabal update      # solo la primera vez
cabal build
```

## Correr

```
cabal run aventura -- <archivo-de-mundo>
cabal run aventura -- --validar <archivo-de-mundo>
cabal run aventura -- <archivo-de-mundo> < <guion>
```

## Probar

```
cabal test
```

## Estructura

| Ruta | Contenido |
|---|---|
| `src/Motor/` | Biblioteca: tipos, reconocedor, mundo, comandos, núcleo y persistencia |
| `app/Main.hs` | Ejecutable `aventura` |
| `test/` | Test-suite |
| `mundos/` | Mundos de ejemplo, el mundo propio y `invalidos/` |
| `guiones/` | Guiones que ganan los mundos |
