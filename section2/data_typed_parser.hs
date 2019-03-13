module Main where
import System.Environment

import Text.ParserCombinators.Parsec hiding (spaces)
import System.Environment

import Control.Monad -- for liftM

data LispVal = Atom String
             | List [LispVal]
             | DottedList [LispVal] LispVal
             | Number Integer
             | String String
             | Bool Bool

-- `Remember, each line of a do-block must have the same type, ` ok...
parseString::Parser LispVal
parseString = do
  char '"'
  x <- many (noneOf "\"")
  char '"'
  return $ String x

symbol::Parser Char
symbol = oneOf "!#$%&|*+-/:<=>?@^_~"

parseAtom::Parser LispVal
parseAtom = do
  first <- letter <|> symbol
  rest <- many (letter <|> digit <|> symbol) -- same as `many $ letter <|> digit <|> symbol` ?
  let atom = first:rest
  return $ case atom of
    "#t" -> Bool True
    "#f" -> Bool False
    _ -> Atom atom

parseNumber::Parser LispVal
parseNumber = liftM (Number . read) $ many1 digit

parseExpr::Parser LispVal
parseExpr = parseAtom
    <|> parseString
    <|> parseNumber

readExper::String -> String
readExper input = case parse parseExpr "lisp" input of
  Left err -> "No match:" ++ show err
  Right _ -> "found value"

spaces::Parser ()
spaces = skipMany1 space

parseList::Parser LispVal
parseList = liftM List $ stepBy parserExpr spaces



main::IO()
main = do
  (expr:_) <- getArgs
  putStrLn(readExper expr)

-- command: ghc -package parsec -o simple_parser data_typed_parser.hs
