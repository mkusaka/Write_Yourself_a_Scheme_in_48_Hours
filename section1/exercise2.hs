module Main where
import System.Environment

main::IO()
main = do
  args <- getArgs
  x <- args !! 0
  y <- args !! 1
  numx <- read x
  numy <- read y
  result <- x ** y
  strResult <- show result
  putStrLn("answer is,,, " ++ strResult ++ " !!")
