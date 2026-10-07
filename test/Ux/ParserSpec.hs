module Ux.ParserSpec (spec) where

import Data.List.NonEmpty (NonEmpty (..))
import Test.Hspec
import Test.Hspec.Megaparsec
import Text.Megaparsec (parse)
import Ux.Parser
import Ux.Syntax

spec :: Spec
spec = do
  describe "file" $ do
    it "parses an empty file" $
      parse file "" "" `shouldParse` File []

    it "parses a chain of converters" $
      parse file "" "pipeline api = tdl -> protobuf -> go"
        `shouldParse` File [Pipeline "api" ("tdl" :| ["protobuf", "go"])]

    it "skips comments and whitespace" $
      parse file "" "// models\npipeline a = x\n\npipeline b = y -> z // done\n"
        `shouldParse` File [Pipeline "a" ("x" :| []), Pipeline "b" ("y" :| ["z"])]

    it "rejects a pipeline with no steps" $
      parse file "" `shouldFailOn` "pipeline api ="

  describe "identifier" $ do
    it "accepts dashes and digits" $
      parse identifier "" "json-schema2" `shouldParse` "json-schema2"

    it "rejects a reserved word" $
      parse identifier "" `shouldFailOn` "pipeline"
