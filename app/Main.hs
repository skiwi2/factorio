module Main where

import Lib
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    case args of
        [bpStr] -> case blueprintJson bpStr of
            Left err    -> putStrLn ("Error: " ++ err)
            Right json  -> putStrLn json
        _       -> putStrLn "Usage: factorio-exe <blueprint-string>"