module Test.Main (main) where

-- kudos http://konkle.us/purescript-for-front-end-developers/

import Prelude

import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)

import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)

import Exercises (noNegs, squares)

main :: Eff (console :: CONSOLE, testOutput :: TESTOUTPUT, avar :: AVAR) Unit
main = runTest do
  suite "Exercises" do
    suite "squares" do
      test "[]" do
        equal (squares []) []

      test "[1.0]" do
        equal (squares [1.0]) [1.0]

      test "[1.0, 2.0]" do
        equal (squares [1.0, 2.0]) [1.0, 4.0]

    suite "noNegs" do
      test "[]" do
        equal (noNegs []) []

      test "[1.0]" do
        equal (noNegs [1.0]) [1.0]

      test "[-1.0]" do
        equal (noNegs [-1.0]) []

-- instead of 'forall' you can use ∀
-- e.g. ∀ a b. a -> b -> a


-- import Data.Path (root)
-- import Data.Foldable (for_)
-- import FileOperations (allFiles)

-- main :: Eff (console :: CONSOLE) Unit
-- main =
--   for_ (allFiles root) logShow

