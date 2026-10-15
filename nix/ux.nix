{ mkDerivation, base, hspec, hspec-megaparsec, lib, megaparsec
, microlens, parser-combinators, proto-lens
, proto-lens-protobuf-types, proto-lens-runtime, text
}:
mkDerivation {
  pname = "ux";
  version = "0.0.12";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base megaparsec parser-combinators proto-lens-protobuf-types
    proto-lens-runtime text
  ];
  executableHaskellDepends = [ base megaparsec text ];
  testHaskellDepends = [
    base hspec hspec-megaparsec megaparsec microlens proto-lens text
  ];
  doHaddock = false;
  homepage = "https://github.com/UnstoppableMango/ux";
  description = "Expressive artifact conversion pipelines";
  license = lib.meta.getLicenseFromSpdxId "MIT";
  mainProgram = "ux";
}
