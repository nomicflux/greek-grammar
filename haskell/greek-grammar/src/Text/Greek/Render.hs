{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}

module Text.Greek.Render where

import Data.Foldable
import Data.Set (Set)
import Text.Greek.FileReference
import Text.Greek.Script.Unit (Unit(..))
import qualified Data.Map as M
import qualified Data.Set as S
import qualified Data.Text.Format as T
import qualified Data.Text.Lazy as L
import qualified Text.Greek.Script.Unit as U

class Render a where
  render :: a -> L.Text

instance Render U.LetterChar where
  render = L.singleton . U.getLetterChar

instance Render U.MarkChar where
  render = T.format "\x25CC{}" . T.Only . U.getMarkChar

instance (Render a, Render b) => Render (a, b) where
  render (a, b) = T.format "({},{})" (render a, render b)

instance (Render l, Render m) => Render (Unit l m) where
  render (Unit c r ms) = T.format "({},{},{})" (render c, render r, render (M.toList ms))

instance Render FileCharReference where
  render (FileCharReference p l) = T.format "{}:{}" (T.Shown p, render l)

instance Render LineReference where
  render (LineReference (Line l) (Column c)) = T.format "{}:{}" (l, c)

instance Render a => Render [a] where
  render = L.intercalate "," . fmap render . toList

instance Render Int where
  render = L.pack . show

instance (Render l, Render m) => Render (U.Property l m) where
  render (U.PropertyLetter l) = render l
  render (U.PropertyMark m) = render m

instance Render a => Render (Set a) where
  render = render . S.toAscList