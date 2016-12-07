module Exercises where

import Prelude

import Data.Array (filter, null)
import Data.Array.Partial (head, tail)
import Data.Int (fromNumber, toNumber)
import Data.Maybe (Maybe(..), fromMaybe)
import Partial.Unsafe (unsafePartial)
import Math (abs)

absInt :: Int -> Maybe Int
absInt i | i < 0 = fromNumber (abs (toNumber i))
         | otherwise = Just i

even :: Int -> Boolean
even 0 = true
even 1 = false
even i | i < 0 = even (fromMaybe 1 (absInt i))
       | otherwise = even(i - 2)

evenInArray :: Array Int -> Int
evenInArray arr =
  let
    mapEven :: Boolean -> Int
    mapEven true = 1
    mapEven false = 0
  in
    if null arr
      then 0
      else mapEven(even(unsafePartial head arr)) + evenInArray(unsafePartial tail arr)

squares :: Array Number -> Array Number
squares arr = map (\n -> n * n) arr

noNegs :: Array Number -> Array Number
noNegs arr = filter (\n -> n >= 0.0) arr
