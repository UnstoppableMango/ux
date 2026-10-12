{- This file was auto-generated from tdl/plugin/v1/plugin.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Tdl.Plugin.V1.Plugin_Fields where
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
import qualified Proto.Tdl.Ir.V1.Ir
accepted ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "accepted" a) =>
  Lens.Family2.LensLike' f s a
accepted = Data.ProtoLens.Field.field @"accepted"
argKinds ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "argKinds" a) =>
  Lens.Family2.LensLike' f s a
argKinds = Data.ProtoLens.Field.field @"argKinds"
content ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "content" a) =>
  Lens.Family2.LensLike' f s a
content = Data.ProtoLens.Field.field @"content"
diagnostics ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "diagnostics" a) =>
  Lens.Family2.LensLike' f s a
diagnostics = Data.ProtoLens.Field.field @"diagnostics"
directives ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "directives" a) =>
  Lens.Family2.LensLike' f s a
directives = Data.ProtoLens.Field.field @"directives"
dryRun ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "dryRun" a) =>
  Lens.Family2.LensLike' f s a
dryRun = Data.ProtoLens.Field.field @"dryRun"
features ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "features" a) =>
  Lens.Family2.LensLike' f s a
features = Data.ProtoLens.Field.field @"features"
files ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "files" a) =>
  Lens.Family2.LensLike' f s a
files = Data.ProtoLens.Field.field @"files"
framingVersion ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "framingVersion" a) =>
  Lens.Family2.LensLike' f s a
framingVersion = Data.ProtoLens.Field.field @"framingVersion"
irVersion ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "irVersion" a) =>
  Lens.Family2.LensLike' f s a
irVersion = Data.ProtoLens.Field.field @"irVersion"
maxArgs ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "maxArgs" a) =>
  Lens.Family2.LensLike' f s a
maxArgs = Data.ProtoLens.Field.field @"maxArgs"
maybe'features ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'features" a) =>
  Lens.Family2.LensLike' f s a
maybe'features = Data.ProtoLens.Field.field @"maybe'features"
maybe'model ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'model" a) =>
  Lens.Family2.LensLike' f s a
maybe'model = Data.ProtoLens.Field.field @"maybe'model"
maybe'position ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'position" a) =>
  Lens.Family2.LensLike' f s a
maybe'position = Data.ProtoLens.Field.field @"maybe'position"
message ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "message" a) =>
  Lens.Family2.LensLike' f s a
message = Data.ProtoLens.Field.field @"message"
minArgs ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "minArgs" a) =>
  Lens.Family2.LensLike' f s a
minArgs = Data.ProtoLens.Field.field @"minArgs"
model ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "model" a) =>
  Lens.Family2.LensLike' f s a
model = Data.ProtoLens.Field.field @"model"
name ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "name" a) =>
  Lens.Family2.LensLike' f s a
name = Data.ProtoLens.Field.field @"name"
out ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "out" a) =>
  Lens.Family2.LensLike' f s a
out = Data.ProtoLens.Field.field @"out"
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
post ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "post" a) =>
  Lens.Family2.LensLike' f s a
post = Data.ProtoLens.Field.field @"post"
refusal ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "refusal" a) =>
  Lens.Family2.LensLike' f s a
refusal = Data.ProtoLens.Field.field @"refusal"
repeatable ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "repeatable" a) =>
  Lens.Family2.LensLike' f s a
repeatable = Data.ProtoLens.Field.field @"repeatable"
reuse ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "reuse" a) =>
  Lens.Family2.LensLike' f s a
reuse = Data.ProtoLens.Field.field @"reuse"
severity ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "severity" a) =>
  Lens.Family2.LensLike' f s a
severity = Data.ProtoLens.Field.field @"severity"
target ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "target" a) =>
  Lens.Family2.LensLike' f s a
target = Data.ProtoLens.Field.field @"target"
vec'argKinds ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'argKinds" a) =>
  Lens.Family2.LensLike' f s a
vec'argKinds = Data.ProtoLens.Field.field @"vec'argKinds"
vec'diagnostics ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'diagnostics" a) =>
  Lens.Family2.LensLike' f s a
vec'diagnostics = Data.ProtoLens.Field.field @"vec'diagnostics"
vec'directives ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'directives" a) =>
  Lens.Family2.LensLike' f s a
vec'directives = Data.ProtoLens.Field.field @"vec'directives"
vec'files ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'files" a) =>
  Lens.Family2.LensLike' f s a
vec'files = Data.ProtoLens.Field.field @"vec'files"
vec'post ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'post" a) =>
  Lens.Family2.LensLike' f s a
vec'post = Data.ProtoLens.Field.field @"vec'post"
version ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "version" a) =>
  Lens.Family2.LensLike' f s a
version = Data.ProtoLens.Field.field @"version"
watch ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "watch" a) =>
  Lens.Family2.LensLike' f s a
watch = Data.ProtoLens.Field.field @"watch"