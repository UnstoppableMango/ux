module Main (main) where

import Data.Text.IO qualified as T
import Data.Version (showVersion)
import Paths_ux (version)
import System.Environment (getArgs)
import System.Exit (exitFailure)
import System.IO (hPutStr, hPutStrLn, stderr)
import Text.Megaparsec (errorBundlePretty)
import Ux.Parser (parseFile)

main :: IO ()
main =
  getArgs >>= \case
    ["version"] -> putStrLn (showVersion version)
    ["parse", path] -> do
      src <- T.readFile path
      case parseFile path src of
        Left err -> hPutStr stderr (errorBundlePretty err) >> exitFailure
        Right ast -> print ast
    _ -> hPutStrLn stderr "usage: ux version | ux parse FILE" >> exitFailure
