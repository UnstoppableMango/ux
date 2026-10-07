{- This file was auto-generated from tdl/ir/v1/ir.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Tdl.Ir.V1.Ir (
        Alias(), AssocBind(), AssocType(), Class(), ClassRef(),
        Constraint(), Decl(), Decl'Node(..), _Decl'Primitive, _Decl'Alias,
        _Decl'Newtype, _Decl'Structure, _Decl'Enumeration, _Decl'Class,
        _Decl'Unit, Deprecation(), Dimension(), Directive(), Enum(),
        Extern(), Field(), FunDep(), ID(), Import(), Instance(), Kind(),
        KindAtom(..), KindAtom(), KindAtom'UnrecognizedValue, Literal(),
        LiteralKind(..), LiteralKind(), LiteralKind'UnrecognizedValue,
        Meta(), Model(), Newtype(), Param(), ParamRef(), Position(),
        Primitive(), Range(), Satisfaction(), Struct(), StructKind(..),
        StructKind(), StructKind'UnrecognizedValue, SyntacticForm(..),
        SyntacticForm(), SyntacticForm'UnrecognizedValue, TargetBlock(),
        Type(), Unit(), UnitDef(), Variant()
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
import qualified Proto.Google.Protobuf.GoFeatures
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.params' @:: Lens' Alias [Param]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'params' @:: Lens' Alias (Data.Vector.Vector Param)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.target' @:: Lens' Alias ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'target' @:: Lens' Alias (Prelude.Maybe ID)@ -}
data Alias
  = Alias'_constructor {_Alias'params :: !(Data.Vector.Vector Param),
                        _Alias'target :: !(Prelude.Maybe ID),
                        _Alias'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Alias where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Alias "params" [Param] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Alias'params (\ x__ y__ -> x__ {_Alias'params = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Alias "vec'params" (Data.Vector.Vector Param) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Alias'params (\ x__ y__ -> x__ {_Alias'params = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Alias "target" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Alias'target (\ x__ y__ -> x__ {_Alias'target = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Alias "maybe'target" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Alias'target (\ x__ y__ -> x__ {_Alias'target = y__}))
        Prelude.id
instance Data.ProtoLens.Message Alias where
  messageName _ = Data.Text.pack "tdl.ir.v1.Alias"
  packedMessageDescriptor _
    = "\n\
      \\ENQAlias\DC2(\n\
      \\ACKparams\CAN\SOH \ETX(\v2\DLE.tdl.ir.v1.ParamR\ACKparams\DC2%\n\
      \\ACKtarget\CAN\STX \SOH(\v2\r.tdl.ir.v1.IDR\ACKtarget"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        params__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "params"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Param)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"params")) ::
              Data.ProtoLens.FieldDescriptor Alias
        target__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "target"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'target")) ::
              Data.ProtoLens.FieldDescriptor Alias
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, params__field_descriptor),
           (Data.ProtoLens.Tag 2, target__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Alias'_unknownFields
        (\ x__ y__ -> x__ {_Alias'_unknownFields = y__})
  defMessage
    = Alias'_constructor
        {_Alias'params = Data.Vector.Generic.empty,
         _Alias'target = Prelude.Nothing, _Alias'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Alias
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Param
             -> Data.ProtoLens.Encoding.Bytes.Parser Alias
        loop x mutable'params
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'params <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'params)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'params") frozen'params x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "params"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'params y)
                                loop x v
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "target"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"target") y x)
                                  mutable'params
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'params
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'params <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'params)
          "Alias"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'params") _x))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'target") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData Alias where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Alias'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Alias'params x__)
                (Control.DeepSeq.deepseq (_Alias'target x__) ()))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.name' @:: Lens' AssocBind Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.type'' @:: Lens' AssocBind ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'type'' @:: Lens' AssocBind (Prelude.Maybe ID)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.position' @:: Lens' AssocBind Position@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'position' @:: Lens' AssocBind (Prelude.Maybe Position)@ -}
data AssocBind
  = AssocBind'_constructor {_AssocBind'name :: !Data.Text.Text,
                            _AssocBind'type' :: !(Prelude.Maybe ID),
                            _AssocBind'position :: !(Prelude.Maybe Position),
                            _AssocBind'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show AssocBind where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField AssocBind "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AssocBind'name (\ x__ y__ -> x__ {_AssocBind'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AssocBind "type'" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AssocBind'type' (\ x__ y__ -> x__ {_AssocBind'type' = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField AssocBind "maybe'type'" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AssocBind'type' (\ x__ y__ -> x__ {_AssocBind'type' = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AssocBind "position" Position where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AssocBind'position (\ x__ y__ -> x__ {_AssocBind'position = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField AssocBind "maybe'position" (Prelude.Maybe Position) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AssocBind'position (\ x__ y__ -> x__ {_AssocBind'position = y__}))
        Prelude.id
instance Data.ProtoLens.Message AssocBind where
  messageName _ = Data.Text.pack "tdl.ir.v1.AssocBind"
  packedMessageDescriptor _
    = "\n\
      \\tAssocBind\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2!\n\
      \\EOTtype\CAN\STX \SOH(\v2\r.tdl.ir.v1.IDR\EOTtype\DC2/\n\
      \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor AssocBind
        type'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'type'")) ::
              Data.ProtoLens.FieldDescriptor AssocBind
        position__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "position"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Position)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'position")) ::
              Data.ProtoLens.FieldDescriptor AssocBind
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, type'__field_descriptor),
           (Data.ProtoLens.Tag 3, position__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _AssocBind'_unknownFields
        (\ x__ y__ -> x__ {_AssocBind'_unknownFields = y__})
  defMessage
    = AssocBind'_constructor
        {_AssocBind'name = Data.ProtoLens.fieldDefault,
         _AssocBind'type' = Prelude.Nothing,
         _AssocBind'position = Prelude.Nothing,
         _AssocBind'_unknownFields = []}
  parseMessage
    = let
        loop :: AssocBind -> Data.ProtoLens.Encoding.Bytes.Parser AssocBind
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "type"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"type'") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "position"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"position") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "AssocBind"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'type'") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'position") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData AssocBind where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_AssocBind'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_AssocBind'name x__)
                (Control.DeepSeq.deepseq
                   (_AssocBind'type' x__)
                   (Control.DeepSeq.deepseq (_AssocBind'position x__) ())))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.meta' @:: Lens' AssocType Meta@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'meta' @:: Lens' AssocType (Prelude.Maybe Meta)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.kind' @:: Lens' AssocType Kind@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'kind' @:: Lens' AssocType (Prelude.Maybe Kind)@ -}
data AssocType
  = AssocType'_constructor {_AssocType'meta :: !(Prelude.Maybe Meta),
                            _AssocType'kind :: !(Prelude.Maybe Kind),
                            _AssocType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show AssocType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField AssocType "meta" Meta where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AssocType'meta (\ x__ y__ -> x__ {_AssocType'meta = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField AssocType "maybe'meta" (Prelude.Maybe Meta) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AssocType'meta (\ x__ y__ -> x__ {_AssocType'meta = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AssocType "kind" Kind where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AssocType'kind (\ x__ y__ -> x__ {_AssocType'kind = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField AssocType "maybe'kind" (Prelude.Maybe Kind) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AssocType'kind (\ x__ y__ -> x__ {_AssocType'kind = y__}))
        Prelude.id
instance Data.ProtoLens.Message AssocType where
  messageName _ = Data.Text.pack "tdl.ir.v1.AssocType"
  packedMessageDescriptor _
    = "\n\
      \\tAssocType\DC2#\n\
      \\EOTmeta\CAN\SOH \SOH(\v2\SI.tdl.ir.v1.MetaR\EOTmeta\DC2#\n\
      \\EOTkind\CAN\STX \SOH(\v2\SI.tdl.ir.v1.KindR\EOTkind"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        meta__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "meta"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Meta)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'meta")) ::
              Data.ProtoLens.FieldDescriptor AssocType
        kind__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "kind"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Kind)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'kind")) ::
              Data.ProtoLens.FieldDescriptor AssocType
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, meta__field_descriptor),
           (Data.ProtoLens.Tag 2, kind__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _AssocType'_unknownFields
        (\ x__ y__ -> x__ {_AssocType'_unknownFields = y__})
  defMessage
    = AssocType'_constructor
        {_AssocType'meta = Prelude.Nothing,
         _AssocType'kind = Prelude.Nothing, _AssocType'_unknownFields = []}
  parseMessage
    = let
        loop :: AssocType -> Data.ProtoLens.Encoding.Bytes.Parser AssocType
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "meta"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"meta") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "kind"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"kind") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "AssocType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'meta") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'kind") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData AssocType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_AssocType'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_AssocType'meta x__)
                (Control.DeepSeq.deepseq (_AssocType'kind x__) ()))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.params' @:: Lens' Class [Param]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'params' @:: Lens' Class (Data.Vector.Vector Param)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.funDeps' @:: Lens' Class [FunDep]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'funDeps' @:: Lens' Class (Data.Vector.Vector FunDep)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.requiresClasses' @:: Lens' Class [ClassRef]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'requiresClasses' @:: Lens' Class (Data.Vector.Vector ClassRef)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.constraints' @:: Lens' Class [ClassRef]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'constraints' @:: Lens' Class (Data.Vector.Vector ClassRef)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.fields' @:: Lens' Class [Field]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'fields' @:: Lens' Class (Data.Vector.Vector Field)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.assocTypes' @:: Lens' Class [AssocType]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'assocTypes' @:: Lens' Class (Data.Vector.Vector AssocType)@ -}
data Class
  = Class'_constructor {_Class'params :: !(Data.Vector.Vector Param),
                        _Class'funDeps :: !(Data.Vector.Vector FunDep),
                        _Class'requiresClasses :: !(Data.Vector.Vector ClassRef),
                        _Class'constraints :: !(Data.Vector.Vector ClassRef),
                        _Class'fields :: !(Data.Vector.Vector Field),
                        _Class'assocTypes :: !(Data.Vector.Vector AssocType),
                        _Class'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Class where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Class "params" [Param] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Class'params (\ x__ y__ -> x__ {_Class'params = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Class "vec'params" (Data.Vector.Vector Param) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Class'params (\ x__ y__ -> x__ {_Class'params = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Class "funDeps" [FunDep] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Class'funDeps (\ x__ y__ -> x__ {_Class'funDeps = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Class "vec'funDeps" (Data.Vector.Vector FunDep) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Class'funDeps (\ x__ y__ -> x__ {_Class'funDeps = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Class "requiresClasses" [ClassRef] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Class'requiresClasses
           (\ x__ y__ -> x__ {_Class'requiresClasses = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Class "vec'requiresClasses" (Data.Vector.Vector ClassRef) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Class'requiresClasses
           (\ x__ y__ -> x__ {_Class'requiresClasses = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Class "constraints" [ClassRef] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Class'constraints (\ x__ y__ -> x__ {_Class'constraints = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Class "vec'constraints" (Data.Vector.Vector ClassRef) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Class'constraints (\ x__ y__ -> x__ {_Class'constraints = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Class "fields" [Field] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Class'fields (\ x__ y__ -> x__ {_Class'fields = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Class "vec'fields" (Data.Vector.Vector Field) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Class'fields (\ x__ y__ -> x__ {_Class'fields = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Class "assocTypes" [AssocType] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Class'assocTypes (\ x__ y__ -> x__ {_Class'assocTypes = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Class "vec'assocTypes" (Data.Vector.Vector AssocType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Class'assocTypes (\ x__ y__ -> x__ {_Class'assocTypes = y__}))
        Prelude.id
instance Data.ProtoLens.Message Class where
  messageName _ = Data.Text.pack "tdl.ir.v1.Class"
  packedMessageDescriptor _
    = "\n\
      \\ENQClass\DC2(\n\
      \\ACKparams\CAN\SOH \ETX(\v2\DLE.tdl.ir.v1.ParamR\ACKparams\DC2,\n\
      \\bfun_deps\CAN\STX \ETX(\v2\DC1.tdl.ir.v1.FunDepR\afunDeps\DC2>\n\
      \\DLErequires_classes\CAN\ETX \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\SIrequiresClasses\DC25\n\
      \\vconstraints\CAN\EOT \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\vconstraints\DC2(\n\
      \\ACKfields\CAN\ENQ \ETX(\v2\DLE.tdl.ir.v1.FieldR\ACKfields\DC25\n\
      \\vassoc_types\CAN\a \ETX(\v2\DC4.tdl.ir.v1.AssocTypeR\n\
      \assocTypesJ\EOT\b\ACK\DLE\aR\frequires_key"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        params__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "params"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Param)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"params")) ::
              Data.ProtoLens.FieldDescriptor Class
        funDeps__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "fun_deps"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FunDep)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"funDeps")) ::
              Data.ProtoLens.FieldDescriptor Class
        requiresClasses__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "requires_classes"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ClassRef)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"requiresClasses")) ::
              Data.ProtoLens.FieldDescriptor Class
        constraints__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "constraints"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ClassRef)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"constraints")) ::
              Data.ProtoLens.FieldDescriptor Class
        fields__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "fields"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Field)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"fields")) ::
              Data.ProtoLens.FieldDescriptor Class
        assocTypes__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "assoc_types"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor AssocType)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"assocTypes")) ::
              Data.ProtoLens.FieldDescriptor Class
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, params__field_descriptor),
           (Data.ProtoLens.Tag 2, funDeps__field_descriptor),
           (Data.ProtoLens.Tag 3, requiresClasses__field_descriptor),
           (Data.ProtoLens.Tag 4, constraints__field_descriptor),
           (Data.ProtoLens.Tag 5, fields__field_descriptor),
           (Data.ProtoLens.Tag 7, assocTypes__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Class'_unknownFields
        (\ x__ y__ -> x__ {_Class'_unknownFields = y__})
  defMessage
    = Class'_constructor
        {_Class'params = Data.Vector.Generic.empty,
         _Class'funDeps = Data.Vector.Generic.empty,
         _Class'requiresClasses = Data.Vector.Generic.empty,
         _Class'constraints = Data.Vector.Generic.empty,
         _Class'fields = Data.Vector.Generic.empty,
         _Class'assocTypes = Data.Vector.Generic.empty,
         _Class'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Class
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld AssocType
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld ClassRef
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Field
                   -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld FunDep
                      -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Param
                         -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld ClassRef
                            -> Data.ProtoLens.Encoding.Bytes.Parser Class
        loop
          x
          mutable'assocTypes
          mutable'constraints
          mutable'fields
          mutable'funDeps
          mutable'params
          mutable'requiresClasses
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'assocTypes <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                             (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                mutable'assocTypes)
                      frozen'constraints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'constraints)
                      frozen'fields <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'fields)
                      frozen'funDeps <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'funDeps)
                      frozen'params <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'params)
                      frozen'requiresClasses <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                  (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                     mutable'requiresClasses)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'assocTypes") frozen'assocTypes
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'constraints") frozen'constraints
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'fields") frozen'fields
                                    (Lens.Family2.set
                                       (Data.ProtoLens.Field.field @"vec'funDeps") frozen'funDeps
                                       (Lens.Family2.set
                                          (Data.ProtoLens.Field.field @"vec'params") frozen'params
                                          (Lens.Family2.set
                                             (Data.ProtoLens.Field.field @"vec'requiresClasses")
                                             frozen'requiresClasses x)))))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "params"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'params y)
                                loop
                                  x mutable'assocTypes mutable'constraints mutable'fields
                                  mutable'funDeps v mutable'requiresClasses
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "fun_deps"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'funDeps y)
                                loop
                                  x mutable'assocTypes mutable'constraints mutable'fields v
                                  mutable'params mutable'requiresClasses
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "requires_classes"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'requiresClasses y)
                                loop
                                  x mutable'assocTypes mutable'constraints mutable'fields
                                  mutable'funDeps mutable'params v
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "constraints"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'constraints y)
                                loop
                                  x mutable'assocTypes v mutable'fields mutable'funDeps
                                  mutable'params mutable'requiresClasses
                        42
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "fields"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'fields y)
                                loop
                                  x mutable'assocTypes mutable'constraints v mutable'funDeps
                                  mutable'params mutable'requiresClasses
                        58
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "assoc_types"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'assocTypes y)
                                loop
                                  x v mutable'constraints mutable'fields mutable'funDeps
                                  mutable'params mutable'requiresClasses
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'assocTypes mutable'constraints mutable'fields
                                  mutable'funDeps mutable'params mutable'requiresClasses
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'assocTypes <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      Data.ProtoLens.Encoding.Growing.new
              mutable'constraints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       Data.ProtoLens.Encoding.Growing.new
              mutable'fields <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              mutable'funDeps <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              mutable'params <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              mutable'requiresClasses <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'assocTypes mutable'constraints
                mutable'fields mutable'funDeps mutable'params
                mutable'requiresClasses)
          "Class"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'params") _x))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'funDeps") _x))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'requiresClasses") _x))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                 ((Prelude..)
                                    (\ bs
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                                            (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    Data.ProtoLens.encodeMessage _v))
                         (Lens.Family2.view
                            (Data.ProtoLens.Field.field @"vec'constraints") _x))
                      ((Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                            (\ _v
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                    ((Prelude..)
                                       (\ bs
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                  (Prelude.fromIntegral
                                                     (Data.ByteString.length bs)))
                                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                       Data.ProtoLens.encodeMessage _v))
                            (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'fields") _x))
                         ((Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                               (\ _v
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                       ((Prelude..)
                                          (\ bs
                                             -> (Data.Monoid.<>)
                                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                     (Prelude.fromIntegral
                                                        (Data.ByteString.length bs)))
                                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                          Data.ProtoLens.encodeMessage _v))
                               (Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"vec'assocTypes") _x))
                            (Data.ProtoLens.Encoding.Wire.buildFieldSet
                               (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))))
instance Control.DeepSeq.NFData Class where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Class'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Class'params x__)
                (Control.DeepSeq.deepseq
                   (_Class'funDeps x__)
                   (Control.DeepSeq.deepseq
                      (_Class'requiresClasses x__)
                      (Control.DeepSeq.deepseq
                         (_Class'constraints x__)
                         (Control.DeepSeq.deepseq
                            (_Class'fields x__)
                            (Control.DeepSeq.deepseq (_Class'assocTypes x__) ()))))))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.class'' @:: Lens' ClassRef ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'class'' @:: Lens' ClassRef (Prelude.Maybe ID)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.extern' @:: Lens' ClassRef ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'extern' @:: Lens' ClassRef (Prelude.Maybe ID)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.args' @:: Lens' ClassRef [ID]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'args' @:: Lens' ClassRef (Data.Vector.Vector ID)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.position' @:: Lens' ClassRef Position@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'position' @:: Lens' ClassRef (Prelude.Maybe Position)@ -}
data ClassRef
  = ClassRef'_constructor {_ClassRef'class' :: !(Prelude.Maybe ID),
                           _ClassRef'extern :: !(Prelude.Maybe ID),
                           _ClassRef'args :: !(Data.Vector.Vector ID),
                           _ClassRef'position :: !(Prelude.Maybe Position),
                           _ClassRef'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ClassRef where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ClassRef "class'" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassRef'class' (\ x__ y__ -> x__ {_ClassRef'class' = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ClassRef "maybe'class'" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassRef'class' (\ x__ y__ -> x__ {_ClassRef'class' = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ClassRef "extern" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassRef'extern (\ x__ y__ -> x__ {_ClassRef'extern = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ClassRef "maybe'extern" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassRef'extern (\ x__ y__ -> x__ {_ClassRef'extern = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ClassRef "args" [ID] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassRef'args (\ x__ y__ -> x__ {_ClassRef'args = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField ClassRef "vec'args" (Data.Vector.Vector ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassRef'args (\ x__ y__ -> x__ {_ClassRef'args = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ClassRef "position" Position where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassRef'position (\ x__ y__ -> x__ {_ClassRef'position = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ClassRef "maybe'position" (Prelude.Maybe Position) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassRef'position (\ x__ y__ -> x__ {_ClassRef'position = y__}))
        Prelude.id
instance Data.ProtoLens.Message ClassRef where
  messageName _ = Data.Text.pack "tdl.ir.v1.ClassRef"
  packedMessageDescriptor _
    = "\n\
      \\bClassRef\DC2#\n\
      \\ENQclass\CAN\SOH \SOH(\v2\r.tdl.ir.v1.IDR\ENQclass\DC2%\n\
      \\ACKextern\CAN\STX \SOH(\v2\r.tdl.ir.v1.IDR\ACKextern\DC2!\n\
      \\EOTargs\CAN\ETX \ETX(\v2\r.tdl.ir.v1.IDR\EOTargs\DC2/\n\
      \\bposition\CAN\EOT \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        class'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "class"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'class'")) ::
              Data.ProtoLens.FieldDescriptor ClassRef
        extern__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "extern"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'extern")) ::
              Data.ProtoLens.FieldDescriptor ClassRef
        args__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "args"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"args")) ::
              Data.ProtoLens.FieldDescriptor ClassRef
        position__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "position"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Position)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'position")) ::
              Data.ProtoLens.FieldDescriptor ClassRef
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, class'__field_descriptor),
           (Data.ProtoLens.Tag 2, extern__field_descriptor),
           (Data.ProtoLens.Tag 3, args__field_descriptor),
           (Data.ProtoLens.Tag 4, position__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ClassRef'_unknownFields
        (\ x__ y__ -> x__ {_ClassRef'_unknownFields = y__})
  defMessage
    = ClassRef'_constructor
        {_ClassRef'class' = Prelude.Nothing,
         _ClassRef'extern = Prelude.Nothing,
         _ClassRef'args = Data.Vector.Generic.empty,
         _ClassRef'position = Prelude.Nothing,
         _ClassRef'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ClassRef
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld ID
             -> Data.ProtoLens.Encoding.Bytes.Parser ClassRef
        loop x mutable'args
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'args <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'args)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'args") frozen'args x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "class"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"class'") y x)
                                  mutable'args
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "extern"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"extern") y x)
                                  mutable'args
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "args"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'args y)
                                loop x v
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "position"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"position") y x)
                                  mutable'args
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'args
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'args <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'args)
          "ClassRef"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'class'") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'extern") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'args") _x))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'position") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                ((Prelude..)
                                   (\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                   Data.ProtoLens.encodeMessage _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData ClassRef where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ClassRef'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ClassRef'class' x__)
                (Control.DeepSeq.deepseq
                   (_ClassRef'extern x__)
                   (Control.DeepSeq.deepseq
                      (_ClassRef'args x__)
                      (Control.DeepSeq.deepseq (_ClassRef'position x__) ()))))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.name' @:: Lens' Constraint Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.args' @:: Lens' Constraint [Literal]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'args' @:: Lens' Constraint (Data.Vector.Vector Literal)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.position' @:: Lens' Constraint Position@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'position' @:: Lens' Constraint (Prelude.Maybe Position)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.from' @:: Lens' Constraint ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'from' @:: Lens' Constraint (Prelude.Maybe ID)@ -}
data Constraint
  = Constraint'_constructor {_Constraint'name :: !Data.Text.Text,
                             _Constraint'args :: !(Data.Vector.Vector Literal),
                             _Constraint'position :: !(Prelude.Maybe Position),
                             _Constraint'from :: !(Prelude.Maybe ID),
                             _Constraint'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Constraint where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Constraint "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constraint'name (\ x__ y__ -> x__ {_Constraint'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Constraint "args" [Literal] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constraint'args (\ x__ y__ -> x__ {_Constraint'args = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Constraint "vec'args" (Data.Vector.Vector Literal) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constraint'args (\ x__ y__ -> x__ {_Constraint'args = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Constraint "position" Position where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constraint'position
           (\ x__ y__ -> x__ {_Constraint'position = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Constraint "maybe'position" (Prelude.Maybe Position) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constraint'position
           (\ x__ y__ -> x__ {_Constraint'position = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Constraint "from" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constraint'from (\ x__ y__ -> x__ {_Constraint'from = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Constraint "maybe'from" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constraint'from (\ x__ y__ -> x__ {_Constraint'from = y__}))
        Prelude.id
instance Data.ProtoLens.Message Constraint where
  messageName _ = Data.Text.pack "tdl.ir.v1.Constraint"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \Constraint\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2&\n\
      \\EOTargs\CAN\STX \ETX(\v2\DC2.tdl.ir.v1.LiteralR\EOTargs\DC2/\n\
      \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\DC2!\n\
      \\EOTfrom\CAN\EOT \SOH(\v2\r.tdl.ir.v1.IDR\EOTfrom"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor Constraint
        args__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "args"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Literal)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"args")) ::
              Data.ProtoLens.FieldDescriptor Constraint
        position__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "position"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Position)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'position")) ::
              Data.ProtoLens.FieldDescriptor Constraint
        from__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "from"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'from")) ::
              Data.ProtoLens.FieldDescriptor Constraint
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, args__field_descriptor),
           (Data.ProtoLens.Tag 3, position__field_descriptor),
           (Data.ProtoLens.Tag 4, from__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Constraint'_unknownFields
        (\ x__ y__ -> x__ {_Constraint'_unknownFields = y__})
  defMessage
    = Constraint'_constructor
        {_Constraint'name = Data.ProtoLens.fieldDefault,
         _Constraint'args = Data.Vector.Generic.empty,
         _Constraint'position = Prelude.Nothing,
         _Constraint'from = Prelude.Nothing,
         _Constraint'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Constraint
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Literal
             -> Data.ProtoLens.Encoding.Bytes.Parser Constraint
        loop x mutable'args
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'args <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'args)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'args") frozen'args x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                                  mutable'args
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "args"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'args y)
                                loop x v
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "position"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"position") y x)
                                  mutable'args
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "from"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"from") y x)
                                  mutable'args
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'args
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'args <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'args)
          "Constraint"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'args") _x))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'position") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'from") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                ((Prelude..)
                                   (\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                   Data.ProtoLens.encodeMessage _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData Constraint where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Constraint'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Constraint'name x__)
                (Control.DeepSeq.deepseq
                   (_Constraint'args x__)
                   (Control.DeepSeq.deepseq
                      (_Constraint'position x__)
                      (Control.DeepSeq.deepseq (_Constraint'from x__) ()))))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.meta' @:: Lens' Decl Meta@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'meta' @:: Lens' Decl (Prelude.Maybe Meta)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.directives' @:: Lens' Decl [Directive]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'directives' @:: Lens' Decl (Data.Vector.Vector Directive)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'node' @:: Lens' Decl (Prelude.Maybe Decl'Node)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'primitive' @:: Lens' Decl (Prelude.Maybe Primitive)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.primitive' @:: Lens' Decl Primitive@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'alias' @:: Lens' Decl (Prelude.Maybe Alias)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.alias' @:: Lens' Decl Alias@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'newtype'' @:: Lens' Decl (Prelude.Maybe Newtype)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.newtype'' @:: Lens' Decl Newtype@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'structure' @:: Lens' Decl (Prelude.Maybe Struct)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.structure' @:: Lens' Decl Struct@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'enumeration' @:: Lens' Decl (Prelude.Maybe Enum)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.enumeration' @:: Lens' Decl Enum@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'class'' @:: Lens' Decl (Prelude.Maybe Class)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.class'' @:: Lens' Decl Class@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'unit' @:: Lens' Decl (Prelude.Maybe UnitDef)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.unit' @:: Lens' Decl UnitDef@ -}
data Decl
  = Decl'_constructor {_Decl'meta :: !(Prelude.Maybe Meta),
                       _Decl'directives :: !(Data.Vector.Vector Directive),
                       _Decl'node :: !(Prelude.Maybe Decl'Node),
                       _Decl'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Decl where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
data Decl'Node
  = Decl'Primitive !Primitive |
    Decl'Alias !Alias |
    Decl'Newtype !Newtype |
    Decl'Structure !Struct |
    Decl'Enumeration !Enum |
    Decl'Class !Class |
    Decl'Unit !UnitDef
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.Field.HasField Decl "meta" Meta where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'meta (\ x__ y__ -> x__ {_Decl'meta = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Decl "maybe'meta" (Prelude.Maybe Meta) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'meta (\ x__ y__ -> x__ {_Decl'meta = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Decl "directives" [Directive] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'directives (\ x__ y__ -> x__ {_Decl'directives = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Decl "vec'directives" (Data.Vector.Vector Directive) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'directives (\ x__ y__ -> x__ {_Decl'directives = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Decl "maybe'node" (Prelude.Maybe Decl'Node) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'node (\ x__ y__ -> x__ {_Decl'node = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Decl "maybe'primitive" (Prelude.Maybe Primitive) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'node (\ x__ y__ -> x__ {_Decl'node = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Decl'Primitive x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Decl'Primitive y__))
instance Data.ProtoLens.Field.HasField Decl "primitive" Primitive where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'node (\ x__ y__ -> x__ {_Decl'node = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Decl'Primitive x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Decl'Primitive y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Decl "maybe'alias" (Prelude.Maybe Alias) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'node (\ x__ y__ -> x__ {_Decl'node = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Decl'Alias x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Decl'Alias y__))
instance Data.ProtoLens.Field.HasField Decl "alias" Alias where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'node (\ x__ y__ -> x__ {_Decl'node = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Decl'Alias x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Decl'Alias y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Decl "maybe'newtype'" (Prelude.Maybe Newtype) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'node (\ x__ y__ -> x__ {_Decl'node = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Decl'Newtype x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Decl'Newtype y__))
instance Data.ProtoLens.Field.HasField Decl "newtype'" Newtype where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'node (\ x__ y__ -> x__ {_Decl'node = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Decl'Newtype x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Decl'Newtype y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Decl "maybe'structure" (Prelude.Maybe Struct) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'node (\ x__ y__ -> x__ {_Decl'node = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Decl'Structure x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Decl'Structure y__))
instance Data.ProtoLens.Field.HasField Decl "structure" Struct where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'node (\ x__ y__ -> x__ {_Decl'node = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Decl'Structure x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Decl'Structure y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Decl "maybe'enumeration" (Prelude.Maybe Enum) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'node (\ x__ y__ -> x__ {_Decl'node = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Decl'Enumeration x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Decl'Enumeration y__))
instance Data.ProtoLens.Field.HasField Decl "enumeration" Enum where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'node (\ x__ y__ -> x__ {_Decl'node = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Decl'Enumeration x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Decl'Enumeration y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Decl "maybe'class'" (Prelude.Maybe Class) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'node (\ x__ y__ -> x__ {_Decl'node = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Decl'Class x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Decl'Class y__))
instance Data.ProtoLens.Field.HasField Decl "class'" Class where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'node (\ x__ y__ -> x__ {_Decl'node = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Decl'Class x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Decl'Class y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Decl "maybe'unit" (Prelude.Maybe UnitDef) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'node (\ x__ y__ -> x__ {_Decl'node = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Decl'Unit x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Decl'Unit y__))
instance Data.ProtoLens.Field.HasField Decl "unit" UnitDef where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Decl'node (\ x__ y__ -> x__ {_Decl'node = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Decl'Unit x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Decl'Unit y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Message Decl where
  messageName _ = Data.Text.pack "tdl.ir.v1.Decl"
  packedMessageDescriptor _
    = "\n\
      \\EOTDecl\DC2#\n\
      \\EOTmeta\CAN\SOH \SOH(\v2\SI.tdl.ir.v1.MetaR\EOTmeta\DC24\n\
      \\n\
      \directives\CAN\b \ETX(\v2\DC4.tdl.ir.v1.DirectiveR\n\
      \directives\DC24\n\
      \\tprimitive\CAN\STX \SOH(\v2\DC4.tdl.ir.v1.PrimitiveH\NULR\tprimitive\DC2(\n\
      \\ENQalias\CAN\ETX \SOH(\v2\DLE.tdl.ir.v1.AliasH\NULR\ENQalias\DC2.\n\
      \\anewtype\CAN\EOT \SOH(\v2\DC2.tdl.ir.v1.NewtypeH\NULR\anewtype\DC21\n\
      \\tstructure\CAN\ENQ \SOH(\v2\DC1.tdl.ir.v1.StructH\NULR\tstructure\DC23\n\
      \\venumeration\CAN\ACK \SOH(\v2\SI.tdl.ir.v1.EnumH\NULR\venumeration\DC2(\n\
      \\ENQclass\CAN\a \SOH(\v2\DLE.tdl.ir.v1.ClassH\NULR\ENQclass\DC2(\n\
      \\EOTunit\CAN\t \SOH(\v2\DC2.tdl.ir.v1.UnitDefH\NULR\EOTunitB\ACK\n\
      \\EOTnode"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        meta__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "meta"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Meta)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'meta")) ::
              Data.ProtoLens.FieldDescriptor Decl
        directives__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "directives"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Directive)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"directives")) ::
              Data.ProtoLens.FieldDescriptor Decl
        primitive__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "primitive"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Primitive)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'primitive")) ::
              Data.ProtoLens.FieldDescriptor Decl
        alias__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "alias"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Alias)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'alias")) ::
              Data.ProtoLens.FieldDescriptor Decl
        newtype'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "newtype"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Newtype)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'newtype'")) ::
              Data.ProtoLens.FieldDescriptor Decl
        structure__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "structure"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Struct)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'structure")) ::
              Data.ProtoLens.FieldDescriptor Decl
        enumeration__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "enumeration"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Enum)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'enumeration")) ::
              Data.ProtoLens.FieldDescriptor Decl
        class'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "class"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Class)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'class'")) ::
              Data.ProtoLens.FieldDescriptor Decl
        unit__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "unit"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UnitDef)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'unit")) ::
              Data.ProtoLens.FieldDescriptor Decl
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, meta__field_descriptor),
           (Data.ProtoLens.Tag 8, directives__field_descriptor),
           (Data.ProtoLens.Tag 2, primitive__field_descriptor),
           (Data.ProtoLens.Tag 3, alias__field_descriptor),
           (Data.ProtoLens.Tag 4, newtype'__field_descriptor),
           (Data.ProtoLens.Tag 5, structure__field_descriptor),
           (Data.ProtoLens.Tag 6, enumeration__field_descriptor),
           (Data.ProtoLens.Tag 7, class'__field_descriptor),
           (Data.ProtoLens.Tag 9, unit__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Decl'_unknownFields
        (\ x__ y__ -> x__ {_Decl'_unknownFields = y__})
  defMessage
    = Decl'_constructor
        {_Decl'meta = Prelude.Nothing,
         _Decl'directives = Data.Vector.Generic.empty,
         _Decl'node = Prelude.Nothing, _Decl'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Decl
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Directive
             -> Data.ProtoLens.Encoding.Bytes.Parser Decl
        loop x mutable'directives
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'directives <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                             (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                mutable'directives)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'directives") frozen'directives
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "meta"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"meta") y x)
                                  mutable'directives
                        66
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "directives"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'directives y)
                                loop x v
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "primitive"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"primitive") y x)
                                  mutable'directives
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "alias"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"alias") y x)
                                  mutable'directives
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "newtype"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"newtype'") y x)
                                  mutable'directives
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "structure"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"structure") y x)
                                  mutable'directives
                        50
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "enumeration"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"enumeration") y x)
                                  mutable'directives
                        58
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "class"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"class'") y x)
                                  mutable'directives
                        74
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "unit"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"unit") y x)
                                  mutable'directives
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'directives
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'directives <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'directives)
          "Decl"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'meta") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view
                      (Data.ProtoLens.Field.field @"vec'directives") _x))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'node") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just (Decl'Primitive v))
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage v)
                      (Prelude.Just (Decl'Alias v))
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage v)
                      (Prelude.Just (Decl'Newtype v))
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage v)
                      (Prelude.Just (Decl'Structure v))
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage v)
                      (Prelude.Just (Decl'Enumeration v))
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage v)
                      (Prelude.Just (Decl'Class v))
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage v)
                      (Prelude.Just (Decl'Unit v))
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 74)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Decl where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Decl'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Decl'meta x__)
                (Control.DeepSeq.deepseq
                   (_Decl'directives x__)
                   (Control.DeepSeq.deepseq (_Decl'node x__) ())))
instance Control.DeepSeq.NFData Decl'Node where
  rnf (Decl'Primitive x__) = Control.DeepSeq.rnf x__
  rnf (Decl'Alias x__) = Control.DeepSeq.rnf x__
  rnf (Decl'Newtype x__) = Control.DeepSeq.rnf x__
  rnf (Decl'Structure x__) = Control.DeepSeq.rnf x__
  rnf (Decl'Enumeration x__) = Control.DeepSeq.rnf x__
  rnf (Decl'Class x__) = Control.DeepSeq.rnf x__
  rnf (Decl'Unit x__) = Control.DeepSeq.rnf x__
_Decl'Primitive :: Data.ProtoLens.Prism.Prism' Decl'Node Primitive
_Decl'Primitive
  = Data.ProtoLens.Prism.prism'
      Decl'Primitive
      (\ p__
         -> case p__ of
              (Decl'Primitive p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Decl'Alias :: Data.ProtoLens.Prism.Prism' Decl'Node Alias
_Decl'Alias
  = Data.ProtoLens.Prism.prism'
      Decl'Alias
      (\ p__
         -> case p__ of
              (Decl'Alias p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Decl'Newtype :: Data.ProtoLens.Prism.Prism' Decl'Node Newtype
_Decl'Newtype
  = Data.ProtoLens.Prism.prism'
      Decl'Newtype
      (\ p__
         -> case p__ of
              (Decl'Newtype p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Decl'Structure :: Data.ProtoLens.Prism.Prism' Decl'Node Struct
_Decl'Structure
  = Data.ProtoLens.Prism.prism'
      Decl'Structure
      (\ p__
         -> case p__ of
              (Decl'Structure p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Decl'Enumeration :: Data.ProtoLens.Prism.Prism' Decl'Node Enum
_Decl'Enumeration
  = Data.ProtoLens.Prism.prism'
      Decl'Enumeration
      (\ p__
         -> case p__ of
              (Decl'Enumeration p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Decl'Class :: Data.ProtoLens.Prism.Prism' Decl'Node Class
_Decl'Class
  = Data.ProtoLens.Prism.prism'
      Decl'Class
      (\ p__
         -> case p__ of
              (Decl'Class p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Decl'Unit :: Data.ProtoLens.Prism.Prism' Decl'Node UnitDef
_Decl'Unit
  = Data.ProtoLens.Prism.prism'
      Decl'Unit
      (\ p__
         -> case p__ of
              (Decl'Unit p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.reason' @:: Lens' Deprecation Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.position' @:: Lens' Deprecation Position@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'position' @:: Lens' Deprecation (Prelude.Maybe Position)@ -}
data Deprecation
  = Deprecation'_constructor {_Deprecation'reason :: !Data.Text.Text,
                              _Deprecation'position :: !(Prelude.Maybe Position),
                              _Deprecation'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Deprecation where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Deprecation "reason" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Deprecation'reason (\ x__ y__ -> x__ {_Deprecation'reason = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Deprecation "position" Position where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Deprecation'position
           (\ x__ y__ -> x__ {_Deprecation'position = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Deprecation "maybe'position" (Prelude.Maybe Position) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Deprecation'position
           (\ x__ y__ -> x__ {_Deprecation'position = y__}))
        Prelude.id
instance Data.ProtoLens.Message Deprecation where
  messageName _ = Data.Text.pack "tdl.ir.v1.Deprecation"
  packedMessageDescriptor _
    = "\n\
      \\vDeprecation\DC2\SYN\n\
      \\ACKreason\CAN\SOH \SOH(\tR\ACKreason\DC2/\n\
      \\bposition\CAN\STX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        reason__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "reason"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"reason")) ::
              Data.ProtoLens.FieldDescriptor Deprecation
        position__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "position"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Position)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'position")) ::
              Data.ProtoLens.FieldDescriptor Deprecation
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, reason__field_descriptor),
           (Data.ProtoLens.Tag 2, position__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Deprecation'_unknownFields
        (\ x__ y__ -> x__ {_Deprecation'_unknownFields = y__})
  defMessage
    = Deprecation'_constructor
        {_Deprecation'reason = Data.ProtoLens.fieldDefault,
         _Deprecation'position = Prelude.Nothing,
         _Deprecation'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Deprecation -> Data.ProtoLens.Encoding.Bytes.Parser Deprecation
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "reason"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"reason") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "position"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"position") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Deprecation"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"reason") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'position") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData Deprecation where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Deprecation'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Deprecation'reason x__)
                (Control.DeepSeq.deepseq (_Deprecation'position x__) ()))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.base' @:: Lens' Dimension ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'base' @:: Lens' Dimension (Prelude.Maybe ID)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.exponent' @:: Lens' Dimension Data.Int.Int32@ -}
data Dimension
  = Dimension'_constructor {_Dimension'base :: !(Prelude.Maybe ID),
                            _Dimension'exponent :: !Data.Int.Int32,
                            _Dimension'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Dimension where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Dimension "base" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Dimension'base (\ x__ y__ -> x__ {_Dimension'base = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Dimension "maybe'base" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Dimension'base (\ x__ y__ -> x__ {_Dimension'base = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Dimension "exponent" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Dimension'exponent (\ x__ y__ -> x__ {_Dimension'exponent = y__}))
        Prelude.id
instance Data.ProtoLens.Message Dimension where
  messageName _ = Data.Text.pack "tdl.ir.v1.Dimension"
  packedMessageDescriptor _
    = "\n\
      \\tDimension\DC2!\n\
      \\EOTbase\CAN\SOH \SOH(\v2\r.tdl.ir.v1.IDR\EOTbase\DC2\SUB\n\
      \\bexponent\CAN\STX \SOH(\ENQR\bexponent"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        base__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "base"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'base")) ::
              Data.ProtoLens.FieldDescriptor Dimension
        exponent__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "exponent"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"exponent")) ::
              Data.ProtoLens.FieldDescriptor Dimension
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, base__field_descriptor),
           (Data.ProtoLens.Tag 2, exponent__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Dimension'_unknownFields
        (\ x__ y__ -> x__ {_Dimension'_unknownFields = y__})
  defMessage
    = Dimension'_constructor
        {_Dimension'base = Prelude.Nothing,
         _Dimension'exponent = Data.ProtoLens.fieldDefault,
         _Dimension'_unknownFields = []}
  parseMessage
    = let
        loop :: Dimension -> Data.ProtoLens.Encoding.Bytes.Parser Dimension
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "base"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"base") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "exponent"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"exponent") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Dimension"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'base") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"exponent") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData Dimension where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Dimension'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Dimension'base x__)
                (Control.DeepSeq.deepseq (_Dimension'exponent x__) ()))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.name' @:: Lens' Directive Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.args' @:: Lens' Directive [Literal]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'args' @:: Lens' Directive (Data.Vector.Vector Literal)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.position' @:: Lens' Directive Position@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'position' @:: Lens' Directive (Prelude.Maybe Position)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.target' @:: Lens' Directive Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.fromClass' @:: Lens' Directive ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'fromClass' @:: Lens' Directive (Prelude.Maybe ID)@ -}
data Directive
  = Directive'_constructor {_Directive'name :: !Data.Text.Text,
                            _Directive'args :: !(Data.Vector.Vector Literal),
                            _Directive'position :: !(Prelude.Maybe Position),
                            _Directive'target :: !Data.Text.Text,
                            _Directive'fromClass :: !(Prelude.Maybe ID),
                            _Directive'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Directive where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Directive "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Directive'name (\ x__ y__ -> x__ {_Directive'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Directive "args" [Literal] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Directive'args (\ x__ y__ -> x__ {_Directive'args = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Directive "vec'args" (Data.Vector.Vector Literal) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Directive'args (\ x__ y__ -> x__ {_Directive'args = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Directive "position" Position where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Directive'position (\ x__ y__ -> x__ {_Directive'position = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Directive "maybe'position" (Prelude.Maybe Position) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Directive'position (\ x__ y__ -> x__ {_Directive'position = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Directive "target" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Directive'target (\ x__ y__ -> x__ {_Directive'target = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Directive "fromClass" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Directive'fromClass
           (\ x__ y__ -> x__ {_Directive'fromClass = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Directive "maybe'fromClass" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Directive'fromClass
           (\ x__ y__ -> x__ {_Directive'fromClass = y__}))
        Prelude.id
instance Data.ProtoLens.Message Directive where
  messageName _ = Data.Text.pack "tdl.ir.v1.Directive"
  packedMessageDescriptor _
    = "\n\
      \\tDirective\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2&\n\
      \\EOTargs\CAN\STX \ETX(\v2\DC2.tdl.ir.v1.LiteralR\EOTargs\DC2/\n\
      \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\DC2\SYN\n\
      \\ACKtarget\CAN\EOT \SOH(\tR\ACKtarget\DC2,\n\
      \\n\
      \from_class\CAN\ENQ \SOH(\v2\r.tdl.ir.v1.IDR\tfromClass"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor Directive
        args__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "args"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Literal)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"args")) ::
              Data.ProtoLens.FieldDescriptor Directive
        position__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "position"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Position)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'position")) ::
              Data.ProtoLens.FieldDescriptor Directive
        target__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "target"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"target")) ::
              Data.ProtoLens.FieldDescriptor Directive
        fromClass__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "from_class"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'fromClass")) ::
              Data.ProtoLens.FieldDescriptor Directive
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, args__field_descriptor),
           (Data.ProtoLens.Tag 3, position__field_descriptor),
           (Data.ProtoLens.Tag 4, target__field_descriptor),
           (Data.ProtoLens.Tag 5, fromClass__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Directive'_unknownFields
        (\ x__ y__ -> x__ {_Directive'_unknownFields = y__})
  defMessage
    = Directive'_constructor
        {_Directive'name = Data.ProtoLens.fieldDefault,
         _Directive'args = Data.Vector.Generic.empty,
         _Directive'position = Prelude.Nothing,
         _Directive'target = Data.ProtoLens.fieldDefault,
         _Directive'fromClass = Prelude.Nothing,
         _Directive'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Directive
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Literal
             -> Data.ProtoLens.Encoding.Bytes.Parser Directive
        loop x mutable'args
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'args <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'args)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'args") frozen'args x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                                  mutable'args
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "args"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'args y)
                                loop x v
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "position"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"position") y x)
                                  mutable'args
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "target"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"target") y x)
                                  mutable'args
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "from_class"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"fromClass") y x)
                                  mutable'args
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'args
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'args <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'args)
          "Directive"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'args") _x))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'position") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage _v))
                   ((Data.Monoid.<>)
                      (let
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"target") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                               ((Prelude..)
                                  (\ bs
                                     -> (Data.Monoid.<>)
                                          (Data.ProtoLens.Encoding.Bytes.putVarInt
                                             (Prelude.fromIntegral (Data.ByteString.length bs)))
                                          (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                  Data.Text.Encoding.encodeUtf8 _v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view
                                (Data.ProtoLens.Field.field @"maybe'fromClass") _x
                          of
                            Prelude.Nothing -> Data.Monoid.mempty
                            (Prelude.Just _v)
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                   ((Prelude..)
                                      (\ bs
                                         -> (Data.Monoid.<>)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                 (Prelude.fromIntegral (Data.ByteString.length bs)))
                                              (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                      Data.ProtoLens.encodeMessage _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData Directive where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Directive'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Directive'name x__)
                (Control.DeepSeq.deepseq
                   (_Directive'args x__)
                   (Control.DeepSeq.deepseq
                      (_Directive'position x__)
                      (Control.DeepSeq.deepseq
                         (_Directive'target x__)
                         (Control.DeepSeq.deepseq (_Directive'fromClass x__) ())))))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.params' @:: Lens' Enum [Param]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'params' @:: Lens' Enum (Data.Vector.Vector Param)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.variants' @:: Lens' Enum [Variant]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'variants' @:: Lens' Enum (Data.Vector.Vector Variant)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.conforms' @:: Lens' Enum [ClassRef]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'conforms' @:: Lens' Enum (Data.Vector.Vector ClassRef)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.constraints' @:: Lens' Enum [ClassRef]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'constraints' @:: Lens' Enum (Data.Vector.Vector ClassRef)@ -}
data Enum
  = Enum'_constructor {_Enum'params :: !(Data.Vector.Vector Param),
                       _Enum'variants :: !(Data.Vector.Vector Variant),
                       _Enum'conforms :: !(Data.Vector.Vector ClassRef),
                       _Enum'constraints :: !(Data.Vector.Vector ClassRef),
                       _Enum'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Enum where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Enum "params" [Param] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'params (\ x__ y__ -> x__ {_Enum'params = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Enum "vec'params" (Data.Vector.Vector Param) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'params (\ x__ y__ -> x__ {_Enum'params = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Enum "variants" [Variant] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'variants (\ x__ y__ -> x__ {_Enum'variants = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Enum "vec'variants" (Data.Vector.Vector Variant) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'variants (\ x__ y__ -> x__ {_Enum'variants = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Enum "conforms" [ClassRef] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'conforms (\ x__ y__ -> x__ {_Enum'conforms = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Enum "vec'conforms" (Data.Vector.Vector ClassRef) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'conforms (\ x__ y__ -> x__ {_Enum'conforms = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Enum "constraints" [ClassRef] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'constraints (\ x__ y__ -> x__ {_Enum'constraints = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Enum "vec'constraints" (Data.Vector.Vector ClassRef) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'constraints (\ x__ y__ -> x__ {_Enum'constraints = y__}))
        Prelude.id
instance Data.ProtoLens.Message Enum where
  messageName _ = Data.Text.pack "tdl.ir.v1.Enum"
  packedMessageDescriptor _
    = "\n\
      \\EOTEnum\DC2(\n\
      \\ACKparams\CAN\SOH \ETX(\v2\DLE.tdl.ir.v1.ParamR\ACKparams\DC2.\n\
      \\bvariants\CAN\STX \ETX(\v2\DC2.tdl.ir.v1.VariantR\bvariants\DC2/\n\
      \\bconforms\CAN\ETX \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\bconforms\DC25\n\
      \\vconstraints\CAN\EOT \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\vconstraints"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        params__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "params"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Param)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"params")) ::
              Data.ProtoLens.FieldDescriptor Enum
        variants__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "variants"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Variant)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"variants")) ::
              Data.ProtoLens.FieldDescriptor Enum
        conforms__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "conforms"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ClassRef)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"conforms")) ::
              Data.ProtoLens.FieldDescriptor Enum
        constraints__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "constraints"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ClassRef)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"constraints")) ::
              Data.ProtoLens.FieldDescriptor Enum
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, params__field_descriptor),
           (Data.ProtoLens.Tag 2, variants__field_descriptor),
           (Data.ProtoLens.Tag 3, conforms__field_descriptor),
           (Data.ProtoLens.Tag 4, constraints__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Enum'_unknownFields
        (\ x__ y__ -> x__ {_Enum'_unknownFields = y__})
  defMessage
    = Enum'_constructor
        {_Enum'params = Data.Vector.Generic.empty,
         _Enum'variants = Data.Vector.Generic.empty,
         _Enum'conforms = Data.Vector.Generic.empty,
         _Enum'constraints = Data.Vector.Generic.empty,
         _Enum'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Enum
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld ClassRef
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld ClassRef
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Param
                   -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Variant
                      -> Data.ProtoLens.Encoding.Bytes.Parser Enum
        loop
          x
          mutable'conforms
          mutable'constraints
          mutable'params
          mutable'variants
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'conforms <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                              mutable'conforms)
                      frozen'constraints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'constraints)
                      frozen'params <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'params)
                      frozen'variants <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                              mutable'variants)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'conforms") frozen'conforms
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'constraints") frozen'constraints
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'params") frozen'params
                                    (Lens.Family2.set
                                       (Data.ProtoLens.Field.field @"vec'variants") frozen'variants
                                       x)))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "params"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'params y)
                                loop x mutable'conforms mutable'constraints v mutable'variants
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "variants"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'variants y)
                                loop x mutable'conforms mutable'constraints mutable'params v
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "conforms"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'conforms y)
                                loop x v mutable'constraints mutable'params mutable'variants
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "constraints"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'constraints y)
                                loop x mutable'conforms v mutable'params mutable'variants
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'conforms mutable'constraints mutable'params
                                  mutable'variants
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'conforms <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                    Data.ProtoLens.Encoding.Growing.new
              mutable'constraints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       Data.ProtoLens.Encoding.Growing.new
              mutable'params <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              mutable'variants <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                    Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'conforms mutable'constraints
                mutable'params mutable'variants)
          "Enum"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'params") _x))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view
                      (Data.ProtoLens.Field.field @"vec'variants") _x))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'conforms") _x))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                 ((Prelude..)
                                    (\ bs
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                                            (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    Data.ProtoLens.encodeMessage _v))
                         (Lens.Family2.view
                            (Data.ProtoLens.Field.field @"vec'constraints") _x))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData Enum where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Enum'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Enum'params x__)
                (Control.DeepSeq.deepseq
                   (_Enum'variants x__)
                   (Control.DeepSeq.deepseq
                      (_Enum'conforms x__)
                      (Control.DeepSeq.deepseq (_Enum'constraints x__) ()))))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.package' @:: Lens' Extern Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.name' @:: Lens' Extern Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.position' @:: Lens' Extern Position@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'position' @:: Lens' Extern (Prelude.Maybe Position)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.directives' @:: Lens' Extern [Directive]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'directives' @:: Lens' Extern (Data.Vector.Vector Directive)@ -}
data Extern
  = Extern'_constructor {_Extern'package :: !Data.Text.Text,
                         _Extern'name :: !Data.Text.Text,
                         _Extern'position :: !(Prelude.Maybe Position),
                         _Extern'directives :: !(Data.Vector.Vector Directive),
                         _Extern'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Extern where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Extern "package" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Extern'package (\ x__ y__ -> x__ {_Extern'package = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Extern "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Extern'name (\ x__ y__ -> x__ {_Extern'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Extern "position" Position where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Extern'position (\ x__ y__ -> x__ {_Extern'position = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Extern "maybe'position" (Prelude.Maybe Position) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Extern'position (\ x__ y__ -> x__ {_Extern'position = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Extern "directives" [Directive] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Extern'directives (\ x__ y__ -> x__ {_Extern'directives = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Extern "vec'directives" (Data.Vector.Vector Directive) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Extern'directives (\ x__ y__ -> x__ {_Extern'directives = y__}))
        Prelude.id
instance Data.ProtoLens.Message Extern where
  messageName _ = Data.Text.pack "tdl.ir.v1.Extern"
  packedMessageDescriptor _
    = "\n\
      \\ACKExtern\DC2\CAN\n\
      \\apackage\CAN\SOH \SOH(\tR\apackage\DC2\DC2\n\
      \\EOTname\CAN\STX \SOH(\tR\EOTname\DC2/\n\
      \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\DC24\n\
      \\n\
      \directives\CAN\EOT \ETX(\v2\DC4.tdl.ir.v1.DirectiveR\n\
      \directives"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        package__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "package"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"package")) ::
              Data.ProtoLens.FieldDescriptor Extern
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor Extern
        position__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "position"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Position)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'position")) ::
              Data.ProtoLens.FieldDescriptor Extern
        directives__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "directives"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Directive)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"directives")) ::
              Data.ProtoLens.FieldDescriptor Extern
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, package__field_descriptor),
           (Data.ProtoLens.Tag 2, name__field_descriptor),
           (Data.ProtoLens.Tag 3, position__field_descriptor),
           (Data.ProtoLens.Tag 4, directives__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Extern'_unknownFields
        (\ x__ y__ -> x__ {_Extern'_unknownFields = y__})
  defMessage
    = Extern'_constructor
        {_Extern'package = Data.ProtoLens.fieldDefault,
         _Extern'name = Data.ProtoLens.fieldDefault,
         _Extern'position = Prelude.Nothing,
         _Extern'directives = Data.Vector.Generic.empty,
         _Extern'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Extern
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Directive
             -> Data.ProtoLens.Encoding.Bytes.Parser Extern
        loop x mutable'directives
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'directives <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                             (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                mutable'directives)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'directives") frozen'directives
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "package"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"package") y x)
                                  mutable'directives
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                                  mutable'directives
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "position"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"position") y x)
                                  mutable'directives
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "directives"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'directives y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'directives
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'directives <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'directives)
          "Extern"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"package") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'position") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage _v))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                 ((Prelude..)
                                    (\ bs
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                                            (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    Data.ProtoLens.encodeMessage _v))
                         (Lens.Family2.view
                            (Data.ProtoLens.Field.field @"vec'directives") _x))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData Extern where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Extern'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Extern'package x__)
                (Control.DeepSeq.deepseq
                   (_Extern'name x__)
                   (Control.DeepSeq.deepseq
                      (_Extern'position x__)
                      (Control.DeepSeq.deepseq (_Extern'directives x__) ()))))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.meta' @:: Lens' Field Meta@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'meta' @:: Lens' Field (Prelude.Maybe Meta)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.type'' @:: Lens' Field ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'type'' @:: Lens' Field (Prelude.Maybe ID)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.owned' @:: Lens' Field Prelude.Bool@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.constraints' @:: Lens' Field [Constraint]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'constraints' @:: Lens' Field (Data.Vector.Vector Constraint)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.defaultValue' @:: Lens' Field Literal@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'defaultValue' @:: Lens' Field (Prelude.Maybe Literal)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.directives' @:: Lens' Field [Directive]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'directives' @:: Lens' Field (Data.Vector.Vector Directive)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.includedFrom' @:: Lens' Field ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'includedFrom' @:: Lens' Field (Prelude.Maybe ID)@ -}
data Field
  = Field'_constructor {_Field'meta :: !(Prelude.Maybe Meta),
                        _Field'type' :: !(Prelude.Maybe ID),
                        _Field'owned :: !Prelude.Bool,
                        _Field'constraints :: !(Data.Vector.Vector Constraint),
                        _Field'defaultValue :: !(Prelude.Maybe Literal),
                        _Field'directives :: !(Data.Vector.Vector Directive),
                        _Field'includedFrom :: !(Prelude.Maybe ID),
                        _Field'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Field where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Field "meta" Meta where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'meta (\ x__ y__ -> x__ {_Field'meta = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Field "maybe'meta" (Prelude.Maybe Meta) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'meta (\ x__ y__ -> x__ {_Field'meta = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Field "type'" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'type' (\ x__ y__ -> x__ {_Field'type' = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Field "maybe'type'" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'type' (\ x__ y__ -> x__ {_Field'type' = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Field "owned" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'owned (\ x__ y__ -> x__ {_Field'owned = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Field "constraints" [Constraint] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'constraints (\ x__ y__ -> x__ {_Field'constraints = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Field "vec'constraints" (Data.Vector.Vector Constraint) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'constraints (\ x__ y__ -> x__ {_Field'constraints = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Field "defaultValue" Literal where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'defaultValue (\ x__ y__ -> x__ {_Field'defaultValue = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Field "maybe'defaultValue" (Prelude.Maybe Literal) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'defaultValue (\ x__ y__ -> x__ {_Field'defaultValue = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Field "directives" [Directive] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'directives (\ x__ y__ -> x__ {_Field'directives = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Field "vec'directives" (Data.Vector.Vector Directive) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'directives (\ x__ y__ -> x__ {_Field'directives = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Field "includedFrom" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'includedFrom (\ x__ y__ -> x__ {_Field'includedFrom = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Field "maybe'includedFrom" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'includedFrom (\ x__ y__ -> x__ {_Field'includedFrom = y__}))
        Prelude.id
instance Data.ProtoLens.Message Field where
  messageName _ = Data.Text.pack "tdl.ir.v1.Field"
  packedMessageDescriptor _
    = "\n\
      \\ENQField\DC2#\n\
      \\EOTmeta\CAN\SOH \SOH(\v2\SI.tdl.ir.v1.MetaR\EOTmeta\DC2!\n\
      \\EOTtype\CAN\STX \SOH(\v2\r.tdl.ir.v1.IDR\EOTtype\DC2\DC4\n\
      \\ENQowned\CAN\EOT \SOH(\bR\ENQowned\DC27\n\
      \\vconstraints\CAN\ACK \ETX(\v2\NAK.tdl.ir.v1.ConstraintR\vconstraints\DC27\n\
      \\rdefault_value\CAN\a \SOH(\v2\DC2.tdl.ir.v1.LiteralR\fdefaultValue\DC24\n\
      \\n\
      \directives\CAN\b \ETX(\v2\DC4.tdl.ir.v1.DirectiveR\n\
      \directives\DC22\n\
      \\rincluded_from\CAN\ENQ \SOH(\v2\r.tdl.ir.v1.IDR\fincludedFromJ\EOT\b\ETX\DLE\EOTR\ETXkey"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        meta__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "meta"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Meta)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'meta")) ::
              Data.ProtoLens.FieldDescriptor Field
        type'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'type'")) ::
              Data.ProtoLens.FieldDescriptor Field
        owned__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "owned"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"owned")) ::
              Data.ProtoLens.FieldDescriptor Field
        constraints__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "constraints"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Constraint)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"constraints")) ::
              Data.ProtoLens.FieldDescriptor Field
        defaultValue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "default_value"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Literal)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'defaultValue")) ::
              Data.ProtoLens.FieldDescriptor Field
        directives__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "directives"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Directive)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"directives")) ::
              Data.ProtoLens.FieldDescriptor Field
        includedFrom__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "included_from"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'includedFrom")) ::
              Data.ProtoLens.FieldDescriptor Field
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, meta__field_descriptor),
           (Data.ProtoLens.Tag 2, type'__field_descriptor),
           (Data.ProtoLens.Tag 4, owned__field_descriptor),
           (Data.ProtoLens.Tag 6, constraints__field_descriptor),
           (Data.ProtoLens.Tag 7, defaultValue__field_descriptor),
           (Data.ProtoLens.Tag 8, directives__field_descriptor),
           (Data.ProtoLens.Tag 5, includedFrom__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Field'_unknownFields
        (\ x__ y__ -> x__ {_Field'_unknownFields = y__})
  defMessage
    = Field'_constructor
        {_Field'meta = Prelude.Nothing, _Field'type' = Prelude.Nothing,
         _Field'owned = Data.ProtoLens.fieldDefault,
         _Field'constraints = Data.Vector.Generic.empty,
         _Field'defaultValue = Prelude.Nothing,
         _Field'directives = Data.Vector.Generic.empty,
         _Field'includedFrom = Prelude.Nothing, _Field'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Field
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Constraint
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Directive
                -> Data.ProtoLens.Encoding.Bytes.Parser Field
        loop x mutable'constraints mutable'directives
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'constraints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'constraints)
                      frozen'directives <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                             (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                mutable'directives)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'constraints") frozen'constraints
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'directives") frozen'directives
                                 x)))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "meta"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"meta") y x)
                                  mutable'constraints mutable'directives
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"type'") y x)
                                  mutable'constraints mutable'directives
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "owned"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"owned") y x)
                                  mutable'constraints mutable'directives
                        50
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "constraints"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'constraints y)
                                loop x v mutable'directives
                        58
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "default_value"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"defaultValue") y x)
                                  mutable'constraints mutable'directives
                        66
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "directives"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'directives y)
                                loop x mutable'constraints v
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "included_from"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"includedFrom") y x)
                                  mutable'constraints mutable'directives
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'constraints mutable'directives
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'constraints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       Data.ProtoLens.Encoding.Growing.new
              mutable'directives <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'constraints mutable'directives)
          "Field"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'meta") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'type'") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"owned") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                               _v))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
                                 ((Prelude..)
                                    (\ bs
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                                            (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    Data.ProtoLens.encodeMessage _v))
                         (Lens.Family2.view
                            (Data.ProtoLens.Field.field @"vec'constraints") _x))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view
                                (Data.ProtoLens.Field.field @"maybe'defaultValue") _x
                          of
                            Prelude.Nothing -> Data.Monoid.mempty
                            (Prelude.Just _v)
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                   ((Prelude..)
                                      (\ bs
                                         -> (Data.Monoid.<>)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                 (Prelude.fromIntegral (Data.ByteString.length bs)))
                                              (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                      Data.ProtoLens.encodeMessage _v))
                         ((Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                               (\ _v
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                                       ((Prelude..)
                                          (\ bs
                                             -> (Data.Monoid.<>)
                                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                     (Prelude.fromIntegral
                                                        (Data.ByteString.length bs)))
                                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                          Data.ProtoLens.encodeMessage _v))
                               (Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"vec'directives") _x))
                            ((Data.Monoid.<>)
                               (case
                                    Lens.Family2.view
                                      (Data.ProtoLens.Field.field @"maybe'includedFrom") _x
                                of
                                  Prelude.Nothing -> Data.Monoid.mempty
                                  (Prelude.Just _v)
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                         ((Prelude..)
                                            (\ bs
                                               -> (Data.Monoid.<>)
                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                       (Prelude.fromIntegral
                                                          (Data.ByteString.length bs)))
                                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                            Data.ProtoLens.encodeMessage _v))
                               (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                  (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))))
instance Control.DeepSeq.NFData Field where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Field'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Field'meta x__)
                (Control.DeepSeq.deepseq
                   (_Field'type' x__)
                   (Control.DeepSeq.deepseq
                      (_Field'owned x__)
                      (Control.DeepSeq.deepseq
                         (_Field'constraints x__)
                         (Control.DeepSeq.deepseq
                            (_Field'defaultValue x__)
                            (Control.DeepSeq.deepseq
                               (_Field'directives x__)
                               (Control.DeepSeq.deepseq (_Field'includedFrom x__) ())))))))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.from' @:: Lens' FunDep [Data.Text.Text]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'from' @:: Lens' FunDep (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.to' @:: Lens' FunDep [Data.Text.Text]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'to' @:: Lens' FunDep (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.position' @:: Lens' FunDep Position@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'position' @:: Lens' FunDep (Prelude.Maybe Position)@ -}
data FunDep
  = FunDep'_constructor {_FunDep'from :: !(Data.Vector.Vector Data.Text.Text),
                         _FunDep'to :: !(Data.Vector.Vector Data.Text.Text),
                         _FunDep'position :: !(Prelude.Maybe Position),
                         _FunDep'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show FunDep where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField FunDep "from" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FunDep'from (\ x__ y__ -> x__ {_FunDep'from = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FunDep "vec'from" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FunDep'from (\ x__ y__ -> x__ {_FunDep'from = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FunDep "to" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FunDep'to (\ x__ y__ -> x__ {_FunDep'to = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FunDep "vec'to" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FunDep'to (\ x__ y__ -> x__ {_FunDep'to = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FunDep "position" Position where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FunDep'position (\ x__ y__ -> x__ {_FunDep'position = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField FunDep "maybe'position" (Prelude.Maybe Position) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FunDep'position (\ x__ y__ -> x__ {_FunDep'position = y__}))
        Prelude.id
instance Data.ProtoLens.Message FunDep where
  messageName _ = Data.Text.pack "tdl.ir.v1.FunDep"
  packedMessageDescriptor _
    = "\n\
      \\ACKFunDep\DC2\DC2\n\
      \\EOTfrom\CAN\SOH \ETX(\tR\EOTfrom\DC2\SO\n\
      \\STXto\CAN\STX \ETX(\tR\STXto\DC2/\n\
      \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        from__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "from"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"from")) ::
              Data.ProtoLens.FieldDescriptor FunDep
        to__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "to"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"to")) ::
              Data.ProtoLens.FieldDescriptor FunDep
        position__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "position"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Position)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'position")) ::
              Data.ProtoLens.FieldDescriptor FunDep
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, from__field_descriptor),
           (Data.ProtoLens.Tag 2, to__field_descriptor),
           (Data.ProtoLens.Tag 3, position__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FunDep'_unknownFields
        (\ x__ y__ -> x__ {_FunDep'_unknownFields = y__})
  defMessage
    = FunDep'_constructor
        {_FunDep'from = Data.Vector.Generic.empty,
         _FunDep'to = Data.Vector.Generic.empty,
         _FunDep'position = Prelude.Nothing, _FunDep'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FunDep
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
                -> Data.ProtoLens.Encoding.Bytes.Parser FunDep
        loop x mutable'from mutable'to
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'from <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'from)
                      frozen'to <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'to)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'from") frozen'from
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'to") frozen'to x)))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getText
                                              (Prelude.fromIntegral len))
                                        "from"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'from y)
                                loop x v mutable'to
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getText
                                              (Prelude.fromIntegral len))
                                        "to"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'to y)
                                loop x mutable'from v
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "position"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"position") y x)
                                  mutable'from mutable'to
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'from mutable'to
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'from <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              mutable'to <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                              Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'from mutable'to)
          "FunDep"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.Text.Encoding.encodeUtf8 _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'from") _x))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.Text.Encoding.encodeUtf8 _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'to") _x))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'position") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData FunDep where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FunDep'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_FunDep'from x__)
                (Control.DeepSeq.deepseq
                   (_FunDep'to x__)
                   (Control.DeepSeq.deepseq (_FunDep'position x__) ())))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.index' @:: Lens' ID Data.Int.Int32@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.name' @:: Lens' ID Data.Text.Text@ -}
data ID
  = ID'_constructor {_ID'index :: !Data.Int.Int32,
                     _ID'name :: !Data.Text.Text,
                     _ID'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ID where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ID "index" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ID'index (\ x__ y__ -> x__ {_ID'index = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ID "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ID'name (\ x__ y__ -> x__ {_ID'name = y__}))
        Prelude.id
instance Data.ProtoLens.Message ID where
  messageName _ = Data.Text.pack "tdl.ir.v1.ID"
  packedMessageDescriptor _
    = "\n\
      \\STXID\DC2\DC4\n\
      \\ENQindex\CAN\SOH \SOH(\ENQR\ENQindex\DC2\DC2\n\
      \\EOTname\CAN\STX \SOH(\tR\EOTname"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        index__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "index"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"index")) ::
              Data.ProtoLens.FieldDescriptor ID
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor ID
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, index__field_descriptor),
           (Data.ProtoLens.Tag 2, name__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ID'_unknownFields (\ x__ y__ -> x__ {_ID'_unknownFields = y__})
  defMessage
    = ID'_constructor
        {_ID'index = Data.ProtoLens.fieldDefault,
         _ID'name = Data.ProtoLens.fieldDefault, _ID'_unknownFields = []}
  parseMessage
    = let
        loop :: ID -> Data.ProtoLens.Encoding.Bytes.Parser ID
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
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "index"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"index") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ID"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"index") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData ID where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ID'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ID'index x__) (Control.DeepSeq.deepseq (_ID'name x__) ()))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.path' @:: Lens' Import Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.alias' @:: Lens' Import Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.package' @:: Lens' Import Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.position' @:: Lens' Import Position@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'position' @:: Lens' Import (Prelude.Maybe Position)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.directives' @:: Lens' Import [Directive]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'directives' @:: Lens' Import (Data.Vector.Vector Directive)@ -}
data Import
  = Import'_constructor {_Import'path :: !Data.Text.Text,
                         _Import'alias :: !Data.Text.Text,
                         _Import'package :: !Data.Text.Text,
                         _Import'position :: !(Prelude.Maybe Position),
                         _Import'directives :: !(Data.Vector.Vector Directive),
                         _Import'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Import where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Import "path" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Import'path (\ x__ y__ -> x__ {_Import'path = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Import "alias" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Import'alias (\ x__ y__ -> x__ {_Import'alias = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Import "package" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Import'package (\ x__ y__ -> x__ {_Import'package = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Import "position" Position where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Import'position (\ x__ y__ -> x__ {_Import'position = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Import "maybe'position" (Prelude.Maybe Position) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Import'position (\ x__ y__ -> x__ {_Import'position = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Import "directives" [Directive] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Import'directives (\ x__ y__ -> x__ {_Import'directives = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Import "vec'directives" (Data.Vector.Vector Directive) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Import'directives (\ x__ y__ -> x__ {_Import'directives = y__}))
        Prelude.id
instance Data.ProtoLens.Message Import where
  messageName _ = Data.Text.pack "tdl.ir.v1.Import"
  packedMessageDescriptor _
    = "\n\
      \\ACKImport\DC2\DC2\n\
      \\EOTpath\CAN\SOH \SOH(\tR\EOTpath\DC2\DC4\n\
      \\ENQalias\CAN\STX \SOH(\tR\ENQalias\DC2\CAN\n\
      \\apackage\CAN\ETX \SOH(\tR\apackage\DC2/\n\
      \\bposition\CAN\EOT \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\DC24\n\
      \\n\
      \directives\CAN\ENQ \ETX(\v2\DC4.tdl.ir.v1.DirectiveR\n\
      \directives"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        path__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "path"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"path")) ::
              Data.ProtoLens.FieldDescriptor Import
        alias__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "alias"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"alias")) ::
              Data.ProtoLens.FieldDescriptor Import
        package__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "package"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"package")) ::
              Data.ProtoLens.FieldDescriptor Import
        position__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "position"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Position)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'position")) ::
              Data.ProtoLens.FieldDescriptor Import
        directives__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "directives"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Directive)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"directives")) ::
              Data.ProtoLens.FieldDescriptor Import
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, path__field_descriptor),
           (Data.ProtoLens.Tag 2, alias__field_descriptor),
           (Data.ProtoLens.Tag 3, package__field_descriptor),
           (Data.ProtoLens.Tag 4, position__field_descriptor),
           (Data.ProtoLens.Tag 5, directives__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Import'_unknownFields
        (\ x__ y__ -> x__ {_Import'_unknownFields = y__})
  defMessage
    = Import'_constructor
        {_Import'path = Data.ProtoLens.fieldDefault,
         _Import'alias = Data.ProtoLens.fieldDefault,
         _Import'package = Data.ProtoLens.fieldDefault,
         _Import'position = Prelude.Nothing,
         _Import'directives = Data.Vector.Generic.empty,
         _Import'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Import
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Directive
             -> Data.ProtoLens.Encoding.Bytes.Parser Import
        loop x mutable'directives
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'directives <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                             (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                mutable'directives)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'directives") frozen'directives
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "path"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"path") y x)
                                  mutable'directives
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "alias"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"alias") y x)
                                  mutable'directives
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "package"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"package") y x)
                                  mutable'directives
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "position"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"position") y x)
                                  mutable'directives
                        42
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "directives"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'directives y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'directives
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'directives <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'directives)
          "Import"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"path") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"alias") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"package") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                            ((Prelude..)
                               (\ bs
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                          (Prelude.fromIntegral (Data.ByteString.length bs)))
                                       (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                               Data.Text.Encoding.encodeUtf8 _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'position") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                ((Prelude..)
                                   (\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                   Data.ProtoLens.encodeMessage _v))
                      ((Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                            (\ _v
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                    ((Prelude..)
                                       (\ bs
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                  (Prelude.fromIntegral
                                                     (Data.ByteString.length bs)))
                                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                       Data.ProtoLens.encodeMessage _v))
                            (Lens.Family2.view
                               (Data.ProtoLens.Field.field @"vec'directives") _x))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData Import where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Import'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Import'path x__)
                (Control.DeepSeq.deepseq
                   (_Import'alias x__)
                   (Control.DeepSeq.deepseq
                      (_Import'package x__)
                      (Control.DeepSeq.deepseq
                         (_Import'position x__)
                         (Control.DeepSeq.deepseq (_Import'directives x__) ())))))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.meta' @:: Lens' Instance Meta@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'meta' @:: Lens' Instance (Prelude.Maybe Meta)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.params' @:: Lens' Instance [Param]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'params' @:: Lens' Instance (Data.Vector.Vector Param)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.class'' @:: Lens' Instance ClassRef@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'class'' @:: Lens' Instance (Prelude.Maybe ClassRef)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.requires' @:: Lens' Instance [ClassRef]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'requires' @:: Lens' Instance (Data.Vector.Vector ClassRef)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.binds' @:: Lens' Instance [AssocBind]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'binds' @:: Lens' Instance (Data.Vector.Vector AssocBind)@ -}
data Instance
  = Instance'_constructor {_Instance'meta :: !(Prelude.Maybe Meta),
                           _Instance'params :: !(Data.Vector.Vector Param),
                           _Instance'class' :: !(Prelude.Maybe ClassRef),
                           _Instance'requires :: !(Data.Vector.Vector ClassRef),
                           _Instance'binds :: !(Data.Vector.Vector AssocBind),
                           _Instance'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Instance where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Instance "meta" Meta where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Instance'meta (\ x__ y__ -> x__ {_Instance'meta = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Instance "maybe'meta" (Prelude.Maybe Meta) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Instance'meta (\ x__ y__ -> x__ {_Instance'meta = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Instance "params" [Param] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Instance'params (\ x__ y__ -> x__ {_Instance'params = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Instance "vec'params" (Data.Vector.Vector Param) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Instance'params (\ x__ y__ -> x__ {_Instance'params = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Instance "class'" ClassRef where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Instance'class' (\ x__ y__ -> x__ {_Instance'class' = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Instance "maybe'class'" (Prelude.Maybe ClassRef) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Instance'class' (\ x__ y__ -> x__ {_Instance'class' = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Instance "requires" [ClassRef] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Instance'requires (\ x__ y__ -> x__ {_Instance'requires = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Instance "vec'requires" (Data.Vector.Vector ClassRef) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Instance'requires (\ x__ y__ -> x__ {_Instance'requires = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Instance "binds" [AssocBind] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Instance'binds (\ x__ y__ -> x__ {_Instance'binds = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Instance "vec'binds" (Data.Vector.Vector AssocBind) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Instance'binds (\ x__ y__ -> x__ {_Instance'binds = y__}))
        Prelude.id
instance Data.ProtoLens.Message Instance where
  messageName _ = Data.Text.pack "tdl.ir.v1.Instance"
  packedMessageDescriptor _
    = "\n\
      \\bInstance\DC2#\n\
      \\EOTmeta\CAN\SOH \SOH(\v2\SI.tdl.ir.v1.MetaR\EOTmeta\DC2(\n\
      \\ACKparams\CAN\STX \ETX(\v2\DLE.tdl.ir.v1.ParamR\ACKparams\DC2)\n\
      \\ENQclass\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.ClassRefR\ENQclass\DC2/\n\
      \\brequires\CAN\EOT \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\brequires\DC2*\n\
      \\ENQbinds\CAN\ENQ \ETX(\v2\DC4.tdl.ir.v1.AssocBindR\ENQbinds"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        meta__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "meta"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Meta)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'meta")) ::
              Data.ProtoLens.FieldDescriptor Instance
        params__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "params"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Param)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"params")) ::
              Data.ProtoLens.FieldDescriptor Instance
        class'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "class"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ClassRef)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'class'")) ::
              Data.ProtoLens.FieldDescriptor Instance
        requires__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "requires"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ClassRef)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"requires")) ::
              Data.ProtoLens.FieldDescriptor Instance
        binds__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "binds"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor AssocBind)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"binds")) ::
              Data.ProtoLens.FieldDescriptor Instance
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, meta__field_descriptor),
           (Data.ProtoLens.Tag 2, params__field_descriptor),
           (Data.ProtoLens.Tag 3, class'__field_descriptor),
           (Data.ProtoLens.Tag 4, requires__field_descriptor),
           (Data.ProtoLens.Tag 5, binds__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Instance'_unknownFields
        (\ x__ y__ -> x__ {_Instance'_unknownFields = y__})
  defMessage
    = Instance'_constructor
        {_Instance'meta = Prelude.Nothing,
         _Instance'params = Data.Vector.Generic.empty,
         _Instance'class' = Prelude.Nothing,
         _Instance'requires = Data.Vector.Generic.empty,
         _Instance'binds = Data.Vector.Generic.empty,
         _Instance'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Instance
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld AssocBind
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Param
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld ClassRef
                   -> Data.ProtoLens.Encoding.Bytes.Parser Instance
        loop x mutable'binds mutable'params mutable'requires
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'binds <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'binds)
                      frozen'params <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'params)
                      frozen'requires <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                              mutable'requires)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'binds") frozen'binds
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'params") frozen'params
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'requires") frozen'requires
                                    x))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "meta"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"meta") y x)
                                  mutable'binds mutable'params mutable'requires
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "params"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'params y)
                                loop x mutable'binds v mutable'requires
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "class"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"class'") y x)
                                  mutable'binds mutable'params mutable'requires
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "requires"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'requires y)
                                loop x mutable'binds mutable'params v
                        42
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "binds"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'binds y)
                                loop x v mutable'params mutable'requires
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'binds mutable'params mutable'requires
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'binds <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              mutable'params <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              mutable'requires <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                    Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'binds mutable'params
                mutable'requires)
          "Instance"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'meta") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'params") _x))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'class'") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage _v))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                 ((Prelude..)
                                    (\ bs
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                                            (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    Data.ProtoLens.encodeMessage _v))
                         (Lens.Family2.view
                            (Data.ProtoLens.Field.field @"vec'requires") _x))
                      ((Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                            (\ _v
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                    ((Prelude..)
                                       (\ bs
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                  (Prelude.fromIntegral
                                                     (Data.ByteString.length bs)))
                                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                       Data.ProtoLens.encodeMessage _v))
                            (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'binds") _x))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData Instance where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Instance'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Instance'meta x__)
                (Control.DeepSeq.deepseq
                   (_Instance'params x__)
                   (Control.DeepSeq.deepseq
                      (_Instance'class' x__)
                      (Control.DeepSeq.deepseq
                         (_Instance'requires x__)
                         (Control.DeepSeq.deepseq (_Instance'binds x__) ())))))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.atom' @:: Lens' Kind KindAtom@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.paren' @:: Lens' Kind Kind@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'paren' @:: Lens' Kind (Prelude.Maybe Kind)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.arrow' @:: Lens' Kind Kind@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'arrow' @:: Lens' Kind (Prelude.Maybe Kind)@ -}
data Kind
  = Kind'_constructor {_Kind'atom :: !KindAtom,
                       _Kind'paren :: !(Prelude.Maybe Kind),
                       _Kind'arrow :: !(Prelude.Maybe Kind),
                       _Kind'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Kind where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Kind "atom" KindAtom where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Kind'atom (\ x__ y__ -> x__ {_Kind'atom = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Kind "paren" Kind where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Kind'paren (\ x__ y__ -> x__ {_Kind'paren = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Kind "maybe'paren" (Prelude.Maybe Kind) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Kind'paren (\ x__ y__ -> x__ {_Kind'paren = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Kind "arrow" Kind where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Kind'arrow (\ x__ y__ -> x__ {_Kind'arrow = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Kind "maybe'arrow" (Prelude.Maybe Kind) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Kind'arrow (\ x__ y__ -> x__ {_Kind'arrow = y__}))
        Prelude.id
instance Data.ProtoLens.Message Kind where
  messageName _ = Data.Text.pack "tdl.ir.v1.Kind"
  packedMessageDescriptor _
    = "\n\
      \\EOTKind\DC2'\n\
      \\EOTatom\CAN\SOH \SOH(\SO2\DC3.tdl.ir.v1.KindAtomR\EOTatom\DC2%\n\
      \\ENQparen\CAN\STX \SOH(\v2\SI.tdl.ir.v1.KindR\ENQparen\DC2%\n\
      \\ENQarrow\CAN\ETX \SOH(\v2\SI.tdl.ir.v1.KindR\ENQarrow"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        atom__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "atom"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor KindAtom)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"atom")) ::
              Data.ProtoLens.FieldDescriptor Kind
        paren__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "paren"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Kind)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'paren")) ::
              Data.ProtoLens.FieldDescriptor Kind
        arrow__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "arrow"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Kind)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'arrow")) ::
              Data.ProtoLens.FieldDescriptor Kind
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, atom__field_descriptor),
           (Data.ProtoLens.Tag 2, paren__field_descriptor),
           (Data.ProtoLens.Tag 3, arrow__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Kind'_unknownFields
        (\ x__ y__ -> x__ {_Kind'_unknownFields = y__})
  defMessage
    = Kind'_constructor
        {_Kind'atom = Data.ProtoLens.fieldDefault,
         _Kind'paren = Prelude.Nothing, _Kind'arrow = Prelude.Nothing,
         _Kind'_unknownFields = []}
  parseMessage
    = let
        loop :: Kind -> Data.ProtoLens.Encoding.Bytes.Parser Kind
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
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "atom"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"atom") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "paren"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"paren") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "arrow"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"arrow") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Kind"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"atom") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                         Prelude.fromEnum _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'paren") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'arrow") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Kind where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Kind'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Kind'atom x__)
                (Control.DeepSeq.deepseq
                   (_Kind'paren x__) (Control.DeepSeq.deepseq (_Kind'arrow x__) ())))
newtype KindAtom'UnrecognizedValue
  = KindAtom'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data KindAtom
  = KIND_ATOM_UNSPECIFIED |
    KIND_ATOM_TYPE |
    KIND_ATOM_UNIT |
    KindAtom'Unrecognized !KindAtom'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum KindAtom where
  maybeToEnum 0 = Prelude.Just KIND_ATOM_UNSPECIFIED
  maybeToEnum 1 = Prelude.Just KIND_ATOM_TYPE
  maybeToEnum 2 = Prelude.Just KIND_ATOM_UNIT
  maybeToEnum k
    = Prelude.Just
        (KindAtom'Unrecognized
           (KindAtom'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum KIND_ATOM_UNSPECIFIED = "KIND_ATOM_UNSPECIFIED"
  showEnum KIND_ATOM_TYPE = "KIND_ATOM_TYPE"
  showEnum KIND_ATOM_UNIT = "KIND_ATOM_UNIT"
  showEnum (KindAtom'Unrecognized (KindAtom'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "KIND_ATOM_UNSPECIFIED"
    = Prelude.Just KIND_ATOM_UNSPECIFIED
    | (Prelude.==) k "KIND_ATOM_TYPE" = Prelude.Just KIND_ATOM_TYPE
    | (Prelude.==) k "KIND_ATOM_UNIT" = Prelude.Just KIND_ATOM_UNIT
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded KindAtom where
  minBound = KIND_ATOM_UNSPECIFIED
  maxBound = KIND_ATOM_UNIT
instance Prelude.Enum KindAtom where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum KindAtom: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum KIND_ATOM_UNSPECIFIED = 0
  fromEnum KIND_ATOM_TYPE = 1
  fromEnum KIND_ATOM_UNIT = 2
  fromEnum (KindAtom'Unrecognized (KindAtom'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ KIND_ATOM_UNIT
    = Prelude.error
        "KindAtom.succ: bad argument KIND_ATOM_UNIT. This value would be out of bounds."
  succ KIND_ATOM_UNSPECIFIED = KIND_ATOM_TYPE
  succ KIND_ATOM_TYPE = KIND_ATOM_UNIT
  succ (KindAtom'Unrecognized _)
    = Prelude.error "KindAtom.succ: bad argument: unrecognized value"
  pred KIND_ATOM_UNSPECIFIED
    = Prelude.error
        "KindAtom.pred: bad argument KIND_ATOM_UNSPECIFIED. This value would be out of bounds."
  pred KIND_ATOM_TYPE = KIND_ATOM_UNSPECIFIED
  pred KIND_ATOM_UNIT = KIND_ATOM_TYPE
  pred (KindAtom'Unrecognized _)
    = Prelude.error "KindAtom.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault KindAtom where
  fieldDefault = KIND_ATOM_UNSPECIFIED
instance Control.DeepSeq.NFData KindAtom where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.kind' @:: Lens' Literal LiteralKind@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.text' @:: Lens' Literal Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.items' @:: Lens' Literal [Literal]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'items' @:: Lens' Literal (Data.Vector.Vector Literal)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.range' @:: Lens' Literal Range@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'range' @:: Lens' Literal (Prelude.Maybe Range)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.position' @:: Lens' Literal Position@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'position' @:: Lens' Literal (Prelude.Maybe Position)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.variant' @:: Lens' Literal ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'variant' @:: Lens' Literal (Prelude.Maybe ID)@ -}
data Literal
  = Literal'_constructor {_Literal'kind :: !LiteralKind,
                          _Literal'text :: !Data.Text.Text,
                          _Literal'items :: !(Data.Vector.Vector Literal),
                          _Literal'range :: !(Prelude.Maybe Range),
                          _Literal'position :: !(Prelude.Maybe Position),
                          _Literal'variant :: !(Prelude.Maybe ID),
                          _Literal'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Literal where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Literal "kind" LiteralKind where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Literal'kind (\ x__ y__ -> x__ {_Literal'kind = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Literal "text" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Literal'text (\ x__ y__ -> x__ {_Literal'text = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Literal "items" [Literal] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Literal'items (\ x__ y__ -> x__ {_Literal'items = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Literal "vec'items" (Data.Vector.Vector Literal) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Literal'items (\ x__ y__ -> x__ {_Literal'items = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Literal "range" Range where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Literal'range (\ x__ y__ -> x__ {_Literal'range = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Literal "maybe'range" (Prelude.Maybe Range) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Literal'range (\ x__ y__ -> x__ {_Literal'range = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Literal "position" Position where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Literal'position (\ x__ y__ -> x__ {_Literal'position = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Literal "maybe'position" (Prelude.Maybe Position) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Literal'position (\ x__ y__ -> x__ {_Literal'position = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Literal "variant" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Literal'variant (\ x__ y__ -> x__ {_Literal'variant = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Literal "maybe'variant" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Literal'variant (\ x__ y__ -> x__ {_Literal'variant = y__}))
        Prelude.id
instance Data.ProtoLens.Message Literal where
  messageName _ = Data.Text.pack "tdl.ir.v1.Literal"
  packedMessageDescriptor _
    = "\n\
      \\aLiteral\DC2*\n\
      \\EOTkind\CAN\SOH \SOH(\SO2\SYN.tdl.ir.v1.LiteralKindR\EOTkind\DC2\DC2\n\
      \\EOTtext\CAN\STX \SOH(\tR\EOTtext\DC2(\n\
      \\ENQitems\CAN\ETX \ETX(\v2\DC2.tdl.ir.v1.LiteralR\ENQitems\DC2&\n\
      \\ENQrange\CAN\EOT \SOH(\v2\DLE.tdl.ir.v1.RangeR\ENQrange\DC2/\n\
      \\bposition\CAN\ENQ \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\DC2'\n\
      \\avariant\CAN\ACK \SOH(\v2\r.tdl.ir.v1.IDR\avariant"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        kind__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "kind"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor LiteralKind)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"kind")) ::
              Data.ProtoLens.FieldDescriptor Literal
        text__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "text"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"text")) ::
              Data.ProtoLens.FieldDescriptor Literal
        items__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "items"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Literal)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"items")) ::
              Data.ProtoLens.FieldDescriptor Literal
        range__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "range"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Range)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'range")) ::
              Data.ProtoLens.FieldDescriptor Literal
        position__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "position"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Position)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'position")) ::
              Data.ProtoLens.FieldDescriptor Literal
        variant__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "variant"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'variant")) ::
              Data.ProtoLens.FieldDescriptor Literal
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, kind__field_descriptor),
           (Data.ProtoLens.Tag 2, text__field_descriptor),
           (Data.ProtoLens.Tag 3, items__field_descriptor),
           (Data.ProtoLens.Tag 4, range__field_descriptor),
           (Data.ProtoLens.Tag 5, position__field_descriptor),
           (Data.ProtoLens.Tag 6, variant__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Literal'_unknownFields
        (\ x__ y__ -> x__ {_Literal'_unknownFields = y__})
  defMessage
    = Literal'_constructor
        {_Literal'kind = Data.ProtoLens.fieldDefault,
         _Literal'text = Data.ProtoLens.fieldDefault,
         _Literal'items = Data.Vector.Generic.empty,
         _Literal'range = Prelude.Nothing,
         _Literal'position = Prelude.Nothing,
         _Literal'variant = Prelude.Nothing, _Literal'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Literal
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Literal
             -> Data.ProtoLens.Encoding.Bytes.Parser Literal
        loop x mutable'items
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'items <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'items)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'items") frozen'items x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "kind"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"kind") y x)
                                  mutable'items
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "text"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"text") y x)
                                  mutable'items
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "items"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'items y)
                                loop x v
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "range"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"range") y x)
                                  mutable'items
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "position"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"position") y x)
                                  mutable'items
                        50
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "variant"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"variant") y x)
                                  mutable'items
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'items
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'items <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'items)
          "Literal"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"kind") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                         Prelude.fromEnum _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"text") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'items") _x))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'range") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                ((Prelude..)
                                   (\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                   Data.ProtoLens.encodeMessage _v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'position") _x
                          of
                            Prelude.Nothing -> Data.Monoid.mempty
                            (Prelude.Just _v)
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                   ((Prelude..)
                                      (\ bs
                                         -> (Data.Monoid.<>)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                 (Prelude.fromIntegral (Data.ByteString.length bs)))
                                              (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                      Data.ProtoLens.encodeMessage _v))
                         ((Data.Monoid.<>)
                            (case
                                 Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'variant") _x
                             of
                               Prelude.Nothing -> Data.Monoid.mempty
                               (Prelude.Just _v)
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
                                      ((Prelude..)
                                         (\ bs
                                            -> (Data.Monoid.<>)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                    (Prelude.fromIntegral
                                                       (Data.ByteString.length bs)))
                                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                         Data.ProtoLens.encodeMessage _v))
                            (Data.ProtoLens.Encoding.Wire.buildFieldSet
                               (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))))
instance Control.DeepSeq.NFData Literal where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Literal'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Literal'kind x__)
                (Control.DeepSeq.deepseq
                   (_Literal'text x__)
                   (Control.DeepSeq.deepseq
                      (_Literal'items x__)
                      (Control.DeepSeq.deepseq
                         (_Literal'range x__)
                         (Control.DeepSeq.deepseq
                            (_Literal'position x__)
                            (Control.DeepSeq.deepseq (_Literal'variant x__) ()))))))
newtype LiteralKind'UnrecognizedValue
  = LiteralKind'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data LiteralKind
  = LITERAL_KIND_UNSPECIFIED |
    LITERAL_KIND_STRING |
    LITERAL_KIND_INT |
    LITERAL_KIND_FLOAT |
    LITERAL_KIND_BOOL |
    LITERAL_KIND_NAME |
    LITERAL_KIND_REGEX |
    LITERAL_KIND_LIST |
    LITERAL_KIND_RANGE |
    LiteralKind'Unrecognized !LiteralKind'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum LiteralKind where
  maybeToEnum 0 = Prelude.Just LITERAL_KIND_UNSPECIFIED
  maybeToEnum 1 = Prelude.Just LITERAL_KIND_STRING
  maybeToEnum 2 = Prelude.Just LITERAL_KIND_INT
  maybeToEnum 3 = Prelude.Just LITERAL_KIND_FLOAT
  maybeToEnum 4 = Prelude.Just LITERAL_KIND_BOOL
  maybeToEnum 5 = Prelude.Just LITERAL_KIND_NAME
  maybeToEnum 6 = Prelude.Just LITERAL_KIND_REGEX
  maybeToEnum 7 = Prelude.Just LITERAL_KIND_LIST
  maybeToEnum 8 = Prelude.Just LITERAL_KIND_RANGE
  maybeToEnum k
    = Prelude.Just
        (LiteralKind'Unrecognized
           (LiteralKind'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum LITERAL_KIND_UNSPECIFIED = "LITERAL_KIND_UNSPECIFIED"
  showEnum LITERAL_KIND_STRING = "LITERAL_KIND_STRING"
  showEnum LITERAL_KIND_INT = "LITERAL_KIND_INT"
  showEnum LITERAL_KIND_FLOAT = "LITERAL_KIND_FLOAT"
  showEnum LITERAL_KIND_BOOL = "LITERAL_KIND_BOOL"
  showEnum LITERAL_KIND_NAME = "LITERAL_KIND_NAME"
  showEnum LITERAL_KIND_REGEX = "LITERAL_KIND_REGEX"
  showEnum LITERAL_KIND_LIST = "LITERAL_KIND_LIST"
  showEnum LITERAL_KIND_RANGE = "LITERAL_KIND_RANGE"
  showEnum
    (LiteralKind'Unrecognized (LiteralKind'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "LITERAL_KIND_UNSPECIFIED"
    = Prelude.Just LITERAL_KIND_UNSPECIFIED
    | (Prelude.==) k "LITERAL_KIND_STRING"
    = Prelude.Just LITERAL_KIND_STRING
    | (Prelude.==) k "LITERAL_KIND_INT" = Prelude.Just LITERAL_KIND_INT
    | (Prelude.==) k "LITERAL_KIND_FLOAT"
    = Prelude.Just LITERAL_KIND_FLOAT
    | (Prelude.==) k "LITERAL_KIND_BOOL"
    = Prelude.Just LITERAL_KIND_BOOL
    | (Prelude.==) k "LITERAL_KIND_NAME"
    = Prelude.Just LITERAL_KIND_NAME
    | (Prelude.==) k "LITERAL_KIND_REGEX"
    = Prelude.Just LITERAL_KIND_REGEX
    | (Prelude.==) k "LITERAL_KIND_LIST"
    = Prelude.Just LITERAL_KIND_LIST
    | (Prelude.==) k "LITERAL_KIND_RANGE"
    = Prelude.Just LITERAL_KIND_RANGE
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded LiteralKind where
  minBound = LITERAL_KIND_UNSPECIFIED
  maxBound = LITERAL_KIND_RANGE
instance Prelude.Enum LiteralKind where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum LiteralKind: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum LITERAL_KIND_UNSPECIFIED = 0
  fromEnum LITERAL_KIND_STRING = 1
  fromEnum LITERAL_KIND_INT = 2
  fromEnum LITERAL_KIND_FLOAT = 3
  fromEnum LITERAL_KIND_BOOL = 4
  fromEnum LITERAL_KIND_NAME = 5
  fromEnum LITERAL_KIND_REGEX = 6
  fromEnum LITERAL_KIND_LIST = 7
  fromEnum LITERAL_KIND_RANGE = 8
  fromEnum
    (LiteralKind'Unrecognized (LiteralKind'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ LITERAL_KIND_RANGE
    = Prelude.error
        "LiteralKind.succ: bad argument LITERAL_KIND_RANGE. This value would be out of bounds."
  succ LITERAL_KIND_UNSPECIFIED = LITERAL_KIND_STRING
  succ LITERAL_KIND_STRING = LITERAL_KIND_INT
  succ LITERAL_KIND_INT = LITERAL_KIND_FLOAT
  succ LITERAL_KIND_FLOAT = LITERAL_KIND_BOOL
  succ LITERAL_KIND_BOOL = LITERAL_KIND_NAME
  succ LITERAL_KIND_NAME = LITERAL_KIND_REGEX
  succ LITERAL_KIND_REGEX = LITERAL_KIND_LIST
  succ LITERAL_KIND_LIST = LITERAL_KIND_RANGE
  succ (LiteralKind'Unrecognized _)
    = Prelude.error
        "LiteralKind.succ: bad argument: unrecognized value"
  pred LITERAL_KIND_UNSPECIFIED
    = Prelude.error
        "LiteralKind.pred: bad argument LITERAL_KIND_UNSPECIFIED. This value would be out of bounds."
  pred LITERAL_KIND_STRING = LITERAL_KIND_UNSPECIFIED
  pred LITERAL_KIND_INT = LITERAL_KIND_STRING
  pred LITERAL_KIND_FLOAT = LITERAL_KIND_INT
  pred LITERAL_KIND_BOOL = LITERAL_KIND_FLOAT
  pred LITERAL_KIND_NAME = LITERAL_KIND_BOOL
  pred LITERAL_KIND_REGEX = LITERAL_KIND_NAME
  pred LITERAL_KIND_LIST = LITERAL_KIND_REGEX
  pred LITERAL_KIND_RANGE = LITERAL_KIND_LIST
  pred (LiteralKind'Unrecognized _)
    = Prelude.error
        "LiteralKind.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault LiteralKind where
  fieldDefault = LITERAL_KIND_UNSPECIFIED
instance Control.DeepSeq.NFData LiteralKind where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.name' @:: Lens' Meta Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.doc' @:: Lens' Meta [Data.Text.Text]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'doc' @:: Lens' Meta (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.position' @:: Lens' Meta Position@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'position' @:: Lens' Meta (Prelude.Maybe Position)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.deprecated' @:: Lens' Meta Deprecation@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'deprecated' @:: Lens' Meta (Prelude.Maybe Deprecation)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.order' @:: Lens' Meta Data.Int.Int32@ -}
data Meta
  = Meta'_constructor {_Meta'name :: !Data.Text.Text,
                       _Meta'doc :: !(Data.Vector.Vector Data.Text.Text),
                       _Meta'position :: !(Prelude.Maybe Position),
                       _Meta'deprecated :: !(Prelude.Maybe Deprecation),
                       _Meta'order :: !Data.Int.Int32,
                       _Meta'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Meta where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Meta "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Meta'name (\ x__ y__ -> x__ {_Meta'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Meta "doc" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Meta'doc (\ x__ y__ -> x__ {_Meta'doc = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Meta "vec'doc" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Meta'doc (\ x__ y__ -> x__ {_Meta'doc = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Meta "position" Position where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Meta'position (\ x__ y__ -> x__ {_Meta'position = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Meta "maybe'position" (Prelude.Maybe Position) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Meta'position (\ x__ y__ -> x__ {_Meta'position = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Meta "deprecated" Deprecation where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Meta'deprecated (\ x__ y__ -> x__ {_Meta'deprecated = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Meta "maybe'deprecated" (Prelude.Maybe Deprecation) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Meta'deprecated (\ x__ y__ -> x__ {_Meta'deprecated = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Meta "order" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Meta'order (\ x__ y__ -> x__ {_Meta'order = y__}))
        Prelude.id
instance Data.ProtoLens.Message Meta where
  messageName _ = Data.Text.pack "tdl.ir.v1.Meta"
  packedMessageDescriptor _
    = "\n\
      \\EOTMeta\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\DLE\n\
      \\ETXdoc\CAN\STX \ETX(\tR\ETXdoc\DC2/\n\
      \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\DC26\n\
      \\n\
      \deprecated\CAN\EOT \SOH(\v2\SYN.tdl.ir.v1.DeprecationR\n\
      \deprecated\DC2\DC4\n\
      \\ENQorder\CAN\ENQ \SOH(\ENQR\ENQorder"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor Meta
        doc__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "doc"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"doc")) ::
              Data.ProtoLens.FieldDescriptor Meta
        position__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "position"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Position)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'position")) ::
              Data.ProtoLens.FieldDescriptor Meta
        deprecated__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "deprecated"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Deprecation)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'deprecated")) ::
              Data.ProtoLens.FieldDescriptor Meta
        order__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "order"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"order")) ::
              Data.ProtoLens.FieldDescriptor Meta
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, doc__field_descriptor),
           (Data.ProtoLens.Tag 3, position__field_descriptor),
           (Data.ProtoLens.Tag 4, deprecated__field_descriptor),
           (Data.ProtoLens.Tag 5, order__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Meta'_unknownFields
        (\ x__ y__ -> x__ {_Meta'_unknownFields = y__})
  defMessage
    = Meta'_constructor
        {_Meta'name = Data.ProtoLens.fieldDefault,
         _Meta'doc = Data.Vector.Generic.empty,
         _Meta'position = Prelude.Nothing,
         _Meta'deprecated = Prelude.Nothing,
         _Meta'order = Data.ProtoLens.fieldDefault,
         _Meta'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Meta
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Bytes.Parser Meta
        loop x mutable'doc
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'doc <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'doc)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'doc") frozen'doc x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                                  mutable'doc
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getText
                                              (Prelude.fromIntegral len))
                                        "doc"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'doc y)
                                loop x v
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "position"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"position") y x)
                                  mutable'doc
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "deprecated"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"deprecated") y x)
                                  mutable'doc
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "order"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"order") y x)
                                  mutable'doc
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'doc
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'doc <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                               Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'doc)
          "Meta"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.Text.Encoding.encodeUtf8 _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'doc") _x))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'position") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view
                             (Data.ProtoLens.Field.field @"maybe'deprecated") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                ((Prelude..)
                                   (\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                   Data.ProtoLens.encodeMessage _v))
                      ((Data.Monoid.<>)
                         (let
                            _v = Lens.Family2.view (Data.ProtoLens.Field.field @"order") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                     _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData Meta where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Meta'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Meta'name x__)
                (Control.DeepSeq.deepseq
                   (_Meta'doc x__)
                   (Control.DeepSeq.deepseq
                      (_Meta'position x__)
                      (Control.DeepSeq.deepseq
                         (_Meta'deprecated x__)
                         (Control.DeepSeq.deepseq (_Meta'order x__) ())))))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.package' @:: Lens' Model Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.decls' @:: Lens' Model [Decl]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'decls' @:: Lens' Model (Data.Vector.Vector Decl)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.types' @:: Lens' Model [Type]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'types' @:: Lens' Model (Data.Vector.Vector Type)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.imports' @:: Lens' Model [Import]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'imports' @:: Lens' Model (Data.Vector.Vector Import)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.externs' @:: Lens' Model [Extern]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'externs' @:: Lens' Model (Data.Vector.Vector Extern)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.instances' @:: Lens' Model [Instance]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'instances' @:: Lens' Model (Data.Vector.Vector Instance)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.satisfies' @:: Lens' Model [Satisfaction]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'satisfies' @:: Lens' Model (Data.Vector.Vector Satisfaction)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.targets' @:: Lens' Model [TargetBlock]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'targets' @:: Lens' Model (Data.Vector.Vector TargetBlock)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.units' @:: Lens' Model [Unit]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'units' @:: Lens' Model (Data.Vector.Vector Unit)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.doc' @:: Lens' Model [Data.Text.Text]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'doc' @:: Lens' Model (Data.Vector.Vector Data.Text.Text)@ -}
data Model
  = Model'_constructor {_Model'package :: !Data.Text.Text,
                        _Model'decls :: !(Data.Vector.Vector Decl),
                        _Model'types :: !(Data.Vector.Vector Type),
                        _Model'imports :: !(Data.Vector.Vector Import),
                        _Model'externs :: !(Data.Vector.Vector Extern),
                        _Model'instances :: !(Data.Vector.Vector Instance),
                        _Model'satisfies :: !(Data.Vector.Vector Satisfaction),
                        _Model'targets :: !(Data.Vector.Vector TargetBlock),
                        _Model'units :: !(Data.Vector.Vector Unit),
                        _Model'doc :: !(Data.Vector.Vector Data.Text.Text),
                        _Model'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Model where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Model "package" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'package (\ x__ y__ -> x__ {_Model'package = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Model "decls" [Decl] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'decls (\ x__ y__ -> x__ {_Model'decls = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Model "vec'decls" (Data.Vector.Vector Decl) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'decls (\ x__ y__ -> x__ {_Model'decls = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Model "types" [Type] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'types (\ x__ y__ -> x__ {_Model'types = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Model "vec'types" (Data.Vector.Vector Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'types (\ x__ y__ -> x__ {_Model'types = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Model "imports" [Import] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'imports (\ x__ y__ -> x__ {_Model'imports = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Model "vec'imports" (Data.Vector.Vector Import) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'imports (\ x__ y__ -> x__ {_Model'imports = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Model "externs" [Extern] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'externs (\ x__ y__ -> x__ {_Model'externs = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Model "vec'externs" (Data.Vector.Vector Extern) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'externs (\ x__ y__ -> x__ {_Model'externs = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Model "instances" [Instance] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'instances (\ x__ y__ -> x__ {_Model'instances = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Model "vec'instances" (Data.Vector.Vector Instance) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'instances (\ x__ y__ -> x__ {_Model'instances = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Model "satisfies" [Satisfaction] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'satisfies (\ x__ y__ -> x__ {_Model'satisfies = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Model "vec'satisfies" (Data.Vector.Vector Satisfaction) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'satisfies (\ x__ y__ -> x__ {_Model'satisfies = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Model "targets" [TargetBlock] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'targets (\ x__ y__ -> x__ {_Model'targets = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Model "vec'targets" (Data.Vector.Vector TargetBlock) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'targets (\ x__ y__ -> x__ {_Model'targets = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Model "units" [Unit] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'units (\ x__ y__ -> x__ {_Model'units = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Model "vec'units" (Data.Vector.Vector Unit) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'units (\ x__ y__ -> x__ {_Model'units = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Model "doc" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'doc (\ x__ y__ -> x__ {_Model'doc = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Model "vec'doc" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Model'doc (\ x__ y__ -> x__ {_Model'doc = y__}))
        Prelude.id
instance Data.ProtoLens.Message Model where
  messageName _ = Data.Text.pack "tdl.ir.v1.Model"
  packedMessageDescriptor _
    = "\n\
      \\ENQModel\DC2\CAN\n\
      \\apackage\CAN\SOH \SOH(\tR\apackage\DC2%\n\
      \\ENQdecls\CAN\STX \ETX(\v2\SI.tdl.ir.v1.DeclR\ENQdecls\DC2%\n\
      \\ENQtypes\CAN\ETX \ETX(\v2\SI.tdl.ir.v1.TypeR\ENQtypes\DC2+\n\
      \\aimports\CAN\EOT \ETX(\v2\DC1.tdl.ir.v1.ImportR\aimports\DC2+\n\
      \\aexterns\CAN\ENQ \ETX(\v2\DC1.tdl.ir.v1.ExternR\aexterns\DC21\n\
      \\tinstances\CAN\ACK \ETX(\v2\DC3.tdl.ir.v1.InstanceR\tinstances\DC25\n\
      \\tsatisfies\CAN\a \ETX(\v2\ETB.tdl.ir.v1.SatisfactionR\tsatisfies\DC20\n\
      \\atargets\CAN\b \ETX(\v2\SYN.tdl.ir.v1.TargetBlockR\atargets\DC2%\n\
      \\ENQunits\CAN\t \ETX(\v2\SI.tdl.ir.v1.UnitR\ENQunits\DC2\DLE\n\
      \\ETXdoc\CAN\n\
      \ \ETX(\tR\ETXdoc"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        package__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "package"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"package")) ::
              Data.ProtoLens.FieldDescriptor Model
        decls__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "decls"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Decl)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"decls")) ::
              Data.ProtoLens.FieldDescriptor Model
        types__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "types"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"types")) ::
              Data.ProtoLens.FieldDescriptor Model
        imports__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "imports"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Import)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"imports")) ::
              Data.ProtoLens.FieldDescriptor Model
        externs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "externs"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Extern)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"externs")) ::
              Data.ProtoLens.FieldDescriptor Model
        instances__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "instances"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Instance)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"instances")) ::
              Data.ProtoLens.FieldDescriptor Model
        satisfies__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "satisfies"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Satisfaction)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"satisfies")) ::
              Data.ProtoLens.FieldDescriptor Model
        targets__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "targets"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor TargetBlock)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"targets")) ::
              Data.ProtoLens.FieldDescriptor Model
        units__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "units"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Unit)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"units")) ::
              Data.ProtoLens.FieldDescriptor Model
        doc__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "doc"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"doc")) ::
              Data.ProtoLens.FieldDescriptor Model
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, package__field_descriptor),
           (Data.ProtoLens.Tag 2, decls__field_descriptor),
           (Data.ProtoLens.Tag 3, types__field_descriptor),
           (Data.ProtoLens.Tag 4, imports__field_descriptor),
           (Data.ProtoLens.Tag 5, externs__field_descriptor),
           (Data.ProtoLens.Tag 6, instances__field_descriptor),
           (Data.ProtoLens.Tag 7, satisfies__field_descriptor),
           (Data.ProtoLens.Tag 8, targets__field_descriptor),
           (Data.ProtoLens.Tag 9, units__field_descriptor),
           (Data.ProtoLens.Tag 10, doc__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Model'_unknownFields
        (\ x__ y__ -> x__ {_Model'_unknownFields = y__})
  defMessage
    = Model'_constructor
        {_Model'package = Data.ProtoLens.fieldDefault,
         _Model'decls = Data.Vector.Generic.empty,
         _Model'types = Data.Vector.Generic.empty,
         _Model'imports = Data.Vector.Generic.empty,
         _Model'externs = Data.Vector.Generic.empty,
         _Model'instances = Data.Vector.Generic.empty,
         _Model'satisfies = Data.Vector.Generic.empty,
         _Model'targets = Data.Vector.Generic.empty,
         _Model'units = Data.Vector.Generic.empty,
         _Model'doc = Data.Vector.Generic.empty, _Model'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Model
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Decl
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Extern
                   -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Import
                      -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Instance
                         -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Satisfaction
                            -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld TargetBlock
                               -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Type
                                  -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Unit
                                     -> Data.ProtoLens.Encoding.Bytes.Parser Model
        loop
          x
          mutable'decls
          mutable'doc
          mutable'externs
          mutable'imports
          mutable'instances
          mutable'satisfies
          mutable'targets
          mutable'types
          mutable'units
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'decls <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'decls)
                      frozen'doc <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'doc)
                      frozen'externs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'externs)
                      frozen'imports <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'imports)
                      frozen'instances <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'instances)
                      frozen'satisfies <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'satisfies)
                      frozen'targets <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'targets)
                      frozen'types <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'types)
                      frozen'units <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'units)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'decls") frozen'decls
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'doc") frozen'doc
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'externs") frozen'externs
                                    (Lens.Family2.set
                                       (Data.ProtoLens.Field.field @"vec'imports") frozen'imports
                                       (Lens.Family2.set
                                          (Data.ProtoLens.Field.field @"vec'instances")
                                          frozen'instances
                                          (Lens.Family2.set
                                             (Data.ProtoLens.Field.field @"vec'satisfies")
                                             frozen'satisfies
                                             (Lens.Family2.set
                                                (Data.ProtoLens.Field.field @"vec'targets")
                                                frozen'targets
                                                (Lens.Family2.set
                                                   (Data.ProtoLens.Field.field @"vec'types")
                                                   frozen'types
                                                   (Lens.Family2.set
                                                      (Data.ProtoLens.Field.field @"vec'units")
                                                      frozen'units x))))))))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "package"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"package") y x)
                                  mutable'decls mutable'doc mutable'externs mutable'imports
                                  mutable'instances mutable'satisfies mutable'targets mutable'types
                                  mutable'units
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "decls"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'decls y)
                                loop
                                  x v mutable'doc mutable'externs mutable'imports mutable'instances
                                  mutable'satisfies mutable'targets mutable'types mutable'units
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "types"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'types y)
                                loop
                                  x mutable'decls mutable'doc mutable'externs mutable'imports
                                  mutable'instances mutable'satisfies mutable'targets v
                                  mutable'units
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "imports"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'imports y)
                                loop
                                  x mutable'decls mutable'doc mutable'externs v mutable'instances
                                  mutable'satisfies mutable'targets mutable'types mutable'units
                        42
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "externs"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'externs y)
                                loop
                                  x mutable'decls mutable'doc v mutable'imports mutable'instances
                                  mutable'satisfies mutable'targets mutable'types mutable'units
                        50
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "instances"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'instances y)
                                loop
                                  x mutable'decls mutable'doc mutable'externs mutable'imports v
                                  mutable'satisfies mutable'targets mutable'types mutable'units
                        58
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "satisfies"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'satisfies y)
                                loop
                                  x mutable'decls mutable'doc mutable'externs mutable'imports
                                  mutable'instances v mutable'targets mutable'types mutable'units
                        66
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "targets"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'targets y)
                                loop
                                  x mutable'decls mutable'doc mutable'externs mutable'imports
                                  mutable'instances mutable'satisfies v mutable'types mutable'units
                        74
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "units"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'units y)
                                loop
                                  x mutable'decls mutable'doc mutable'externs mutable'imports
                                  mutable'instances mutable'satisfies mutable'targets mutable'types
                                  v
                        82
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getText
                                              (Prelude.fromIntegral len))
                                        "doc"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'doc y)
                                loop
                                  x mutable'decls v mutable'externs mutable'imports
                                  mutable'instances mutable'satisfies mutable'targets mutable'types
                                  mutable'units
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'decls mutable'doc mutable'externs mutable'imports
                                  mutable'instances mutable'satisfies mutable'targets mutable'types
                                  mutable'units
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'decls <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              mutable'doc <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                               Data.ProtoLens.Encoding.Growing.new
              mutable'externs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              mutable'imports <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              mutable'instances <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
              mutable'satisfies <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
              mutable'targets <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              mutable'types <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              mutable'units <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'decls mutable'doc mutable'externs
                mutable'imports mutable'instances mutable'satisfies mutable'targets
                mutable'types mutable'units)
          "Model"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"package") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'decls") _x))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'types") _x))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                 ((Prelude..)
                                    (\ bs
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                                            (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    Data.ProtoLens.encodeMessage _v))
                         (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'imports") _x))
                      ((Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                            (\ _v
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                    ((Prelude..)
                                       (\ bs
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                  (Prelude.fromIntegral
                                                     (Data.ByteString.length bs)))
                                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                       Data.ProtoLens.encodeMessage _v))
                            (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'externs") _x))
                         ((Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                               (\ _v
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
                                       ((Prelude..)
                                          (\ bs
                                             -> (Data.Monoid.<>)
                                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                     (Prelude.fromIntegral
                                                        (Data.ByteString.length bs)))
                                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                          Data.ProtoLens.encodeMessage _v))
                               (Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"vec'instances") _x))
                            ((Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                  (\ _v
                                     -> (Data.Monoid.<>)
                                          (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                          ((Prelude..)
                                             (\ bs
                                                -> (Data.Monoid.<>)
                                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                        (Prelude.fromIntegral
                                                           (Data.ByteString.length bs)))
                                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                             Data.ProtoLens.encodeMessage _v))
                                  (Lens.Family2.view
                                     (Data.ProtoLens.Field.field @"vec'satisfies") _x))
                               ((Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                     (\ _v
                                        -> (Data.Monoid.<>)
                                             (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                                             ((Prelude..)
                                                (\ bs
                                                   -> (Data.Monoid.<>)
                                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                           (Prelude.fromIntegral
                                                              (Data.ByteString.length bs)))
                                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                                Data.ProtoLens.encodeMessage _v))
                                     (Lens.Family2.view
                                        (Data.ProtoLens.Field.field @"vec'targets") _x))
                                  ((Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                        (\ _v
                                           -> (Data.Monoid.<>)
                                                (Data.ProtoLens.Encoding.Bytes.putVarInt 74)
                                                ((Prelude..)
                                                   (\ bs
                                                      -> (Data.Monoid.<>)
                                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                              (Prelude.fromIntegral
                                                                 (Data.ByteString.length bs)))
                                                           (Data.ProtoLens.Encoding.Bytes.putBytes
                                                              bs))
                                                   Data.ProtoLens.encodeMessage _v))
                                        (Lens.Family2.view
                                           (Data.ProtoLens.Field.field @"vec'units") _x))
                                     ((Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                           (\ _v
                                              -> (Data.Monoid.<>)
                                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 82)
                                                   ((Prelude..)
                                                      (\ bs
                                                         -> (Data.Monoid.<>)
                                                              (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                 (Prelude.fromIntegral
                                                                    (Data.ByteString.length bs)))
                                                              (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                 bs))
                                                      Data.Text.Encoding.encodeUtf8 _v))
                                           (Lens.Family2.view
                                              (Data.ProtoLens.Field.field @"vec'doc") _x))
                                        (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                           (Lens.Family2.view
                                              Data.ProtoLens.unknownFields _x)))))))))))
instance Control.DeepSeq.NFData Model where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Model'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Model'package x__)
                (Control.DeepSeq.deepseq
                   (_Model'decls x__)
                   (Control.DeepSeq.deepseq
                      (_Model'types x__)
                      (Control.DeepSeq.deepseq
                         (_Model'imports x__)
                         (Control.DeepSeq.deepseq
                            (_Model'externs x__)
                            (Control.DeepSeq.deepseq
                               (_Model'instances x__)
                               (Control.DeepSeq.deepseq
                                  (_Model'satisfies x__)
                                  (Control.DeepSeq.deepseq
                                     (_Model'targets x__)
                                     (Control.DeepSeq.deepseq
                                        (_Model'units x__)
                                        (Control.DeepSeq.deepseq (_Model'doc x__) ()))))))))))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.params' @:: Lens' Newtype [Param]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'params' @:: Lens' Newtype (Data.Vector.Vector Param)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.base' @:: Lens' Newtype ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'base' @:: Lens' Newtype (Prelude.Maybe ID)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.constraints' @:: Lens' Newtype [ClassRef]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'constraints' @:: Lens' Newtype (Data.Vector.Vector ClassRef)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.valueConstraints' @:: Lens' Newtype [Constraint]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'valueConstraints' @:: Lens' Newtype (Data.Vector.Vector Constraint)@ -}
data Newtype
  = Newtype'_constructor {_Newtype'params :: !(Data.Vector.Vector Param),
                          _Newtype'base :: !(Prelude.Maybe ID),
                          _Newtype'constraints :: !(Data.Vector.Vector ClassRef),
                          _Newtype'valueConstraints :: !(Data.Vector.Vector Constraint),
                          _Newtype'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Newtype where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Newtype "params" [Param] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Newtype'params (\ x__ y__ -> x__ {_Newtype'params = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Newtype "vec'params" (Data.Vector.Vector Param) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Newtype'params (\ x__ y__ -> x__ {_Newtype'params = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Newtype "base" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Newtype'base (\ x__ y__ -> x__ {_Newtype'base = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Newtype "maybe'base" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Newtype'base (\ x__ y__ -> x__ {_Newtype'base = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Newtype "constraints" [ClassRef] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Newtype'constraints
           (\ x__ y__ -> x__ {_Newtype'constraints = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Newtype "vec'constraints" (Data.Vector.Vector ClassRef) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Newtype'constraints
           (\ x__ y__ -> x__ {_Newtype'constraints = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Newtype "valueConstraints" [Constraint] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Newtype'valueConstraints
           (\ x__ y__ -> x__ {_Newtype'valueConstraints = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Newtype "vec'valueConstraints" (Data.Vector.Vector Constraint) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Newtype'valueConstraints
           (\ x__ y__ -> x__ {_Newtype'valueConstraints = y__}))
        Prelude.id
instance Data.ProtoLens.Message Newtype where
  messageName _ = Data.Text.pack "tdl.ir.v1.Newtype"
  packedMessageDescriptor _
    = "\n\
      \\aNewtype\DC2(\n\
      \\ACKparams\CAN\SOH \ETX(\v2\DLE.tdl.ir.v1.ParamR\ACKparams\DC2!\n\
      \\EOTbase\CAN\STX \SOH(\v2\r.tdl.ir.v1.IDR\EOTbase\DC25\n\
      \\vconstraints\CAN\ETX \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\vconstraints\DC2B\n\
      \\DC1value_constraints\CAN\EOT \ETX(\v2\NAK.tdl.ir.v1.ConstraintR\DLEvalueConstraints"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        params__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "params"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Param)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"params")) ::
              Data.ProtoLens.FieldDescriptor Newtype
        base__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "base"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'base")) ::
              Data.ProtoLens.FieldDescriptor Newtype
        constraints__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "constraints"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ClassRef)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"constraints")) ::
              Data.ProtoLens.FieldDescriptor Newtype
        valueConstraints__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value_constraints"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Constraint)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"valueConstraints")) ::
              Data.ProtoLens.FieldDescriptor Newtype
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, params__field_descriptor),
           (Data.ProtoLens.Tag 2, base__field_descriptor),
           (Data.ProtoLens.Tag 3, constraints__field_descriptor),
           (Data.ProtoLens.Tag 4, valueConstraints__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Newtype'_unknownFields
        (\ x__ y__ -> x__ {_Newtype'_unknownFields = y__})
  defMessage
    = Newtype'_constructor
        {_Newtype'params = Data.Vector.Generic.empty,
         _Newtype'base = Prelude.Nothing,
         _Newtype'constraints = Data.Vector.Generic.empty,
         _Newtype'valueConstraints = Data.Vector.Generic.empty,
         _Newtype'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Newtype
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld ClassRef
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Param
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Constraint
                   -> Data.ProtoLens.Encoding.Bytes.Parser Newtype
        loop x mutable'constraints mutable'params mutable'valueConstraints
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'constraints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'constraints)
                      frozen'params <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'params)
                      frozen'valueConstraints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                   (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                      mutable'valueConstraints)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'constraints") frozen'constraints
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'params") frozen'params
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'valueConstraints")
                                    frozen'valueConstraints x))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "params"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'params y)
                                loop x mutable'constraints v mutable'valueConstraints
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "base"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"base") y x)
                                  mutable'constraints mutable'params mutable'valueConstraints
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "constraints"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'constraints y)
                                loop x v mutable'params mutable'valueConstraints
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "value_constraints"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'valueConstraints y)
                                loop x mutable'constraints mutable'params v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'constraints mutable'params mutable'valueConstraints
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'constraints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       Data.ProtoLens.Encoding.Growing.new
              mutable'params <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              mutable'valueConstraints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'constraints mutable'params
                mutable'valueConstraints)
          "Newtype"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'params") _x))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'base") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'constraints") _x))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                 ((Prelude..)
                                    (\ bs
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                                            (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    Data.ProtoLens.encodeMessage _v))
                         (Lens.Family2.view
                            (Data.ProtoLens.Field.field @"vec'valueConstraints") _x))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData Newtype where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Newtype'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Newtype'params x__)
                (Control.DeepSeq.deepseq
                   (_Newtype'base x__)
                   (Control.DeepSeq.deepseq
                      (_Newtype'constraints x__)
                      (Control.DeepSeq.deepseq (_Newtype'valueConstraints x__) ()))))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.name' @:: Lens' Param Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.kind' @:: Lens' Param Kind@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'kind' @:: Lens' Param (Prelude.Maybe Kind)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.position' @:: Lens' Param Position@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'position' @:: Lens' Param (Prelude.Maybe Position)@ -}
data Param
  = Param'_constructor {_Param'name :: !Data.Text.Text,
                        _Param'kind :: !(Prelude.Maybe Kind),
                        _Param'position :: !(Prelude.Maybe Position),
                        _Param'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Param where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Param "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Param'name (\ x__ y__ -> x__ {_Param'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Param "kind" Kind where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Param'kind (\ x__ y__ -> x__ {_Param'kind = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Param "maybe'kind" (Prelude.Maybe Kind) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Param'kind (\ x__ y__ -> x__ {_Param'kind = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Param "position" Position where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Param'position (\ x__ y__ -> x__ {_Param'position = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Param "maybe'position" (Prelude.Maybe Position) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Param'position (\ x__ y__ -> x__ {_Param'position = y__}))
        Prelude.id
instance Data.ProtoLens.Message Param where
  messageName _ = Data.Text.pack "tdl.ir.v1.Param"
  packedMessageDescriptor _
    = "\n\
      \\ENQParam\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2#\n\
      \\EOTkind\CAN\STX \SOH(\v2\SI.tdl.ir.v1.KindR\EOTkind\DC2/\n\
      \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor Param
        kind__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "kind"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Kind)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'kind")) ::
              Data.ProtoLens.FieldDescriptor Param
        position__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "position"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Position)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'position")) ::
              Data.ProtoLens.FieldDescriptor Param
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, kind__field_descriptor),
           (Data.ProtoLens.Tag 3, position__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Param'_unknownFields
        (\ x__ y__ -> x__ {_Param'_unknownFields = y__})
  defMessage
    = Param'_constructor
        {_Param'name = Data.ProtoLens.fieldDefault,
         _Param'kind = Prelude.Nothing, _Param'position = Prelude.Nothing,
         _Param'_unknownFields = []}
  parseMessage
    = let
        loop :: Param -> Data.ProtoLens.Encoding.Bytes.Parser Param
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "kind"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"kind") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "position"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"position") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Param"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'kind") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'position") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Param where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Param'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Param'name x__)
                (Control.DeepSeq.deepseq
                   (_Param'kind x__)
                   (Control.DeepSeq.deepseq (_Param'position x__) ())))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.name' @:: Lens' ParamRef Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.index' @:: Lens' ParamRef Data.Int.Int32@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.owner' @:: Lens' ParamRef ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'owner' @:: Lens' ParamRef (Prelude.Maybe ID)@ -}
data ParamRef
  = ParamRef'_constructor {_ParamRef'name :: !Data.Text.Text,
                           _ParamRef'index :: !Data.Int.Int32,
                           _ParamRef'owner :: !(Prelude.Maybe ID),
                           _ParamRef'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ParamRef where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ParamRef "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ParamRef'name (\ x__ y__ -> x__ {_ParamRef'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ParamRef "index" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ParamRef'index (\ x__ y__ -> x__ {_ParamRef'index = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ParamRef "owner" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ParamRef'owner (\ x__ y__ -> x__ {_ParamRef'owner = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ParamRef "maybe'owner" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ParamRef'owner (\ x__ y__ -> x__ {_ParamRef'owner = y__}))
        Prelude.id
instance Data.ProtoLens.Message ParamRef where
  messageName _ = Data.Text.pack "tdl.ir.v1.ParamRef"
  packedMessageDescriptor _
    = "\n\
      \\bParamRef\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\DC4\n\
      \\ENQindex\CAN\STX \SOH(\ENQR\ENQindex\DC2#\n\
      \\ENQowner\CAN\ETX \SOH(\v2\r.tdl.ir.v1.IDR\ENQowner"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor ParamRef
        index__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "index"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"index")) ::
              Data.ProtoLens.FieldDescriptor ParamRef
        owner__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "owner"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'owner")) ::
              Data.ProtoLens.FieldDescriptor ParamRef
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, index__field_descriptor),
           (Data.ProtoLens.Tag 3, owner__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ParamRef'_unknownFields
        (\ x__ y__ -> x__ {_ParamRef'_unknownFields = y__})
  defMessage
    = ParamRef'_constructor
        {_ParamRef'name = Data.ProtoLens.fieldDefault,
         _ParamRef'index = Data.ProtoLens.fieldDefault,
         _ParamRef'owner = Prelude.Nothing, _ParamRef'_unknownFields = []}
  parseMessage
    = let
        loop :: ParamRef -> Data.ProtoLens.Encoding.Bytes.Parser ParamRef
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "index"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"index") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "owner"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"owner") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ParamRef"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"index") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'owner") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData ParamRef where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ParamRef'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ParamRef'name x__)
                (Control.DeepSeq.deepseq
                   (_ParamRef'index x__)
                   (Control.DeepSeq.deepseq (_ParamRef'owner x__) ())))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.filename' @:: Lens' Position Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.line' @:: Lens' Position Data.Int.Int32@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.column' @:: Lens' Position Data.Int.Int32@ -}
data Position
  = Position'_constructor {_Position'filename :: !Data.Text.Text,
                           _Position'line :: !Data.Int.Int32,
                           _Position'column :: !Data.Int.Int32,
                           _Position'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Position where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Position "filename" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Position'filename (\ x__ y__ -> x__ {_Position'filename = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Position "line" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Position'line (\ x__ y__ -> x__ {_Position'line = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Position "column" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Position'column (\ x__ y__ -> x__ {_Position'column = y__}))
        Prelude.id
instance Data.ProtoLens.Message Position where
  messageName _ = Data.Text.pack "tdl.ir.v1.Position"
  packedMessageDescriptor _
    = "\n\
      \\bPosition\DC2\SUB\n\
      \\bfilename\CAN\SOH \SOH(\tR\bfilename\DC2\DC2\n\
      \\EOTline\CAN\STX \SOH(\ENQR\EOTline\DC2\SYN\n\
      \\ACKcolumn\CAN\ETX \SOH(\ENQR\ACKcolumn"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        filename__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "filename"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"filename")) ::
              Data.ProtoLens.FieldDescriptor Position
        line__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "line"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"line")) ::
              Data.ProtoLens.FieldDescriptor Position
        column__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "column"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"column")) ::
              Data.ProtoLens.FieldDescriptor Position
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, filename__field_descriptor),
           (Data.ProtoLens.Tag 2, line__field_descriptor),
           (Data.ProtoLens.Tag 3, column__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Position'_unknownFields
        (\ x__ y__ -> x__ {_Position'_unknownFields = y__})
  defMessage
    = Position'_constructor
        {_Position'filename = Data.ProtoLens.fieldDefault,
         _Position'line = Data.ProtoLens.fieldDefault,
         _Position'column = Data.ProtoLens.fieldDefault,
         _Position'_unknownFields = []}
  parseMessage
    = let
        loop :: Position -> Data.ProtoLens.Encoding.Bytes.Parser Position
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "filename"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"filename") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "line"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"line") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "column"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"column") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Position"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"filename") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"line") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"column") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Position where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Position'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Position'filename x__)
                (Control.DeepSeq.deepseq
                   (_Position'line x__)
                   (Control.DeepSeq.deepseq (_Position'column x__) ())))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.kind' @:: Lens' Primitive Kind@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'kind' @:: Lens' Primitive (Prelude.Maybe Kind)@ -}
data Primitive
  = Primitive'_constructor {_Primitive'kind :: !(Prelude.Maybe Kind),
                            _Primitive'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Primitive where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Primitive "kind" Kind where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Primitive'kind (\ x__ y__ -> x__ {_Primitive'kind = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Primitive "maybe'kind" (Prelude.Maybe Kind) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Primitive'kind (\ x__ y__ -> x__ {_Primitive'kind = y__}))
        Prelude.id
instance Data.ProtoLens.Message Primitive where
  messageName _ = Data.Text.pack "tdl.ir.v1.Primitive"
  packedMessageDescriptor _
    = "\n\
      \\tPrimitive\DC2#\n\
      \\EOTkind\CAN\SOH \SOH(\v2\SI.tdl.ir.v1.KindR\EOTkind"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        kind__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "kind"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Kind)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'kind")) ::
              Data.ProtoLens.FieldDescriptor Primitive
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, kind__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Primitive'_unknownFields
        (\ x__ y__ -> x__ {_Primitive'_unknownFields = y__})
  defMessage
    = Primitive'_constructor
        {_Primitive'kind = Prelude.Nothing, _Primitive'_unknownFields = []}
  parseMessage
    = let
        loop :: Primitive -> Data.ProtoLens.Encoding.Bytes.Parser Primitive
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "kind"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"kind") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Primitive"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'kind") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Primitive where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Primitive'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Primitive'kind x__) ())
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.low' @:: Lens' Range Data.Int.Int64@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'low' @:: Lens' Range (Prelude.Maybe Data.Int.Int64)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.high' @:: Lens' Range Data.Int.Int64@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'high' @:: Lens' Range (Prelude.Maybe Data.Int.Int64)@ -}
data Range
  = Range'_constructor {_Range'low :: !(Prelude.Maybe Data.Int.Int64),
                        _Range'high :: !(Prelude.Maybe Data.Int.Int64),
                        _Range'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Range where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Range "low" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Range'low (\ x__ y__ -> x__ {_Range'low = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField Range "maybe'low" (Prelude.Maybe Data.Int.Int64) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Range'low (\ x__ y__ -> x__ {_Range'low = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Range "high" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Range'high (\ x__ y__ -> x__ {_Range'high = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField Range "maybe'high" (Prelude.Maybe Data.Int.Int64) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Range'high (\ x__ y__ -> x__ {_Range'high = y__}))
        Prelude.id
instance Data.ProtoLens.Message Range where
  messageName _ = Data.Text.pack "tdl.ir.v1.Range"
  packedMessageDescriptor _
    = "\n\
      \\ENQRange\DC2\ETB\n\
      \\ETXlow\CAN\SOH \SOH(\ETXR\ETXlowB\ENQ\170\SOH\STX\b\SOH\DC2\EM\n\
      \\EOThigh\CAN\STX \SOH(\ETXR\EOThighB\ENQ\170\SOH\STX\b\SOH"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        low__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "low"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'low")) ::
              Data.ProtoLens.FieldDescriptor Range
        high__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "high"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'high")) ::
              Data.ProtoLens.FieldDescriptor Range
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, low__field_descriptor),
           (Data.ProtoLens.Tag 2, high__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Range'_unknownFields
        (\ x__ y__ -> x__ {_Range'_unknownFields = y__})
  defMessage
    = Range'_constructor
        {_Range'low = Prelude.Nothing, _Range'high = Prelude.Nothing,
         _Range'_unknownFields = []}
  parseMessage
    = let
        loop :: Range -> Data.ProtoLens.Encoding.Bytes.Parser Range
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
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "low"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"low") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "high"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"high") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Range"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'low") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                       ((Prelude..)
                          Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'high") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData Range where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Range'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Range'low x__) (Control.DeepSeq.deepseq (_Range'high x__) ()))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.class'' @:: Lens' Satisfaction ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'class'' @:: Lens' Satisfaction (Prelude.Maybe ID)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.decls' @:: Lens' Satisfaction [ID]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'decls' @:: Lens' Satisfaction (Data.Vector.Vector ID)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.types' @:: Lens' Satisfaction [ID]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'types' @:: Lens' Satisfaction (Data.Vector.Vector ID)@ -}
data Satisfaction
  = Satisfaction'_constructor {_Satisfaction'class' :: !(Prelude.Maybe ID),
                               _Satisfaction'decls :: !(Data.Vector.Vector ID),
                               _Satisfaction'types :: !(Data.Vector.Vector ID),
                               _Satisfaction'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Satisfaction where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Satisfaction "class'" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Satisfaction'class'
           (\ x__ y__ -> x__ {_Satisfaction'class' = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Satisfaction "maybe'class'" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Satisfaction'class'
           (\ x__ y__ -> x__ {_Satisfaction'class' = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Satisfaction "decls" [ID] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Satisfaction'decls (\ x__ y__ -> x__ {_Satisfaction'decls = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Satisfaction "vec'decls" (Data.Vector.Vector ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Satisfaction'decls (\ x__ y__ -> x__ {_Satisfaction'decls = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Satisfaction "types" [ID] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Satisfaction'types (\ x__ y__ -> x__ {_Satisfaction'types = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Satisfaction "vec'types" (Data.Vector.Vector ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Satisfaction'types (\ x__ y__ -> x__ {_Satisfaction'types = y__}))
        Prelude.id
instance Data.ProtoLens.Message Satisfaction where
  messageName _ = Data.Text.pack "tdl.ir.v1.Satisfaction"
  packedMessageDescriptor _
    = "\n\
      \\fSatisfaction\DC2#\n\
      \\ENQclass\CAN\SOH \SOH(\v2\r.tdl.ir.v1.IDR\ENQclass\DC2#\n\
      \\ENQdecls\CAN\STX \ETX(\v2\r.tdl.ir.v1.IDR\ENQdecls\DC2#\n\
      \\ENQtypes\CAN\ETX \ETX(\v2\r.tdl.ir.v1.IDR\ENQtypes"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        class'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "class"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'class'")) ::
              Data.ProtoLens.FieldDescriptor Satisfaction
        decls__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "decls"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"decls")) ::
              Data.ProtoLens.FieldDescriptor Satisfaction
        types__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "types"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"types")) ::
              Data.ProtoLens.FieldDescriptor Satisfaction
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, class'__field_descriptor),
           (Data.ProtoLens.Tag 2, decls__field_descriptor),
           (Data.ProtoLens.Tag 3, types__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Satisfaction'_unknownFields
        (\ x__ y__ -> x__ {_Satisfaction'_unknownFields = y__})
  defMessage
    = Satisfaction'_constructor
        {_Satisfaction'class' = Prelude.Nothing,
         _Satisfaction'decls = Data.Vector.Generic.empty,
         _Satisfaction'types = Data.Vector.Generic.empty,
         _Satisfaction'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Satisfaction
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld ID
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld ID
                -> Data.ProtoLens.Encoding.Bytes.Parser Satisfaction
        loop x mutable'decls mutable'types
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'decls <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'decls)
                      frozen'types <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'types)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'decls") frozen'decls
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'types") frozen'types x)))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "class"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"class'") y x)
                                  mutable'decls mutable'types
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "decls"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'decls y)
                                loop x v mutable'types
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "types"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'types y)
                                loop x mutable'decls v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'decls mutable'types
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'decls <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              mutable'types <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'decls mutable'types)
          "Satisfaction"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'class'") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'decls") _x))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'types") _x))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Satisfaction where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Satisfaction'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Satisfaction'class' x__)
                (Control.DeepSeq.deepseq
                   (_Satisfaction'decls x__)
                   (Control.DeepSeq.deepseq (_Satisfaction'types x__) ())))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.kind' @:: Lens' Struct StructKind@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.params' @:: Lens' Struct [Param]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'params' @:: Lens' Struct (Data.Vector.Vector Param)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.fields' @:: Lens' Struct [Field]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'fields' @:: Lens' Struct (Data.Vector.Vector Field)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.conforms' @:: Lens' Struct [ClassRef]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'conforms' @:: Lens' Struct (Data.Vector.Vector ClassRef)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.constraints' @:: Lens' Struct [ClassRef]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'constraints' @:: Lens' Struct (Data.Vector.Vector ClassRef)@ -}
data Struct
  = Struct'_constructor {_Struct'kind :: !StructKind,
                         _Struct'params :: !(Data.Vector.Vector Param),
                         _Struct'fields :: !(Data.Vector.Vector Field),
                         _Struct'conforms :: !(Data.Vector.Vector ClassRef),
                         _Struct'constraints :: !(Data.Vector.Vector ClassRef),
                         _Struct'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Struct where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Struct "kind" StructKind where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Struct'kind (\ x__ y__ -> x__ {_Struct'kind = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Struct "params" [Param] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Struct'params (\ x__ y__ -> x__ {_Struct'params = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Struct "vec'params" (Data.Vector.Vector Param) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Struct'params (\ x__ y__ -> x__ {_Struct'params = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Struct "fields" [Field] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Struct'fields (\ x__ y__ -> x__ {_Struct'fields = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Struct "vec'fields" (Data.Vector.Vector Field) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Struct'fields (\ x__ y__ -> x__ {_Struct'fields = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Struct "conforms" [ClassRef] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Struct'conforms (\ x__ y__ -> x__ {_Struct'conforms = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Struct "vec'conforms" (Data.Vector.Vector ClassRef) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Struct'conforms (\ x__ y__ -> x__ {_Struct'conforms = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Struct "constraints" [ClassRef] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Struct'constraints (\ x__ y__ -> x__ {_Struct'constraints = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Struct "vec'constraints" (Data.Vector.Vector ClassRef) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Struct'constraints (\ x__ y__ -> x__ {_Struct'constraints = y__}))
        Prelude.id
instance Data.ProtoLens.Message Struct where
  messageName _ = Data.Text.pack "tdl.ir.v1.Struct"
  packedMessageDescriptor _
    = "\n\
      \\ACKStruct\DC2)\n\
      \\EOTkind\CAN\SOH \SOH(\SO2\NAK.tdl.ir.v1.StructKindR\EOTkind\DC2(\n\
      \\ACKparams\CAN\STX \ETX(\v2\DLE.tdl.ir.v1.ParamR\ACKparams\DC2(\n\
      \\ACKfields\CAN\ETX \ETX(\v2\DLE.tdl.ir.v1.FieldR\ACKfields\DC2/\n\
      \\bconforms\CAN\EOT \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\bconforms\DC25\n\
      \\vconstraints\CAN\ENQ \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\vconstraints"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        kind__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "kind"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor StructKind)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"kind")) ::
              Data.ProtoLens.FieldDescriptor Struct
        params__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "params"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Param)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"params")) ::
              Data.ProtoLens.FieldDescriptor Struct
        fields__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "fields"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Field)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"fields")) ::
              Data.ProtoLens.FieldDescriptor Struct
        conforms__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "conforms"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ClassRef)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"conforms")) ::
              Data.ProtoLens.FieldDescriptor Struct
        constraints__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "constraints"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ClassRef)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"constraints")) ::
              Data.ProtoLens.FieldDescriptor Struct
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, kind__field_descriptor),
           (Data.ProtoLens.Tag 2, params__field_descriptor),
           (Data.ProtoLens.Tag 3, fields__field_descriptor),
           (Data.ProtoLens.Tag 4, conforms__field_descriptor),
           (Data.ProtoLens.Tag 5, constraints__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Struct'_unknownFields
        (\ x__ y__ -> x__ {_Struct'_unknownFields = y__})
  defMessage
    = Struct'_constructor
        {_Struct'kind = Data.ProtoLens.fieldDefault,
         _Struct'params = Data.Vector.Generic.empty,
         _Struct'fields = Data.Vector.Generic.empty,
         _Struct'conforms = Data.Vector.Generic.empty,
         _Struct'constraints = Data.Vector.Generic.empty,
         _Struct'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Struct
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld ClassRef
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld ClassRef
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Field
                   -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Param
                      -> Data.ProtoLens.Encoding.Bytes.Parser Struct
        loop
          x
          mutable'conforms
          mutable'constraints
          mutable'fields
          mutable'params
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'conforms <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                              mutable'conforms)
                      frozen'constraints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'constraints)
                      frozen'fields <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'fields)
                      frozen'params <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'params)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'conforms") frozen'conforms
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'constraints") frozen'constraints
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'fields") frozen'fields
                                    (Lens.Family2.set
                                       (Data.ProtoLens.Field.field @"vec'params") frozen'params
                                       x)))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "kind"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"kind") y x)
                                  mutable'conforms mutable'constraints mutable'fields mutable'params
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "params"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'params y)
                                loop x mutable'conforms mutable'constraints mutable'fields v
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "fields"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'fields y)
                                loop x mutable'conforms mutable'constraints v mutable'params
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "conforms"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'conforms y)
                                loop x v mutable'constraints mutable'fields mutable'params
                        42
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "constraints"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'constraints y)
                                loop x mutable'conforms v mutable'fields mutable'params
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'conforms mutable'constraints mutable'fields mutable'params
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'conforms <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                    Data.ProtoLens.Encoding.Growing.new
              mutable'constraints <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       Data.ProtoLens.Encoding.Growing.new
              mutable'fields <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              mutable'params <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'conforms mutable'constraints
                mutable'fields mutable'params)
          "Struct"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"kind") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                         Prelude.fromEnum _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'params") _x))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'fields") _x))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                 ((Prelude..)
                                    (\ bs
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                                            (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    Data.ProtoLens.encodeMessage _v))
                         (Lens.Family2.view
                            (Data.ProtoLens.Field.field @"vec'conforms") _x))
                      ((Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                            (\ _v
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                    ((Prelude..)
                                       (\ bs
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                  (Prelude.fromIntegral
                                                     (Data.ByteString.length bs)))
                                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                       Data.ProtoLens.encodeMessage _v))
                            (Lens.Family2.view
                               (Data.ProtoLens.Field.field @"vec'constraints") _x))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData Struct where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Struct'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Struct'kind x__)
                (Control.DeepSeq.deepseq
                   (_Struct'params x__)
                   (Control.DeepSeq.deepseq
                      (_Struct'fields x__)
                      (Control.DeepSeq.deepseq
                         (_Struct'conforms x__)
                         (Control.DeepSeq.deepseq (_Struct'constraints x__) ())))))
newtype StructKind'UnrecognizedValue
  = StructKind'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data StructKind
  = STRUCT_KIND_UNSPECIFIED |
    STRUCT_KIND_ENTITY |
    STRUCT_KIND_VALUE |
    STRUCT_KIND_MIXIN |
    StructKind'Unrecognized !StructKind'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum StructKind where
  maybeToEnum 0 = Prelude.Just STRUCT_KIND_UNSPECIFIED
  maybeToEnum 1 = Prelude.Just STRUCT_KIND_ENTITY
  maybeToEnum 2 = Prelude.Just STRUCT_KIND_VALUE
  maybeToEnum 3 = Prelude.Just STRUCT_KIND_MIXIN
  maybeToEnum k
    = Prelude.Just
        (StructKind'Unrecognized
           (StructKind'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum STRUCT_KIND_UNSPECIFIED = "STRUCT_KIND_UNSPECIFIED"
  showEnum STRUCT_KIND_ENTITY = "STRUCT_KIND_ENTITY"
  showEnum STRUCT_KIND_VALUE = "STRUCT_KIND_VALUE"
  showEnum STRUCT_KIND_MIXIN = "STRUCT_KIND_MIXIN"
  showEnum (StructKind'Unrecognized (StructKind'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "STRUCT_KIND_UNSPECIFIED"
    = Prelude.Just STRUCT_KIND_UNSPECIFIED
    | (Prelude.==) k "STRUCT_KIND_ENTITY"
    = Prelude.Just STRUCT_KIND_ENTITY
    | (Prelude.==) k "STRUCT_KIND_VALUE"
    = Prelude.Just STRUCT_KIND_VALUE
    | (Prelude.==) k "STRUCT_KIND_MIXIN"
    = Prelude.Just STRUCT_KIND_MIXIN
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded StructKind where
  minBound = STRUCT_KIND_UNSPECIFIED
  maxBound = STRUCT_KIND_MIXIN
instance Prelude.Enum StructKind where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum StructKind: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum STRUCT_KIND_UNSPECIFIED = 0
  fromEnum STRUCT_KIND_ENTITY = 1
  fromEnum STRUCT_KIND_VALUE = 2
  fromEnum STRUCT_KIND_MIXIN = 3
  fromEnum (StructKind'Unrecognized (StructKind'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ STRUCT_KIND_MIXIN
    = Prelude.error
        "StructKind.succ: bad argument STRUCT_KIND_MIXIN. This value would be out of bounds."
  succ STRUCT_KIND_UNSPECIFIED = STRUCT_KIND_ENTITY
  succ STRUCT_KIND_ENTITY = STRUCT_KIND_VALUE
  succ STRUCT_KIND_VALUE = STRUCT_KIND_MIXIN
  succ (StructKind'Unrecognized _)
    = Prelude.error "StructKind.succ: bad argument: unrecognized value"
  pred STRUCT_KIND_UNSPECIFIED
    = Prelude.error
        "StructKind.pred: bad argument STRUCT_KIND_UNSPECIFIED. This value would be out of bounds."
  pred STRUCT_KIND_ENTITY = STRUCT_KIND_UNSPECIFIED
  pred STRUCT_KIND_VALUE = STRUCT_KIND_ENTITY
  pred STRUCT_KIND_MIXIN = STRUCT_KIND_VALUE
  pred (StructKind'Unrecognized _)
    = Prelude.error "StructKind.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault StructKind where
  fieldDefault = STRUCT_KIND_UNSPECIFIED
instance Control.DeepSeq.NFData StructKind where
  rnf x__ = Prelude.seq x__ ()
newtype SyntacticForm'UnrecognizedValue
  = SyntacticForm'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data SyntacticForm
  = SYNTACTIC_FORM_UNSPECIFIED |
    SYNTACTIC_FORM_NAMED |
    SYNTACTIC_FORM_BRACKETS |
    SYNTACTIC_FORM_BRACES |
    SYNTACTIC_FORM_ARROW |
    SYNTACTIC_FORM_QUESTION |
    SYNTACTIC_FORM_OR_NULL |
    SyntacticForm'Unrecognized !SyntacticForm'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum SyntacticForm where
  maybeToEnum 0 = Prelude.Just SYNTACTIC_FORM_UNSPECIFIED
  maybeToEnum 1 = Prelude.Just SYNTACTIC_FORM_NAMED
  maybeToEnum 2 = Prelude.Just SYNTACTIC_FORM_BRACKETS
  maybeToEnum 3 = Prelude.Just SYNTACTIC_FORM_BRACES
  maybeToEnum 4 = Prelude.Just SYNTACTIC_FORM_ARROW
  maybeToEnum 5 = Prelude.Just SYNTACTIC_FORM_QUESTION
  maybeToEnum 6 = Prelude.Just SYNTACTIC_FORM_OR_NULL
  maybeToEnum k
    = Prelude.Just
        (SyntacticForm'Unrecognized
           (SyntacticForm'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum SYNTACTIC_FORM_UNSPECIFIED = "SYNTACTIC_FORM_UNSPECIFIED"
  showEnum SYNTACTIC_FORM_NAMED = "SYNTACTIC_FORM_NAMED"
  showEnum SYNTACTIC_FORM_BRACKETS = "SYNTACTIC_FORM_BRACKETS"
  showEnum SYNTACTIC_FORM_BRACES = "SYNTACTIC_FORM_BRACES"
  showEnum SYNTACTIC_FORM_ARROW = "SYNTACTIC_FORM_ARROW"
  showEnum SYNTACTIC_FORM_QUESTION = "SYNTACTIC_FORM_QUESTION"
  showEnum SYNTACTIC_FORM_OR_NULL = "SYNTACTIC_FORM_OR_NULL"
  showEnum
    (SyntacticForm'Unrecognized (SyntacticForm'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "SYNTACTIC_FORM_UNSPECIFIED"
    = Prelude.Just SYNTACTIC_FORM_UNSPECIFIED
    | (Prelude.==) k "SYNTACTIC_FORM_NAMED"
    = Prelude.Just SYNTACTIC_FORM_NAMED
    | (Prelude.==) k "SYNTACTIC_FORM_BRACKETS"
    = Prelude.Just SYNTACTIC_FORM_BRACKETS
    | (Prelude.==) k "SYNTACTIC_FORM_BRACES"
    = Prelude.Just SYNTACTIC_FORM_BRACES
    | (Prelude.==) k "SYNTACTIC_FORM_ARROW"
    = Prelude.Just SYNTACTIC_FORM_ARROW
    | (Prelude.==) k "SYNTACTIC_FORM_QUESTION"
    = Prelude.Just SYNTACTIC_FORM_QUESTION
    | (Prelude.==) k "SYNTACTIC_FORM_OR_NULL"
    = Prelude.Just SYNTACTIC_FORM_OR_NULL
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded SyntacticForm where
  minBound = SYNTACTIC_FORM_UNSPECIFIED
  maxBound = SYNTACTIC_FORM_OR_NULL
instance Prelude.Enum SyntacticForm where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum SyntacticForm: "
              (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum SYNTACTIC_FORM_UNSPECIFIED = 0
  fromEnum SYNTACTIC_FORM_NAMED = 1
  fromEnum SYNTACTIC_FORM_BRACKETS = 2
  fromEnum SYNTACTIC_FORM_BRACES = 3
  fromEnum SYNTACTIC_FORM_ARROW = 4
  fromEnum SYNTACTIC_FORM_QUESTION = 5
  fromEnum SYNTACTIC_FORM_OR_NULL = 6
  fromEnum
    (SyntacticForm'Unrecognized (SyntacticForm'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ SYNTACTIC_FORM_OR_NULL
    = Prelude.error
        "SyntacticForm.succ: bad argument SYNTACTIC_FORM_OR_NULL. This value would be out of bounds."
  succ SYNTACTIC_FORM_UNSPECIFIED = SYNTACTIC_FORM_NAMED
  succ SYNTACTIC_FORM_NAMED = SYNTACTIC_FORM_BRACKETS
  succ SYNTACTIC_FORM_BRACKETS = SYNTACTIC_FORM_BRACES
  succ SYNTACTIC_FORM_BRACES = SYNTACTIC_FORM_ARROW
  succ SYNTACTIC_FORM_ARROW = SYNTACTIC_FORM_QUESTION
  succ SYNTACTIC_FORM_QUESTION = SYNTACTIC_FORM_OR_NULL
  succ (SyntacticForm'Unrecognized _)
    = Prelude.error
        "SyntacticForm.succ: bad argument: unrecognized value"
  pred SYNTACTIC_FORM_UNSPECIFIED
    = Prelude.error
        "SyntacticForm.pred: bad argument SYNTACTIC_FORM_UNSPECIFIED. This value would be out of bounds."
  pred SYNTACTIC_FORM_NAMED = SYNTACTIC_FORM_UNSPECIFIED
  pred SYNTACTIC_FORM_BRACKETS = SYNTACTIC_FORM_NAMED
  pred SYNTACTIC_FORM_BRACES = SYNTACTIC_FORM_BRACKETS
  pred SYNTACTIC_FORM_ARROW = SYNTACTIC_FORM_BRACES
  pred SYNTACTIC_FORM_QUESTION = SYNTACTIC_FORM_ARROW
  pred SYNTACTIC_FORM_OR_NULL = SYNTACTIC_FORM_QUESTION
  pred (SyntacticForm'Unrecognized _)
    = Prelude.error
        "SyntacticForm.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault SyntacticForm where
  fieldDefault = SYNTACTIC_FORM_UNSPECIFIED
instance Control.DeepSeq.NFData SyntacticForm where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.meta' @:: Lens' TargetBlock Meta@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'meta' @:: Lens' TargetBlock (Prelude.Maybe Meta)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.forPackage' @:: Lens' TargetBlock Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.directives' @:: Lens' TargetBlock [Directive]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'directives' @:: Lens' TargetBlock (Data.Vector.Vector Directive)@ -}
data TargetBlock
  = TargetBlock'_constructor {_TargetBlock'meta :: !(Prelude.Maybe Meta),
                              _TargetBlock'forPackage :: !Data.Text.Text,
                              _TargetBlock'directives :: !(Data.Vector.Vector Directive),
                              _TargetBlock'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TargetBlock where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField TargetBlock "meta" Meta where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TargetBlock'meta (\ x__ y__ -> x__ {_TargetBlock'meta = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField TargetBlock "maybe'meta" (Prelude.Maybe Meta) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TargetBlock'meta (\ x__ y__ -> x__ {_TargetBlock'meta = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField TargetBlock "forPackage" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TargetBlock'forPackage
           (\ x__ y__ -> x__ {_TargetBlock'forPackage = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField TargetBlock "directives" [Directive] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TargetBlock'directives
           (\ x__ y__ -> x__ {_TargetBlock'directives = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField TargetBlock "vec'directives" (Data.Vector.Vector Directive) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TargetBlock'directives
           (\ x__ y__ -> x__ {_TargetBlock'directives = y__}))
        Prelude.id
instance Data.ProtoLens.Message TargetBlock where
  messageName _ = Data.Text.pack "tdl.ir.v1.TargetBlock"
  packedMessageDescriptor _
    = "\n\
      \\vTargetBlock\DC2#\n\
      \\EOTmeta\CAN\SOH \SOH(\v2\SI.tdl.ir.v1.MetaR\EOTmeta\DC2\US\n\
      \\vfor_package\CAN\STX \SOH(\tR\n\
      \forPackage\DC24\n\
      \\n\
      \directives\CAN\ETX \ETX(\v2\DC4.tdl.ir.v1.DirectiveR\n\
      \directives"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        meta__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "meta"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Meta)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'meta")) ::
              Data.ProtoLens.FieldDescriptor TargetBlock
        forPackage__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "for_package"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"forPackage")) ::
              Data.ProtoLens.FieldDescriptor TargetBlock
        directives__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "directives"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Directive)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"directives")) ::
              Data.ProtoLens.FieldDescriptor TargetBlock
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, meta__field_descriptor),
           (Data.ProtoLens.Tag 2, forPackage__field_descriptor),
           (Data.ProtoLens.Tag 3, directives__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _TargetBlock'_unknownFields
        (\ x__ y__ -> x__ {_TargetBlock'_unknownFields = y__})
  defMessage
    = TargetBlock'_constructor
        {_TargetBlock'meta = Prelude.Nothing,
         _TargetBlock'forPackage = Data.ProtoLens.fieldDefault,
         _TargetBlock'directives = Data.Vector.Generic.empty,
         _TargetBlock'_unknownFields = []}
  parseMessage
    = let
        loop ::
          TargetBlock
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Directive
             -> Data.ProtoLens.Encoding.Bytes.Parser TargetBlock
        loop x mutable'directives
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'directives <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                             (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                mutable'directives)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'directives") frozen'directives
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "meta"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"meta") y x)
                                  mutable'directives
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "for_package"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"forPackage") y x)
                                  mutable'directives
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "directives"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'directives y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'directives
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'directives <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'directives)
          "TargetBlock"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'meta") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"forPackage") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'directives") _x))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData TargetBlock where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_TargetBlock'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_TargetBlock'meta x__)
                (Control.DeepSeq.deepseq
                   (_TargetBlock'forPackage x__)
                   (Control.DeepSeq.deepseq (_TargetBlock'directives x__) ())))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.ctor' @:: Lens' Type ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'ctor' @:: Lens' Type (Prelude.Maybe ID)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.args' @:: Lens' Type [ID]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'args' @:: Lens' Type (Data.Vector.Vector ID)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.wrote' @:: Lens' Type SyntacticForm@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.position' @:: Lens' Type Position@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'position' @:: Lens' Type (Prelude.Maybe Position)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.param' @:: Lens' Type ParamRef@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'param' @:: Lens' Type (Prelude.Maybe ParamRef)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.extern' @:: Lens' Type ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'extern' @:: Lens' Type (Prelude.Maybe ID)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.unit' @:: Lens' Type ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'unit' @:: Lens' Type (Prelude.Maybe ID)@ -}
data Type
  = Type'_constructor {_Type'ctor :: !(Prelude.Maybe ID),
                       _Type'args :: !(Data.Vector.Vector ID),
                       _Type'wrote :: !SyntacticForm,
                       _Type'position :: !(Prelude.Maybe Position),
                       _Type'param :: !(Prelude.Maybe ParamRef),
                       _Type'extern :: !(Prelude.Maybe ID),
                       _Type'unit :: !(Prelude.Maybe ID),
                       _Type'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Type where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Type "ctor" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'ctor (\ x__ y__ -> x__ {_Type'ctor = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Type "maybe'ctor" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'ctor (\ x__ y__ -> x__ {_Type'ctor = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Type "args" [ID] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'args (\ x__ y__ -> x__ {_Type'args = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Type "vec'args" (Data.Vector.Vector ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'args (\ x__ y__ -> x__ {_Type'args = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Type "wrote" SyntacticForm where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'wrote (\ x__ y__ -> x__ {_Type'wrote = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Type "position" Position where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'position (\ x__ y__ -> x__ {_Type'position = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Type "maybe'position" (Prelude.Maybe Position) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'position (\ x__ y__ -> x__ {_Type'position = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Type "param" ParamRef where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'param (\ x__ y__ -> x__ {_Type'param = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Type "maybe'param" (Prelude.Maybe ParamRef) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'param (\ x__ y__ -> x__ {_Type'param = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Type "extern" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'extern (\ x__ y__ -> x__ {_Type'extern = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Type "maybe'extern" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'extern (\ x__ y__ -> x__ {_Type'extern = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Type "unit" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'unit (\ x__ y__ -> x__ {_Type'unit = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Type "maybe'unit" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'unit (\ x__ y__ -> x__ {_Type'unit = y__}))
        Prelude.id
instance Data.ProtoLens.Message Type where
  messageName _ = Data.Text.pack "tdl.ir.v1.Type"
  packedMessageDescriptor _
    = "\n\
      \\EOTType\DC2!\n\
      \\EOTctor\CAN\SOH \SOH(\v2\r.tdl.ir.v1.IDR\EOTctor\DC2!\n\
      \\EOTargs\CAN\STX \ETX(\v2\r.tdl.ir.v1.IDR\EOTargs\DC2.\n\
      \\ENQwrote\CAN\ETX \SOH(\SO2\CAN.tdl.ir.v1.SyntacticFormR\ENQwrote\DC2/\n\
      \\bposition\CAN\EOT \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\DC2)\n\
      \\ENQparam\CAN\ENQ \SOH(\v2\DC3.tdl.ir.v1.ParamRefR\ENQparam\DC2%\n\
      \\ACKextern\CAN\ACK \SOH(\v2\r.tdl.ir.v1.IDR\ACKextern\DC2!\n\
      \\EOTunit\CAN\a \SOH(\v2\r.tdl.ir.v1.IDR\EOTunit"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        ctor__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "ctor"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'ctor")) ::
              Data.ProtoLens.FieldDescriptor Type
        args__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "args"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"args")) ::
              Data.ProtoLens.FieldDescriptor Type
        wrote__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "wrote"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor SyntacticForm)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"wrote")) ::
              Data.ProtoLens.FieldDescriptor Type
        position__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "position"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Position)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'position")) ::
              Data.ProtoLens.FieldDescriptor Type
        param__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "param"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ParamRef)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'param")) ::
              Data.ProtoLens.FieldDescriptor Type
        extern__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "extern"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'extern")) ::
              Data.ProtoLens.FieldDescriptor Type
        unit__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "unit"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'unit")) ::
              Data.ProtoLens.FieldDescriptor Type
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, ctor__field_descriptor),
           (Data.ProtoLens.Tag 2, args__field_descriptor),
           (Data.ProtoLens.Tag 3, wrote__field_descriptor),
           (Data.ProtoLens.Tag 4, position__field_descriptor),
           (Data.ProtoLens.Tag 5, param__field_descriptor),
           (Data.ProtoLens.Tag 6, extern__field_descriptor),
           (Data.ProtoLens.Tag 7, unit__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Type'_unknownFields
        (\ x__ y__ -> x__ {_Type'_unknownFields = y__})
  defMessage
    = Type'_constructor
        {_Type'ctor = Prelude.Nothing,
         _Type'args = Data.Vector.Generic.empty,
         _Type'wrote = Data.ProtoLens.fieldDefault,
         _Type'position = Prelude.Nothing, _Type'param = Prelude.Nothing,
         _Type'extern = Prelude.Nothing, _Type'unit = Prelude.Nothing,
         _Type'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Type
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld ID
             -> Data.ProtoLens.Encoding.Bytes.Parser Type
        loop x mutable'args
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'args <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'args)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'args") frozen'args x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "ctor"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"ctor") y x)
                                  mutable'args
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "args"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'args y)
                                loop x v
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "wrote"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"wrote") y x)
                                  mutable'args
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "position"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"position") y x)
                                  mutable'args
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "param"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"param") y x)
                                  mutable'args
                        50
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "extern"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"extern") y x)
                                  mutable'args
                        58
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "unit"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"unit") y x)
                                  mutable'args
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'args
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'args <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'args)
          "Type"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'ctor") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'args") _x))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"wrote") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                               Prelude.fromEnum _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'position") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                ((Prelude..)
                                   (\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                   Data.ProtoLens.encodeMessage _v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'param") _x
                          of
                            Prelude.Nothing -> Data.Monoid.mempty
                            (Prelude.Just _v)
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                   ((Prelude..)
                                      (\ bs
                                         -> (Data.Monoid.<>)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                 (Prelude.fromIntegral (Data.ByteString.length bs)))
                                              (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                      Data.ProtoLens.encodeMessage _v))
                         ((Data.Monoid.<>)
                            (case
                                 Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'extern") _x
                             of
                               Prelude.Nothing -> Data.Monoid.mempty
                               (Prelude.Just _v)
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
                                      ((Prelude..)
                                         (\ bs
                                            -> (Data.Monoid.<>)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                    (Prelude.fromIntegral
                                                       (Data.ByteString.length bs)))
                                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                         Data.ProtoLens.encodeMessage _v))
                            ((Data.Monoid.<>)
                               (case
                                    Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'unit") _x
                                of
                                  Prelude.Nothing -> Data.Monoid.mempty
                                  (Prelude.Just _v)
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                         ((Prelude..)
                                            (\ bs
                                               -> (Data.Monoid.<>)
                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                       (Prelude.fromIntegral
                                                          (Data.ByteString.length bs)))
                                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                            Data.ProtoLens.encodeMessage _v))
                               (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                  (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))))
instance Control.DeepSeq.NFData Type where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Type'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Type'ctor x__)
                (Control.DeepSeq.deepseq
                   (_Type'args x__)
                   (Control.DeepSeq.deepseq
                      (_Type'wrote x__)
                      (Control.DeepSeq.deepseq
                         (_Type'position x__)
                         (Control.DeepSeq.deepseq
                            (_Type'param x__)
                            (Control.DeepSeq.deepseq
                               (_Type'extern x__)
                               (Control.DeepSeq.deepseq (_Type'unit x__) ())))))))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.dims' @:: Lens' Unit [Dimension]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'dims' @:: Lens' Unit (Data.Vector.Vector Dimension)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.decl' @:: Lens' Unit ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'decl' @:: Lens' Unit (Prelude.Maybe ID)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.wrote' @:: Lens' Unit Data.Text.Text@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.position' @:: Lens' Unit Position@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'position' @:: Lens' Unit (Prelude.Maybe Position)@ -}
data Unit
  = Unit'_constructor {_Unit'dims :: !(Data.Vector.Vector Dimension),
                       _Unit'decl :: !(Prelude.Maybe ID),
                       _Unit'wrote :: !Data.Text.Text,
                       _Unit'position :: !(Prelude.Maybe Position),
                       _Unit'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Unit where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Unit "dims" [Dimension] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Unit'dims (\ x__ y__ -> x__ {_Unit'dims = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Unit "vec'dims" (Data.Vector.Vector Dimension) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Unit'dims (\ x__ y__ -> x__ {_Unit'dims = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Unit "decl" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Unit'decl (\ x__ y__ -> x__ {_Unit'decl = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Unit "maybe'decl" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Unit'decl (\ x__ y__ -> x__ {_Unit'decl = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Unit "wrote" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Unit'wrote (\ x__ y__ -> x__ {_Unit'wrote = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Unit "position" Position where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Unit'position (\ x__ y__ -> x__ {_Unit'position = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Unit "maybe'position" (Prelude.Maybe Position) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Unit'position (\ x__ y__ -> x__ {_Unit'position = y__}))
        Prelude.id
instance Data.ProtoLens.Message Unit where
  messageName _ = Data.Text.pack "tdl.ir.v1.Unit"
  packedMessageDescriptor _
    = "\n\
      \\EOTUnit\DC2(\n\
      \\EOTdims\CAN\SOH \ETX(\v2\DC4.tdl.ir.v1.DimensionR\EOTdims\DC2!\n\
      \\EOTdecl\CAN\STX \SOH(\v2\r.tdl.ir.v1.IDR\EOTdecl\DC2\DC4\n\
      \\ENQwrote\CAN\ETX \SOH(\tR\ENQwrote\DC2/\n\
      \\bposition\CAN\EOT \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        dims__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "dims"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Dimension)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"dims")) ::
              Data.ProtoLens.FieldDescriptor Unit
        decl__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "decl"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'decl")) ::
              Data.ProtoLens.FieldDescriptor Unit
        wrote__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "wrote"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"wrote")) ::
              Data.ProtoLens.FieldDescriptor Unit
        position__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "position"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Position)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'position")) ::
              Data.ProtoLens.FieldDescriptor Unit
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, dims__field_descriptor),
           (Data.ProtoLens.Tag 2, decl__field_descriptor),
           (Data.ProtoLens.Tag 3, wrote__field_descriptor),
           (Data.ProtoLens.Tag 4, position__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Unit'_unknownFields
        (\ x__ y__ -> x__ {_Unit'_unknownFields = y__})
  defMessage
    = Unit'_constructor
        {_Unit'dims = Data.Vector.Generic.empty,
         _Unit'decl = Prelude.Nothing,
         _Unit'wrote = Data.ProtoLens.fieldDefault,
         _Unit'position = Prelude.Nothing, _Unit'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Unit
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Dimension
             -> Data.ProtoLens.Encoding.Bytes.Parser Unit
        loop x mutable'dims
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'dims <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'dims)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'dims") frozen'dims x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "dims"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'dims y)
                                loop x v
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "decl"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"decl") y x)
                                  mutable'dims
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "wrote"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"wrote") y x)
                                  mutable'dims
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "position"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"position") y x)
                                  mutable'dims
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'dims
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'dims <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'dims)
          "Unit"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'dims") _x))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'decl") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"wrote") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                            ((Prelude..)
                               (\ bs
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                          (Prelude.fromIntegral (Data.ByteString.length bs)))
                                       (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                               Data.Text.Encoding.encodeUtf8 _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'position") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                ((Prelude..)
                                   (\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                   Data.ProtoLens.encodeMessage _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData Unit where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Unit'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Unit'dims x__)
                (Control.DeepSeq.deepseq
                   (_Unit'decl x__)
                   (Control.DeepSeq.deepseq
                      (_Unit'wrote x__)
                      (Control.DeepSeq.deepseq (_Unit'position x__) ()))))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.unit' @:: Lens' UnitDef ID@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'unit' @:: Lens' UnitDef (Prelude.Maybe ID)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.base' @:: Lens' UnitDef Prelude.Bool@ -}
data UnitDef
  = UnitDef'_constructor {_UnitDef'unit :: !(Prelude.Maybe ID),
                          _UnitDef'base :: !Prelude.Bool,
                          _UnitDef'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UnitDef where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField UnitDef "unit" ID where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UnitDef'unit (\ x__ y__ -> x__ {_UnitDef'unit = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField UnitDef "maybe'unit" (Prelude.Maybe ID) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UnitDef'unit (\ x__ y__ -> x__ {_UnitDef'unit = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UnitDef "base" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UnitDef'base (\ x__ y__ -> x__ {_UnitDef'base = y__}))
        Prelude.id
instance Data.ProtoLens.Message UnitDef where
  messageName _ = Data.Text.pack "tdl.ir.v1.UnitDef"
  packedMessageDescriptor _
    = "\n\
      \\aUnitDef\DC2!\n\
      \\EOTunit\CAN\SOH \SOH(\v2\r.tdl.ir.v1.IDR\EOTunit\DC2\DC2\n\
      \\EOTbase\CAN\STX \SOH(\bR\EOTbase"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        unit__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "unit"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ID)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'unit")) ::
              Data.ProtoLens.FieldDescriptor UnitDef
        base__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "base"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"base")) ::
              Data.ProtoLens.FieldDescriptor UnitDef
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, unit__field_descriptor),
           (Data.ProtoLens.Tag 2, base__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UnitDef'_unknownFields
        (\ x__ y__ -> x__ {_UnitDef'_unknownFields = y__})
  defMessage
    = UnitDef'_constructor
        {_UnitDef'unit = Prelude.Nothing,
         _UnitDef'base = Data.ProtoLens.fieldDefault,
         _UnitDef'_unknownFields = []}
  parseMessage
    = let
        loop :: UnitDef -> Data.ProtoLens.Encoding.Bytes.Parser UnitDef
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "unit"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"unit") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "base"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"base") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "UnitDef"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'unit") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"base") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                            _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData UnitDef where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_UnitDef'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_UnitDef'unit x__)
                (Control.DeepSeq.deepseq (_UnitDef'base x__) ()))
{- | Fields :
     
         * 'Proto.Tdl.Ir.V1.Ir_Fields.meta' @:: Lens' Variant Meta@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.maybe'meta' @:: Lens' Variant (Prelude.Maybe Meta)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.fields' @:: Lens' Variant [Field]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'fields' @:: Lens' Variant (Data.Vector.Vector Field)@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.directives' @:: Lens' Variant [Directive]@
         * 'Proto.Tdl.Ir.V1.Ir_Fields.vec'directives' @:: Lens' Variant (Data.Vector.Vector Directive)@ -}
data Variant
  = Variant'_constructor {_Variant'meta :: !(Prelude.Maybe Meta),
                          _Variant'fields :: !(Data.Vector.Vector Field),
                          _Variant'directives :: !(Data.Vector.Vector Directive),
                          _Variant'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Variant where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Variant "meta" Meta where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Variant'meta (\ x__ y__ -> x__ {_Variant'meta = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Variant "maybe'meta" (Prelude.Maybe Meta) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Variant'meta (\ x__ y__ -> x__ {_Variant'meta = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Variant "fields" [Field] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Variant'fields (\ x__ y__ -> x__ {_Variant'fields = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Variant "vec'fields" (Data.Vector.Vector Field) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Variant'fields (\ x__ y__ -> x__ {_Variant'fields = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Variant "directives" [Directive] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Variant'directives (\ x__ y__ -> x__ {_Variant'directives = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Variant "vec'directives" (Data.Vector.Vector Directive) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Variant'directives (\ x__ y__ -> x__ {_Variant'directives = y__}))
        Prelude.id
instance Data.ProtoLens.Message Variant where
  messageName _ = Data.Text.pack "tdl.ir.v1.Variant"
  packedMessageDescriptor _
    = "\n\
      \\aVariant\DC2#\n\
      \\EOTmeta\CAN\SOH \SOH(\v2\SI.tdl.ir.v1.MetaR\EOTmeta\DC2(\n\
      \\ACKfields\CAN\STX \ETX(\v2\DLE.tdl.ir.v1.FieldR\ACKfields\DC24\n\
      \\n\
      \directives\CAN\ETX \ETX(\v2\DC4.tdl.ir.v1.DirectiveR\n\
      \directives"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        meta__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "meta"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Meta)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'meta")) ::
              Data.ProtoLens.FieldDescriptor Variant
        fields__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "fields"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Field)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"fields")) ::
              Data.ProtoLens.FieldDescriptor Variant
        directives__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "directives"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Directive)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"directives")) ::
              Data.ProtoLens.FieldDescriptor Variant
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, meta__field_descriptor),
           (Data.ProtoLens.Tag 2, fields__field_descriptor),
           (Data.ProtoLens.Tag 3, directives__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Variant'_unknownFields
        (\ x__ y__ -> x__ {_Variant'_unknownFields = y__})
  defMessage
    = Variant'_constructor
        {_Variant'meta = Prelude.Nothing,
         _Variant'fields = Data.Vector.Generic.empty,
         _Variant'directives = Data.Vector.Generic.empty,
         _Variant'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Variant
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Directive
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Field
                -> Data.ProtoLens.Encoding.Bytes.Parser Variant
        loop x mutable'directives mutable'fields
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'directives <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                             (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                mutable'directives)
                      frozen'fields <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'fields)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'directives") frozen'directives
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'fields") frozen'fields x)))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "meta"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"meta") y x)
                                  mutable'directives mutable'fields
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "fields"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'fields y)
                                loop x mutable'directives v
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "directives"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'directives y)
                                loop x v mutable'fields
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'directives mutable'fields
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'directives <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      Data.ProtoLens.Encoding.Growing.new
              mutable'fields <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'directives mutable'fields)
          "Variant"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'meta") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'fields") _x))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'directives") _x))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Variant where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Variant'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Variant'meta x__)
                (Control.DeepSeq.deepseq
                   (_Variant'fields x__)
                   (Control.DeepSeq.deepseq (_Variant'directives x__) ())))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\DC2tdl/ir/v1/ir.proto\DC2\ttdl.ir.v1\SUB!google/protobuf/go_features.proto\".\n\
    \\STXID\DC2\DC4\n\
    \\ENQindex\CAN\SOH \SOH(\ENQR\ENQindex\DC2\DC2\n\
    \\EOTname\CAN\STX \SOH(\tR\EOTname\"R\n\
    \\bPosition\DC2\SUB\n\
    \\bfilename\CAN\SOH \SOH(\tR\bfilename\DC2\DC2\n\
    \\EOTline\CAN\STX \SOH(\ENQR\EOTline\DC2\SYN\n\
    \\ACKcolumn\CAN\ETX \SOH(\ENQR\ACKcolumn\"V\n\
    \\vDeprecation\DC2\SYN\n\
    \\ACKreason\CAN\SOH \SOH(\tR\ACKreason\DC2/\n\
    \\bposition\CAN\STX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\"\171\SOH\n\
    \\EOTMeta\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\DLE\n\
    \\ETXdoc\CAN\STX \ETX(\tR\ETXdoc\DC2/\n\
    \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\DC26\n\
    \\n\
    \deprecated\CAN\EOT \SOH(\v2\SYN.tdl.ir.v1.DeprecationR\n\
    \deprecated\DC2\DC4\n\
    \\ENQorder\CAN\ENQ \SOH(\ENQR\ENQorder\"\158\ETX\n\
    \\ENQModel\DC2\CAN\n\
    \\apackage\CAN\SOH \SOH(\tR\apackage\DC2%\n\
    \\ENQdecls\CAN\STX \ETX(\v2\SI.tdl.ir.v1.DeclR\ENQdecls\DC2%\n\
    \\ENQtypes\CAN\ETX \ETX(\v2\SI.tdl.ir.v1.TypeR\ENQtypes\DC2+\n\
    \\aimports\CAN\EOT \ETX(\v2\DC1.tdl.ir.v1.ImportR\aimports\DC2+\n\
    \\aexterns\CAN\ENQ \ETX(\v2\DC1.tdl.ir.v1.ExternR\aexterns\DC21\n\
    \\tinstances\CAN\ACK \ETX(\v2\DC3.tdl.ir.v1.InstanceR\tinstances\DC25\n\
    \\tsatisfies\CAN\a \ETX(\v2\ETB.tdl.ir.v1.SatisfactionR\tsatisfies\DC20\n\
    \\atargets\CAN\b \ETX(\v2\SYN.tdl.ir.v1.TargetBlockR\atargets\DC2%\n\
    \\ENQunits\CAN\t \ETX(\v2\SI.tdl.ir.v1.UnitR\ENQunits\DC2\DLE\n\
    \\ETXdoc\CAN\n\
    \ \ETX(\tR\ETXdoc\"\137\SOH\n\
    \\vTargetBlock\DC2#\n\
    \\EOTmeta\CAN\SOH \SOH(\v2\SI.tdl.ir.v1.MetaR\EOTmeta\DC2\US\n\
    \\vfor_package\CAN\STX \SOH(\tR\n\
    \forPackage\DC24\n\
    \\n\
    \directives\CAN\ETX \ETX(\v2\DC4.tdl.ir.v1.DirectiveR\n\
    \directives\"\190\SOH\n\
    \\tDirective\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2&\n\
    \\EOTargs\CAN\STX \ETX(\v2\DC2.tdl.ir.v1.LiteralR\EOTargs\DC2/\n\
    \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\DC2\SYN\n\
    \\ACKtarget\CAN\EOT \SOH(\tR\ACKtarget\DC2,\n\
    \\n\
    \from_class\CAN\ENQ \SOH(\v2\r.tdl.ir.v1.IDR\tfromClass\"\225\SOH\n\
    \\bInstance\DC2#\n\
    \\EOTmeta\CAN\SOH \SOH(\v2\SI.tdl.ir.v1.MetaR\EOTmeta\DC2(\n\
    \\ACKparams\CAN\STX \ETX(\v2\DLE.tdl.ir.v1.ParamR\ACKparams\DC2)\n\
    \\ENQclass\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.ClassRefR\ENQclass\DC2/\n\
    \\brequires\CAN\EOT \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\brequires\DC2*\n\
    \\ENQbinds\CAN\ENQ \ETX(\v2\DC4.tdl.ir.v1.AssocBindR\ENQbinds\"s\n\
    \\tAssocBind\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2!\n\
    \\EOTtype\CAN\STX \SOH(\v2\r.tdl.ir.v1.IDR\EOTtype\DC2/\n\
    \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\"\170\SOH\n\
    \\bClassRef\DC2#\n\
    \\ENQclass\CAN\SOH \SOH(\v2\r.tdl.ir.v1.IDR\ENQclass\DC2%\n\
    \\ACKextern\CAN\STX \SOH(\v2\r.tdl.ir.v1.IDR\ACKextern\DC2!\n\
    \\EOTargs\CAN\ETX \ETX(\v2\r.tdl.ir.v1.IDR\EOTargs\DC2/\n\
    \\bposition\CAN\EOT \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\"}\n\
    \\fSatisfaction\DC2#\n\
    \\ENQclass\CAN\SOH \SOH(\v2\r.tdl.ir.v1.IDR\ENQclass\DC2#\n\
    \\ENQdecls\CAN\STX \ETX(\v2\r.tdl.ir.v1.IDR\ENQdecls\DC2#\n\
    \\ENQtypes\CAN\ETX \ETX(\v2\r.tdl.ir.v1.IDR\ENQtypes\"\179\SOH\n\
    \\ACKImport\DC2\DC2\n\
    \\EOTpath\CAN\SOH \SOH(\tR\EOTpath\DC2\DC4\n\
    \\ENQalias\CAN\STX \SOH(\tR\ENQalias\DC2\CAN\n\
    \\apackage\CAN\ETX \SOH(\tR\apackage\DC2/\n\
    \\bposition\CAN\EOT \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\DC24\n\
    \\n\
    \directives\CAN\ENQ \ETX(\v2\DC4.tdl.ir.v1.DirectiveR\n\
    \directives\"\157\SOH\n\
    \\ACKExtern\DC2\CAN\n\
    \\apackage\CAN\SOH \SOH(\tR\apackage\DC2\DC2\n\
    \\EOTname\CAN\STX \SOH(\tR\EOTname\DC2/\n\
    \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\DC24\n\
    \\n\
    \directives\CAN\EOT \ETX(\v2\DC4.tdl.ir.v1.DirectiveR\n\
    \directives\"\181\ETX\n\
    \\EOTDecl\DC2#\n\
    \\EOTmeta\CAN\SOH \SOH(\v2\SI.tdl.ir.v1.MetaR\EOTmeta\DC24\n\
    \\n\
    \directives\CAN\b \ETX(\v2\DC4.tdl.ir.v1.DirectiveR\n\
    \directives\DC24\n\
    \\tprimitive\CAN\STX \SOH(\v2\DC4.tdl.ir.v1.PrimitiveH\NULR\tprimitive\DC2(\n\
    \\ENQalias\CAN\ETX \SOH(\v2\DLE.tdl.ir.v1.AliasH\NULR\ENQalias\DC2.\n\
    \\anewtype\CAN\EOT \SOH(\v2\DC2.tdl.ir.v1.NewtypeH\NULR\anewtype\DC21\n\
    \\tstructure\CAN\ENQ \SOH(\v2\DC1.tdl.ir.v1.StructH\NULR\tstructure\DC23\n\
    \\venumeration\CAN\ACK \SOH(\v2\SI.tdl.ir.v1.EnumH\NULR\venumeration\DC2(\n\
    \\ENQclass\CAN\a \SOH(\v2\DLE.tdl.ir.v1.ClassH\NULR\ENQclass\DC2(\n\
    \\EOTunit\CAN\t \SOH(\v2\DC2.tdl.ir.v1.UnitDefH\NULR\EOTunitB\ACK\n\
    \\EOTnode\"\203\STX\n\
    \\ENQClass\DC2(\n\
    \\ACKparams\CAN\SOH \ETX(\v2\DLE.tdl.ir.v1.ParamR\ACKparams\DC2,\n\
    \\bfun_deps\CAN\STX \ETX(\v2\DC1.tdl.ir.v1.FunDepR\afunDeps\DC2>\n\
    \\DLErequires_classes\CAN\ETX \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\SIrequiresClasses\DC25\n\
    \\vconstraints\CAN\EOT \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\vconstraints\DC2(\n\
    \\ACKfields\CAN\ENQ \ETX(\v2\DLE.tdl.ir.v1.FieldR\ACKfields\DC25\n\
    \\vassoc_types\CAN\a \ETX(\v2\DC4.tdl.ir.v1.AssocTypeR\n\
    \assocTypesJ\EOT\b\ACK\DLE\aR\frequires_key\"]\n\
    \\ACKFunDep\DC2\DC2\n\
    \\EOTfrom\CAN\SOH \ETX(\tR\EOTfrom\DC2\SO\n\
    \\STXto\CAN\STX \ETX(\tR\STXto\DC2/\n\
    \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\"U\n\
    \\tAssocType\DC2#\n\
    \\EOTmeta\CAN\SOH \SOH(\v2\SI.tdl.ir.v1.MetaR\EOTmeta\DC2#\n\
    \\EOTkind\CAN\STX \SOH(\v2\SI.tdl.ir.v1.KindR\EOTkind\"0\n\
    \\tPrimitive\DC2#\n\
    \\EOTkind\CAN\SOH \SOH(\v2\SI.tdl.ir.v1.KindR\EOTkind\"@\n\
    \\aUnitDef\DC2!\n\
    \\EOTunit\CAN\SOH \SOH(\v2\r.tdl.ir.v1.IDR\EOTunit\DC2\DC2\n\
    \\EOTbase\CAN\STX \SOH(\bR\EOTbase\"J\n\
    \\tDimension\DC2!\n\
    \\EOTbase\CAN\SOH \SOH(\v2\r.tdl.ir.v1.IDR\EOTbase\DC2\SUB\n\
    \\bexponent\CAN\STX \SOH(\ENQR\bexponent\"\154\SOH\n\
    \\EOTUnit\DC2(\n\
    \\EOTdims\CAN\SOH \ETX(\v2\DC4.tdl.ir.v1.DimensionR\EOTdims\DC2!\n\
    \\EOTdecl\CAN\STX \SOH(\v2\r.tdl.ir.v1.IDR\EOTdecl\DC2\DC4\n\
    \\ENQwrote\CAN\ETX \SOH(\tR\ENQwrote\DC2/\n\
    \\bposition\CAN\EOT \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\"X\n\
    \\ENQAlias\DC2(\n\
    \\ACKparams\CAN\SOH \ETX(\v2\DLE.tdl.ir.v1.ParamR\ACKparams\DC2%\n\
    \\ACKtarget\CAN\STX \SOH(\v2\r.tdl.ir.v1.IDR\ACKtarget\"\209\SOH\n\
    \\aNewtype\DC2(\n\
    \\ACKparams\CAN\SOH \ETX(\v2\DLE.tdl.ir.v1.ParamR\ACKparams\DC2!\n\
    \\EOTbase\CAN\STX \SOH(\v2\r.tdl.ir.v1.IDR\EOTbase\DC25\n\
    \\vconstraints\CAN\ETX \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\vconstraints\DC2B\n\
    \\DC1value_constraints\CAN\EOT \ETX(\v2\NAK.tdl.ir.v1.ConstraintR\DLEvalueConstraints\"\245\SOH\n\
    \\aLiteral\DC2*\n\
    \\EOTkind\CAN\SOH \SOH(\SO2\SYN.tdl.ir.v1.LiteralKindR\EOTkind\DC2\DC2\n\
    \\EOTtext\CAN\STX \SOH(\tR\EOTtext\DC2(\n\
    \\ENQitems\CAN\ETX \ETX(\v2\DC2.tdl.ir.v1.LiteralR\ENQitems\DC2&\n\
    \\ENQrange\CAN\EOT \SOH(\v2\DLE.tdl.ir.v1.RangeR\ENQrange\DC2/\n\
    \\bposition\CAN\ENQ \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\DC2'\n\
    \\avariant\CAN\ACK \SOH(\v2\r.tdl.ir.v1.IDR\avariant\";\n\
    \\ENQRange\DC2\ETB\n\
    \\ETXlow\CAN\SOH \SOH(\ETXR\ETXlowB\ENQ\170\SOH\STX\b\SOH\DC2\EM\n\
    \\EOThigh\CAN\STX \SOH(\ETXR\EOThighB\ENQ\170\SOH\STX\b\SOH\"\156\SOH\n\
    \\n\
    \Constraint\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2&\n\
    \\EOTargs\CAN\STX \ETX(\v2\DC2.tdl.ir.v1.LiteralR\EOTargs\DC2/\n\
    \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\DC2!\n\
    \\EOTfrom\CAN\EOT \SOH(\v2\r.tdl.ir.v1.IDR\EOTfrom\"\239\SOH\n\
    \\ACKStruct\DC2)\n\
    \\EOTkind\CAN\SOH \SOH(\SO2\NAK.tdl.ir.v1.StructKindR\EOTkind\DC2(\n\
    \\ACKparams\CAN\STX \ETX(\v2\DLE.tdl.ir.v1.ParamR\ACKparams\DC2(\n\
    \\ACKfields\CAN\ETX \ETX(\v2\DLE.tdl.ir.v1.FieldR\ACKfields\DC2/\n\
    \\bconforms\CAN\EOT \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\bconforms\DC25\n\
    \\vconstraints\CAN\ENQ \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\vconstraints\"\200\SOH\n\
    \\EOTEnum\DC2(\n\
    \\ACKparams\CAN\SOH \ETX(\v2\DLE.tdl.ir.v1.ParamR\ACKparams\DC2.\n\
    \\bvariants\CAN\STX \ETX(\v2\DC2.tdl.ir.v1.VariantR\bvariants\DC2/\n\
    \\bconforms\CAN\ETX \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\bconforms\DC25\n\
    \\vconstraints\CAN\EOT \ETX(\v2\DC3.tdl.ir.v1.ClassRefR\vconstraints\"\142\SOH\n\
    \\aVariant\DC2#\n\
    \\EOTmeta\CAN\SOH \SOH(\v2\SI.tdl.ir.v1.MetaR\EOTmeta\DC2(\n\
    \\ACKfields\CAN\STX \ETX(\v2\DLE.tdl.ir.v1.FieldR\ACKfields\DC24\n\
    \\n\
    \directives\CAN\ETX \ETX(\v2\DC4.tdl.ir.v1.DirectiveR\n\
    \directives\"\204\STX\n\
    \\ENQField\DC2#\n\
    \\EOTmeta\CAN\SOH \SOH(\v2\SI.tdl.ir.v1.MetaR\EOTmeta\DC2!\n\
    \\EOTtype\CAN\STX \SOH(\v2\r.tdl.ir.v1.IDR\EOTtype\DC2\DC4\n\
    \\ENQowned\CAN\EOT \SOH(\bR\ENQowned\DC27\n\
    \\vconstraints\CAN\ACK \ETX(\v2\NAK.tdl.ir.v1.ConstraintR\vconstraints\DC27\n\
    \\rdefault_value\CAN\a \SOH(\v2\DC2.tdl.ir.v1.LiteralR\fdefaultValue\DC24\n\
    \\n\
    \directives\CAN\b \ETX(\v2\DC4.tdl.ir.v1.DirectiveR\n\
    \directives\DC22\n\
    \\rincluded_from\CAN\ENQ \SOH(\v2\r.tdl.ir.v1.IDR\fincludedFromJ\EOT\b\ETX\DLE\EOTR\ETXkey\"q\n\
    \\ENQParam\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2#\n\
    \\EOTkind\CAN\STX \SOH(\v2\SI.tdl.ir.v1.KindR\EOTkind\DC2/\n\
    \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\"}\n\
    \\EOTKind\DC2'\n\
    \\EOTatom\CAN\SOH \SOH(\SO2\DC3.tdl.ir.v1.KindAtomR\EOTatom\DC2%\n\
    \\ENQparen\CAN\STX \SOH(\v2\SI.tdl.ir.v1.KindR\ENQparen\DC2%\n\
    \\ENQarrow\CAN\ETX \SOH(\v2\SI.tdl.ir.v1.KindR\ENQarrow\"\162\STX\n\
    \\EOTType\DC2!\n\
    \\EOTctor\CAN\SOH \SOH(\v2\r.tdl.ir.v1.IDR\EOTctor\DC2!\n\
    \\EOTargs\CAN\STX \ETX(\v2\r.tdl.ir.v1.IDR\EOTargs\DC2.\n\
    \\ENQwrote\CAN\ETX \SOH(\SO2\CAN.tdl.ir.v1.SyntacticFormR\ENQwrote\DC2/\n\
    \\bposition\CAN\EOT \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition\DC2)\n\
    \\ENQparam\CAN\ENQ \SOH(\v2\DC3.tdl.ir.v1.ParamRefR\ENQparam\DC2%\n\
    \\ACKextern\CAN\ACK \SOH(\v2\r.tdl.ir.v1.IDR\ACKextern\DC2!\n\
    \\EOTunit\CAN\a \SOH(\v2\r.tdl.ir.v1.IDR\EOTunit\"Y\n\
    \\bParamRef\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\DC4\n\
    \\ENQindex\CAN\STX \SOH(\ENQR\ENQindex\DC2#\n\
    \\ENQowner\CAN\ETX \SOH(\v2\r.tdl.ir.v1.IDR\ENQowner*\231\SOH\n\
    \\vLiteralKind\DC2\FS\n\
    \\CANLITERAL_KIND_UNSPECIFIED\DLE\NUL\DC2\ETB\n\
    \\DC3LITERAL_KIND_STRING\DLE\SOH\DC2\DC4\n\
    \\DLELITERAL_KIND_INT\DLE\STX\DC2\SYN\n\
    \\DC2LITERAL_KIND_FLOAT\DLE\ETX\DC2\NAK\n\
    \\DC1LITERAL_KIND_BOOL\DLE\EOT\DC2\NAK\n\
    \\DC1LITERAL_KIND_NAME\DLE\ENQ\DC2\SYN\n\
    \\DC2LITERAL_KIND_REGEX\DLE\ACK\DC2\NAK\n\
    \\DC1LITERAL_KIND_LIST\DLE\a\DC2\SYN\n\
    \\DC2LITERAL_KIND_RANGE\DLE\b*o\n\
    \\n\
    \StructKind\DC2\ESC\n\
    \\ETBSTRUCT_KIND_UNSPECIFIED\DLE\NUL\DC2\SYN\n\
    \\DC2STRUCT_KIND_ENTITY\DLE\SOH\DC2\NAK\n\
    \\DC1STRUCT_KIND_VALUE\DLE\STX\DC2\NAK\n\
    \\DC1STRUCT_KIND_MIXIN\DLE\ETX*M\n\
    \\bKindAtom\DC2\EM\n\
    \\NAKKIND_ATOM_UNSPECIFIED\DLE\NUL\DC2\DC2\n\
    \\SOKIND_ATOM_TYPE\DLE\SOH\DC2\DC2\n\
    \\SOKIND_ATOM_UNIT\DLE\STX*\212\SOH\n\
    \\rSyntacticForm\DC2\RS\n\
    \\SUBSYNTACTIC_FORM_UNSPECIFIED\DLE\NUL\DC2\CAN\n\
    \\DC4SYNTACTIC_FORM_NAMED\DLE\SOH\DC2\ESC\n\
    \\ETBSYNTACTIC_FORM_BRACKETS\DLE\STX\DC2\EM\n\
    \\NAKSYNTACTIC_FORM_BRACES\DLE\ETX\DC2\CAN\n\
    \\DC4SYNTACTIC_FORM_ARROW\DLE\EOT\DC2\ESC\n\
    \\ETBSYNTACTIC_FORM_QUESTION\DLE\ENQ\DC2\SUB\n\
    \\SYNSYNTACTIC_FORM_OR_NULL\DLE\ACKB\n\
    \\146\ETX\a\b\STX\210>\STX\DLE\SOHJ\148\148\SOH\n\
    \\a\DC2\ENQ\EOT\NUL\159\ETX\SOH\n\
    \\205\SOH\n\
    \\SOH\f\DC2\ETX\EOT\NUL\DC1\SUB\194\SOH The TDL intermediate representation: the resolved semantic model that\n\
    \ backends consume, in-process and over the plugin protocol.\n\
    \\n\
    \ See docs/design/ir.md for the decisions this schema encodes.\n\
    \\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ACK\NUL\DC2\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\b\NUL+\n\
    \\b\n\
    \\SOH\b\DC2\ETX\f\NUL-\n\
    \h\n\
    \\ENQ\b2\234\a\STX\DC2\ETX\f\NUL-\SUBZ Keep the open Go API these types were published with; backends\n\
    \ construct them directly.\n\
    \\n\
    \\b\n\
    \\SOH\b\DC2\ETX\SO\NUL*\n\
    \P\n\
    \\ETX\b2\SOH\DC2\ETX\SO\NUL*\SUBD Implicit presence, as in proto3. A field wanting presence says so.\n\
    \\n\
    \\239\STX\n\
    \\STX\EOT\NUL\DC2\EOT\EM\NUL\FS\SOH\SUB\226\STX ID references a node by its index into a table and by its fully qualified\n\
    \ name.\n\
    \\n\
    \ Lookups use the index. Diagnostics, dumps, and target paths use the name,\n\
    \ which is stable across edits. The field holding an ID fixes which table it\n\
    \ indexes.\n\
    \\n\
    \ An index of -1 means the name did not resolve; lowering reports it, and\n\
    \ the name records what was written.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\EM\b\n\
    \\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\SUB\STX\DC2\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX\SUB\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\SUB\b\r\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\SUB\DLE\DC1\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX\ESC\STX\DC2\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\ETX\ESC\STX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX\ESC\t\r\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX\ESC\DLE\DC1\n\
    \6\n\
    \\STX\EOT\SOH\DC2\EOT\US\NUL#\SOH\SUB* Position is a location in a source file.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX\US\b\DLE\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX \STX\SYN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETX \STX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX \t\DC1\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX \DC4\NAK\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETX!\STX\DC1\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ENQ\DC2\ETX!\STX\a\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETX!\b\f\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETX!\SI\DLE\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETX\"\STX\DC3\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ENQ\DC2\ETX\"\STX\a\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETX\"\b\SO\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETX\"\DC1\DC2\n\
    \9\n\
    \\STX\EOT\STX\DC2\EOT&\NUL)\SOH\SUB- Deprecation marks a node as on its way out.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETX&\b\DC3\n\
    \-\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETX'\STX\DC4\"  empty when written without one\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\ETX'\STX\b\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETX'\t\SI\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETX'\DC2\DC3\n\
    \\v\n\
    \\EOT\EOT\STX\STX\SOH\DC2\ETX(\STX\CAN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ACK\DC2\ETX(\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\ETX(\v\DC3\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\ETX(\SYN\ETB\n\
    \\135\SOH\n\
    \\STX\EOT\ETX\DC2\EOT.\NUL4\SOH\SUB{ Meta is the source information every node carries.\n\
    \\n\
    \ order is the position among siblings, so generated output is stable.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\ETX\SOH\DC2\ETX.\b\f\n\
    \C\n\
    \\EOT\EOT\ETX\STX\NUL\DC2\ETX/\STX\DC2\"6 fully qualified for a declaration, bare for a member\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ENQ\DC2\ETX/\STX\b\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\ETX/\t\r\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\ETX/\DLE\DC1\n\
    \\v\n\
    \\EOT\EOT\ETX\STX\SOH\DC2\ETX0\STX\SUB\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\EOT\DC2\ETX0\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\ENQ\DC2\ETX0\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\SOH\DC2\ETX0\DC2\NAK\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\ETX\DC2\ETX0\CAN\EM\n\
    \\v\n\
    \\EOT\EOT\ETX\STX\STX\DC2\ETX1\STX\CAN\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\STX\ACK\DC2\ETX1\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\STX\SOH\DC2\ETX1\v\DC3\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\STX\ETX\DC2\ETX1\SYN\ETB\n\
    \(\n\
    \\EOT\EOT\ETX\STX\ETX\DC2\ETX2\STX\GS\"\ESC unset when not deprecated\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\ETX\ACK\DC2\ETX2\STX\r\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\ETX\SOH\DC2\ETX2\SO\CAN\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\ETX\ETX\DC2\ETX2\ESC\FS\n\
    \\v\n\
    \\EOT\EOT\ETX\STX\EOT\DC2\ETX3\STX\DC2\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\EOT\ENQ\DC2\ETX3\STX\a\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\EOT\SOH\DC2\ETX3\b\r\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\EOT\ETX\DC2\ETX3\DLE\DC1\n\
    \\144\STX\n\
    \\STX\EOT\EOT\DC2\EOT<\NULG\SOH\SUB\131\STX Model is one package: every declaration in it, and every type reference\n\
    \ those declarations use.\n\
    \\n\
    \ Each table is its own ID space. Declarations from imported packages are\n\
    \ not inlined; a reference into a dependency is an ID whose name carries\n\
    \ that package.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\EOT\SOH\DC2\ETX<\b\r\n\
    \\v\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\ETX=\STX\NAK\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\ETX=\STX\b\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\ETX=\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\ETX=\DC3\DC4\n\
    \\v\n\
    \\EOT\EOT\EOT\STX\SOH\DC2\ETX>\STX\SUB\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\EOT\DC2\ETX>\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\ACK\DC2\ETX>\v\SI\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\SOH\DC2\ETX>\DLE\NAK\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\ETX\DC2\ETX>\CAN\EM\n\
    \\v\n\
    \\EOT\EOT\EOT\STX\STX\DC2\ETX?\STX\SUB\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\STX\EOT\DC2\ETX?\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\STX\ACK\DC2\ETX?\v\SI\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\STX\SOH\DC2\ETX?\DLE\NAK\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\STX\ETX\DC2\ETX?\CAN\EM\n\
    \\v\n\
    \\EOT\EOT\EOT\STX\ETX\DC2\ETX@\STX\RS\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\ETX\EOT\DC2\ETX@\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\ETX\ACK\DC2\ETX@\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\ETX\SOH\DC2\ETX@\DC2\EM\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\ETX\ETX\DC2\ETX@\FS\GS\n\
    \\v\n\
    \\EOT\EOT\EOT\STX\EOT\DC2\ETXA\STX\RS\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\EOT\EOT\DC2\ETXA\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\EOT\ACK\DC2\ETXA\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\EOT\SOH\DC2\ETXA\DC2\EM\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\EOT\ETX\DC2\ETXA\FS\GS\n\
    \\v\n\
    \\EOT\EOT\EOT\STX\ENQ\DC2\ETXB\STX\"\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\ENQ\EOT\DC2\ETXB\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\ENQ\ACK\DC2\ETXB\v\DC3\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\ENQ\SOH\DC2\ETXB\DC4\GS\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\ENQ\ETX\DC2\ETXB !\n\
    \\v\n\
    \\EOT\EOT\EOT\STX\ACK\DC2\ETXC\STX&\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\ACK\EOT\DC2\ETXC\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\ACK\ACK\DC2\ETXC\v\ETB\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\ACK\SOH\DC2\ETXC\CAN!\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\ACK\ETX\DC2\ETXC$%\n\
    \\v\n\
    \\EOT\EOT\EOT\STX\a\DC2\ETXD\STX#\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\a\EOT\DC2\ETXD\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\a\ACK\DC2\ETXD\v\SYN\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\a\SOH\DC2\ETXD\ETB\RS\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\a\ETX\DC2\ETXD!\"\n\
    \&\n\
    \\EOT\EOT\EOT\STX\b\DC2\ETXE\STX\SUB\"\EM the interned unit table\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\b\EOT\DC2\ETXE\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\b\ACK\DC2\ETXE\v\SI\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\b\SOH\DC2\ETXE\DLE\NAK\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\b\ETX\DC2\ETXE\CAN\EM\n\
    \.\n\
    \\EOT\EOT\EOT\STX\t\DC2\ETXF\STX\ESC\"! the doc comment above `package`\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\t\EOT\DC2\ETXF\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\t\ENQ\DC2\ETXF\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\t\SOH\DC2\ETXF\DC2\NAK\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\t\ETX\DC2\ETXF\CAN\SUB\n\
    \\205\SOH\n\
    \\STX\EOT\ENQ\DC2\EOTM\NULQ\SOH\SUB\192\SOH TargetBlock is one `target go for billing { ... }` block.\n\
    \\n\
    \ Resolved directives are attached to the nodes they apply to. This holds\n\
    \ only the directives that apply to the package as a whole.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\ENQ\SOH\DC2\ETXM\b\DC3\n\
    \4\n\
    \\EOT\EOT\ENQ\STX\NUL\DC2\ETXN\STX\DLE\"' name is the target name, such as \"go\"\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ACK\DC2\ETXN\STX\ACK\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\SOH\DC2\ETXN\a\v\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ETX\DC2\ETXN\SO\SI\n\
    \\v\n\
    \\EOT\EOT\ENQ\STX\SOH\DC2\ETXO\STX\EM\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\SOH\ENQ\DC2\ETXO\STX\b\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\SOH\SOH\DC2\ETXO\t\DC4\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\SOH\ETX\DC2\ETXO\ETB\CAN\n\
    \\v\n\
    \\EOT\EOT\ENQ\STX\STX\DC2\ETXP\STX$\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\STX\EOT\DC2\ETXP\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\STX\ACK\DC2\ETXP\v\DC4\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\STX\SOH\DC2\ETXP\NAK\US\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\STX\ETX\DC2\ETXP\"#\n\
    \\152\SOH\n\
    \\STX\EOT\ACK\DC2\EOTU\NUL`\SOH\SUB\139\SOH Directive is an opaque instruction to a backend. The compiler checks its\n\
    \ shape and resolves its path; the backend decides what it means.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\ACK\SOH\DC2\ETXU\b\DC1\n\
    \\v\n\
    \\EOT\EOT\ACK\STX\NUL\DC2\ETXV\STX\DC2\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\ENQ\DC2\ETXV\STX\b\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\SOH\DC2\ETXV\t\r\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\ETX\DC2\ETXV\DLE\DC1\n\
    \\v\n\
    \\EOT\EOT\ACK\STX\SOH\DC2\ETXW\STX\FS\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\SOH\EOT\DC2\ETXW\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\SOH\ACK\DC2\ETXW\v\DC2\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\SOH\SOH\DC2\ETXW\DC3\ETB\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\SOH\ETX\DC2\ETXW\SUB\ESC\n\
    \\v\n\
    \\EOT\EOT\ACK\STX\STX\DC2\ETXX\STX\CAN\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\STX\ACK\DC2\ETXX\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\STX\SOH\DC2\ETXX\v\DC3\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\STX\ETX\DC2\ETXX\SYN\ETB\n\
    \5\n\
    \\EOT\EOT\ACK\STX\ETX\DC2\ETX[\STX\DC4\SUB( target names the block this came from.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\ETX\ENQ\DC2\ETX[\STX\b\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\ETX\SOH\DC2\ETX[\t\SI\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\ETX\ETX\DC2\ETX[\DC2\DC3\n\
    \\147\SOH\n\
    \\EOT\EOT\ACK\STX\EOT\DC2\ETX_\STX\DC4\SUBo from_class is set when the directive was written against a class and\n\
    \ expanded onto everything satisfying it.\n\
    \\"\NAK indexes Model.decls\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\EOT\ACK\DC2\ETX_\STX\EOT\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\EOT\SOH\DC2\ETX_\ENQ\SI\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\EOT\ETX\DC2\ETX_\DC2\DC3\n\
    \\173\SOH\n\
    \\STX\EOT\a\DC2\EOTf\NULl\SOH\SUB\160\SOH Instance declares that a type satisfies a class.\n\
    \\n\
    \ `instance C for T` is lowered to `instance C<T>`. An instance is not a\n\
    \ type name, so it has its own table.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\a\SOH\DC2\ETXf\b\DLE\n\
    \\v\n\
    \\EOT\EOT\a\STX\NUL\DC2\ETXg\STX\DLE\n\
    \\f\n\
    \\ENQ\EOT\a\STX\NUL\ACK\DC2\ETXg\STX\ACK\n\
    \\f\n\
    \\ENQ\EOT\a\STX\NUL\SOH\DC2\ETXg\a\v\n\
    \\f\n\
    \\ENQ\EOT\a\STX\NUL\ETX\DC2\ETXg\SO\SI\n\
    \\v\n\
    \\EOT\EOT\a\STX\SOH\DC2\ETXh\STX\FS\n\
    \\f\n\
    \\ENQ\EOT\a\STX\SOH\EOT\DC2\ETXh\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\a\STX\SOH\ACK\DC2\ETXh\v\DLE\n\
    \\f\n\
    \\ENQ\EOT\a\STX\SOH\SOH\DC2\ETXh\DC1\ETB\n\
    \\f\n\
    \\ENQ\EOT\a\STX\SOH\ETX\DC2\ETXh\SUB\ESC\n\
    \\v\n\
    \\EOT\EOT\a\STX\STX\DC2\ETXi\STX\NAK\n\
    \\f\n\
    \\ENQ\EOT\a\STX\STX\ACK\DC2\ETXi\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\a\STX\STX\SOH\DC2\ETXi\v\DLE\n\
    \\f\n\
    \\ENQ\EOT\a\STX\STX\ETX\DC2\ETXi\DC3\DC4\n\
    \*\n\
    \\EOT\EOT\a\STX\ETX\DC2\ETXj\STX!\"\GS conditions on this instance\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\a\STX\ETX\EOT\DC2\ETXj\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\a\STX\ETX\ACK\DC2\ETXj\v\DC3\n\
    \\f\n\
    \\ENQ\EOT\a\STX\ETX\SOH\DC2\ETXj\DC4\FS\n\
    \\f\n\
    \\ENQ\EOT\a\STX\ETX\ETX\DC2\ETXj\US \n\
    \\v\n\
    \\EOT\EOT\a\STX\EOT\DC2\ETXk\STX\US\n\
    \\f\n\
    \\ENQ\EOT\a\STX\EOT\EOT\DC2\ETXk\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\a\STX\EOT\ACK\DC2\ETXk\v\DC4\n\
    \\f\n\
    \\ENQ\EOT\a\STX\EOT\SOH\DC2\ETXk\NAK\SUB\n\
    \\f\n\
    \\ENQ\EOT\a\STX\EOT\ETX\DC2\ETXk\GS\RS\n\
    \[\n\
    \\STX\EOT\b\DC2\EOTp\NULt\SOH\SUBO AssocBind supplies a type for one of a class's associated type\n\
    \ requirements.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\b\SOH\DC2\ETXp\b\DC1\n\
    \\v\n\
    \\EOT\EOT\b\STX\NUL\DC2\ETXq\STX\DC2\n\
    \\f\n\
    \\ENQ\EOT\b\STX\NUL\ENQ\DC2\ETXq\STX\b\n\
    \\f\n\
    \\ENQ\EOT\b\STX\NUL\SOH\DC2\ETXq\t\r\n\
    \\f\n\
    \\ENQ\EOT\b\STX\NUL\ETX\DC2\ETXq\DLE\DC1\n\
    \\"\n\
    \\EOT\EOT\b\STX\SOH\DC2\ETXr\STX\SO\"\NAK indexes Model.types\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\b\STX\SOH\ACK\DC2\ETXr\STX\EOT\n\
    \\f\n\
    \\ENQ\EOT\b\STX\SOH\SOH\DC2\ETXr\ENQ\t\n\
    \\f\n\
    \\ENQ\EOT\b\STX\SOH\ETX\DC2\ETXr\f\r\n\
    \\v\n\
    \\EOT\EOT\b\STX\STX\DC2\ETXs\STX\CAN\n\
    \\f\n\
    \\ENQ\EOT\b\STX\STX\ACK\DC2\ETXs\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\b\STX\STX\SOH\DC2\ETXs\v\DC3\n\
    \\f\n\
    \\ENQ\EOT\b\STX\STX\ETX\DC2\ETXs\SYN\ETB\n\
    \;\n\
    \\STX\EOT\t\DC2\EOTw\NUL|\SOH\SUB/ ClassRef names a class, applied to arguments.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\t\SOH\DC2\ETXw\b\DLE\n\
    \<\n\
    \\EOT\EOT\t\STX\NUL\DC2\ETXx\STX\SI\"/ indexes Model.decls; unset when extern is set\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\t\STX\NUL\ACK\DC2\ETXx\STX\EOT\n\
    \\f\n\
    \\ENQ\EOT\t\STX\NUL\SOH\DC2\ETXx\ENQ\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\t\STX\NUL\ETX\DC2\ETXx\r\SO\n\
    \$\n\
    \\EOT\EOT\t\STX\SOH\DC2\ETXy\STX\DLE\"\ETB indexes Model.externs\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\t\STX\SOH\ACK\DC2\ETXy\STX\EOT\n\
    \\f\n\
    \\ENQ\EOT\t\STX\SOH\SOH\DC2\ETXy\ENQ\v\n\
    \\f\n\
    \\ENQ\EOT\t\STX\SOH\ETX\DC2\ETXy\SO\SI\n\
    \\"\n\
    \\EOT\EOT\t\STX\STX\DC2\ETXz\STX\ETB\"\NAK indexes Model.types\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\t\STX\STX\EOT\DC2\ETXz\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\t\STX\STX\ACK\DC2\ETXz\v\r\n\
    \\f\n\
    \\ENQ\EOT\t\STX\STX\SOH\DC2\ETXz\SO\DC2\n\
    \\f\n\
    \\ENQ\EOT\t\STX\STX\ETX\DC2\ETXz\NAK\SYN\n\
    \\v\n\
    \\EOT\EOT\t\STX\ETX\DC2\ETX{\STX\CAN\n\
    \\f\n\
    \\ENQ\EOT\t\STX\ETX\ACK\DC2\ETX{\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\t\STX\ETX\SOH\DC2\ETX{\v\DC3\n\
    \\f\n\
    \\ENQ\EOT\t\STX\ETX\ETX\DC2\ETX{\SYN\ETB\n\
    \\230\SOH\n\
    \\STX\EOT\n\
    \\DC2\ACK\131\SOH\NUL\141\SOH\SOH\SUB\215\SOH Satisfaction is the computed answer to \"what satisfies this class\",\n\
    \ closed over the classes a class requires.\n\
    \\n\
    \ A backend applying a class-scoped target directive reads this instead\n\
    \ of reasoning about instances.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\n\
    \\SOH\DC2\EOT\131\SOH\b\DC4\n\
    \#\n\
    \\EOT\EOT\n\
    \\STX\NUL\DC2\EOT\132\SOH\STX\SI\"\NAK indexes Model.decls\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\ACK\DC2\EOT\132\SOH\STX\EOT\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\SOH\DC2\EOT\132\SOH\ENQ\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\ETX\DC2\EOT\132\SOH\r\SO\n\
    \#\n\
    \\EOT\EOT\n\
    \\STX\SOH\DC2\EOT\133\SOH\STX\CAN\"\NAK indexes Model.decls\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\EOT\DC2\EOT\133\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\ACK\DC2\EOT\133\SOH\v\r\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\SOH\DC2\EOT\133\SOH\SO\DC3\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\ETX\DC2\EOT\133\SOH\SYN\ETB\n\
    \\152\STX\n\
    \\EOT\EOT\n\
    \\STX\STX\DC2\EOT\140\SOH\STX\CAN\SUB\242\SOH types lists instantiated types that satisfy the class through a\n\
    \ conditional instance, as in `Page<Order>` given\n\
    \ `instance <T> Auditable<Page<T>> requires Auditable<T>`.\n\
    \\n\
    \ `Page` alone satisfies nothing, so these cannot be listed in decls.\n\
    \\"\NAK indexes Model.types\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\EOT\DC2\EOT\140\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\ACK\DC2\EOT\140\SOH\v\r\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\SOH\DC2\EOT\140\SOH\SO\DC3\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\ETX\DC2\EOT\140\SOH\SYN\ETB\n\
    \C\n\
    \\STX\EOT\v\DC2\ACK\144\SOH\NUL\153\SOH\SOH\SUB5 Import is one `import \"path\" as alias` in the file.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\v\SOH\DC2\EOT\144\SOH\b\SO\n\
    \\SUB\n\
    \\EOT\EOT\v\STX\NUL\DC2\EOT\145\SOH\STX\DC2\"\f as written\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\ENQ\DC2\EOT\145\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\SOH\DC2\EOT\145\SOH\t\r\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\ETX\DC2\EOT\145\SOH\DLE\DC1\n\
    \=\n\
    \\EOT\EOT\v\STX\SOH\DC2\EOT\146\SOH\STX\DC3\"/ \"_\" merges the imported names into this scope\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\SOH\ENQ\DC2\EOT\146\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\v\STX\SOH\SOH\DC2\EOT\146\SOH\t\SO\n\
    \\r\n\
    \\ENQ\EOT\v\STX\SOH\ETX\DC2\EOT\146\SOH\DC1\DC2\n\
    \6\n\
    \\EOT\EOT\v\STX\STX\DC2\EOT\147\SOH\STX\NAK\"( the package the imported file declares\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\STX\ENQ\DC2\EOT\147\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\v\STX\STX\SOH\DC2\EOT\147\SOH\t\DLE\n\
    \\r\n\
    \\ENQ\EOT\v\STX\STX\ETX\DC2\EOT\147\SOH\DC3\DC4\n\
    \\f\n\
    \\EOT\EOT\v\STX\ETX\DC2\EOT\148\SOH\STX\CAN\n\
    \\r\n\
    \\ENQ\EOT\v\STX\ETX\ACK\DC2\EOT\148\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\ETX\SOH\DC2\EOT\148\SOH\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\v\STX\ETX\ETX\DC2\EOT\148\SOH\SYN\ETB\n\
    \\155\SOH\n\
    \\EOT\EOT\v\STX\EOT\DC2\EOT\152\SOH\STX$\SUB\140\SOH directives are the block-scope directives of the dependency's target\n\
    \ blocks, so a backend can refer to the dependency as it is generated.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\EOT\EOT\DC2\EOT\152\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\EOT\ACK\DC2\EOT\152\SOH\v\DC4\n\
    \\r\n\
    \\ENQ\EOT\v\STX\EOT\SOH\DC2\EOT\152\SOH\NAK\US\n\
    \\r\n\
    \\ENQ\EOT\v\STX\EOT\ETX\DC2\EOT\152\SOH\"#\n\
    \\211\SOH\n\
    \\STX\EOT\f\DC2\ACK\159\SOH\NUL\164\SOH\SOH\SUB\196\SOH Extern is a declaration in another package that this one refers to.\n\
    \\n\
    \ A backend either resolves an extern through the import table and\n\
    \ generates a reference, or maps it with a target directive.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\f\SOH\DC2\EOT\159\SOH\b\SO\n\
    \%\n\
    \\EOT\EOT\f\STX\NUL\DC2\EOT\160\SOH\STX\NAK\"\ETB the declaring package\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\ENQ\DC2\EOT\160\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\SOH\DC2\EOT\160\SOH\t\DLE\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\ETX\DC2\EOT\160\SOH\DC3\DC4\n\
    \0\n\
    \\EOT\EOT\f\STX\SOH\DC2\EOT\161\SOH\STX\DC2\"\" the declaration's name within it\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\ENQ\DC2\EOT\161\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\SOH\DC2\EOT\161\SOH\t\r\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\ETX\DC2\EOT\161\SOH\DLE\DC1\n\
    \5\n\
    \\EOT\EOT\f\STX\STX\DC2\EOT\162\SOH\STX\CAN\"' where this model first referred to it\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\ACK\DC2\EOT\162\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\SOH\DC2\EOT\162\SOH\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\ETX\DC2\EOT\162\SOH\SYN\ETB\n\
    \G\n\
    \\EOT\EOT\f\STX\ETX\DC2\EOT\163\SOH\STX$\"9 resolved target directives whose path names this extern\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ETX\EOT\DC2\EOT\163\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ETX\ACK\DC2\EOT\163\SOH\v\DC4\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ETX\SOH\DC2\EOT\163\SOH\NAK\US\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ETX\ETX\DC2\EOT\163\SOH\"#\n\
    \y\n\
    \\STX\EOT\r\DC2\ACK\168\SOH\NUL\181\SOH\SOH\SUBk Decl is one declaration. Entities, values, and mixins share Struct; each\n\
    \ other form has its own message.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\r\SOH\DC2\EOT\168\SOH\b\f\n\
    \\f\n\
    \\EOT\EOT\r\STX\NUL\DC2\EOT\169\SOH\STX\DLE\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\ACK\DC2\EOT\169\SOH\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\SOH\DC2\EOT\169\SOH\a\v\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\ETX\DC2\EOT\169\SOH\SO\SI\n\
    \\f\n\
    \\EOT\EOT\r\STX\SOH\DC2\EOT\170\SOH\STX$\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SOH\EOT\DC2\EOT\170\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SOH\ACK\DC2\EOT\170\SOH\v\DC4\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SOH\SOH\DC2\EOT\170\SOH\NAK\US\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SOH\ETX\DC2\EOT\170\SOH\"#\n\
    \\SO\n\
    \\EOT\EOT\r\b\NUL\DC2\ACK\172\SOH\STX\180\SOH\ETX\n\
    \\r\n\
    \\ENQ\EOT\r\b\NUL\SOH\DC2\EOT\172\SOH\b\f\n\
    \\f\n\
    \\EOT\EOT\r\STX\STX\DC2\EOT\173\SOH\EOT\FS\n\
    \\r\n\
    \\ENQ\EOT\r\STX\STX\ACK\DC2\EOT\173\SOH\EOT\r\n\
    \\r\n\
    \\ENQ\EOT\r\STX\STX\SOH\DC2\EOT\173\SOH\SO\ETB\n\
    \\r\n\
    \\ENQ\EOT\r\STX\STX\ETX\DC2\EOT\173\SOH\SUB\ESC\n\
    \\f\n\
    \\EOT\EOT\r\STX\ETX\DC2\EOT\174\SOH\EOT\DC4\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ETX\ACK\DC2\EOT\174\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ETX\SOH\DC2\EOT\174\SOH\n\
    \\SI\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ETX\ETX\DC2\EOT\174\SOH\DC2\DC3\n\
    \\f\n\
    \\EOT\EOT\r\STX\EOT\DC2\EOT\175\SOH\EOT\CAN\n\
    \\r\n\
    \\ENQ\EOT\r\STX\EOT\ACK\DC2\EOT\175\SOH\EOT\v\n\
    \\r\n\
    \\ENQ\EOT\r\STX\EOT\SOH\DC2\EOT\175\SOH\f\DC3\n\
    \\r\n\
    \\ENQ\EOT\r\STX\EOT\ETX\DC2\EOT\175\SOH\SYN\ETB\n\
    \\f\n\
    \\EOT\EOT\r\STX\ENQ\DC2\EOT\176\SOH\EOT\EM\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ENQ\ACK\DC2\EOT\176\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ENQ\SOH\DC2\EOT\176\SOH\v\DC4\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ENQ\ETX\DC2\EOT\176\SOH\ETB\CAN\n\
    \\f\n\
    \\EOT\EOT\r\STX\ACK\DC2\EOT\177\SOH\EOT\EM\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ACK\ACK\DC2\EOT\177\SOH\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ACK\SOH\DC2\EOT\177\SOH\t\DC4\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ACK\ETX\DC2\EOT\177\SOH\ETB\CAN\n\
    \\f\n\
    \\EOT\EOT\r\STX\a\DC2\EOT\178\SOH\EOT\DC4\n\
    \\r\n\
    \\ENQ\EOT\r\STX\a\ACK\DC2\EOT\178\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\r\STX\a\SOH\DC2\EOT\178\SOH\n\
    \\SI\n\
    \\r\n\
    \\ENQ\EOT\r\STX\a\ETX\DC2\EOT\178\SOH\DC2\DC3\n\
    \\f\n\
    \\EOT\EOT\r\STX\b\DC2\EOT\179\SOH\EOT\NAK\n\
    \\r\n\
    \\ENQ\EOT\r\STX\b\ACK\DC2\EOT\179\SOH\EOT\v\n\
    \\r\n\
    \\ENQ\EOT\r\STX\b\SOH\DC2\EOT\179\SOH\f\DLE\n\
    \\r\n\
    \\ENQ\EOT\r\STX\b\ETX\DC2\EOT\179\SOH\DC3\DC4\n\
    \P\n\
    \\STX\EOT\SO\DC2\ACK\184\SOH\NUL\194\SOH\SOH\SUBB Class is a contract. Conformance is nominal and always declared.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\SO\SOH\DC2\EOT\184\SOH\b\r\n\
    \\f\n\
    \\EOT\EOT\SO\STX\NUL\DC2\EOT\185\SOH\STX\FS\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\NUL\EOT\DC2\EOT\185\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\NUL\ACK\DC2\EOT\185\SOH\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\NUL\SOH\DC2\EOT\185\SOH\DC1\ETB\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\NUL\ETX\DC2\EOT\185\SOH\SUB\ESC\n\
    \\f\n\
    \\EOT\EOT\SO\STX\SOH\DC2\EOT\186\SOH\STX\US\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\EOT\DC2\EOT\186\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\ACK\DC2\EOT\186\SOH\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\SOH\DC2\EOT\186\SOH\DC2\SUB\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\ETX\DC2\EOT\186\SOH\GS\RS\n\
    \8\n\
    \\EOT\EOT\SO\STX\STX\DC2\EOT\187\SOH\STX)\"* classes an implementor must also satisfy\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\STX\EOT\DC2\EOT\187\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\STX\ACK\DC2\EOT\187\SOH\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\STX\SOH\DC2\EOT\187\SOH\DC4$\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\STX\ETX\DC2\EOT\187\SOH'(\n\
    \@\n\
    \\EOT\EOT\SO\STX\ETX\DC2\EOT\188\SOH\STX$\"2 the `requires` clause on this class's parameters\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\ETX\EOT\DC2\EOT\188\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\ETX\ACK\DC2\EOT\188\SOH\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\ETX\SOH\DC2\EOT\188\SOH\DC4\US\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\ETX\ETX\DC2\EOT\188\SOH\"#\n\
    \\f\n\
    \\EOT\EOT\SO\STX\EOT\DC2\EOT\189\SOH\STX\FS\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\EOT\EOT\DC2\EOT\189\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\EOT\ACK\DC2\EOT\189\SOH\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\EOT\SOH\DC2\EOT\189\SOH\DC1\ETB\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\EOT\ETX\DC2\EOT\189\SOH\SUB\ESC\n\
    \\f\n\
    \\EOT\EOT\SO\STX\ENQ\DC2\EOT\190\SOH\STX%\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\ENQ\EOT\DC2\EOT\190\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\ENQ\ACK\DC2\EOT\190\SOH\v\DC4\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\ENQ\SOH\DC2\EOT\190\SOH\NAK \n\
    \\r\n\
    \\ENQ\EOT\SO\STX\ENQ\ETX\DC2\EOT\190\SOH#$\n\
    \\v\n\
    \\ETX\EOT\SO\t\DC2\EOT\192\SOH\STX\r\n\
    \\f\n\
    \\EOT\EOT\SO\t\NUL\DC2\EOT\192\SOH\v\f\n\
    \\r\n\
    \\ENQ\EOT\SO\t\NUL\SOH\DC2\EOT\192\SOH\v\f\n\
    \\r\n\
    \\ENQ\EOT\SO\t\NUL\STX\DC2\EOT\192\SOH\v\f\n\
    \\v\n\
    \\ETX\EOT\SO\n\
    \\DC2\EOT\193\SOH\STX\CAN\n\
    \\f\n\
    \\EOT\EOT\SO\n\
    \\NUL\DC2\EOT\193\SOH\v\ETB\n\
    \D\n\
    \\STX\EOT\SI\DC2\ACK\197\SOH\NUL\201\SOH\SOH\SUB6 FunDep states that some parameters determine others.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\SI\SOH\DC2\EOT\197\SOH\b\SO\n\
    \\f\n\
    \\EOT\EOT\SI\STX\NUL\DC2\EOT\198\SOH\STX\ESC\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\NUL\EOT\DC2\EOT\198\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\NUL\ENQ\DC2\EOT\198\SOH\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\NUL\SOH\DC2\EOT\198\SOH\DC2\SYN\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\NUL\ETX\DC2\EOT\198\SOH\EM\SUB\n\
    \\f\n\
    \\EOT\EOT\SI\STX\SOH\DC2\EOT\199\SOH\STX\EM\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\SOH\EOT\DC2\EOT\199\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\SOH\ENQ\DC2\EOT\199\SOH\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\SOH\SOH\DC2\EOT\199\SOH\DC2\DC4\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\SOH\ETX\DC2\EOT\199\SOH\ETB\CAN\n\
    \\f\n\
    \\EOT\EOT\SI\STX\STX\DC2\EOT\200\SOH\STX\CAN\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\STX\ACK\DC2\EOT\200\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\STX\SOH\DC2\EOT\200\SOH\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\STX\ETX\DC2\EOT\200\SOH\SYN\ETB\n\
    \U\n\
    \\STX\EOT\DLE\DC2\ACK\204\SOH\NUL\207\SOH\SOH\SUBG AssocType is a type an implementor must supply and an instance binds.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\DLE\SOH\DC2\EOT\204\SOH\b\DC1\n\
    \\f\n\
    \\EOT\EOT\DLE\STX\NUL\DC2\EOT\205\SOH\STX\DLE\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\NUL\ACK\DC2\EOT\205\SOH\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\NUL\SOH\DC2\EOT\205\SOH\a\v\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\NUL\ETX\DC2\EOT\205\SOH\SO\SI\n\
    \\f\n\
    \\EOT\EOT\DLE\STX\SOH\DC2\EOT\206\SOH\STX\DLE\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\SOH\ACK\DC2\EOT\206\SOH\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\SOH\SOH\DC2\EOT\206\SOH\a\v\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\SOH\ETX\DC2\EOT\206\SOH\SO\SI\n\
    \>\n\
    \\STX\EOT\DC1\DC2\ACK\210\SOH\NUL\212\SOH\SOH\SUB0 Primitive is an opaque, irreducible root type.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\DC1\SOH\DC2\EOT\210\SOH\b\DC1\n\
    \8\n\
    \\EOT\EOT\DC1\STX\NUL\DC2\EOT\211\SOH\STX\DLE\"* unset when the kind is left to inference\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\NUL\ACK\DC2\EOT\211\SOH\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\NUL\SOH\DC2\EOT\211\SOH\a\v\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\NUL\ETX\DC2\EOT\211\SOH\SO\SI\n\
    \\182\SOH\n\
    \\STX\EOT\DC2\DC2\ACK\218\SOH\NUL\221\SOH\SOH\SUB\167\SOH UnitDef is a `unit kg` or `unit N = kg*m/s^2` declaration.\n\
    \\n\
    \ This is the name the source gave; `unit` points at the entry in\n\
    \ Model.units that says what it measures.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\DC2\SOH\DC2\EOT\218\SOH\b\SI\n\
    \#\n\
    \\EOT\EOT\DC2\STX\NUL\DC2\EOT\219\SOH\STX\SO\"\NAK indexes Model.units\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\NUL\ACK\DC2\EOT\219\SOH\STX\EOT\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\NUL\SOH\DC2\EOT\219\SOH\ENQ\t\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\NUL\ETX\DC2\EOT\219\SOH\f\r\n\
    \-\n\
    \\EOT\EOT\DC2\STX\SOH\DC2\EOT\220\SOH\STX\DLE\"\US written without an expression\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\SOH\ENQ\DC2\EOT\220\SOH\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\SOH\SOH\DC2\EOT\220\SOH\a\v\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\SOH\ETX\DC2\EOT\220\SOH\SO\SI\n\
    \=\n\
    \\STX\EOT\DC3\DC2\ACK\224\SOH\NUL\227\SOH\SOH\SUB/ Dimension is one base unit raised to a power.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\DC3\SOH\DC2\EOT\224\SOH\b\DC1\n\
    \5\n\
    \\EOT\EOT\DC3\STX\NUL\DC2\EOT\225\SOH\STX\SO\"' indexes Model.decls at a base UnitDef\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\NUL\ACK\DC2\EOT\225\SOH\STX\EOT\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\NUL\SOH\DC2\EOT\225\SOH\ENQ\t\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\NUL\ETX\DC2\EOT\225\SOH\f\r\n\
    \<\n\
    \\EOT\EOT\DC3\STX\SOH\DC2\EOT\226\SOH\STX\NAK\". never zero; a cancelled dimension is dropped\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\SOH\ENQ\DC2\EOT\226\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\SOH\SOH\DC2\EOT\226\SOH\b\DLE\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\SOH\ETX\DC2\EOT\226\SOH\DC3\DC4\n\
    \\165\STX\n\
    \\STX\EOT\DC4\DC2\ACK\236\SOH\NUL\241\SOH\SOH\SUB\150\STX Unit is a quantity reduced to base dimensions.\n\
    \\n\
    \ A unit is interned on `dims` alone, so decimal<N> and decimal<kg*m/s^2>\n\
    \ reach one entry. `decl` and `wrote` record the first spelling and take no\n\
    \ part in identity.\n\
    \\n\
    \ `dims` is sorted by base index with zero exponents removed.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\DC4\SOH\DC2\EOT\236\SOH\b\f\n\
    \\f\n\
    \\EOT\EOT\DC4\STX\NUL\DC2\EOT\237\SOH\STX\RS\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\NUL\EOT\DC2\EOT\237\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\NUL\ACK\DC2\EOT\237\SOH\v\DC4\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\NUL\SOH\DC2\EOT\237\SOH\NAK\EM\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\NUL\ETX\DC2\EOT\237\SOH\FS\GS\n\
    \S\n\
    \\EOT\EOT\DC4\STX\SOH\DC2\EOT\238\SOH\STX\SO\"E the UnitDef first naming this quantity; unset for a bare expression\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\SOH\ACK\DC2\EOT\238\SOH\STX\EOT\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\SOH\SOH\DC2\EOT\238\SOH\ENQ\t\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\SOH\ETX\DC2\EOT\238\SOH\f\r\n\
    \+\n\
    \\EOT\EOT\DC4\STX\STX\DC2\EOT\239\SOH\STX\DC3\"\GS the source text, as written\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\STX\ENQ\DC2\EOT\239\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\STX\SOH\DC2\EOT\239\SOH\t\SO\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\STX\ETX\DC2\EOT\239\SOH\DC1\DC2\n\
    \\f\n\
    \\EOT\EOT\DC4\STX\ETX\DC2\EOT\240\SOH\STX\CAN\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\ETX\ACK\DC2\EOT\240\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\ETX\SOH\DC2\EOT\240\SOH\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\ETX\ETX\DC2\EOT\240\SOH\SYN\ETB\n\
    \U\n\
    \\STX\EOT\NAK\DC2\ACK\244\SOH\NUL\247\SOH\SOH\SUBG Alias is a transparent abbreviation, expanded rather than referenced.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\NAK\SOH\DC2\EOT\244\SOH\b\r\n\
    \\f\n\
    \\EOT\EOT\NAK\STX\NUL\DC2\EOT\245\SOH\STX\FS\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\NUL\EOT\DC2\EOT\245\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\NUL\ACK\DC2\EOT\245\SOH\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\NUL\SOH\DC2\EOT\245\SOH\DC1\ETB\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\NUL\ETX\DC2\EOT\245\SOH\SUB\ESC\n\
    \#\n\
    \\EOT\EOT\NAK\STX\SOH\DC2\EOT\246\SOH\STX\DLE\"\NAK indexes Model.types\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\SOH\ACK\DC2\EOT\246\SOH\STX\EOT\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\SOH\SOH\DC2\EOT\246\SOH\ENQ\v\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\SOH\ETX\DC2\EOT\246\SOH\SO\SI\n\
    \U\n\
    \\STX\EOT\SYN\DC2\ACK\250\SOH\NUL\255\SOH\SOH\SUBG Newtype is a distinct type over another, not interchangeable with it.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\SYN\SOH\DC2\EOT\250\SOH\b\SI\n\
    \\f\n\
    \\EOT\EOT\SYN\STX\NUL\DC2\EOT\251\SOH\STX\FS\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\NUL\EOT\DC2\EOT\251\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\NUL\ACK\DC2\EOT\251\SOH\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\NUL\SOH\DC2\EOT\251\SOH\DC1\ETB\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\NUL\ETX\DC2\EOT\251\SOH\SUB\ESC\n\
    \#\n\
    \\EOT\EOT\SYN\STX\SOH\DC2\EOT\252\SOH\STX\SO\"\NAK indexes Model.types\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\SOH\ACK\DC2\EOT\252\SOH\STX\EOT\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\SOH\SOH\DC2\EOT\252\SOH\ENQ\t\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\SOH\ETX\DC2\EOT\252\SOH\f\r\n\
    \7\n\
    \\EOT\EOT\SYN\STX\STX\DC2\EOT\253\SOH\STX$\") the `requires` clause on its parameters\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\STX\EOT\DC2\EOT\253\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\STX\ACK\DC2\EOT\253\SOH\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\STX\SOH\DC2\EOT\253\SOH\DC4\US\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\STX\ETX\DC2\EOT\253\SOH\"#\n\
    \=\n\
    \\EOT\EOT\SYN\STX\ETX\DC2\EOT\254\SOH\STX,\"/ the `where` block, accumulated down the chain\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\ETX\EOT\DC2\EOT\254\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\ETX\ACK\DC2\EOT\254\SOH\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\ETX\SOH\DC2\EOT\254\SOH\SYN'\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\ETX\ETX\DC2\EOT\254\SOH*+\n\
    \B\n\
    \\STX\ENQ\NUL\DC2\ACK\130\STX\NUL\140\STX\SOH\SUB4 LiteralKind identifies which form a Literal takes.\n\
    \\n\
    \\v\n\
    \\ETX\ENQ\NUL\SOH\DC2\EOT\130\STX\ENQ\DLE\n\
    \\f\n\
    \\EOT\ENQ\NUL\STX\NUL\DC2\EOT\131\STX\STX\US\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\NUL\SOH\DC2\EOT\131\STX\STX\SUB\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\NUL\STX\DC2\EOT\131\STX\GS\RS\n\
    \\f\n\
    \\EOT\ENQ\NUL\STX\SOH\DC2\EOT\132\STX\STX\SUB\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\SOH\SOH\DC2\EOT\132\STX\STX\NAK\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\SOH\STX\DC2\EOT\132\STX\CAN\EM\n\
    \\f\n\
    \\EOT\ENQ\NUL\STX\STX\DC2\EOT\133\STX\STX\ETB\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\STX\SOH\DC2\EOT\133\STX\STX\DC2\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\STX\STX\DC2\EOT\133\STX\NAK\SYN\n\
    \\f\n\
    \\EOT\ENQ\NUL\STX\ETX\DC2\EOT\134\STX\STX\EM\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\ETX\SOH\DC2\EOT\134\STX\STX\DC4\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\ETX\STX\DC2\EOT\134\STX\ETB\CAN\n\
    \\f\n\
    \\EOT\ENQ\NUL\STX\EOT\DC2\EOT\135\STX\STX\CAN\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\EOT\SOH\DC2\EOT\135\STX\STX\DC3\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\EOT\STX\DC2\EOT\135\STX\SYN\ETB\n\
    \/\n\
    \\EOT\ENQ\NUL\STX\ENQ\DC2\EOT\136\STX\STX\CAN\"! a name denoting an enum variant\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\ENQ\SOH\DC2\EOT\136\STX\STX\DC3\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\ENQ\STX\DC2\EOT\136\STX\SYN\ETB\n\
    \\f\n\
    \\EOT\ENQ\NUL\STX\ACK\DC2\EOT\137\STX\STX\EM\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\ACK\SOH\DC2\EOT\137\STX\STX\DC4\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\ACK\STX\DC2\EOT\137\STX\ETB\CAN\n\
    \\f\n\
    \\EOT\ENQ\NUL\STX\a\DC2\EOT\138\STX\STX\CAN\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\a\SOH\DC2\EOT\138\STX\STX\DC3\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\a\STX\DC2\EOT\138\STX\SYN\ETB\n\
    \\f\n\
    \\EOT\ENQ\NUL\STX\b\DC2\EOT\139\STX\STX\EM\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\b\SOH\DC2\EOT\139\STX\STX\DC4\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\b\STX\DC2\EOT\139\STX\ETB\CAN\n\
    \{\n\
    \\STX\EOT\ETB\DC2\ACK\144\STX\NUL\154\STX\SOH\SUBm Literal is a value written in the source: a field default, a constraint\n\
    \ argument, or a directive argument.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\ETB\SOH\DC2\EOT\144\STX\b\SI\n\
    \\f\n\
    \\EOT\EOT\ETB\STX\NUL\DC2\EOT\145\STX\STX\ETB\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\NUL\ACK\DC2\EOT\145\STX\STX\r\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\NUL\SOH\DC2\EOT\145\STX\SO\DC2\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\NUL\ETX\DC2\EOT\145\STX\NAK\SYN\n\
    \L\n\
    \\EOT\EOT\ETB\STX\SOH\DC2\EOT\146\STX\STX\DC2\"> decoded for STRING, the pattern for REGEX, the name for NAME\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\SOH\ENQ\DC2\EOT\146\STX\STX\b\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\SOH\SOH\DC2\EOT\146\STX\t\r\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\SOH\ETX\DC2\EOT\146\STX\DLE\DC1\n\
    \\FS\n\
    \\EOT\EOT\ETB\STX\STX\DC2\EOT\147\STX\STX\GS\"\SO set for LIST\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\STX\EOT\DC2\EOT\147\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\STX\ACK\DC2\EOT\147\STX\v\DC2\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\STX\SOH\DC2\EOT\147\STX\DC3\CAN\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\STX\ETX\DC2\EOT\147\STX\ESC\FS\n\
    \\GS\n\
    \\EOT\EOT\ETB\STX\ETX\DC2\EOT\148\STX\STX\DC2\"\SI set for RANGE\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\ETX\ACK\DC2\EOT\148\STX\STX\a\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\ETX\SOH\DC2\EOT\148\STX\b\r\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\ETX\ETX\DC2\EOT\148\STX\DLE\DC1\n\
    \\f\n\
    \\EOT\EOT\ETB\STX\EOT\DC2\EOT\149\STX\STX\CAN\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\EOT\ACK\DC2\EOT\149\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\EOT\SOH\DC2\EOT\149\STX\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\EOT\ETX\DC2\EOT\149\STX\SYN\ETB\n\
    \\140\SOH\n\
    \\EOT\EOT\ETB\STX\ENQ\DC2\EOT\153\STX\STX\DC1\SUB~ variant names the enum variant a NAME literal resolves to, checked\n\
    \ against the field's type. Unset when it did not resolve.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\ENQ\ACK\DC2\EOT\153\STX\STX\EOT\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\ENQ\SOH\DC2\EOT\153\STX\ENQ\f\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\ENQ\ETX\DC2\EOT\153\STX\SI\DLE\n\
    \S\n\
    \\STX\EOT\CAN\DC2\ACK\157\STX\NUL\160\STX\SOH\SUBE Range is a bound with either end optional: `3..254`, `1..`, `..64`.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\CAN\SOH\DC2\EOT\157\STX\b\r\n\
    \\f\n\
    \\EOT\EOT\CAN\STX\NUL\DC2\EOT\158\STX\STX5\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\NUL\ENQ\DC2\EOT\158\STX\STX\a\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\NUL\SOH\DC2\EOT\158\STX\b\v\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\NUL\ETX\DC2\EOT\158\STX\SO\SI\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\NUL\b\DC2\EOT\158\STX\DLE4\n\
    \\SI\n\
    \\a\EOT\CAN\STX\NUL\b\NAK\SOH\DC2\EOT\158\STX\DC13\n\
    \\f\n\
    \\EOT\EOT\CAN\STX\SOH\DC2\EOT\159\STX\STX6\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\SOH\ENQ\DC2\EOT\159\STX\STX\a\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\SOH\SOH\DC2\EOT\159\STX\b\f\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\SOH\ETX\DC2\EOT\159\STX\SI\DLE\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\SOH\b\DC2\EOT\159\STX\DC15\n\
    \\SI\n\
    \\a\EOT\CAN\STX\SOH\b\NAK\SOH\DC2\EOT\159\STX\DC24\n\
    \\204\SOH\n\
    \\STX\EOT\EM\DC2\ACK\166\STX\NUL\174\STX\SOH\SUB\189\SOH Constraint is one entry in a `where { ... }` block.\n\
    \\n\
    \ The set of names is open. The compiler checks the arity and argument\n\
    \ kinds of the standard names and passes everything else through.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\EM\SOH\DC2\EOT\166\STX\b\DC2\n\
    \\f\n\
    \\EOT\EOT\EM\STX\NUL\DC2\EOT\167\STX\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\NUL\ENQ\DC2\EOT\167\STX\STX\b\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\NUL\SOH\DC2\EOT\167\STX\t\r\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\NUL\ETX\DC2\EOT\167\STX\DLE\DC1\n\
    \\f\n\
    \\EOT\EOT\EM\STX\SOH\DC2\EOT\168\STX\STX\FS\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\SOH\EOT\DC2\EOT\168\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\SOH\ACK\DC2\EOT\168\STX\v\DC2\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\SOH\SOH\DC2\EOT\168\STX\DC3\ETB\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\SOH\ETX\DC2\EOT\168\STX\SUB\ESC\n\
    \\f\n\
    \\EOT\EOT\EM\STX\STX\DC2\EOT\169\STX\STX\CAN\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\STX\ACK\DC2\EOT\169\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\STX\SOH\DC2\EOT\169\STX\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\STX\ETX\DC2\EOT\169\STX\SYN\ETB\n\
    \\138\SOH\n\
    \\EOT\EOT\EM\STX\ETX\DC2\EOT\173\STX\STX\SO\SUBe from names the newtype a constraint was inherited from, unset for one\n\
    \ written on this declaration.\n\
    \\"\NAK indexes Model.decls\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\ETX\ACK\DC2\EOT\173\STX\STX\EOT\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\ETX\SOH\DC2\EOT\173\STX\ENQ\t\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\ETX\ETX\DC2\EOT\173\STX\f\r\n\
    \\205\SOH\n\
    \\STX\ENQ\SOH\DC2\ACK\179\STX\NUL\184\STX\SOH\SUB\190\SOH StructKind distinguishes the three declarations that share a body. The\n\
    \ compiler computes it: MIXIN for a mixin, ENTITY for any other struct\n\
    \ satisfying std.Entity, and VALUE for the rest.\n\
    \\n\
    \\v\n\
    \\ETX\ENQ\SOH\SOH\DC2\EOT\179\STX\ENQ\SI\n\
    \\f\n\
    \\EOT\ENQ\SOH\STX\NUL\DC2\EOT\180\STX\STX\RS\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\NUL\SOH\DC2\EOT\180\STX\STX\EM\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\NUL\STX\DC2\EOT\180\STX\FS\GS\n\
    \>\n\
    \\EOT\ENQ\SOH\STX\SOH\DC2\EOT\181\STX\STX\EM\"0 identity that survives changes to its contents\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\SOH\SOH\DC2\EOT\181\STX\STX\DC4\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\SOH\STX\DC2\EOT\181\STX\ETB\CAN\n\
    \0\n\
    \\EOT\ENQ\SOH\STX\STX\DC2\EOT\182\STX\STX\CAN\"\" defined entirely by its contents\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\STX\SOH\DC2\EOT\182\STX\STX\DC3\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\STX\STX\DC2\EOT\182\STX\SYN\ETB\n\
    \<\n\
    \\EOT\ENQ\SOH\STX\ETX\DC2\EOT\183\STX\STX\CAN\". reuse, copied into the including declaration\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\ETX\SOH\DC2\EOT\183\STX\STX\DC3\n\
    \\r\n\
    \\ENQ\ENQ\SOH\STX\ETX\STX\DC2\EOT\183\STX\SYN\ETB\n\
    \9\n\
    \\STX\EOT\SUB\DC2\ACK\187\STX\NUL\193\STX\SOH\SUB+ Struct is an entity, a value, or a mixin.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\SUB\SOH\DC2\EOT\187\STX\b\SO\n\
    \\f\n\
    \\EOT\EOT\SUB\STX\NUL\DC2\EOT\188\STX\STX\SYN\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\NUL\ACK\DC2\EOT\188\STX\STX\f\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\NUL\SOH\DC2\EOT\188\STX\r\DC1\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\NUL\ETX\DC2\EOT\188\STX\DC4\NAK\n\
    \\f\n\
    \\EOT\EOT\SUB\STX\SOH\DC2\EOT\189\STX\STX\FS\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\SOH\EOT\DC2\EOT\189\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\SOH\ACK\DC2\EOT\189\STX\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\SOH\SOH\DC2\EOT\189\STX\DC1\ETB\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\SOH\ETX\DC2\EOT\189\STX\SUB\ESC\n\
    \\f\n\
    \\EOT\EOT\SUB\STX\STX\DC2\EOT\190\STX\STX\FS\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\STX\EOT\DC2\EOT\190\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\STX\ACK\DC2\EOT\190\STX\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\STX\SOH\DC2\EOT\190\STX\DC1\ETB\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\STX\ETX\DC2\EOT\190\STX\SUB\ESC\n\
    \:\n\
    \\EOT\EOT\SUB\STX\ETX\DC2\EOT\191\STX\STX!\", classes this declaration says it satisfies\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\ETX\EOT\DC2\EOT\191\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\ETX\ACK\DC2\EOT\191\STX\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\ETX\SOH\DC2\EOT\191\STX\DC4\FS\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\ETX\ETX\DC2\EOT\191\STX\US \n\
    \7\n\
    \\EOT\EOT\SUB\STX\EOT\DC2\EOT\192\STX\STX$\") the `requires` clause on its parameters\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\EOT\EOT\DC2\EOT\192\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\EOT\ACK\DC2\EOT\192\STX\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\EOT\SOH\DC2\EOT\192\STX\DC4\US\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\EOT\ETX\DC2\EOT\192\STX\"#\n\
    \x\n\
    \\STX\EOT\ESC\DC2\ACK\197\STX\NUL\202\STX\SOH\SUBj Enum is a closed set of variants. A variant may carry fields, which makes\n\
    \ enum the language's sum type.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\ESC\SOH\DC2\EOT\197\STX\b\f\n\
    \\f\n\
    \\EOT\EOT\ESC\STX\NUL\DC2\EOT\198\STX\STX\FS\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\NUL\EOT\DC2\EOT\198\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\NUL\ACK\DC2\EOT\198\STX\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\NUL\SOH\DC2\EOT\198\STX\DC1\ETB\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\NUL\ETX\DC2\EOT\198\STX\SUB\ESC\n\
    \\f\n\
    \\EOT\EOT\ESC\STX\SOH\DC2\EOT\199\STX\STX \n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\SOH\EOT\DC2\EOT\199\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\SOH\ACK\DC2\EOT\199\STX\v\DC2\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\SOH\SOH\DC2\EOT\199\STX\DC3\ESC\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\SOH\ETX\DC2\EOT\199\STX\RS\US\n\
    \\f\n\
    \\EOT\EOT\ESC\STX\STX\DC2\EOT\200\STX\STX!\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\STX\EOT\DC2\EOT\200\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\STX\ACK\DC2\EOT\200\STX\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\STX\SOH\DC2\EOT\200\STX\DC4\FS\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\STX\ETX\DC2\EOT\200\STX\US \n\
    \\f\n\
    \\EOT\EOT\ESC\STX\ETX\DC2\EOT\201\STX\STX$\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\ETX\EOT\DC2\EOT\201\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\ETX\ACK\DC2\EOT\201\STX\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\ETX\SOH\DC2\EOT\201\STX\DC4\US\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\ETX\ETX\DC2\EOT\201\STX\"#\n\
    \6\n\
    \\STX\EOT\FS\DC2\ACK\205\STX\NUL\209\STX\SOH\SUB( Variant is one alternative in an Enum.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\FS\SOH\DC2\EOT\205\STX\b\SI\n\
    \\f\n\
    \\EOT\EOT\FS\STX\NUL\DC2\EOT\206\STX\STX\DLE\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\NUL\ACK\DC2\EOT\206\STX\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\NUL\SOH\DC2\EOT\206\STX\a\v\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\NUL\ETX\DC2\EOT\206\STX\SO\SI\n\
    \\f\n\
    \\EOT\EOT\FS\STX\SOH\DC2\EOT\207\STX\STX\FS\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\SOH\EOT\DC2\EOT\207\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\SOH\ACK\DC2\EOT\207\STX\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\SOH\SOH\DC2\EOT\207\STX\DC1\ETB\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\SOH\ETX\DC2\EOT\207\STX\SUB\ESC\n\
    \G\n\
    \\EOT\EOT\FS\STX\STX\DC2\EOT\208\STX\STX$\"9 resolved from every target block, tagged with the block\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\STX\EOT\DC2\EOT\208\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\STX\ACK\DC2\EOT\208\STX\v\DC4\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\STX\SOH\DC2\EOT\208\STX\NAK\US\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\STX\ETX\DC2\EOT\208\STX\"#\n\
    \/\n\
    \\STX\EOT\GS\DC2\ACK\212\STX\NUL\226\STX\SOH\SUB! Field is a named, typed member.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\GS\SOH\DC2\EOT\212\STX\b\r\n\
    \\f\n\
    \\EOT\EOT\GS\STX\NUL\DC2\EOT\213\STX\STX\DLE\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\NUL\ACK\DC2\EOT\213\STX\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\NUL\SOH\DC2\EOT\213\STX\a\v\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\NUL\ETX\DC2\EOT\213\STX\SO\SI\n\
    \#\n\
    \\EOT\EOT\GS\STX\SOH\DC2\EOT\214\STX\STX\SO\"\NAK indexes Model.types\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\SOH\ACK\DC2\EOT\214\STX\STX\EOT\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\SOH\SOH\DC2\EOT\214\STX\ENQ\t\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\SOH\ETX\DC2\EOT\214\STX\f\r\n\
    \1\n\
    \\EOT\EOT\GS\STX\STX\DC2\EOT\215\STX\STX\DC1\"# composition rather than reference\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\STX\ENQ\DC2\EOT\215\STX\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\STX\SOH\DC2\EOT\215\STX\a\f\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\STX\ETX\DC2\EOT\215\STX\SI\DLE\n\
    \\f\n\
    \\EOT\EOT\GS\STX\ETX\DC2\EOT\216\STX\STX&\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\ETX\EOT\DC2\EOT\216\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\ETX\ACK\DC2\EOT\216\STX\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\ETX\SOH\DC2\EOT\216\STX\SYN!\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\ETX\ETX\DC2\EOT\216\STX$%\n\
    \3\n\
    \\EOT\EOT\GS\STX\EOT\DC2\EOT\217\STX\STX\FS\"% unset when the field has no default\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\EOT\ACK\DC2\EOT\217\STX\STX\t\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\EOT\SOH\DC2\EOT\217\STX\n\
    \\ETB\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\EOT\ETX\DC2\EOT\217\STX\SUB\ESC\n\
    \\f\n\
    \\EOT\EOT\GS\STX\ENQ\DC2\EOT\218\STX\STX$\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\ENQ\EOT\DC2\EOT\218\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\ENQ\ACK\DC2\EOT\218\STX\v\DC4\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\ENQ\SOH\DC2\EOT\218\STX\NAK\US\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\ENQ\ETX\DC2\EOT\218\STX\"#\n\
    \\142\SOH\n\
    \\EOT\EOT\GS\STX\ACK\DC2\EOT\222\STX\STX\ETB\SUBi included_from names the mixin a field was copied from, unset for a\n\
    \ field the declaration wrote itself.\n\
    \\"\NAK indexes Model.decls\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\ACK\ACK\DC2\EOT\222\STX\STX\EOT\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\ACK\SOH\DC2\EOT\222\STX\ENQ\DC2\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\ACK\ETX\DC2\EOT\222\STX\NAK\SYN\n\
    \\v\n\
    \\ETX\EOT\GS\t\DC2\EOT\224\STX\STX\r\n\
    \\f\n\
    \\EOT\EOT\GS\t\NUL\DC2\EOT\224\STX\v\f\n\
    \\r\n\
    \\ENQ\EOT\GS\t\NUL\SOH\DC2\EOT\224\STX\v\f\n\
    \\r\n\
    \\ENQ\EOT\GS\t\NUL\STX\DC2\EOT\224\STX\v\f\n\
    \\v\n\
    \\ETX\EOT\GS\n\
    \\DC2\EOT\225\STX\STX\SI\n\
    \\f\n\
    \\EOT\EOT\GS\n\
    \\NUL\DC2\EOT\225\STX\v\SO\n\
    \,\n\
    \\STX\EOT\RS\DC2\ACK\229\STX\NUL\233\STX\SOH\SUB\RS Param is one type parameter.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\RS\SOH\DC2\EOT\229\STX\b\r\n\
    \\f\n\
    \\EOT\EOT\RS\STX\NUL\DC2\EOT\230\STX\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\NUL\ENQ\DC2\EOT\230\STX\STX\b\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\NUL\SOH\DC2\EOT\230\STX\t\r\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\NUL\ETX\DC2\EOT\230\STX\DLE\DC1\n\
    \,\n\
    \\EOT\EOT\RS\STX\SOH\DC2\EOT\231\STX\STX\DLE\"\RS unset when inferred from use\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\SOH\ACK\DC2\EOT\231\STX\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\SOH\SOH\DC2\EOT\231\STX\a\v\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\SOH\ETX\DC2\EOT\231\STX\SO\SI\n\
    \\f\n\
    \\EOT\EOT\RS\STX\STX\DC2\EOT\232\STX\STX\CAN\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\STX\ACK\DC2\EOT\232\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\STX\SOH\DC2\EOT\232\STX\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\STX\ETX\DC2\EOT\232\STX\SYN\ETB\n\
    \(\n\
    \\STX\ENQ\STX\DC2\ACK\236\STX\NUL\240\STX\SOH\SUB\SUB KindAtom is a base kind.\n\
    \\n\
    \\v\n\
    \\ETX\ENQ\STX\SOH\DC2\EOT\236\STX\ENQ\r\n\
    \\f\n\
    \\EOT\ENQ\STX\STX\NUL\DC2\EOT\237\STX\STX\FS\n\
    \\r\n\
    \\ENQ\ENQ\STX\STX\NUL\SOH\DC2\EOT\237\STX\STX\ETB\n\
    \\r\n\
    \\ENQ\ENQ\STX\STX\NUL\STX\DC2\EOT\237\STX\SUB\ESC\n\
    \\f\n\
    \\EOT\ENQ\STX\STX\SOH\DC2\EOT\238\STX\STX\NAK\n\
    \\r\n\
    \\ENQ\ENQ\STX\STX\SOH\SOH\DC2\EOT\238\STX\STX\DLE\n\
    \\r\n\
    \\ENQ\ENQ\STX\STX\SOH\STX\DC2\EOT\238\STX\DC3\DC4\n\
    \\f\n\
    \\EOT\ENQ\STX\STX\STX\DC2\EOT\239\STX\STX\NAK\n\
    \\r\n\
    \\ENQ\ENQ\STX\STX\STX\SOH\DC2\EOT\239\STX\STX\DLE\n\
    \\r\n\
    \\ENQ\ENQ\STX\STX\STX\STX\DC2\EOT\239\STX\DC3\DC4\n\
    \\147\SOH\n\
    \\STX\EOT\US\DC2\ACK\244\STX\NUL\248\STX\SOH\SUB\132\SOH Kind is a kind expression: an atom, a parenthesized kind, or either of\n\
    \ those followed by an arrow. Arrows associate to the right.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\US\SOH\DC2\EOT\244\STX\b\f\n\
    \'\n\
    \\EOT\EOT\US\STX\NUL\DC2\EOT\245\STX\STX\DC4\"\EM unset when paren is set\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\US\STX\NUL\ACK\DC2\EOT\245\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\US\STX\NUL\SOH\DC2\EOT\245\STX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\US\STX\NUL\ETX\DC2\EOT\245\STX\DC2\DC3\n\
    \\f\n\
    \\EOT\EOT\US\STX\SOH\DC2\EOT\246\STX\STX\DC1\n\
    \\r\n\
    \\ENQ\EOT\US\STX\SOH\ACK\DC2\EOT\246\STX\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\US\STX\SOH\SOH\DC2\EOT\246\STX\a\f\n\
    \\r\n\
    \\ENQ\EOT\US\STX\SOH\ETX\DC2\EOT\246\STX\SI\DLE\n\
    \%\n\
    \\EOT\EOT\US\STX\STX\DC2\EOT\247\STX\STX\DC1\"\ETB unset for a bare atom\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\US\STX\STX\ACK\DC2\EOT\247\STX\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\US\STX\STX\SOH\DC2\EOT\247\STX\a\f\n\
    \\r\n\
    \\ENQ\EOT\US\STX\STX\ETX\DC2\EOT\247\STX\SI\DLE\n\
    \\239\SOH\n\
    \\STX\ENQ\ETX\DC2\ACK\255\STX\NUL\135\ETX\SOH\SUB\224\SOH SyntacticForm records how a type reference was written.\n\
    \\n\
    \ The form is advisory: `[T]` is `List<T>` and `T?` is `Option<T>`\n\
    \ regardless. A backend may use it to emit `*T` for `T?` and a wrapper for\n\
    \ an explicit `Option<T>`.\n\
    \\n\
    \\v\n\
    \\ETX\ENQ\ETX\SOH\DC2\EOT\255\STX\ENQ\DC2\n\
    \\f\n\
    \\EOT\ENQ\ETX\STX\NUL\DC2\EOT\128\ETX\STX!\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\NUL\SOH\DC2\EOT\128\ETX\STX\FS\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\NUL\STX\DC2\EOT\128\ETX\US \n\
    \\GS\n\
    \\EOT\ENQ\ETX\STX\SOH\DC2\EOT\129\ETX\STX\ESC\"\SI User, List<T>\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\SOH\SOH\DC2\EOT\129\ETX\STX\SYN\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\SOH\STX\DC2\EOT\129\ETX\EM\SUB\n\
    \\DC3\n\
    \\EOT\ENQ\ETX\STX\STX\DC2\EOT\130\ETX\STX\RS\"\ENQ [T]\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\STX\SOH\DC2\EOT\130\ETX\STX\EM\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\STX\STX\DC2\EOT\130\ETX\FS\GS\n\
    \\DC3\n\
    \\EOT\ENQ\ETX\STX\ETX\DC2\EOT\131\ETX\STX\FS\"\ENQ {T}\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\ETX\SOH\DC2\EOT\131\ETX\STX\ETB\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\ETX\STX\DC2\EOT\131\ETX\SUB\ESC\n\
    \\CAN\n\
    \\EOT\ENQ\ETX\STX\EOT\DC2\EOT\132\ETX\STX\ESC\"\n\
    \ {K -> V}\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\EOT\SOH\DC2\EOT\132\ETX\STX\SYN\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\EOT\STX\DC2\EOT\132\ETX\EM\SUB\n\
    \\DC2\n\
    \\EOT\ENQ\ETX\STX\ENQ\DC2\EOT\133\ETX\STX\RS\"\EOT T?\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\ENQ\SOH\DC2\EOT\133\ETX\STX\EM\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\ENQ\STX\DC2\EOT\133\ETX\FS\GS\n\
    \\CAN\n\
    \\EOT\ENQ\ETX\STX\ACK\DC2\EOT\134\ETX\STX\GS\"\n\
    \ T | null\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\ACK\SOH\DC2\EOT\134\ETX\STX\CAN\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\ACK\STX\DC2\EOT\134\ETX\ESC\FS\n\
    \\189\SOH\n\
    \\STX\EOT \DC2\ACK\141\ETX\NUL\149\ETX\SOH\SUB\174\SOH Type is one interned type reference: a constructor applied to arguments,\n\
    \ or a reference to a type parameter.\n\
    \\n\
    \ Equal types share an entry, so comparing IDs compares types.\n\
    \\n\
    \\v\n\
    \\ETX\EOT \SOH\DC2\EOT\141\ETX\b\f\n\
    \F\n\
    \\EOT\EOT \STX\NUL\DC2\EOT\142\ETX\STX\SO\"8 indexes Model.decls; unset when param or extern is set\n\
    \\n\
    \\r\n\
    \\ENQ\EOT \STX\NUL\ACK\DC2\EOT\142\ETX\STX\EOT\n\
    \\r\n\
    \\ENQ\EOT \STX\NUL\SOH\DC2\EOT\142\ETX\ENQ\t\n\
    \\r\n\
    \\ENQ\EOT \STX\NUL\ETX\DC2\EOT\142\ETX\f\r\n\
    \#\n\
    \\EOT\EOT \STX\SOH\DC2\EOT\143\ETX\STX\ETB\"\NAK indexes Model.types\n\
    \\n\
    \\r\n\
    \\ENQ\EOT \STX\SOH\EOT\DC2\EOT\143\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT \STX\SOH\ACK\DC2\EOT\143\ETX\v\r\n\
    \\r\n\
    \\ENQ\EOT \STX\SOH\SOH\DC2\EOT\143\ETX\SO\DC2\n\
    \\r\n\
    \\ENQ\EOT \STX\SOH\ETX\DC2\EOT\143\ETX\NAK\SYN\n\
    \\f\n\
    \\EOT\EOT \STX\STX\DC2\EOT\144\ETX\STX\SUB\n\
    \\r\n\
    \\ENQ\EOT \STX\STX\ACK\DC2\EOT\144\ETX\STX\SI\n\
    \\r\n\
    \\ENQ\EOT \STX\STX\SOH\DC2\EOT\144\ETX\DLE\NAK\n\
    \\r\n\
    \\ENQ\EOT \STX\STX\ETX\DC2\EOT\144\ETX\CAN\EM\n\
    \\f\n\
    \\EOT\EOT \STX\ETX\DC2\EOT\145\ETX\STX\CAN\n\
    \\r\n\
    \\ENQ\EOT \STX\ETX\ACK\DC2\EOT\145\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT \STX\ETX\SOH\DC2\EOT\145\ETX\v\DC3\n\
    \\r\n\
    \\ENQ\EOT \STX\ETX\ETX\DC2\EOT\145\ETX\SYN\ETB\n\
    \8\n\
    \\EOT\EOT \STX\EOT\DC2\EOT\146\ETX\STX\NAK\"* set instead of ctor for a type parameter\n\
    \\n\
    \\r\n\
    \\ENQ\EOT \STX\EOT\ACK\DC2\EOT\146\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT \STX\EOT\SOH\DC2\EOT\146\ETX\v\DLE\n\
    \\r\n\
    \\ENQ\EOT \STX\EOT\ETX\DC2\EOT\146\ETX\DC3\DC4\n\
    \:\n\
    \\EOT\EOT \STX\ENQ\DC2\EOT\147\ETX\STX\DLE\", set instead of ctor; indexes Model.externs\n\
    \\n\
    \\r\n\
    \\ENQ\EOT \STX\ENQ\ACK\DC2\EOT\147\ETX\STX\EOT\n\
    \\r\n\
    \\ENQ\EOT \STX\ENQ\SOH\DC2\EOT\147\ETX\ENQ\v\n\
    \\r\n\
    \\ENQ\EOT \STX\ENQ\ETX\DC2\EOT\147\ETX\SO\SI\n\
    \8\n\
    \\EOT\EOT \STX\ACK\DC2\EOT\148\ETX\STX\SO\"* set instead of ctor; indexes Model.units\n\
    \\n\
    \\r\n\
    \\ENQ\EOT \STX\ACK\ACK\DC2\EOT\148\ETX\STX\EOT\n\
    \\r\n\
    \\ENQ\EOT \STX\ACK\SOH\DC2\EOT\148\ETX\ENQ\t\n\
    \\r\n\
    \\ENQ\EOT \STX\ACK\ETX\DC2\EOT\148\ETX\f\r\n\
    \\145\SOH\n\
    \\STX\EOT!\DC2\ACK\155\ETX\NUL\159\ETX\SOH\SUB\130\SOH ParamRef is a use of a type parameter.\n\
    \\n\
    \ Parameters are not monomorphized; a backend without generics\n\
    \ instantiates them itself.\n\
    \\n\
    \\v\n\
    \\ETX\EOT!\SOH\DC2\EOT\155\ETX\b\DLE\n\
    \\f\n\
    \\EOT\EOT!\STX\NUL\DC2\EOT\156\ETX\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT!\STX\NUL\ENQ\DC2\EOT\156\ETX\STX\b\n\
    \\r\n\
    \\ENQ\EOT!\STX\NUL\SOH\DC2\EOT\156\ETX\t\r\n\
    \\r\n\
    \\ENQ\EOT!\STX\NUL\ETX\DC2\EOT\156\ETX\DLE\DC1\n\
    \0\n\
    \\EOT\EOT!\STX\SOH\DC2\EOT\157\ETX\STX\DC2\"\" into the declaring node's params\n\
    \\n\
    \\r\n\
    \\ENQ\EOT!\STX\SOH\ENQ\DC2\EOT\157\ETX\STX\a\n\
    \\r\n\
    \\ENQ\EOT!\STX\SOH\SOH\DC2\EOT\157\ETX\b\r\n\
    \\r\n\
    \\ENQ\EOT!\STX\SOH\ETX\DC2\EOT\157\ETX\DLE\DC1\n\
    \0\n\
    \\EOT\EOT!\STX\STX\DC2\EOT\158\ETX\STX\SI\"\" the declaration that declares it\n\
    \\n\
    \\r\n\
    \\ENQ\EOT!\STX\STX\ACK\DC2\EOT\158\ETX\STX\EOT\n\
    \\r\n\
    \\ENQ\EOT!\STX\STX\SOH\DC2\EOT\158\ETX\ENQ\n\
    \\n\
    \\r\n\
    \\ENQ\EOT!\STX\STX\ETX\DC2\EOT\158\ETX\r\SOb\beditionsp\233\a"