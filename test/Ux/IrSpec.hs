module Ux.IrSpec (spec) where

import Data.ProtoLens (decodeMessage, defMessage, encodeMessage)
import Lens.Micro ((&), (.~))
import Proto.Tdl.Ir.V1.Ir (Model)
import Proto.Tdl.Ir.V1.Ir_Fields (doc, package)
import Test.Hspec

spec :: Spec
spec = describe "tdl.ir.v1.Model" $
  it "round-trips through the wire format" $ do
    let model :: Model
        model = defMessage & package .~ "example" & doc .~ ["A model."]
    decodeMessage (encodeMessage model) `shouldBe` Right model
