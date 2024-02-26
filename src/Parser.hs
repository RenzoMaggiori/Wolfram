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

validRule :: Int -> Bool
validRule r = r >= 0 && r <= 255

updateConfig :: String -> Int -> Config -> Maybe Config
updateConfig "--rule" val conf | validRule val = Just conf { rule = val }
updateConfig "--start" val conf | val >= 0 = Just conf { start = val }
updateConfig "--lines" val conf | val >= 0 = Just conf { numLines = Just val }
updateConfig "--window" val conf | val >= 0 = Just conf { window = val }
updateConfig "--move" val conf = Just conf { move = val }
updateConfig _ _ _ = Nothing

parseArgs :: [String] -> Maybe Config -> Maybe Config
parseArgs (o:v:rs) (Just conf) = case readMaybe v of
    Just val -> parseArgs rs $ updateConfig o val conf
    Nothing -> Nothing
parseArgs [] conf = conf
parseArgs _ _ = Nothing
