# Learning Objective

1. Initializing a new cabal project
2. Folder organization (Separate Lib & Exe)
3. Using external package
4. Interacting with the application from REPL

# Notes

## Project Init

* [Cabal GS Guide](https://cabal.readthedocs.io/en/latest/getting-started.html)

```bash
> mkdir myfirstapp
> cd myfirstapp
> cabal init --cabal-version=2.4 --libandexe -p myfirstapp
```

## Starting REPL

```bash
> cabal new-repl exe:myfirstapp
```