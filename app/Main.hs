{-
-- EPITECH PROJECT, 2024
-- B-FUN-400-BAR-4-1-wolfram-renzo.maggiori
-- File description:
-- Main
-}

module Main (main) where

import System.Environment (getArgs)
import System.Exit (exitWith, ExitCode(ExitFailure))
import System.IO (hPutStrLn, stderr)
import Parser (getOptions)
import Rules (runRules)

main :: IO ()
main = do
    cliArgs <- getArgs
    case getOptions cliArgs of
        Nothing -> hPutStrLn stderr "Error: Invalid configuration" >>
          exitWith (ExitFailure 84)
        Just conf -> runRules conf
