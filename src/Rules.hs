{-
-- EPITECH PROJECT, 2024
-- B-FUN-400-BAR-4-1-wolfram-renzo.maggiori
-- File description:
-- Rules
-}

module Rules (runRules) where

import Parser (Config(..))
import System.Exit (exitSuccess)
import Data.Bits (shiftR, (.&.), Bits (shiftL))


getPatternChar :: String -> Int -> String
getPatternChar str ruleNum = go str
  where
    go [] = ""
    go p@(_:xs)
      | length p >= 3 = char ruleNum (intPattern $ take 3 p) ++ go xs
      | otherwise = ""

intPattern :: String -> Int
intPattern = foldr (\(i, c) acc -> acc + if c == '*'
    then pow2 i else 0) 0 . zip [0..]
  where
    pow2 = shiftL 1

char :: Int -> Int -> String
char r p = if shiftR r p .&. 1 == 1 then "*" else " "


loop :: Int -> String -> Config -> IO ()
loop 0 _ _ = exitSuccess
loop left prevLine conf = display prevLine
  (start conf) (window conf) (move conf) >>
  loop (if start conf > 0 then left else left - 1)
    (getPatternChar ("  " ++ prevLine ++ "  ") (rule conf))
      conf { start = start conf - 1 }

getLeft :: Int -> Int -> String
getLeft lineLength width = replicate ((width - lineLength + 1) `div` 2) ' '

getRight :: Int -> Int -> String
getRight lineLength width = replicate
  (max 0 ((width - lineLength) `div` 2)) ' '

padding :: String -> Int -> String
padding line lineMove = replicate (max 0 lineMove) ' ' ++
  take (length line - abs lineMove) line ++ replicate (max 0 (-lineMove)) ' '

formatLine :: String -> Int -> String
formatLine line width = getLeft (length line) width ++
  line ++ getRight (length line) width

display :: String -> Int -> Int -> Int -> IO ()
display line leftToSkip width lineMove
  | leftToSkip > 0 = return ()
  | otherwise = putStrLn $ padding
    (take width . drop
      ((length formattedLine - width) `div` 2) $ formattedLine) lineMove
  where
    formattedLine = formatLine (reverse line) width

runRules :: Config -> IO ()
runRules conf = loop (maybe (-1) id (numLines conf)) "*" conf
