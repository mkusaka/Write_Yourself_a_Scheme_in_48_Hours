module Main where
import System.Environment

import Text.ParserCombinators.Parsec hiding (spaces)
import System.Environment

symbol::Parser Char
symbol = oneOf "!#$%&|*+-/:<=>?@^_~"

spaces::Parser ()
spaces = skipMany1 space

readExper::String -> String
readExper input = case parse (spaces>>symbol) "lisp" input of
  Left err -> "No match: " ++ show err
  Right val -> "Found value " ++ show val

main::IO()
main = do
  (expr:_) <- getArgs
  putStrLn(readExper expr)

-- command: ghc --make -o whiteignore_parser whitespace_parser.hs
