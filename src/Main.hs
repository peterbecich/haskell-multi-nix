module Main where

import Foo (fooFunc)

import Data.Text

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  fooFunc
