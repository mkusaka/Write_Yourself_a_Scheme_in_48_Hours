module Main where
import System.Environment

main::IO()
main = do
  args <- getArgs
  putStrLn("answer is,,, " ++ show ( read (args !! 0) ** read(args !! 1)) ++ " !!")
