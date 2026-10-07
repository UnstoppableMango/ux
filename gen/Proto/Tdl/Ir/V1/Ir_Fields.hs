{- This file was auto-generated from tdl/ir/v1/ir.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Tdl.Ir.V1.Ir_Fields where
import qualified Data.ProtoLens.Runtime.Prelude as Prelude
import qualified Data.ProtoLens.Runtime.Data.Int as Data.Int
import qualified Data.ProtoLens.Runtime.Data.Monoid as Data.Monoid
import qualified Data.ProtoLens.Runtime.Data.Word as Data.Word
import qualified Data.ProtoLens.Runtime.Data.ProtoLens as Data.ProtoLens
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Bytes as Data.ProtoLens.Encoding.Bytes
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Growing as Data.ProtoLens.Encoding.Growing
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Parser.Unsafe as Data.ProtoLens.Encoding.Parser.Unsafe
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Wire as Data.ProtoLens.Encoding.Wire
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Field as Data.ProtoLens.Field
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Message.Enum as Data.ProtoLens.Message.Enum
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Service.Types as Data.ProtoLens.Service.Types
import qualified Data.ProtoLens.Runtime.Lens.Family2 as Lens.Family2
import qualified Data.ProtoLens.Runtime.Lens.Family2.Unchecked as Lens.Family2.Unchecked
import qualified Data.ProtoLens.Runtime.Data.Text as Data.Text
import qualified Data.ProtoLens.Runtime.Data.Map as Data.Map
import qualified Data.ProtoLens.Runtime.Data.ByteString as Data.ByteString
import qualified Data.ProtoLens.Runtime.Data.ByteString.Char8 as Data.ByteString.Char8
import qualified Data.ProtoLens.Runtime.Data.Text.Encoding as Data.Text.Encoding
import qualified Data.ProtoLens.Runtime.Data.Vector as Data.Vector
import qualified Data.ProtoLens.Runtime.Data.Vector.Generic as Data.Vector.Generic
import qualified Data.ProtoLens.Runtime.Data.Vector.Unboxed as Data.Vector.Unboxed
import qualified Data.ProtoLens.Runtime.Text.Read as Text.Read
import qualified Proto.Google.Protobuf.GoFeatures
alias ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "alias" a) =>
  Lens.Family2.LensLike' f s a
alias = Data.ProtoLens.Field.field @"alias"
args ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "args" a) =>
  Lens.Family2.LensLike' f s a
args = Data.ProtoLens.Field.field @"args"
arrow ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "arrow" a) =>
  Lens.Family2.LensLike' f s a
arrow = Data.ProtoLens.Field.field @"arrow"
assocTypes ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "assocTypes" a) =>
  Lens.Family2.LensLike' f s a
assocTypes = Data.ProtoLens.Field.field @"assocTypes"
atom ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "atom" a) =>
  Lens.Family2.LensLike' f s a
atom = Data.ProtoLens.Field.field @"atom"
base ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "base" a) =>
  Lens.Family2.LensLike' f s a
base = Data.ProtoLens.Field.field @"base"
binds ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "binds" a) =>
  Lens.Family2.LensLike' f s a
binds = Data.ProtoLens.Field.field @"binds"
class' ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "class'" a) =>
  Lens.Family2.LensLike' f s a
class' = Data.ProtoLens.Field.field @"class'"
column ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "column" a) =>
  Lens.Family2.LensLike' f s a
column = Data.ProtoLens.Field.field @"column"
conforms ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "conforms" a) =>
  Lens.Family2.LensLike' f s a
conforms = Data.ProtoLens.Field.field @"conforms"
constraints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "constraints" a) =>
  Lens.Family2.LensLike' f s a
constraints = Data.ProtoLens.Field.field @"constraints"
ctor ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "ctor" a) =>
  Lens.Family2.LensLike' f s a
ctor = Data.ProtoLens.Field.field @"ctor"
decl ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "decl" a) =>
  Lens.Family2.LensLike' f s a
decl = Data.ProtoLens.Field.field @"decl"
decls ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "decls" a) =>
  Lens.Family2.LensLike' f s a
decls = Data.ProtoLens.Field.field @"decls"
defaultValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "defaultValue" a) =>
  Lens.Family2.LensLike' f s a
defaultValue = Data.ProtoLens.Field.field @"defaultValue"
deprecated ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "deprecated" a) =>
  Lens.Family2.LensLike' f s a
deprecated = Data.ProtoLens.Field.field @"deprecated"
dims ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "dims" a) =>
  Lens.Family2.LensLike' f s a
dims = Data.ProtoLens.Field.field @"dims"
directives ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "directives" a) =>
  Lens.Family2.LensLike' f s a
directives = Data.ProtoLens.Field.field @"directives"
doc ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "doc" a) =>
  Lens.Family2.LensLike' f s a
doc = Data.ProtoLens.Field.field @"doc"
enumeration ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "enumeration" a) =>
  Lens.Family2.LensLike' f s a
enumeration = Data.ProtoLens.Field.field @"enumeration"
exponent ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "exponent" a) =>
  Lens.Family2.LensLike' f s a
exponent = Data.ProtoLens.Field.field @"exponent"
extern ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "extern" a) =>
  Lens.Family2.LensLike' f s a
extern = Data.ProtoLens.Field.field @"extern"
externs ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "externs" a) =>
  Lens.Family2.LensLike' f s a
externs = Data.ProtoLens.Field.field @"externs"
fields ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "fields" a) =>
  Lens.Family2.LensLike' f s a
fields = Data.ProtoLens.Field.field @"fields"
filename ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "filename" a) =>
  Lens.Family2.LensLike' f s a
filename = Data.ProtoLens.Field.field @"filename"
forPackage ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "forPackage" a) =>
  Lens.Family2.LensLike' f s a
forPackage = Data.ProtoLens.Field.field @"forPackage"
from ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "from" a) =>
  Lens.Family2.LensLike' f s a
from = Data.ProtoLens.Field.field @"from"
fromClass ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fromClass" a) =>
  Lens.Family2.LensLike' f s a
fromClass = Data.ProtoLens.Field.field @"fromClass"
funDeps ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "funDeps" a) =>
  Lens.Family2.LensLike' f s a
funDeps = Data.ProtoLens.Field.field @"funDeps"
high ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "high" a) =>
  Lens.Family2.LensLike' f s a
high = Data.ProtoLens.Field.field @"high"
imports ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "imports" a) =>
  Lens.Family2.LensLike' f s a
imports = Data.ProtoLens.Field.field @"imports"
includedFrom ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "includedFrom" a) =>
  Lens.Family2.LensLike' f s a
includedFrom = Data.ProtoLens.Field.field @"includedFrom"
index ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "index" a) =>
  Lens.Family2.LensLike' f s a
index = Data.ProtoLens.Field.field @"index"
instances ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "instances" a) =>
  Lens.Family2.LensLike' f s a
instances = Data.ProtoLens.Field.field @"instances"
items ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "items" a) =>
  Lens.Family2.LensLike' f s a
items = Data.ProtoLens.Field.field @"items"
kind ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "kind" a) =>
  Lens.Family2.LensLike' f s a
kind = Data.ProtoLens.Field.field @"kind"
line ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "line" a) =>
  Lens.Family2.LensLike' f s a
line = Data.ProtoLens.Field.field @"line"
low ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "low" a) =>
  Lens.Family2.LensLike' f s a
low = Data.ProtoLens.Field.field @"low"
maybe'alias ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'alias" a) =>
  Lens.Family2.LensLike' f s a
maybe'alias = Data.ProtoLens.Field.field @"maybe'alias"
maybe'arrow ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'arrow" a) =>
  Lens.Family2.LensLike' f s a
maybe'arrow = Data.ProtoLens.Field.field @"maybe'arrow"
maybe'base ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'base" a) =>
  Lens.Family2.LensLike' f s a
maybe'base = Data.ProtoLens.Field.field @"maybe'base"
maybe'class' ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'class'" a) =>
  Lens.Family2.LensLike' f s a
maybe'class' = Data.ProtoLens.Field.field @"maybe'class'"
maybe'ctor ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'ctor" a) =>
  Lens.Family2.LensLike' f s a
maybe'ctor = Data.ProtoLens.Field.field @"maybe'ctor"
maybe'decl ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'decl" a) =>
  Lens.Family2.LensLike' f s a
maybe'decl = Data.ProtoLens.Field.field @"maybe'decl"
maybe'defaultValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'defaultValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'defaultValue
  = Data.ProtoLens.Field.field @"maybe'defaultValue"
maybe'deprecated ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'deprecated" a) =>
  Lens.Family2.LensLike' f s a
maybe'deprecated = Data.ProtoLens.Field.field @"maybe'deprecated"
maybe'enumeration ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'enumeration" a) =>
  Lens.Family2.LensLike' f s a
maybe'enumeration = Data.ProtoLens.Field.field @"maybe'enumeration"
maybe'extern ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'extern" a) =>
  Lens.Family2.LensLike' f s a
maybe'extern = Data.ProtoLens.Field.field @"maybe'extern"
maybe'from ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'from" a) =>
  Lens.Family2.LensLike' f s a
maybe'from = Data.ProtoLens.Field.field @"maybe'from"
maybe'fromClass ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'fromClass" a) =>
  Lens.Family2.LensLike' f s a
maybe'fromClass = Data.ProtoLens.Field.field @"maybe'fromClass"
maybe'high ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'high" a) =>
  Lens.Family2.LensLike' f s a
maybe'high = Data.ProtoLens.Field.field @"maybe'high"
maybe'includedFrom ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'includedFrom" a) =>
  Lens.Family2.LensLike' f s a
maybe'includedFrom
  = Data.ProtoLens.Field.field @"maybe'includedFrom"
maybe'kind ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'kind" a) =>
  Lens.Family2.LensLike' f s a
maybe'kind = Data.ProtoLens.Field.field @"maybe'kind"
maybe'low ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'low" a) =>
  Lens.Family2.LensLike' f s a
maybe'low = Data.ProtoLens.Field.field @"maybe'low"
maybe'meta ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'meta" a) =>
  Lens.Family2.LensLike' f s a
maybe'meta = Data.ProtoLens.Field.field @"maybe'meta"
maybe'newtype' ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'newtype'" a) =>
  Lens.Family2.LensLike' f s a
maybe'newtype' = Data.ProtoLens.Field.field @"maybe'newtype'"
maybe'node ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'node" a) =>
  Lens.Family2.LensLike' f s a
maybe'node = Data.ProtoLens.Field.field @"maybe'node"
maybe'owner ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'owner" a) =>
  Lens.Family2.LensLike' f s a
maybe'owner = Data.ProtoLens.Field.field @"maybe'owner"
maybe'param ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'param" a) =>
  Lens.Family2.LensLike' f s a
maybe'param = Data.ProtoLens.Field.field @"maybe'param"
maybe'paren ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'paren" a) =>
  Lens.Family2.LensLike' f s a
maybe'paren = Data.ProtoLens.Field.field @"maybe'paren"
maybe'position ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'position" a) =>
  Lens.Family2.LensLike' f s a
maybe'position = Data.ProtoLens.Field.field @"maybe'position"
maybe'primitive ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'primitive" a) =>
  Lens.Family2.LensLike' f s a
maybe'primitive = Data.ProtoLens.Field.field @"maybe'primitive"
maybe'range ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'range" a) =>
  Lens.Family2.LensLike' f s a
maybe'range = Data.ProtoLens.Field.field @"maybe'range"
maybe'structure ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'structure" a) =>
  Lens.Family2.LensLike' f s a
maybe'structure = Data.ProtoLens.Field.field @"maybe'structure"
maybe'target ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'target" a) =>
  Lens.Family2.LensLike' f s a
maybe'target = Data.ProtoLens.Field.field @"maybe'target"
maybe'type' ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'type'" a) =>
  Lens.Family2.LensLike' f s a
maybe'type' = Data.ProtoLens.Field.field @"maybe'type'"
maybe'unit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'unit" a) =>
  Lens.Family2.LensLike' f s a
maybe'unit = Data.ProtoLens.Field.field @"maybe'unit"
maybe'variant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'variant" a) =>
  Lens.Family2.LensLike' f s a
maybe'variant = Data.ProtoLens.Field.field @"maybe'variant"
meta ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "meta" a) =>
  Lens.Family2.LensLike' f s a
meta = Data.ProtoLens.Field.field @"meta"
name ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "name" a) =>
  Lens.Family2.LensLike' f s a
name = Data.ProtoLens.Field.field @"name"
newtype' ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "newtype'" a) =>
  Lens.Family2.LensLike' f s a
newtype' = Data.ProtoLens.Field.field @"newtype'"
order ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "order" a) =>
  Lens.Family2.LensLike' f s a
order = Data.ProtoLens.Field.field @"order"
owned ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "owned" a) =>
  Lens.Family2.LensLike' f s a
owned = Data.ProtoLens.Field.field @"owned"
owner ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "owner" a) =>
  Lens.Family2.LensLike' f s a
owner = Data.ProtoLens.Field.field @"owner"
package ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "package" a) =>
  Lens.Family2.LensLike' f s a
package = Data.ProtoLens.Field.field @"package"
param ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "param" a) =>
  Lens.Family2.LensLike' f s a
param = Data.ProtoLens.Field.field @"param"
params ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "params" a) =>
  Lens.Family2.LensLike' f s a
params = Data.ProtoLens.Field.field @"params"
paren ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "paren" a) =>
  Lens.Family2.LensLike' f s a
paren = Data.ProtoLens.Field.field @"paren"
path ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "path" a) =>
  Lens.Family2.LensLike' f s a
path = Data.ProtoLens.Field.field @"path"
position ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "position" a) =>
  Lens.Family2.LensLike' f s a
position = Data.ProtoLens.Field.field @"position"
primitive ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "primitive" a) =>
  Lens.Family2.LensLike' f s a
primitive = Data.ProtoLens.Field.field @"primitive"
range ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "range" a) =>
  Lens.Family2.LensLike' f s a
range = Data.ProtoLens.Field.field @"range"
reason ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "reason" a) =>
  Lens.Family2.LensLike' f s a
reason = Data.ProtoLens.Field.field @"reason"
requires ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "requires" a) =>
  Lens.Family2.LensLike' f s a
requires = Data.ProtoLens.Field.field @"requires"
requiresClasses ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "requiresClasses" a) =>
  Lens.Family2.LensLike' f s a
requiresClasses = Data.ProtoLens.Field.field @"requiresClasses"
satisfies ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "satisfies" a) =>
  Lens.Family2.LensLike' f s a
satisfies = Data.ProtoLens.Field.field @"satisfies"
structure ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "structure" a) =>
  Lens.Family2.LensLike' f s a
structure = Data.ProtoLens.Field.field @"structure"
target ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "target" a) =>
  Lens.Family2.LensLike' f s a
target = Data.ProtoLens.Field.field @"target"
targets ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "targets" a) =>
  Lens.Family2.LensLike' f s a
targets = Data.ProtoLens.Field.field @"targets"
text ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "text" a) =>
  Lens.Family2.LensLike' f s a
text = Data.ProtoLens.Field.field @"text"
to ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "to" a) =>
  Lens.Family2.LensLike' f s a
to = Data.ProtoLens.Field.field @"to"
type' ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "type'" a) =>
  Lens.Family2.LensLike' f s a
type' = Data.ProtoLens.Field.field @"type'"
types ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "types" a) =>
  Lens.Family2.LensLike' f s a
types = Data.ProtoLens.Field.field @"types"
unit ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "unit" a) =>
  Lens.Family2.LensLike' f s a
unit = Data.ProtoLens.Field.field @"unit"
units ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "units" a) =>
  Lens.Family2.LensLike' f s a
units = Data.ProtoLens.Field.field @"units"
valueConstraints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "valueConstraints" a) =>
  Lens.Family2.LensLike' f s a
valueConstraints = Data.ProtoLens.Field.field @"valueConstraints"
variant ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "variant" a) =>
  Lens.Family2.LensLike' f s a
variant = Data.ProtoLens.Field.field @"variant"
variants ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "variants" a) =>
  Lens.Family2.LensLike' f s a
variants = Data.ProtoLens.Field.field @"variants"
vec'args ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'args" a) =>
  Lens.Family2.LensLike' f s a
vec'args = Data.ProtoLens.Field.field @"vec'args"
vec'assocTypes ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'assocTypes" a) =>
  Lens.Family2.LensLike' f s a
vec'assocTypes = Data.ProtoLens.Field.field @"vec'assocTypes"
vec'binds ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'binds" a) =>
  Lens.Family2.LensLike' f s a
vec'binds = Data.ProtoLens.Field.field @"vec'binds"
vec'conforms ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'conforms" a) =>
  Lens.Family2.LensLike' f s a
vec'conforms = Data.ProtoLens.Field.field @"vec'conforms"
vec'constraints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'constraints" a) =>
  Lens.Family2.LensLike' f s a
vec'constraints = Data.ProtoLens.Field.field @"vec'constraints"
vec'decls ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'decls" a) =>
  Lens.Family2.LensLike' f s a
vec'decls = Data.ProtoLens.Field.field @"vec'decls"
vec'dims ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'dims" a) =>
  Lens.Family2.LensLike' f s a
vec'dims = Data.ProtoLens.Field.field @"vec'dims"
vec'directives ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'directives" a) =>
  Lens.Family2.LensLike' f s a
vec'directives = Data.ProtoLens.Field.field @"vec'directives"
vec'doc ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "vec'doc" a) =>
  Lens.Family2.LensLike' f s a
vec'doc = Data.ProtoLens.Field.field @"vec'doc"
vec'externs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'externs" a) =>
  Lens.Family2.LensLike' f s a
vec'externs = Data.ProtoLens.Field.field @"vec'externs"
vec'fields ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'fields" a) =>
  Lens.Family2.LensLike' f s a
vec'fields = Data.ProtoLens.Field.field @"vec'fields"
vec'from ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'from" a) =>
  Lens.Family2.LensLike' f s a
vec'from = Data.ProtoLens.Field.field @"vec'from"
vec'funDeps ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'funDeps" a) =>
  Lens.Family2.LensLike' f s a
vec'funDeps = Data.ProtoLens.Field.field @"vec'funDeps"
vec'imports ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'imports" a) =>
  Lens.Family2.LensLike' f s a
vec'imports = Data.ProtoLens.Field.field @"vec'imports"
vec'instances ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'instances" a) =>
  Lens.Family2.LensLike' f s a
vec'instances = Data.ProtoLens.Field.field @"vec'instances"
vec'items ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'items" a) =>
  Lens.Family2.LensLike' f s a
vec'items = Data.ProtoLens.Field.field @"vec'items"
vec'params ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'params" a) =>
  Lens.Family2.LensLike' f s a
vec'params = Data.ProtoLens.Field.field @"vec'params"
vec'requires ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'requires" a) =>
  Lens.Family2.LensLike' f s a
vec'requires = Data.ProtoLens.Field.field @"vec'requires"
vec'requiresClasses ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'requiresClasses" a) =>
  Lens.Family2.LensLike' f s a
vec'requiresClasses
  = Data.ProtoLens.Field.field @"vec'requiresClasses"
vec'satisfies ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'satisfies" a) =>
  Lens.Family2.LensLike' f s a
vec'satisfies = Data.ProtoLens.Field.field @"vec'satisfies"
vec'targets ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'targets" a) =>
  Lens.Family2.LensLike' f s a
vec'targets = Data.ProtoLens.Field.field @"vec'targets"
vec'to ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "vec'to" a) =>
  Lens.Family2.LensLike' f s a
vec'to = Data.ProtoLens.Field.field @"vec'to"
vec'types ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'types" a) =>
  Lens.Family2.LensLike' f s a
vec'types = Data.ProtoLens.Field.field @"vec'types"
vec'units ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'units" a) =>
  Lens.Family2.LensLike' f s a
vec'units = Data.ProtoLens.Field.field @"vec'units"
vec'valueConstraints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'valueConstraints" a) =>
  Lens.Family2.LensLike' f s a
vec'valueConstraints
  = Data.ProtoLens.Field.field @"vec'valueConstraints"
vec'variants ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'variants" a) =>
  Lens.Family2.LensLike' f s a
vec'variants = Data.ProtoLens.Field.field @"vec'variants"
wrote ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "wrote" a) =>
  Lens.Family2.LensLike' f s a
wrote = Data.ProtoLens.Field.field @"wrote"