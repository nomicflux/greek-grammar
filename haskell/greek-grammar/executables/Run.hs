{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Lens
import Data.Either
import Data.List
import Text.Greek.Render
import Text.Greek.Source.All
import Text.Greek.Utility
import qualified Data.Text as T
import qualified Data.Text.IO as T
import qualified Data.Text.Lazy as L
import qualified Text.Greek.Script.Unit as U

main :: IO ()
main = do
  result <- loadAll
  case result of
    Left es -> printErrors es
    Right xs -> works xs
      
works :: [Work] -> IO ()
works ws = case errors of
  _ : _ -> printErrors errors
  [] -> unitMarks results
  where
    (errors, results) = partitionEithers . fmap (\(Word s r _) -> U.toUnits s r) . concatMap workWords $ ws

unitMarkLetterPairs :: [[U.UnitChar]] -> IO ()
unitMarkLetterPairs = renderAll . fmap (over _2 length) . sortOn fst . concatQuery (U.getMarkLetterPairs) . concat

unitLetterMarkSets :: [[U.UnitChar]] -> IO ()
unitLetterMarkSets = renderAll . fmap (over _2 length) . sortOn fst . query U.getLetterMarkSet . concat

unitLetters :: [[U.UnitChar]] -> IO ()
unitLetters = renderAll . fmap (over _2 length) . sortOn fst . query U.unitLetter . concat

unitMarks :: [[U.UnitChar]] -> IO ()
unitMarks = renderAll . fmap (over _2 length) . sortOn fst . concatQuery U.getMarks . concat

renderAll :: Render t => [t] -> IO ()
renderAll = mapM_ (T.putStrLn . L.toStrict . render)

printErrors :: (Show e, Foldable t) => t e -> IO ()
printErrors = mapM_ (T.putStrLn . T.pack . show)
