{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}

module Text.Greek.Process where

import Data.Map (Map)
import Data.Text (Text)
import Text.Greek.FileReference (FileReference)
import qualified Control.Lens as Lens
import qualified Data.Map as Map
import qualified Text.Greek.Json as Json
import qualified Text.Greek.Source.All as All
import qualified Text.Greek.Source.Work as Work
import qualified Text.Greek.Script.Word as Word
import qualified Text.Greek.Utility as Utility

go :: IO ()
go = All.loadAll >>= handleResult process . showError

process :: [Work.Indexed [Word.IndexedBasic (Text, FileReference)]] -> IO ()
process ws = dumpData (Json.Data ourIndex [] types)
  where
    ourIndex = Json.Index workInfos typeInfos
    typeInfos = fmap Json.makeTypeInfo types
    workInfos = []

    types :: [Json.Type]
    types = pure . store . generateType "Source Text" ValueSimple . extractWordProperty getSourceText $ ws

type WordLocation = (Work.Index, Word.Index)
newtype ValueIndex = ValueIndex { getValueIndex :: Int } deriving (Eq, Ord, Show)
data Value
  = ValueSimple Text
  deriving (Eq, Ord, Show)
data Type a = Type
  { typeTitle :: Text
  , typeInstances :: [(WordLocation, a)]
  , typeValueMap :: Map a ValueIndex
  , typeValueInstances :: [(Value, [WordLocation])]
  }

store :: Ord a => Type a -> Json.Type
store (Type t _ _ vs) = Json.Type t (fmap storeValue vs)
  where
    storeValue :: (Value, [WordLocation]) -> Json.Value
    storeValue ((ValueSimple vt), ls) = Json.Value vt (fmap locationToInstance ls)

    locationToInstance :: WordLocation -> Json.Instance
    locationToInstance = uncurry Json.Instance

generateType :: forall a. Ord a => Text -> (a -> Value) -> [(WordLocation, a)] -> Type a
generateType t f is = Type t is valueMap typedValueInstances
  where
    valueInstances :: [(a, [WordLocation])]
    valueInstances = Lens.over (traverse . Lens._2 . traverse) fst . Map.assocs . Utility.mapGroupBy snd $ is

    typedValueInstances :: [(Value, [WordLocation])]
    typedValueInstances = Lens.over (traverse . Lens._1) f valueInstances

    indexedValues :: [(a, ValueIndex)]
    indexedValues = Lens.over (traverse . Lens._2) ValueIndex . flip zip [0..] . fmap fst $ valueInstances

    valueMap :: Map a ValueIndex
    valueMap = Map.fromList indexedValues

getSourceText :: Word.IndexedBasic (Text, FileReference) -> Text
getSourceText = Lens.view (Word.surface . Lens._1)

extractWordProperty :: forall a b c. (Word.Indexed a b -> c) -> [Work.Indexed [Word.Indexed a b]] -> [(WordLocation, c)]
extractWordProperty f = concatMap getIndexedWorkProps
  where
    getIndexedWorkProps :: Work.Indexed [Word.Indexed a b] -> [(WordLocation, c)]
    getIndexedWorkProps w = fmap (\(i, p) -> ((getWorkIndex w, i), p)) (getWorkProps w)

    getWorkProps :: Work.Indexed [Word.Indexed a b] -> [(Word.Index, c)]
    getWorkProps = fmap getIndexedWordProp . Work.getContent

    getWorkIndex :: Work.Indexed x -> Work.Index
    getWorkIndex = Lens.view (Work.info . Lens._1)

    getIndexedWordProp :: Word.Indexed a b -> (Word.Index, c)
    getIndexedWordProp w = (getWordIndex w, f w)

    getWordIndex :: Word.Indexed a b -> Word.Index
    getWordIndex = Lens.view (Word.info . Lens._1)

handleResult :: (a -> IO ()) -> Either String a -> IO ()
handleResult _ (Left e) = putStrLn e
handleResult f (Right a) = f a

showError :: Show a => Either a b -> Either String b
showError = Lens.over Lens._Left show

dumpData :: Json.Data -> IO ()
dumpData = Json.dumpJson
