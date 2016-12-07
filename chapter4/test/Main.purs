module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, logShow)
import Data.Path (root)
import Data.Foldable (for_)
import FileOperations (allFiles)
import Exercises (squares)

main :: Eff (console :: CONSOLE) Unit
main =
  logShow squares [1.0, 2.0]
  for_ (allFiles root) logShow

