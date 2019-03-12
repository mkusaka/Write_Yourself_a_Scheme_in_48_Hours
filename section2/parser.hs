module Main where
import System.Environment

import Text.ParserCombinators.Parsec hiding (spaces)
import System.Environment

symbol::Parser Char
symbol = oneOf "!#$%&|*+-/:<=>?@^_~"

readExper::String -> String
readExper input = case parse symbol "lisp" input of
  Left err -> "No match: " ++ show err
  Right val -> "Found value"

main::IO()
main = do
  (expr:_) <- getArgs
  putStrLn(readExper expr)
-- command: ghc --make -o simple_parser parser.hs
-- if you find `Failed to load interface for ‘Text.ParserCombinations.Parsec’` error, then you may fix it by `stack install parsec`.
