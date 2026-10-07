-- | A megaparsec parser for 'Ux.Syntax'.
module Ux.Parser
  ( Parser,
    parseFile,
    file,
    pipeline,
    identifier,
  )
where

import Control.Monad (void)
import Control.Monad.Combinators.NonEmpty qualified as NE
import Data.Text (Text)
import Data.Text qualified as T
import Data.Void (Void)
import Text.Megaparsec
import Text.Megaparsec.Char
import Text.Megaparsec.Char.Lexer qualified as L
import Ux.Syntax

type Parser = Parsec Void Text

parseFile :: FilePath -> Text -> Either (ParseErrorBundle Text Void) File
parseFile = parse file

file :: Parser File
file = File <$> (sc *> many pipeline <* eof)

pipeline :: Parser Pipeline
pipeline = do
  keyword "pipeline"
  n <- identifier
  symbol "="
  Pipeline n <$> NE.sepBy1 identifier (symbol "->")

identifier :: Parser Text
identifier = lexeme . try $ do
  ident <- T.cons <$> start <*> takeWhileP Nothing rest
  if ident `elem` reserved
    then fail ("reserved word " <> show ident)
    else pure ident
  where
    start = letterChar <|> char '_' <?> "identifier"
    rest c = c == '_' || c == '-' || c `elem` ['a' .. 'z'] || c `elem` ['A' .. 'Z'] || c `elem` ['0' .. '9']

reserved :: [Text]
reserved = ["pipeline"]

keyword :: Text -> Parser ()
keyword w = lexeme . try $ string w *> notFollowedBy (alphaNumChar <|> char '_' <|> char '-')

symbol :: Text -> Parser ()
symbol = void . L.symbol sc

lexeme :: Parser a -> Parser a
lexeme = L.lexeme sc

-- | Whitespace and @//@ comments.
sc :: Parser ()
sc = L.space space1 (L.skipLineComment "//") empty
