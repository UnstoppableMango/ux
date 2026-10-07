{- This file was auto-generated from google/protobuf/go_features.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Google.Protobuf.GoFeatures (
        GoFeatures(), GoFeatures'APILevel(..), GoFeatures'APILevel(),
        GoFeatures'OptimizeModeFeature(),
        GoFeatures'OptimizeModeFeature'OptimizeMode(..),
        GoFeatures'OptimizeModeFeature'OptimizeMode(),
        GoFeatures'StripEnumPrefix(..), GoFeatures'StripEnumPrefix()
    ) where
import qualified Data.ProtoLens.Runtime.Control.DeepSeq as Control.DeepSeq
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Prism as Data.ProtoLens.Prism
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
import qualified Proto.Google.Protobuf.Descriptor
{- | Fields :
     
         * 'Proto.Google.Protobuf.GoFeatures_Fields.legacyUnmarshalJsonEnum' @:: Lens' GoFeatures Prelude.Bool@
         * 'Proto.Google.Protobuf.GoFeatures_Fields.maybe'legacyUnmarshalJsonEnum' @:: Lens' GoFeatures (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.GoFeatures_Fields.apiLevel' @:: Lens' GoFeatures GoFeatures'APILevel@
         * 'Proto.Google.Protobuf.GoFeatures_Fields.maybe'apiLevel' @:: Lens' GoFeatures (Prelude.Maybe GoFeatures'APILevel)@
         * 'Proto.Google.Protobuf.GoFeatures_Fields.stripEnumPrefix' @:: Lens' GoFeatures GoFeatures'StripEnumPrefix@
         * 'Proto.Google.Protobuf.GoFeatures_Fields.maybe'stripEnumPrefix' @:: Lens' GoFeatures (Prelude.Maybe GoFeatures'StripEnumPrefix)@
         * 'Proto.Google.Protobuf.GoFeatures_Fields.optimizeMode' @:: Lens' GoFeatures GoFeatures'OptimizeModeFeature'OptimizeMode@
         * 'Proto.Google.Protobuf.GoFeatures_Fields.maybe'optimizeMode' @:: Lens' GoFeatures (Prelude.Maybe GoFeatures'OptimizeModeFeature'OptimizeMode)@ -}
data GoFeatures
  = GoFeatures'_constructor {_GoFeatures'legacyUnmarshalJsonEnum :: !(Prelude.Maybe Prelude.Bool),
                             _GoFeatures'apiLevel :: !(Prelude.Maybe GoFeatures'APILevel),
                             _GoFeatures'stripEnumPrefix :: !(Prelude.Maybe GoFeatures'StripEnumPrefix),
                             _GoFeatures'optimizeMode :: !(Prelude.Maybe GoFeatures'OptimizeModeFeature'OptimizeMode),
                             _GoFeatures'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show GoFeatures where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField GoFeatures "legacyUnmarshalJsonEnum" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GoFeatures'legacyUnmarshalJsonEnum
           (\ x__ y__ -> x__ {_GoFeatures'legacyUnmarshalJsonEnum = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField GoFeatures "maybe'legacyUnmarshalJsonEnum" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GoFeatures'legacyUnmarshalJsonEnum
           (\ x__ y__ -> x__ {_GoFeatures'legacyUnmarshalJsonEnum = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField GoFeatures "apiLevel" GoFeatures'APILevel where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GoFeatures'apiLevel
           (\ x__ y__ -> x__ {_GoFeatures'apiLevel = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField GoFeatures "maybe'apiLevel" (Prelude.Maybe GoFeatures'APILevel) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GoFeatures'apiLevel
           (\ x__ y__ -> x__ {_GoFeatures'apiLevel = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField GoFeatures "stripEnumPrefix" GoFeatures'StripEnumPrefix where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GoFeatures'stripEnumPrefix
           (\ x__ y__ -> x__ {_GoFeatures'stripEnumPrefix = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField GoFeatures "maybe'stripEnumPrefix" (Prelude.Maybe GoFeatures'StripEnumPrefix) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GoFeatures'stripEnumPrefix
           (\ x__ y__ -> x__ {_GoFeatures'stripEnumPrefix = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField GoFeatures "optimizeMode" GoFeatures'OptimizeModeFeature'OptimizeMode where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GoFeatures'optimizeMode
           (\ x__ y__ -> x__ {_GoFeatures'optimizeMode = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField GoFeatures "maybe'optimizeMode" (Prelude.Maybe GoFeatures'OptimizeModeFeature'OptimizeMode) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GoFeatures'optimizeMode
           (\ x__ y__ -> x__ {_GoFeatures'optimizeMode = y__}))
        Prelude.id
instance Data.ProtoLens.Message GoFeatures where
  messageName _ = Data.Text.pack "pb.GoFeatures"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \GoFeatures\DC2\190\SOH\n\
      \\SUBlegacy_unmarshal_json_enum\CAN\SOH \SOH(\bR\ETBlegacyUnmarshalJsonEnumB\128\SOH\136\SOH\SOH\152\SOH\ACK\152\SOH\SOH\162\SOH\t\CAN\132\a\DC2\EOTtrue\162\SOH\n\
      \\CAN\231\a\DC2\ENQfalse\178\SOH[\b\232\a\DLE\232\a\SUBSThe legacy UnmarshalJSON API is deprecated and will be removed in a future edition.\DC2t\n\
      \\tapi_level\CAN\STX \SOH(\SO2\ETB.pb.GoFeatures.APILevelR\bapiLevelB>\136\SOH\SOH\152\SOH\ETX\152\SOH\SOH\162\SOH\SUB\CAN\132\a\DC2\NAKAPI_LEVEL_UNSPECIFIED\162\SOH\SI\CAN\233\a\DC2\n\
      \API_OPAQUE\178\SOH\ETX\b\232\a\DC2|\n\
      \\DC1strip_enum_prefix\CAN\ETX \SOH(\SO2\RS.pb.GoFeatures.StripEnumPrefixR\SIstripEnumPrefixB0\136\SOH\SOH\152\SOH\ACK\152\SOH\a\152\SOH\SOH\162\SOH\ESC\CAN\132\a\DC2\SYNSTRIP_ENUM_PREFIX_KEEP\178\SOH\ETX\b\233\a\DC2\134\SOH\n\
      \\roptimize_mode\CAN\EOT \SOH(\SO2/.pb.GoFeatures.OptimizeModeFeature.OptimizeModeR\foptimizeModeB0\136\SOH\SOH\152\SOH\ETX\152\SOH\SOH\162\SOH\RS\CAN\132\a\DC2\EMOPTIMIZE_MODE_UNSPECIFIED\178\SOH\ETX\b\233\a\SUB^\n\
      \\DC3OptimizeModeFeature\"G\n\
      \\fOptimizeMode\DC2\GS\n\
      \\EMOPTIMIZE_MODE_UNSPECIFIED\DLE\NUL\DC2\t\n\
      \\ENQSPEED\DLE\SOH\DC2\r\n\
      \\tCODE_SIZE\DLE\STX\"S\n\
      \\bAPILevel\DC2\EM\n\
      \\NAKAPI_LEVEL_UNSPECIFIED\DLE\NUL\DC2\f\n\
      \\bAPI_OPEN\DLE\SOH\DC2\SO\n\
      \\n\
      \API_HYBRID\DLE\STX\DC2\SO\n\
      \\n\
      \API_OPAQUE\DLE\ETX\"\146\SOH\n\
      \\SIStripEnumPrefix\DC2!\n\
      \\GSSTRIP_ENUM_PREFIX_UNSPECIFIED\DLE\NUL\DC2\SUB\n\
      \\SYNSTRIP_ENUM_PREFIX_KEEP\DLE\SOH\DC2#\n\
      \\USSTRIP_ENUM_PREFIX_GENERATE_BOTH\DLE\STX\DC2\ESC\n\
      \\ETBSTRIP_ENUM_PREFIX_STRIP\DLE\ETX"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        legacyUnmarshalJsonEnum__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "legacy_unmarshal_json_enum"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'legacyUnmarshalJsonEnum")) ::
              Data.ProtoLens.FieldDescriptor GoFeatures
        apiLevel__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "api_level"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor GoFeatures'APILevel)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'apiLevel")) ::
              Data.ProtoLens.FieldDescriptor GoFeatures
        stripEnumPrefix__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "strip_enum_prefix"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor GoFeatures'StripEnumPrefix)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'stripEnumPrefix")) ::
              Data.ProtoLens.FieldDescriptor GoFeatures
        optimizeMode__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "optimize_mode"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor GoFeatures'OptimizeModeFeature'OptimizeMode)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'optimizeMode")) ::
              Data.ProtoLens.FieldDescriptor GoFeatures
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, legacyUnmarshalJsonEnum__field_descriptor),
           (Data.ProtoLens.Tag 2, apiLevel__field_descriptor),
           (Data.ProtoLens.Tag 3, stripEnumPrefix__field_descriptor),
           (Data.ProtoLens.Tag 4, optimizeMode__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GoFeatures'_unknownFields
        (\ x__ y__ -> x__ {_GoFeatures'_unknownFields = y__})
  defMessage
    = GoFeatures'_constructor
        {_GoFeatures'legacyUnmarshalJsonEnum = Prelude.Nothing,
         _GoFeatures'apiLevel = Prelude.Nothing,
         _GoFeatures'stripEnumPrefix = Prelude.Nothing,
         _GoFeatures'optimizeMode = Prelude.Nothing,
         _GoFeatures'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GoFeatures -> Data.ProtoLens.Encoding.Bytes.Parser GoFeatures
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "legacy_unmarshal_json_enum"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"legacyUnmarshalJsonEnum") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "api_level"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"apiLevel") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "strip_enum_prefix"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"stripEnumPrefix") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "optimize_mode"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"optimizeMode") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "GoFeatures"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'legacyUnmarshalJsonEnum") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                       ((Prelude..)
                          Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'apiLevel") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                          ((Prelude..)
                             ((Prelude..)
                                Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                             Prelude.fromEnum _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view
                          (Data.ProtoLens.Field.field @"maybe'stripEnumPrefix") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                             ((Prelude..)
                                ((Prelude..)
                                   Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                                Prelude.fromEnum _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view
                             (Data.ProtoLens.Field.field @"maybe'optimizeMode") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                                ((Prelude..)
                                   ((Prelude..)
                                      Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                                   Prelude.fromEnum _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData GoFeatures where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_GoFeatures'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_GoFeatures'legacyUnmarshalJsonEnum x__)
                (Control.DeepSeq.deepseq
                   (_GoFeatures'apiLevel x__)
                   (Control.DeepSeq.deepseq
                      (_GoFeatures'stripEnumPrefix x__)
                      (Control.DeepSeq.deepseq (_GoFeatures'optimizeMode x__) ()))))
data GoFeatures'APILevel
  = GoFeatures'API_LEVEL_UNSPECIFIED |
    GoFeatures'API_OPEN |
    GoFeatures'API_HYBRID |
    GoFeatures'API_OPAQUE
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum GoFeatures'APILevel where
  maybeToEnum 0 = Prelude.Just GoFeatures'API_LEVEL_UNSPECIFIED
  maybeToEnum 1 = Prelude.Just GoFeatures'API_OPEN
  maybeToEnum 2 = Prelude.Just GoFeatures'API_HYBRID
  maybeToEnum 3 = Prelude.Just GoFeatures'API_OPAQUE
  maybeToEnum _ = Prelude.Nothing
  showEnum GoFeatures'API_LEVEL_UNSPECIFIED = "API_LEVEL_UNSPECIFIED"
  showEnum GoFeatures'API_OPEN = "API_OPEN"
  showEnum GoFeatures'API_HYBRID = "API_HYBRID"
  showEnum GoFeatures'API_OPAQUE = "API_OPAQUE"
  readEnum k
    | (Prelude.==) k "API_LEVEL_UNSPECIFIED"
    = Prelude.Just GoFeatures'API_LEVEL_UNSPECIFIED
    | (Prelude.==) k "API_OPEN" = Prelude.Just GoFeatures'API_OPEN
    | (Prelude.==) k "API_HYBRID" = Prelude.Just GoFeatures'API_HYBRID
    | (Prelude.==) k "API_OPAQUE" = Prelude.Just GoFeatures'API_OPAQUE
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded GoFeatures'APILevel where
  minBound = GoFeatures'API_LEVEL_UNSPECIFIED
  maxBound = GoFeatures'API_OPAQUE
instance Prelude.Enum GoFeatures'APILevel where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum APILevel: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum GoFeatures'API_LEVEL_UNSPECIFIED = 0
  fromEnum GoFeatures'API_OPEN = 1
  fromEnum GoFeatures'API_HYBRID = 2
  fromEnum GoFeatures'API_OPAQUE = 3
  succ GoFeatures'API_OPAQUE
    = Prelude.error
        "GoFeatures'APILevel.succ: bad argument GoFeatures'API_OPAQUE. This value would be out of bounds."
  succ GoFeatures'API_LEVEL_UNSPECIFIED = GoFeatures'API_OPEN
  succ GoFeatures'API_OPEN = GoFeatures'API_HYBRID
  succ GoFeatures'API_HYBRID = GoFeatures'API_OPAQUE
  pred GoFeatures'API_LEVEL_UNSPECIFIED
    = Prelude.error
        "GoFeatures'APILevel.pred: bad argument GoFeatures'API_LEVEL_UNSPECIFIED. This value would be out of bounds."
  pred GoFeatures'API_OPEN = GoFeatures'API_LEVEL_UNSPECIFIED
  pred GoFeatures'API_HYBRID = GoFeatures'API_OPEN
  pred GoFeatures'API_OPAQUE = GoFeatures'API_HYBRID
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault GoFeatures'APILevel where
  fieldDefault = GoFeatures'API_LEVEL_UNSPECIFIED
instance Control.DeepSeq.NFData GoFeatures'APILevel where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
      -}
data GoFeatures'OptimizeModeFeature
  = GoFeatures'OptimizeModeFeature'_constructor {_GoFeatures'OptimizeModeFeature'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show GoFeatures'OptimizeModeFeature where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message GoFeatures'OptimizeModeFeature where
  messageName _ = Data.Text.pack "pb.GoFeatures.OptimizeModeFeature"
  packedMessageDescriptor _
    = "\n\
      \\DC3OptimizeModeFeature\"G\n\
      \\fOptimizeMode\DC2\GS\n\
      \\EMOPTIMIZE_MODE_UNSPECIFIED\DLE\NUL\DC2\t\n\
      \\ENQSPEED\DLE\SOH\DC2\r\n\
      \\tCODE_SIZE\DLE\STX"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GoFeatures'OptimizeModeFeature'_unknownFields
        (\ x__ y__
           -> x__ {_GoFeatures'OptimizeModeFeature'_unknownFields = y__})
  defMessage
    = GoFeatures'OptimizeModeFeature'_constructor
        {_GoFeatures'OptimizeModeFeature'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GoFeatures'OptimizeModeFeature
          -> Data.ProtoLens.Encoding.Bytes.Parser GoFeatures'OptimizeModeFeature
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "OptimizeModeFeature"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData GoFeatures'OptimizeModeFeature where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_GoFeatures'OptimizeModeFeature'_unknownFields x__) ()
data GoFeatures'OptimizeModeFeature'OptimizeMode
  = GoFeatures'OptimizeModeFeature'OPTIMIZE_MODE_UNSPECIFIED |
    GoFeatures'OptimizeModeFeature'SPEED |
    GoFeatures'OptimizeModeFeature'CODE_SIZE
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum GoFeatures'OptimizeModeFeature'OptimizeMode where
  maybeToEnum 0
    = Prelude.Just
        GoFeatures'OptimizeModeFeature'OPTIMIZE_MODE_UNSPECIFIED
  maybeToEnum 1 = Prelude.Just GoFeatures'OptimizeModeFeature'SPEED
  maybeToEnum 2
    = Prelude.Just GoFeatures'OptimizeModeFeature'CODE_SIZE
  maybeToEnum _ = Prelude.Nothing
  showEnum GoFeatures'OptimizeModeFeature'OPTIMIZE_MODE_UNSPECIFIED
    = "OPTIMIZE_MODE_UNSPECIFIED"
  showEnum GoFeatures'OptimizeModeFeature'SPEED = "SPEED"
  showEnum GoFeatures'OptimizeModeFeature'CODE_SIZE = "CODE_SIZE"
  readEnum k
    | (Prelude.==) k "OPTIMIZE_MODE_UNSPECIFIED"
    = Prelude.Just
        GoFeatures'OptimizeModeFeature'OPTIMIZE_MODE_UNSPECIFIED
    | (Prelude.==) k "SPEED"
    = Prelude.Just GoFeatures'OptimizeModeFeature'SPEED
    | (Prelude.==) k "CODE_SIZE"
    = Prelude.Just GoFeatures'OptimizeModeFeature'CODE_SIZE
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded GoFeatures'OptimizeModeFeature'OptimizeMode where
  minBound = GoFeatures'OptimizeModeFeature'OPTIMIZE_MODE_UNSPECIFIED
  maxBound = GoFeatures'OptimizeModeFeature'CODE_SIZE
instance Prelude.Enum GoFeatures'OptimizeModeFeature'OptimizeMode where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum OptimizeMode: "
              (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum GoFeatures'OptimizeModeFeature'OPTIMIZE_MODE_UNSPECIFIED
    = 0
  fromEnum GoFeatures'OptimizeModeFeature'SPEED = 1
  fromEnum GoFeatures'OptimizeModeFeature'CODE_SIZE = 2
  succ GoFeatures'OptimizeModeFeature'CODE_SIZE
    = Prelude.error
        "GoFeatures'OptimizeModeFeature'OptimizeMode.succ: bad argument GoFeatures'OptimizeModeFeature'CODE_SIZE. This value would be out of bounds."
  succ GoFeatures'OptimizeModeFeature'OPTIMIZE_MODE_UNSPECIFIED
    = GoFeatures'OptimizeModeFeature'SPEED
  succ GoFeatures'OptimizeModeFeature'SPEED
    = GoFeatures'OptimizeModeFeature'CODE_SIZE
  pred GoFeatures'OptimizeModeFeature'OPTIMIZE_MODE_UNSPECIFIED
    = Prelude.error
        "GoFeatures'OptimizeModeFeature'OptimizeMode.pred: bad argument GoFeatures'OptimizeModeFeature'OPTIMIZE_MODE_UNSPECIFIED. This value would be out of bounds."
  pred GoFeatures'OptimizeModeFeature'SPEED
    = GoFeatures'OptimizeModeFeature'OPTIMIZE_MODE_UNSPECIFIED
  pred GoFeatures'OptimizeModeFeature'CODE_SIZE
    = GoFeatures'OptimizeModeFeature'SPEED
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault GoFeatures'OptimizeModeFeature'OptimizeMode where
  fieldDefault
    = GoFeatures'OptimizeModeFeature'OPTIMIZE_MODE_UNSPECIFIED
instance Control.DeepSeq.NFData GoFeatures'OptimizeModeFeature'OptimizeMode where
  rnf x__ = Prelude.seq x__ ()
data GoFeatures'StripEnumPrefix
  = GoFeatures'STRIP_ENUM_PREFIX_UNSPECIFIED |
    GoFeatures'STRIP_ENUM_PREFIX_KEEP |
    GoFeatures'STRIP_ENUM_PREFIX_GENERATE_BOTH |
    GoFeatures'STRIP_ENUM_PREFIX_STRIP
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum GoFeatures'StripEnumPrefix where
  maybeToEnum 0
    = Prelude.Just GoFeatures'STRIP_ENUM_PREFIX_UNSPECIFIED
  maybeToEnum 1 = Prelude.Just GoFeatures'STRIP_ENUM_PREFIX_KEEP
  maybeToEnum 2
    = Prelude.Just GoFeatures'STRIP_ENUM_PREFIX_GENERATE_BOTH
  maybeToEnum 3 = Prelude.Just GoFeatures'STRIP_ENUM_PREFIX_STRIP
  maybeToEnum _ = Prelude.Nothing
  showEnum GoFeatures'STRIP_ENUM_PREFIX_UNSPECIFIED
    = "STRIP_ENUM_PREFIX_UNSPECIFIED"
  showEnum GoFeatures'STRIP_ENUM_PREFIX_KEEP
    = "STRIP_ENUM_PREFIX_KEEP"
  showEnum GoFeatures'STRIP_ENUM_PREFIX_GENERATE_BOTH
    = "STRIP_ENUM_PREFIX_GENERATE_BOTH"
  showEnum GoFeatures'STRIP_ENUM_PREFIX_STRIP
    = "STRIP_ENUM_PREFIX_STRIP"
  readEnum k
    | (Prelude.==) k "STRIP_ENUM_PREFIX_UNSPECIFIED"
    = Prelude.Just GoFeatures'STRIP_ENUM_PREFIX_UNSPECIFIED
    | (Prelude.==) k "STRIP_ENUM_PREFIX_KEEP"
    = Prelude.Just GoFeatures'STRIP_ENUM_PREFIX_KEEP
    | (Prelude.==) k "STRIP_ENUM_PREFIX_GENERATE_BOTH"
    = Prelude.Just GoFeatures'STRIP_ENUM_PREFIX_GENERATE_BOTH
    | (Prelude.==) k "STRIP_ENUM_PREFIX_STRIP"
    = Prelude.Just GoFeatures'STRIP_ENUM_PREFIX_STRIP
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded GoFeatures'StripEnumPrefix where
  minBound = GoFeatures'STRIP_ENUM_PREFIX_UNSPECIFIED
  maxBound = GoFeatures'STRIP_ENUM_PREFIX_STRIP
instance Prelude.Enum GoFeatures'StripEnumPrefix where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum StripEnumPrefix: "
              (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum GoFeatures'STRIP_ENUM_PREFIX_UNSPECIFIED = 0
  fromEnum GoFeatures'STRIP_ENUM_PREFIX_KEEP = 1
  fromEnum GoFeatures'STRIP_ENUM_PREFIX_GENERATE_BOTH = 2
  fromEnum GoFeatures'STRIP_ENUM_PREFIX_STRIP = 3
  succ GoFeatures'STRIP_ENUM_PREFIX_STRIP
    = Prelude.error
        "GoFeatures'StripEnumPrefix.succ: bad argument GoFeatures'STRIP_ENUM_PREFIX_STRIP. This value would be out of bounds."
  succ GoFeatures'STRIP_ENUM_PREFIX_UNSPECIFIED
    = GoFeatures'STRIP_ENUM_PREFIX_KEEP
  succ GoFeatures'STRIP_ENUM_PREFIX_KEEP
    = GoFeatures'STRIP_ENUM_PREFIX_GENERATE_BOTH
  succ GoFeatures'STRIP_ENUM_PREFIX_GENERATE_BOTH
    = GoFeatures'STRIP_ENUM_PREFIX_STRIP
  pred GoFeatures'STRIP_ENUM_PREFIX_UNSPECIFIED
    = Prelude.error
        "GoFeatures'StripEnumPrefix.pred: bad argument GoFeatures'STRIP_ENUM_PREFIX_UNSPECIFIED. This value would be out of bounds."
  pred GoFeatures'STRIP_ENUM_PREFIX_KEEP
    = GoFeatures'STRIP_ENUM_PREFIX_UNSPECIFIED
  pred GoFeatures'STRIP_ENUM_PREFIX_GENERATE_BOTH
    = GoFeatures'STRIP_ENUM_PREFIX_KEEP
  pred GoFeatures'STRIP_ENUM_PREFIX_STRIP
    = GoFeatures'STRIP_ENUM_PREFIX_GENERATE_BOTH
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault GoFeatures'StripEnumPrefix where
  fieldDefault = GoFeatures'STRIP_ENUM_PREFIX_UNSPECIFIED
instance Control.DeepSeq.NFData GoFeatures'StripEnumPrefix where
  rnf x__ = Prelude.seq x__ ()
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \!google/protobuf/go_features.proto\DC2\STXpb\SUB google/protobuf/descriptor.proto\"\148\a\n\
    \\n\
    \GoFeatures\DC2\190\SOH\n\
    \\SUBlegacy_unmarshal_json_enum\CAN\SOH \SOH(\bR\ETBlegacyUnmarshalJsonEnumB\128\SOH\136\SOH\SOH\152\SOH\ACK\152\SOH\SOH\162\SOH\t\CAN\132\a\DC2\EOTtrue\162\SOH\n\
    \\CAN\231\a\DC2\ENQfalse\178\SOH[\b\232\a\DLE\232\a\SUBSThe legacy UnmarshalJSON API is deprecated and will be removed in a future edition.\DC2t\n\
    \\tapi_level\CAN\STX \SOH(\SO2\ETB.pb.GoFeatures.APILevelR\bapiLevelB>\136\SOH\SOH\152\SOH\ETX\152\SOH\SOH\162\SOH\SUB\CAN\132\a\DC2\NAKAPI_LEVEL_UNSPECIFIED\162\SOH\SI\CAN\233\a\DC2\n\
    \API_OPAQUE\178\SOH\ETX\b\232\a\DC2|\n\
    \\DC1strip_enum_prefix\CAN\ETX \SOH(\SO2\RS.pb.GoFeatures.StripEnumPrefixR\SIstripEnumPrefixB0\136\SOH\SOH\152\SOH\ACK\152\SOH\a\152\SOH\SOH\162\SOH\ESC\CAN\132\a\DC2\SYNSTRIP_ENUM_PREFIX_KEEP\178\SOH\ETX\b\233\a\DC2\134\SOH\n\
    \\roptimize_mode\CAN\EOT \SOH(\SO2/.pb.GoFeatures.OptimizeModeFeature.OptimizeModeR\foptimizeModeB0\136\SOH\SOH\152\SOH\ETX\152\SOH\SOH\162\SOH\RS\CAN\132\a\DC2\EMOPTIMIZE_MODE_UNSPECIFIED\178\SOH\ETX\b\233\a\SUB^\n\
    \\DC3OptimizeModeFeature\"G\n\
    \\fOptimizeMode\DC2\GS\n\
    \\EMOPTIMIZE_MODE_UNSPECIFIED\DLE\NUL\DC2\t\n\
    \\ENQSPEED\DLE\SOH\DC2\r\n\
    \\tCODE_SIZE\DLE\STX\"S\n\
    \\bAPILevel\DC2\EM\n\
    \\NAKAPI_LEVEL_UNSPECIFIED\DLE\NUL\DC2\f\n\
    \\bAPI_OPEN\DLE\SOH\DC2\SO\n\
    \\n\
    \API_HYBRID\DLE\STX\DC2\SO\n\
    \\n\
    \API_OPAQUE\DLE\ETX\"\146\SOH\n\
    \\SIStripEnumPrefix\DC2!\n\
    \\GSSTRIP_ENUM_PREFIX_UNSPECIFIED\DLE\NUL\DC2\SUB\n\
    \\SYNSTRIP_ENUM_PREFIX_KEEP\DLE\SOH\DC2#\n\
    \\USSTRIP_ENUM_PREFIX_GENERATE_BOTH\DLE\STX\DC2\ESC\n\
    \\ETBSTRIP_ENUM_PREFIX_STRIP\DLE\ETX:<\n\
    \\STXgo\CAN\234\a \SOH(\v2\SO.pb.GoFeatures\DC2\ESC.google.protobuf.FeatureSetR\STXgoB/Z-google.golang.org/protobuf/types/gofeaturespbJ\229\DC4\n\
    \\ACK\DC2\EOT\a\NULo\SOH\n\
    \\148\STX\n\
    \\SOH\f\DC2\ETX\a\NUL\DC22\137\STX Protocol Buffers - Google's data interchange format\n\
    \ Copyright 2023 Google Inc.  All rights reserved.\n\
    \\n\
    \ Use of this source code is governed by a BSD-style\n\
    \ license that can be found in the LICENSE file or at\n\
    \ https://developers.google.com/open-source/licenses/bsd\n\
    \\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\t\NUL\v\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\v\NUL*\n\
    \\b\n\
    \\SOH\b\DC2\ETX\r\NULD\n\
    \\t\n\
    \\STX\b\v\DC2\ETX\r\NULD\n\
    \\t\n\
    \\SOH\a\DC2\EOT\SI\NUL\DC1\SOH\n\
    \\t\n\
    \\STX\a\NUL\DC2\ETX\DLE\STX \n\
    \\n\
    \\n\
    \\ETX\a\NUL\STX\DC2\ETX\SI\a!\n\
    \\n\
    \\n\
    \\ETX\a\NUL\EOT\DC2\ETX\DLE\STX\n\
    \\n\
    \\n\
    \\n\
    \\ETX\a\NUL\ACK\DC2\ETX\DLE\v\NAK\n\
    \\n\
    \\n\
    \\ETX\a\NUL\SOH\DC2\ETX\DLE\SYN\CAN\n\
    \\n\
    \\n\
    \\ETX\a\NUL\ETX\DC2\ETX\DLE\ESC\US\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\DC3\NULo\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\DC3\b\DC2\n\
    \\145\SOH\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\EOT\SYN\STX\"\EOT\SUB\130\SOH Whether or not to generate the deprecated UnmarshalJSON method for enums.\n\
    \ Can only be true for proto using the Open Struct api.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\EOT\DC2\ETX\SYN\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX\SYN\v\SI\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\SYN\DLE*\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\SYN-.\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\b\DC2\EOT\SYN/\"\ETX\n\
    \\r\n\
    \\ACK\EOT\NUL\STX\NUL\b\DC1\DC2\ETX\ETB\EOT!\n\
    \\SO\n\
    \\a\EOT\NUL\STX\NUL\b\DC3\NUL\DC2\ETX\CAN\EOT\RS\n\
    \\SO\n\
    \\a\EOT\NUL\STX\NUL\b\DC3\SOH\DC2\ETX\EM\EOT\RS\n\
    \\SO\n\
    \\ACK\EOT\NUL\STX\NUL\b\SYN\DC2\EOT\SUB\EOT\US\ENQ\n\
    \\SO\n\
    \\a\EOT\NUL\STX\NUL\b\DC4\NUL\DC2\ETX \EOTA\n\
    \\SO\n\
    \\a\EOT\NUL\STX\NUL\b\DC4\SOH\DC2\ETX!\EOTB\n\
    \\f\n\
    \\EOT\EOT\NUL\EOT\NUL\DC2\EOT$\STX,\ETX\n\
    \\f\n\
    \\ENQ\EOT\NUL\EOT\NUL\SOH\DC2\ETX$\a\SI\n\
    \\184\SOH\n\
    \\ACK\EOT\NUL\EOT\NUL\STX\NUL\DC2\ETX(\EOT\RS\SUB\168\SOH API_LEVEL_UNSPECIFIED results in selecting the OPEN API,\n\
    \ but needs to be a separate value to distinguish between\n\
    \ an explicitly set api level or a missing api level.\n\
    \\n\
    \\SO\n\
    \\a\EOT\NUL\EOT\NUL\STX\NUL\SOH\DC2\ETX(\EOT\EM\n\
    \\SO\n\
    \\a\EOT\NUL\EOT\NUL\STX\NUL\STX\DC2\ETX(\FS\GS\n\
    \\r\n\
    \\ACK\EOT\NUL\EOT\NUL\STX\SOH\DC2\ETX)\EOT\DC1\n\
    \\SO\n\
    \\a\EOT\NUL\EOT\NUL\STX\SOH\SOH\DC2\ETX)\EOT\f\n\
    \\SO\n\
    \\a\EOT\NUL\EOT\NUL\STX\SOH\STX\DC2\ETX)\SI\DLE\n\
    \\r\n\
    \\ACK\EOT\NUL\EOT\NUL\STX\STX\DC2\ETX*\EOT\DC3\n\
    \\SO\n\
    \\a\EOT\NUL\EOT\NUL\STX\STX\SOH\DC2\ETX*\EOT\SO\n\
    \\SO\n\
    \\a\EOT\NUL\EOT\NUL\STX\STX\STX\DC2\ETX*\DC1\DC2\n\
    \\r\n\
    \\ACK\EOT\NUL\EOT\NUL\STX\ETX\DC2\ETX+\EOT\DC3\n\
    \\SO\n\
    \\a\EOT\NUL\EOT\NUL\STX\ETX\SOH\DC2\ETX+\EOT\SO\n\
    \\SO\n\
    \\a\EOT\NUL\EOT\NUL\STX\ETX\STX\DC2\ETX+\DC1\DC2\n\
    \.\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\EOT/\STX;\EOT\SUB  One of OPEN, HYBRID or OPAQUE.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\EOT\DC2\ETX/\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ACK\DC2\ETX/\v\DC3\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX/\DC4\GS\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX/ !\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\SOH\b\DC2\EOT/\";\ETX\n\
    \\r\n\
    \\ACK\EOT\NUL\STX\SOH\b\DC1\DC2\ETX0\EOT!\n\
    \\SO\n\
    \\a\EOT\NUL\STX\SOH\b\DC3\NUL\DC2\ETX1\EOT!\n\
    \\SO\n\
    \\a\EOT\NUL\STX\SOH\b\DC3\SOH\DC2\ETX2\EOT\RS\n\
    \\SO\n\
    \\ACK\EOT\NUL\STX\SOH\b\SYN\DC2\EOT3\EOT5\ENQ\n\
    \\SI\n\
    \\a\EOT\NUL\STX\SOH\b\DC4\NUL\DC2\EOT6\EOT9\ENQ\n\
    \\SO\n\
    \\a\EOT\NUL\STX\SOH\b\DC4\SOH\DC2\ETX:\EOTE\n\
    \\f\n\
    \\EOT\EOT\NUL\EOT\SOH\DC2\EOT=\STXB\ETX\n\
    \\f\n\
    \\ENQ\EOT\NUL\EOT\SOH\SOH\DC2\ETX=\a\SYN\n\
    \\r\n\
    \\ACK\EOT\NUL\EOT\SOH\STX\NUL\DC2\ETX>\EOT&\n\
    \\SO\n\
    \\a\EOT\NUL\EOT\SOH\STX\NUL\SOH\DC2\ETX>\EOT!\n\
    \\SO\n\
    \\a\EOT\NUL\EOT\SOH\STX\NUL\STX\DC2\ETX>$%\n\
    \\r\n\
    \\ACK\EOT\NUL\EOT\SOH\STX\SOH\DC2\ETX?\EOT\US\n\
    \\SO\n\
    \\a\EOT\NUL\EOT\SOH\STX\SOH\SOH\DC2\ETX?\EOT\SUB\n\
    \\SO\n\
    \\a\EOT\NUL\EOT\SOH\STX\SOH\STX\DC2\ETX?\GS\RS\n\
    \\r\n\
    \\ACK\EOT\NUL\EOT\SOH\STX\STX\DC2\ETX@\EOT(\n\
    \\SO\n\
    \\a\EOT\NUL\EOT\SOH\STX\STX\SOH\DC2\ETX@\EOT#\n\
    \\SO\n\
    \\a\EOT\NUL\EOT\SOH\STX\STX\STX\DC2\ETX@&'\n\
    \\r\n\
    \\ACK\EOT\NUL\EOT\SOH\STX\ETX\DC2\ETXA\EOT \n\
    \\SO\n\
    \\a\EOT\NUL\EOT\SOH\STX\ETX\SOH\DC2\ETXA\EOT\ESC\n\
    \\SO\n\
    \\a\EOT\NUL\EOT\SOH\STX\ETX\STX\DC2\ETXA\RS\US\n\
    \\f\n\
    \\EOT\EOT\NUL\STX\STX\DC2\EOTD\STXQ\EOT\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\EOT\DC2\ETXD\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ACK\DC2\ETXD\v\SUB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\SOH\DC2\ETXD\ESC,\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ETX\DC2\ETXD/0\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\STX\b\DC2\EOTD1Q\ETX\n\
    \\r\n\
    \\ACK\EOT\NUL\STX\STX\b\DC1\DC2\ETXE\EOT!\n\
    \\SO\n\
    \\a\EOT\NUL\STX\STX\b\DC3\NUL\DC2\ETXF\EOT\RS\n\
    \\SO\n\
    \\a\EOT\NUL\STX\STX\b\DC3\SOH\DC2\ETXG\EOT$\n\
    \\SO\n\
    \\a\EOT\NUL\STX\STX\b\DC3\STX\DC2\ETXH\EOT\RS\n\
    \\SO\n\
    \\ACK\EOT\NUL\STX\STX\b\SYN\DC2\EOTI\EOTK\ENQ\n\
    \\SI\n\
    \\a\EOT\NUL\STX\STX\b\DC4\NUL\DC2\EOTM\EOTP\ENQ\n\
    \\128\SOH\n\
    \\EOT\EOT\NUL\ETX\NUL\DC2\EOTU\STXa\ETX\SUBr Wrap the OptimizeMode enum in a message for scoping:\n\
    \ This way, users can type shorter names (SPEED, CODE_SIZE).\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\ETX\NUL\SOH\DC2\ETXU\n\
    \\GS\n\
    \Q\n\
    \\ACK\EOT\NUL\ETX\NUL\EOT\NUL\DC2\EOTW\EOT`\ENQ\SUBA The name of this enum matches OptimizeMode in descriptor.proto.\n\
    \\n\
    \\SO\n\
    \\a\EOT\NUL\ETX\NUL\EOT\NUL\SOH\DC2\ETXW\t\NAK\n\
    \\228\SOH\n\
    \\b\EOT\NUL\ETX\NUL\EOT\NUL\STX\NUL\DC2\ETX[\ACK$\SUB\210\SOH OPTIMIZE_MODE_UNSPECIFIED results in falling back to the default\n\
    \ (optimize for code size), but needs to be a separate value to distinguish\n\
    \ between an explicitly set optimize mode or a missing optimize mode.\n\
    \\n\
    \\DLE\n\
    \\t\EOT\NUL\ETX\NUL\EOT\NUL\STX\NUL\SOH\DC2\ETX[\ACK\US\n\
    \\DLE\n\
    \\t\EOT\NUL\ETX\NUL\EOT\NUL\STX\NUL\STX\DC2\ETX[\"#\n\
    \\SI\n\
    \\b\EOT\NUL\ETX\NUL\EOT\NUL\STX\SOH\DC2\ETX\\\ACK\DLE\n\
    \\DLE\n\
    \\t\EOT\NUL\ETX\NUL\EOT\NUL\STX\SOH\SOH\DC2\ETX\\\ACK\v\n\
    \\DLE\n\
    \\t\EOT\NUL\ETX\NUL\EOT\NUL\STX\SOH\STX\DC2\ETX\\\SO\SI\n\
    \\144\SOH\n\
    \\b\EOT\NUL\ETX\NUL\EOT\NUL\STX\STX\DC2\ETX]\ACK\DC4\"\DEL There is no enum entry for LITE_RUNTIME (descriptor.proto),\n\
    \ because Go Protobuf does not have the concept of a lite runtime.\n\
    \\n\
    \\DLE\n\
    \\t\EOT\NUL\ETX\NUL\EOT\NUL\STX\STX\SOH\DC2\ETX]\ACK\SI\n\
    \\DLE\n\
    \\t\EOT\NUL\ETX\NUL\EOT\NUL\STX\STX\STX\DC2\ETX]\DC2\DC3\n\
    \\f\n\
    \\EOT\EOT\NUL\STX\ETX\DC2\EOTc\STXn\EOT\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\EOT\DC2\ETXc\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ACK\DC2\ETXc\v+\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\SOH\DC2\ETXc,9\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ETX\DC2\ETXc<=\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\ETX\b\DC2\EOTc>n\ETX\n\
    \\r\n\
    \\ACK\EOT\NUL\STX\ETX\b\DC1\DC2\ETXd\EOT!\n\
    \\SO\n\
    \\a\EOT\NUL\STX\ETX\b\DC3\NUL\DC2\ETXe\EOT!\n\
    \\SO\n\
    \\a\EOT\NUL\STX\ETX\b\DC3\SOH\DC2\ETXf\EOT\RS\n\
    \\SO\n\
    \\ACK\EOT\NUL\STX\ETX\b\SYN\DC2\EOTg\EOTi\ENQ\n\
    \\SI\n\
    \\a\EOT\NUL\STX\ETX\b\DC4\NUL\DC2\EOTj\EOTm\ENQ"