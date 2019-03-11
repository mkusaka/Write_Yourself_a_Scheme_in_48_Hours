module Main where
import System.Environment

main::IO()
main = do
  putStrLn("Please input your name: ")
  arg <- getLine
  putStrLn("Thank you! " ++ arg ++ "! Today is a good day to live.")
