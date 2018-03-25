module Main where

import Lib
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    if null args
        then putStrLn "Usage: factorio-exe <blueprint-string>"
        else do
            case blueprintJson (head args) of
                Left err    -> putStrLn ("Error: " ++ err)
                Right json  -> putStrLn json