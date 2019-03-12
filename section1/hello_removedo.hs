module Main where
import System.Environment

main::IO()
main = getArgs >>= (\x -> putStrLn("Hello " ++ x !! 0))

-- command: ghc -o hello --make hello_removedo.hs
