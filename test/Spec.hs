module Main (main) where

import Test.Hspec
import Ux.IrSpec qualified
import Ux.ParserSpec qualified

main :: IO ()
main = hspec $ do
  describe "Ux.Ir" Ux.IrSpec.spec
  describe "Ux.Parser" Ux.ParserSpec.spec
