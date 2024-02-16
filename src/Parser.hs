{-
-- EPITECH PROJECT, 2024
-- B-FUN-400-BAR-4-1-wolfram-renzo.maggiori
-- File description:
-- Parser
-}

module Parser (getOptions, Config(..)) where

import Text.Read (readMaybe)

data Config = Config { rule, start, window, move :: Int, numLines :: Maybe Int }

defaultConf :: Config
defaultConf = Config {
  rule = 0,
  start = 0,
  window = 80,
  move = 0,
  numLines = Nothing
}

getOptions :: [String] -> Maybe Config
getOptions args
  | "--rule" `notElem` args = Nothing
  | otherwise = parseArgs args (Just defaultConf)

parseArgs :: [String] -> Maybe Config -> Maybe Config
parseArgs (o:v:rs) (Just conf) = case readMaybe v of
    Just val -> parseArgs rs $ case o of
        "--rule" | validRule val -> Just conf { rule = val }
        "--start" | val >= 0 -> Just conf { start = val }
        "--lines" | val >= 0 -> Just conf { numLines = Just val }
        "--window" | val >= 0 -> Just conf { window = val }
        "--move" -> Just conf { move = val }
        _ -> Nothing
    Nothing -> Nothing
  where
    validRule r = r >= 0 && r <= 255
parseArgs [] conf = conf
parseArgs _ _ = Nothing
