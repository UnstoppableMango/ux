-- | The parse tree of a ux file.
--
-- This is a stub: a file is a list of pipelines, and a pipeline is a chain of
-- converter names. The real grammar is still to be designed.
module Ux.Syntax
  ( File (..),
    Pipeline (..),
  )
where

import Data.List.NonEmpty (NonEmpty)
import Data.Text (Text)

newtype File = File {pipelines :: [Pipeline]}
  deriving (Eq, Show)

-- | @pipeline name = a -> b -> c@
data Pipeline = Pipeline
  { name :: Text,
    steps :: NonEmpty Text
  }
  deriving (Eq, Show)
