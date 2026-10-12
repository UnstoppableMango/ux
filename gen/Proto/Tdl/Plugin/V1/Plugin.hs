{- This file was auto-generated from tdl/plugin/v1/plugin.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Tdl.Plugin.V1.Plugin (
        Diagnostic(), DirectiveSpec(), Features(), File(), Handshake(),
        HandshakeReply(), Request(), Response(), Severity(..), Severity(),
        Severity'UnrecognizedValue
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
import qualified Proto.Tdl.Ir.V1.Ir
{- | Fields :
     
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.severity' @:: Lens' Diagnostic Severity@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.message' @:: Lens' Diagnostic Data.Text.Text@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.position' @:: Lens' Diagnostic Proto.Tdl.Ir.V1.Ir.Position@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.maybe'position' @:: Lens' Diagnostic (Prelude.Maybe Proto.Tdl.Ir.V1.Ir.Position)@ -}
data Diagnostic
  = Diagnostic'_constructor {_Diagnostic'severity :: !Severity,
                             _Diagnostic'message :: !Data.Text.Text,
                             _Diagnostic'position :: !(Prelude.Maybe Proto.Tdl.Ir.V1.Ir.Position),
                             _Diagnostic'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Diagnostic where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Diagnostic "severity" Severity where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Diagnostic'severity
           (\ x__ y__ -> x__ {_Diagnostic'severity = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Diagnostic "message" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Diagnostic'message (\ x__ y__ -> x__ {_Diagnostic'message = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Diagnostic "position" Proto.Tdl.Ir.V1.Ir.Position where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Diagnostic'position
           (\ x__ y__ -> x__ {_Diagnostic'position = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Diagnostic "maybe'position" (Prelude.Maybe Proto.Tdl.Ir.V1.Ir.Position) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Diagnostic'position
           (\ x__ y__ -> x__ {_Diagnostic'position = y__}))
        Prelude.id
instance Data.ProtoLens.Message Diagnostic where
  messageName _ = Data.Text.pack "tdl.plugin.v1.Diagnostic"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \Diagnostic\DC23\n\
      \\bseverity\CAN\SOH \SOH(\SO2\ETB.tdl.plugin.v1.SeverityR\bseverity\DC2\CAN\n\
      \\amessage\CAN\STX \SOH(\tR\amessage\DC2/\n\
      \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        severity__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "severity"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Severity)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"severity")) ::
              Data.ProtoLens.FieldDescriptor Diagnostic
        message__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "message"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"message")) ::
              Data.ProtoLens.FieldDescriptor Diagnostic
        position__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "position"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Tdl.Ir.V1.Ir.Position)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'position")) ::
              Data.ProtoLens.FieldDescriptor Diagnostic
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, severity__field_descriptor),
           (Data.ProtoLens.Tag 2, message__field_descriptor),
           (Data.ProtoLens.Tag 3, position__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Diagnostic'_unknownFields
        (\ x__ y__ -> x__ {_Diagnostic'_unknownFields = y__})
  defMessage
    = Diagnostic'_constructor
        {_Diagnostic'severity = Data.ProtoLens.fieldDefault,
         _Diagnostic'message = Data.ProtoLens.fieldDefault,
         _Diagnostic'position = Prelude.Nothing,
         _Diagnostic'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Diagnostic -> Data.ProtoLens.Encoding.Bytes.Parser Diagnostic
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
                                       "severity"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"severity") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "message"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"message") y x)
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
          (do loop Data.ProtoLens.defMessage) "Diagnostic"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"severity") _x
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
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"message") _x
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
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Diagnostic where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Diagnostic'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Diagnostic'severity x__)
                (Control.DeepSeq.deepseq
                   (_Diagnostic'message x__)
                   (Control.DeepSeq.deepseq (_Diagnostic'position x__) ())))
{- | Fields :
     
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.name' @:: Lens' DirectiveSpec Data.Text.Text@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.minArgs' @:: Lens' DirectiveSpec Data.Int.Int32@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.maxArgs' @:: Lens' DirectiveSpec Data.Int.Int32@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.argKinds' @:: Lens' DirectiveSpec [Proto.Tdl.Ir.V1.Ir.LiteralKind]@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.vec'argKinds' @:: Lens' DirectiveSpec (Data.Vector.Vector Proto.Tdl.Ir.V1.Ir.LiteralKind)@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.repeatable' @:: Lens' DirectiveSpec Prelude.Bool@ -}
data DirectiveSpec
  = DirectiveSpec'_constructor {_DirectiveSpec'name :: !Data.Text.Text,
                                _DirectiveSpec'minArgs :: !Data.Int.Int32,
                                _DirectiveSpec'maxArgs :: !Data.Int.Int32,
                                _DirectiveSpec'argKinds :: !(Data.Vector.Vector Proto.Tdl.Ir.V1.Ir.LiteralKind),
                                _DirectiveSpec'repeatable :: !Prelude.Bool,
                                _DirectiveSpec'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DirectiveSpec where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField DirectiveSpec "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DirectiveSpec'name (\ x__ y__ -> x__ {_DirectiveSpec'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DirectiveSpec "minArgs" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DirectiveSpec'minArgs
           (\ x__ y__ -> x__ {_DirectiveSpec'minArgs = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DirectiveSpec "maxArgs" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DirectiveSpec'maxArgs
           (\ x__ y__ -> x__ {_DirectiveSpec'maxArgs = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DirectiveSpec "argKinds" [Proto.Tdl.Ir.V1.Ir.LiteralKind] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DirectiveSpec'argKinds
           (\ x__ y__ -> x__ {_DirectiveSpec'argKinds = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField DirectiveSpec "vec'argKinds" (Data.Vector.Vector Proto.Tdl.Ir.V1.Ir.LiteralKind) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DirectiveSpec'argKinds
           (\ x__ y__ -> x__ {_DirectiveSpec'argKinds = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DirectiveSpec "repeatable" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DirectiveSpec'repeatable
           (\ x__ y__ -> x__ {_DirectiveSpec'repeatable = y__}))
        Prelude.id
instance Data.ProtoLens.Message DirectiveSpec where
  messageName _ = Data.Text.pack "tdl.plugin.v1.DirectiveSpec"
  packedMessageDescriptor _
    = "\n\
      \\rDirectiveSpec\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\EM\n\
      \\bmin_args\CAN\STX \SOH(\ENQR\aminArgs\DC2\EM\n\
      \\bmax_args\CAN\ETX \SOH(\ENQR\amaxArgs\DC23\n\
      \\targ_kinds\CAN\EOT \ETX(\SO2\SYN.tdl.ir.v1.LiteralKindR\bargKinds\DC2\RS\n\
      \\n\
      \repeatable\CAN\ENQ \SOH(\bR\n\
      \repeatable"
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
              Data.ProtoLens.FieldDescriptor DirectiveSpec
        minArgs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "min_args"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"minArgs")) ::
              Data.ProtoLens.FieldDescriptor DirectiveSpec
        maxArgs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "max_args"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"maxArgs")) ::
              Data.ProtoLens.FieldDescriptor DirectiveSpec
        argKinds__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "arg_kinds"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Tdl.Ir.V1.Ir.LiteralKind)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Packed (Data.ProtoLens.Field.field @"argKinds")) ::
              Data.ProtoLens.FieldDescriptor DirectiveSpec
        repeatable__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "repeatable"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"repeatable")) ::
              Data.ProtoLens.FieldDescriptor DirectiveSpec
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, minArgs__field_descriptor),
           (Data.ProtoLens.Tag 3, maxArgs__field_descriptor),
           (Data.ProtoLens.Tag 4, argKinds__field_descriptor),
           (Data.ProtoLens.Tag 5, repeatable__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _DirectiveSpec'_unknownFields
        (\ x__ y__ -> x__ {_DirectiveSpec'_unknownFields = y__})
  defMessage
    = DirectiveSpec'_constructor
        {_DirectiveSpec'name = Data.ProtoLens.fieldDefault,
         _DirectiveSpec'minArgs = Data.ProtoLens.fieldDefault,
         _DirectiveSpec'maxArgs = Data.ProtoLens.fieldDefault,
         _DirectiveSpec'argKinds = Data.Vector.Generic.empty,
         _DirectiveSpec'repeatable = Data.ProtoLens.fieldDefault,
         _DirectiveSpec'_unknownFields = []}
  parseMessage
    = let
        loop ::
          DirectiveSpec
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Proto.Tdl.Ir.V1.Ir.LiteralKind
             -> Data.ProtoLens.Encoding.Bytes.Parser DirectiveSpec
        loop x mutable'argKinds
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'argKinds <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                              mutable'argKinds)
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
                              (Data.ProtoLens.Field.field @"vec'argKinds") frozen'argKinds x))
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
                                  mutable'argKinds
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "min_args"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"minArgs") y x)
                                  mutable'argKinds
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "max_args"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"maxArgs") y x)
                                  mutable'argKinds
                        32
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (Prelude.fmap
                                           Prelude.toEnum
                                           (Prelude.fmap
                                              Prelude.fromIntegral
                                              Data.ProtoLens.Encoding.Bytes.getVarInt))
                                        "arg_kinds"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'argKinds y)
                                loop x v
                        34
                          -> do y <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                        Data.ProtoLens.Encoding.Bytes.isolate
                                          (Prelude.fromIntegral len)
                                          ((let
                                              ploop qs
                                                = do packedEnd <- Data.ProtoLens.Encoding.Bytes.atEnd
                                                     if packedEnd then
                                                         Prelude.return qs
                                                     else
                                                         do !q <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    (Prelude.fmap
                                                                       Prelude.toEnum
                                                                       (Prelude.fmap
                                                                          Prelude.fromIntegral
                                                                          Data.ProtoLens.Encoding.Bytes.getVarInt))
                                                                    "arg_kinds"
                                                            qs' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                                     (Data.ProtoLens.Encoding.Growing.append
                                                                        qs q)
                                                            ploop qs'
                                            in ploop)
                                             mutable'argKinds)
                                loop x y
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "repeatable"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"repeatable") y x)
                                  mutable'argKinds
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'argKinds
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'argKinds <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                    Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'argKinds)
          "DirectiveSpec"
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"minArgs") _x
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
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"maxArgs") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (let
                         p = Lens.Family2.view
                               (Data.ProtoLens.Field.field @"vec'argKinds") _x
                       in
                         if Data.Vector.Generic.null p then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                               ((\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                  (Data.ProtoLens.Encoding.Bytes.runBuilder
                                     (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                        ((Prelude..)
                                           ((Prelude..)
                                              Data.ProtoLens.Encoding.Bytes.putVarInt
                                              Prelude.fromIntegral)
                                           Prelude.fromEnum)
                                        p))))
                      ((Data.Monoid.<>)
                         (let
                            _v
                              = Lens.Family2.view (Data.ProtoLens.Field.field @"repeatable") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (\ b -> if b then 1 else 0) _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData DirectiveSpec where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_DirectiveSpec'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_DirectiveSpec'name x__)
                (Control.DeepSeq.deepseq
                   (_DirectiveSpec'minArgs x__)
                   (Control.DeepSeq.deepseq
                      (_DirectiveSpec'maxArgs x__)
                      (Control.DeepSeq.deepseq
                         (_DirectiveSpec'argKinds x__)
                         (Control.DeepSeq.deepseq (_DirectiveSpec'repeatable x__) ())))))
{- | Fields :
     
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.reuse' @:: Lens' Features Prelude.Bool@ -}
data Features
  = Features'_constructor {_Features'reuse :: !Prelude.Bool,
                           _Features'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Features where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Features "reuse" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Features'reuse (\ x__ y__ -> x__ {_Features'reuse = y__}))
        Prelude.id
instance Data.ProtoLens.Message Features where
  messageName _ = Data.Text.pack "tdl.plugin.v1.Features"
  packedMessageDescriptor _
    = "\n\
      \\bFeatures\DC2\DC4\n\
      \\ENQreuse\CAN\SOH \SOH(\bR\ENQreuse"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        reuse__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "reuse"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"reuse")) ::
              Data.ProtoLens.FieldDescriptor Features
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, reuse__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Features'_unknownFields
        (\ x__ y__ -> x__ {_Features'_unknownFields = y__})
  defMessage
    = Features'_constructor
        {_Features'reuse = Data.ProtoLens.fieldDefault,
         _Features'_unknownFields = []}
  parseMessage
    = let
        loop :: Features -> Data.ProtoLens.Encoding.Bytes.Parser Features
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
                                       "reuse"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"reuse") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Features"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"reuse") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Features where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Features'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Features'reuse x__) ())
{- | Fields :
     
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.path' @:: Lens' File Data.Text.Text@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.content' @:: Lens' File Data.ByteString.ByteString@ -}
data File
  = File'_constructor {_File'path :: !Data.Text.Text,
                       _File'content :: !Data.ByteString.ByteString,
                       _File'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show File where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField File "path" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _File'path (\ x__ y__ -> x__ {_File'path = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField File "content" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _File'content (\ x__ y__ -> x__ {_File'content = y__}))
        Prelude.id
instance Data.ProtoLens.Message File where
  messageName _ = Data.Text.pack "tdl.plugin.v1.File"
  packedMessageDescriptor _
    = "\n\
      \\EOTFile\DC2\DC2\n\
      \\EOTpath\CAN\SOH \SOH(\tR\EOTpath\DC2\CAN\n\
      \\acontent\CAN\STX \SOH(\fR\acontent"
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
              Data.ProtoLens.FieldDescriptor File
        content__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "content"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"content")) ::
              Data.ProtoLens.FieldDescriptor File
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, path__field_descriptor),
           (Data.ProtoLens.Tag 2, content__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _File'_unknownFields
        (\ x__ y__ -> x__ {_File'_unknownFields = y__})
  defMessage
    = File'_constructor
        {_File'path = Data.ProtoLens.fieldDefault,
         _File'content = Data.ProtoLens.fieldDefault,
         _File'_unknownFields = []}
  parseMessage
    = let
        loop :: File -> Data.ProtoLens.Encoding.Bytes.Parser File
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
                                       "path"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"path") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "content"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"content") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "File"
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"content") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData File where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_File'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_File'path x__) (Control.DeepSeq.deepseq (_File'content x__) ()))
{- | Fields :
     
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.framingVersion' @:: Lens' Handshake Data.Int.Int32@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.irVersion' @:: Lens' Handshake Data.Text.Text@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.watch' @:: Lens' Handshake Prelude.Bool@ -}
data Handshake
  = Handshake'_constructor {_Handshake'framingVersion :: !Data.Int.Int32,
                            _Handshake'irVersion :: !Data.Text.Text,
                            _Handshake'watch :: !Prelude.Bool,
                            _Handshake'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Handshake where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Handshake "framingVersion" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Handshake'framingVersion
           (\ x__ y__ -> x__ {_Handshake'framingVersion = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Handshake "irVersion" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Handshake'irVersion
           (\ x__ y__ -> x__ {_Handshake'irVersion = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Handshake "watch" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Handshake'watch (\ x__ y__ -> x__ {_Handshake'watch = y__}))
        Prelude.id
instance Data.ProtoLens.Message Handshake where
  messageName _ = Data.Text.pack "tdl.plugin.v1.Handshake"
  packedMessageDescriptor _
    = "\n\
      \\tHandshake\DC2'\n\
      \\SIframing_version\CAN\SOH \SOH(\ENQR\SOframingVersion\DC2\GS\n\
      \\n\
      \ir_version\CAN\STX \SOH(\tR\tirVersion\DC2\DC4\n\
      \\ENQwatch\CAN\ETX \SOH(\bR\ENQwatch"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        framingVersion__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "framing_version"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"framingVersion")) ::
              Data.ProtoLens.FieldDescriptor Handshake
        irVersion__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "ir_version"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"irVersion")) ::
              Data.ProtoLens.FieldDescriptor Handshake
        watch__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "watch"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"watch")) ::
              Data.ProtoLens.FieldDescriptor Handshake
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, framingVersion__field_descriptor),
           (Data.ProtoLens.Tag 2, irVersion__field_descriptor),
           (Data.ProtoLens.Tag 3, watch__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Handshake'_unknownFields
        (\ x__ y__ -> x__ {_Handshake'_unknownFields = y__})
  defMessage
    = Handshake'_constructor
        {_Handshake'framingVersion = Data.ProtoLens.fieldDefault,
         _Handshake'irVersion = Data.ProtoLens.fieldDefault,
         _Handshake'watch = Data.ProtoLens.fieldDefault,
         _Handshake'_unknownFields = []}
  parseMessage
    = let
        loop :: Handshake -> Data.ProtoLens.Encoding.Bytes.Parser Handshake
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
                                       "framing_version"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"framingVersion") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "ir_version"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"irVersion") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "watch"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"watch") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Handshake"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"framingVersion") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"irVersion") _x
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
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"watch") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                               _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Handshake where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Handshake'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Handshake'framingVersion x__)
                (Control.DeepSeq.deepseq
                   (_Handshake'irVersion x__)
                   (Control.DeepSeq.deepseq (_Handshake'watch x__) ())))
{- | Fields :
     
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.accepted' @:: Lens' HandshakeReply Prelude.Bool@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.refusal' @:: Lens' HandshakeReply Data.Text.Text@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.name' @:: Lens' HandshakeReply Data.Text.Text@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.version' @:: Lens' HandshakeReply Data.Text.Text@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.directives' @:: Lens' HandshakeReply [DirectiveSpec]@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.vec'directives' @:: Lens' HandshakeReply (Data.Vector.Vector DirectiveSpec)@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.features' @:: Lens' HandshakeReply Features@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.maybe'features' @:: Lens' HandshakeReply (Prelude.Maybe Features)@ -}
data HandshakeReply
  = HandshakeReply'_constructor {_HandshakeReply'accepted :: !Prelude.Bool,
                                 _HandshakeReply'refusal :: !Data.Text.Text,
                                 _HandshakeReply'name :: !Data.Text.Text,
                                 _HandshakeReply'version :: !Data.Text.Text,
                                 _HandshakeReply'directives :: !(Data.Vector.Vector DirectiveSpec),
                                 _HandshakeReply'features :: !(Prelude.Maybe Features),
                                 _HandshakeReply'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show HandshakeReply where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField HandshakeReply "accepted" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HandshakeReply'accepted
           (\ x__ y__ -> x__ {_HandshakeReply'accepted = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField HandshakeReply "refusal" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HandshakeReply'refusal
           (\ x__ y__ -> x__ {_HandshakeReply'refusal = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField HandshakeReply "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HandshakeReply'name
           (\ x__ y__ -> x__ {_HandshakeReply'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField HandshakeReply "version" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HandshakeReply'version
           (\ x__ y__ -> x__ {_HandshakeReply'version = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField HandshakeReply "directives" [DirectiveSpec] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HandshakeReply'directives
           (\ x__ y__ -> x__ {_HandshakeReply'directives = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField HandshakeReply "vec'directives" (Data.Vector.Vector DirectiveSpec) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HandshakeReply'directives
           (\ x__ y__ -> x__ {_HandshakeReply'directives = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField HandshakeReply "features" Features where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HandshakeReply'features
           (\ x__ y__ -> x__ {_HandshakeReply'features = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField HandshakeReply "maybe'features" (Prelude.Maybe Features) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _HandshakeReply'features
           (\ x__ y__ -> x__ {_HandshakeReply'features = y__}))
        Prelude.id
instance Data.ProtoLens.Message HandshakeReply where
  messageName _ = Data.Text.pack "tdl.plugin.v1.HandshakeReply"
  packedMessageDescriptor _
    = "\n\
      \\SO\&HandshakeReply\DC2\SUB\n\
      \\baccepted\CAN\SOH \SOH(\bR\baccepted\DC2\CAN\n\
      \\arefusal\CAN\STX \SOH(\tR\arefusal\DC2\DC2\n\
      \\EOTname\CAN\ETX \SOH(\tR\EOTname\DC2\CAN\n\
      \\aversion\CAN\EOT \SOH(\tR\aversion\DC2<\n\
      \\n\
      \directives\CAN\ENQ \ETX(\v2\FS.tdl.plugin.v1.DirectiveSpecR\n\
      \directives\DC23\n\
      \\bfeatures\CAN\ACK \SOH(\v2\ETB.tdl.plugin.v1.FeaturesR\bfeatures"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        accepted__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "accepted"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"accepted")) ::
              Data.ProtoLens.FieldDescriptor HandshakeReply
        refusal__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "refusal"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"refusal")) ::
              Data.ProtoLens.FieldDescriptor HandshakeReply
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor HandshakeReply
        version__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "version"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"version")) ::
              Data.ProtoLens.FieldDescriptor HandshakeReply
        directives__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "directives"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor DirectiveSpec)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"directives")) ::
              Data.ProtoLens.FieldDescriptor HandshakeReply
        features__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "features"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Features)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'features")) ::
              Data.ProtoLens.FieldDescriptor HandshakeReply
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, accepted__field_descriptor),
           (Data.ProtoLens.Tag 2, refusal__field_descriptor),
           (Data.ProtoLens.Tag 3, name__field_descriptor),
           (Data.ProtoLens.Tag 4, version__field_descriptor),
           (Data.ProtoLens.Tag 5, directives__field_descriptor),
           (Data.ProtoLens.Tag 6, features__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _HandshakeReply'_unknownFields
        (\ x__ y__ -> x__ {_HandshakeReply'_unknownFields = y__})
  defMessage
    = HandshakeReply'_constructor
        {_HandshakeReply'accepted = Data.ProtoLens.fieldDefault,
         _HandshakeReply'refusal = Data.ProtoLens.fieldDefault,
         _HandshakeReply'name = Data.ProtoLens.fieldDefault,
         _HandshakeReply'version = Data.ProtoLens.fieldDefault,
         _HandshakeReply'directives = Data.Vector.Generic.empty,
         _HandshakeReply'features = Prelude.Nothing,
         _HandshakeReply'_unknownFields = []}
  parseMessage
    = let
        loop ::
          HandshakeReply
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld DirectiveSpec
             -> Data.ProtoLens.Encoding.Bytes.Parser HandshakeReply
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
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "accepted"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"accepted") y x)
                                  mutable'directives
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "refusal"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"refusal") y x)
                                  mutable'directives
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                                  mutable'directives
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "version"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"version") y x)
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
                        50
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "features"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"features") y x)
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
          "HandshakeReply"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"accepted") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                         _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"refusal") _x
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
                   (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
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
                      (let
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"version") _x
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
                         ((Data.Monoid.<>)
                            (case
                                 Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'features") _x
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
instance Control.DeepSeq.NFData HandshakeReply where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_HandshakeReply'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_HandshakeReply'accepted x__)
                (Control.DeepSeq.deepseq
                   (_HandshakeReply'refusal x__)
                   (Control.DeepSeq.deepseq
                      (_HandshakeReply'name x__)
                      (Control.DeepSeq.deepseq
                         (_HandshakeReply'version x__)
                         (Control.DeepSeq.deepseq
                            (_HandshakeReply'directives x__)
                            (Control.DeepSeq.deepseq (_HandshakeReply'features x__) ()))))))
{- | Fields :
     
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.target' @:: Lens' Request Data.Text.Text@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.model' @:: Lens' Request Proto.Tdl.Ir.V1.Ir.Model@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.maybe'model' @:: Lens' Request (Prelude.Maybe Proto.Tdl.Ir.V1.Ir.Model)@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.out' @:: Lens' Request Data.Text.Text@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.dryRun' @:: Lens' Request Prelude.Bool@ -}
data Request
  = Request'_constructor {_Request'target :: !Data.Text.Text,
                          _Request'model :: !(Prelude.Maybe Proto.Tdl.Ir.V1.Ir.Model),
                          _Request'out :: !Data.Text.Text,
                          _Request'dryRun :: !Prelude.Bool,
                          _Request'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Request where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Request "target" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'target (\ x__ y__ -> x__ {_Request'target = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Request "model" Proto.Tdl.Ir.V1.Ir.Model where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'model (\ x__ y__ -> x__ {_Request'model = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Request "maybe'model" (Prelude.Maybe Proto.Tdl.Ir.V1.Ir.Model) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'model (\ x__ y__ -> x__ {_Request'model = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Request "out" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'out (\ x__ y__ -> x__ {_Request'out = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Request "dryRun" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Request'dryRun (\ x__ y__ -> x__ {_Request'dryRun = y__}))
        Prelude.id
instance Data.ProtoLens.Message Request where
  messageName _ = Data.Text.pack "tdl.plugin.v1.Request"
  packedMessageDescriptor _
    = "\n\
      \\aRequest\DC2\SYN\n\
      \\ACKtarget\CAN\SOH \SOH(\tR\ACKtarget\DC2&\n\
      \\ENQmodel\CAN\STX \SOH(\v2\DLE.tdl.ir.v1.ModelR\ENQmodel\DC2\DLE\n\
      \\ETXout\CAN\ETX \SOH(\tR\ETXout\DC2\ETB\n\
      \\adry_run\CAN\EOT \SOH(\bR\ACKdryRun"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        target__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "target"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"target")) ::
              Data.ProtoLens.FieldDescriptor Request
        model__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "model"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Tdl.Ir.V1.Ir.Model)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'model")) ::
              Data.ProtoLens.FieldDescriptor Request
        out__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "out"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"out")) ::
              Data.ProtoLens.FieldDescriptor Request
        dryRun__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "dry_run"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"dryRun")) ::
              Data.ProtoLens.FieldDescriptor Request
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, target__field_descriptor),
           (Data.ProtoLens.Tag 2, model__field_descriptor),
           (Data.ProtoLens.Tag 3, out__field_descriptor),
           (Data.ProtoLens.Tag 4, dryRun__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Request'_unknownFields
        (\ x__ y__ -> x__ {_Request'_unknownFields = y__})
  defMessage
    = Request'_constructor
        {_Request'target = Data.ProtoLens.fieldDefault,
         _Request'model = Prelude.Nothing,
         _Request'out = Data.ProtoLens.fieldDefault,
         _Request'dryRun = Data.ProtoLens.fieldDefault,
         _Request'_unknownFields = []}
  parseMessage
    = let
        loop :: Request -> Data.ProtoLens.Encoding.Bytes.Parser Request
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
                                       "target"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"target") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "model"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"model") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "out"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"out") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "dry_run"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"dryRun") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Request"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"target") _x
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
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'model") _x
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
                   (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"out") _x
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
                      (let
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"dryRun") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (\ b -> if b then 1 else 0) _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData Request where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Request'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Request'target x__)
                (Control.DeepSeq.deepseq
                   (_Request'model x__)
                   (Control.DeepSeq.deepseq
                      (_Request'out x__)
                      (Control.DeepSeq.deepseq (_Request'dryRun x__) ()))))
{- | Fields :
     
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.files' @:: Lens' Response [File]@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.vec'files' @:: Lens' Response (Data.Vector.Vector File)@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.post' @:: Lens' Response [Data.Text.Text]@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.vec'post' @:: Lens' Response (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.diagnostics' @:: Lens' Response [Diagnostic]@
         * 'Proto.Tdl.Plugin.V1.Plugin_Fields.vec'diagnostics' @:: Lens' Response (Data.Vector.Vector Diagnostic)@ -}
data Response
  = Response'_constructor {_Response'files :: !(Data.Vector.Vector File),
                           _Response'post :: !(Data.Vector.Vector Data.Text.Text),
                           _Response'diagnostics :: !(Data.Vector.Vector Diagnostic),
                           _Response'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Response where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Response "files" [File] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Response'files (\ x__ y__ -> x__ {_Response'files = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Response "vec'files" (Data.Vector.Vector File) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Response'files (\ x__ y__ -> x__ {_Response'files = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Response "post" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Response'post (\ x__ y__ -> x__ {_Response'post = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Response "vec'post" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Response'post (\ x__ y__ -> x__ {_Response'post = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Response "diagnostics" [Diagnostic] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Response'diagnostics
           (\ x__ y__ -> x__ {_Response'diagnostics = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Response "vec'diagnostics" (Data.Vector.Vector Diagnostic) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Response'diagnostics
           (\ x__ y__ -> x__ {_Response'diagnostics = y__}))
        Prelude.id
instance Data.ProtoLens.Message Response where
  messageName _ = Data.Text.pack "tdl.plugin.v1.Response"
  packedMessageDescriptor _
    = "\n\
      \\bResponse\DC2)\n\
      \\ENQfiles\CAN\SOH \ETX(\v2\DC3.tdl.plugin.v1.FileR\ENQfiles\DC2\DC2\n\
      \\EOTpost\CAN\STX \ETX(\tR\EOTpost\DC2;\n\
      \\vdiagnostics\CAN\ETX \ETX(\v2\EM.tdl.plugin.v1.DiagnosticR\vdiagnostics"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        files__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "files"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor File)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"files")) ::
              Data.ProtoLens.FieldDescriptor Response
        post__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "post"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"post")) ::
              Data.ProtoLens.FieldDescriptor Response
        diagnostics__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "diagnostics"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Diagnostic)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"diagnostics")) ::
              Data.ProtoLens.FieldDescriptor Response
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, files__field_descriptor),
           (Data.ProtoLens.Tag 2, post__field_descriptor),
           (Data.ProtoLens.Tag 3, diagnostics__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Response'_unknownFields
        (\ x__ y__ -> x__ {_Response'_unknownFields = y__})
  defMessage
    = Response'_constructor
        {_Response'files = Data.Vector.Generic.empty,
         _Response'post = Data.Vector.Generic.empty,
         _Response'diagnostics = Data.Vector.Generic.empty,
         _Response'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Response
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Diagnostic
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld File
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
                   -> Data.ProtoLens.Encoding.Bytes.Parser Response
        loop x mutable'diagnostics mutable'files mutable'post
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'diagnostics <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'diagnostics)
                      frozen'files <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'files)
                      frozen'post <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'post)
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
                              (Data.ProtoLens.Field.field @"vec'diagnostics") frozen'diagnostics
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'files") frozen'files
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'post") frozen'post x))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "files"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'files y)
                                loop x mutable'diagnostics v mutable'post
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getText
                                              (Prelude.fromIntegral len))
                                        "post"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'post y)
                                loop x mutable'diagnostics mutable'files v
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "diagnostics"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'diagnostics y)
                                loop x v mutable'files mutable'post
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'diagnostics mutable'files mutable'post
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'diagnostics <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       Data.ProtoLens.Encoding.Growing.new
              mutable'files <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              mutable'post <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'diagnostics mutable'files
                mutable'post)
          "Response"
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
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'files") _x))
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
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'post") _x))
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
                         (Data.ProtoLens.Field.field @"vec'diagnostics") _x))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Response where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Response'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Response'files x__)
                (Control.DeepSeq.deepseq
                   (_Response'post x__)
                   (Control.DeepSeq.deepseq (_Response'diagnostics x__) ())))
newtype Severity'UnrecognizedValue
  = Severity'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Severity
  = SEVERITY_UNSPECIFIED |
    SEVERITY_ERROR |
    SEVERITY_WARNING |
    Severity'Unrecognized !Severity'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Severity where
  maybeToEnum 0 = Prelude.Just SEVERITY_UNSPECIFIED
  maybeToEnum 1 = Prelude.Just SEVERITY_ERROR
  maybeToEnum 2 = Prelude.Just SEVERITY_WARNING
  maybeToEnum k
    = Prelude.Just
        (Severity'Unrecognized
           (Severity'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum SEVERITY_UNSPECIFIED = "SEVERITY_UNSPECIFIED"
  showEnum SEVERITY_ERROR = "SEVERITY_ERROR"
  showEnum SEVERITY_WARNING = "SEVERITY_WARNING"
  showEnum (Severity'Unrecognized (Severity'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "SEVERITY_UNSPECIFIED"
    = Prelude.Just SEVERITY_UNSPECIFIED
    | (Prelude.==) k "SEVERITY_ERROR" = Prelude.Just SEVERITY_ERROR
    | (Prelude.==) k "SEVERITY_WARNING" = Prelude.Just SEVERITY_WARNING
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Severity where
  minBound = SEVERITY_UNSPECIFIED
  maxBound = SEVERITY_WARNING
instance Prelude.Enum Severity where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Severity: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum SEVERITY_UNSPECIFIED = 0
  fromEnum SEVERITY_ERROR = 1
  fromEnum SEVERITY_WARNING = 2
  fromEnum (Severity'Unrecognized (Severity'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ SEVERITY_WARNING
    = Prelude.error
        "Severity.succ: bad argument SEVERITY_WARNING. This value would be out of bounds."
  succ SEVERITY_UNSPECIFIED = SEVERITY_ERROR
  succ SEVERITY_ERROR = SEVERITY_WARNING
  succ (Severity'Unrecognized _)
    = Prelude.error "Severity.succ: bad argument: unrecognized value"
  pred SEVERITY_UNSPECIFIED
    = Prelude.error
        "Severity.pred: bad argument SEVERITY_UNSPECIFIED. This value would be out of bounds."
  pred SEVERITY_ERROR = SEVERITY_UNSPECIFIED
  pred SEVERITY_WARNING = SEVERITY_ERROR
  pred (Severity'Unrecognized _)
    = Prelude.error "Severity.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Severity where
  fieldDefault = SEVERITY_UNSPECIFIED
instance Control.DeepSeq.NFData Severity where
  rnf x__ = Prelude.seq x__ ()
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\SUBtdl/plugin/v1/plugin.proto\DC2\rtdl.plugin.v1\SUB!google/protobuf/go_features.proto\SUB\DC2tdl/ir/v1/ir.proto\"i\n\
    \\tHandshake\DC2'\n\
    \\SIframing_version\CAN\SOH \SOH(\ENQR\SOframingVersion\DC2\GS\n\
    \\n\
    \ir_version\CAN\STX \SOH(\tR\tirVersion\DC2\DC4\n\
    \\ENQwatch\CAN\ETX \SOH(\bR\ENQwatch\"\231\SOH\n\
    \\SO\&HandshakeReply\DC2\SUB\n\
    \\baccepted\CAN\SOH \SOH(\bR\baccepted\DC2\CAN\n\
    \\arefusal\CAN\STX \SOH(\tR\arefusal\DC2\DC2\n\
    \\EOTname\CAN\ETX \SOH(\tR\EOTname\DC2\CAN\n\
    \\aversion\CAN\EOT \SOH(\tR\aversion\DC2<\n\
    \\n\
    \directives\CAN\ENQ \ETX(\v2\FS.tdl.plugin.v1.DirectiveSpecR\n\
    \directives\DC23\n\
    \\bfeatures\CAN\ACK \SOH(\v2\ETB.tdl.plugin.v1.FeaturesR\bfeatures\"\174\SOH\n\
    \\rDirectiveSpec\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\EM\n\
    \\bmin_args\CAN\STX \SOH(\ENQR\aminArgs\DC2\EM\n\
    \\bmax_args\CAN\ETX \SOH(\ENQR\amaxArgs\DC23\n\
    \\targ_kinds\CAN\EOT \ETX(\SO2\SYN.tdl.ir.v1.LiteralKindR\bargKinds\DC2\RS\n\
    \\n\
    \repeatable\CAN\ENQ \SOH(\bR\n\
    \repeatable\" \n\
    \\bFeatures\DC2\DC4\n\
    \\ENQreuse\CAN\SOH \SOH(\bR\ENQreuse\"t\n\
    \\aRequest\DC2\SYN\n\
    \\ACKtarget\CAN\SOH \SOH(\tR\ACKtarget\DC2&\n\
    \\ENQmodel\CAN\STX \SOH(\v2\DLE.tdl.ir.v1.ModelR\ENQmodel\DC2\DLE\n\
    \\ETXout\CAN\ETX \SOH(\tR\ETXout\DC2\ETB\n\
    \\adry_run\CAN\EOT \SOH(\bR\ACKdryRun\"\134\SOH\n\
    \\bResponse\DC2)\n\
    \\ENQfiles\CAN\SOH \ETX(\v2\DC3.tdl.plugin.v1.FileR\ENQfiles\DC2\DC2\n\
    \\EOTpost\CAN\STX \ETX(\tR\EOTpost\DC2;\n\
    \\vdiagnostics\CAN\ETX \ETX(\v2\EM.tdl.plugin.v1.DiagnosticR\vdiagnostics\"4\n\
    \\EOTFile\DC2\DC2\n\
    \\EOTpath\CAN\SOH \SOH(\tR\EOTpath\DC2\CAN\n\
    \\acontent\CAN\STX \SOH(\fR\acontent\"\140\SOH\n\
    \\n\
    \Diagnostic\DC23\n\
    \\bseverity\CAN\SOH \SOH(\SO2\ETB.tdl.plugin.v1.SeverityR\bseverity\DC2\CAN\n\
    \\amessage\CAN\STX \SOH(\tR\amessage\DC2/\n\
    \\bposition\CAN\ETX \SOH(\v2\DC3.tdl.ir.v1.PositionR\bposition*N\n\
    \\bSeverity\DC2\CAN\n\
    \\DC4SEVERITY_UNSPECIFIED\DLE\NUL\DC2\DC2\n\
    \\SOSEVERITY_ERROR\DLE\SOH\DC2\DC4\n\
    \\DLESEVERITY_WARNING\DLE\STXB\n\
    \\146\ETX\a\b\STX\210>\STX\DLE\SOHJ\163'\n\
    \\a\DC2\ENQ\EOT\NUL\139\SOH\SOH\n\
    \\178\SOH\n\
    \\SOH\f\DC2\ETX\EOT\NUL\DC1\SUB\167\SOH The TDL plugin protocol: the messages a backend exchanges with tdl,\n\
    \ whether it is compiled in or run as a subprocess.\n\
    \\n\
    \ See docs/design/plugins.md for the protocol.\n\
    \\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ACK\NUL\SYN\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\b\NUL+\n\
    \\t\n\
    \\STX\ETX\SOH\DC2\ETX\t\NUL\FS\n\
    \\b\n\
    \\SOH\b\DC2\ETX\r\NUL-\n\
    \h\n\
    \\ENQ\b2\234\a\STX\DC2\ETX\r\NUL-\SUBZ Keep the open Go API these types were published with; backends\n\
    \ construct them directly.\n\
    \\n\
    \\b\n\
    \\SOH\b\DC2\ETX\SI\NUL*\n\
    \.\n\
    \\ETX\b2\SOH\DC2\ETX\SI\NUL*\SUB\" Implicit presence, as in proto3.\n\
    \\n\
    \\195\SOH\n\
    \\STX\EOT\NUL\DC2\EOT\NAK\NUL\"\SOH\SUB\182\SOH Handshake is what tdl sends first, before any request.\n\
    \\n\
    \ A plugin that cannot read what is coming refuses here instead of\n\
    \ ignoring fields it does not know and emitting wrong code.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\NAK\b\DC1\n\
    \\163\SOH\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\EM\STX\FS\SUB\149\SOH framing_version is the wire framing this connection uses. Version 1 is\n\
    \ a varint length prefix followed by an encoded message, in both\n\
    \ directions.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX\EM\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\EM\b\ETB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\EM\SUB\ESC\n\
    \\178\SOH\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX\RS\STX\CAN\SUB\164\SOH ir_version is the protobuf package the model is encoded with, such as\n\
    \ \"tdl.ir.v1\". Within a version, field numbers are never reused and new\n\
    \ fields are additive.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\ETX\RS\STX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX\RS\t\DC3\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX\RS\SYN\ETB\n\
    \J\n\
    \\EOT\EOT\NUL\STX\STX\DC2\ETX!\STX\DC1\SUB= watch says this connection may serve more than one request.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ENQ\DC2\ETX!\STX\ACK\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\SOH\DC2\ETX!\a\f\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ETX\DC2\ETX!\SI\DLE\n\
    \4\n\
    \\STX\EOT\SOH\DC2\EOT%\NUL4\SOH\SUB( HandshakeReply is the plugin's answer.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX%\b\SYN\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX&\STX\DC4\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETX&\STX\ACK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX&\a\SI\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX&\DC2\DC3\n\
    \j\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETX*\STX\NAK\SUB] refusal says what the plugin needed, when accepted is false. It should\n\
    \ name both versions.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ENQ\DC2\ETX*\STX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETX*\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETX*\DC3\DC4\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETX,\STX\DC2\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ENQ\DC2\ETX,\STX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETX,\t\r\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETX,\DLE\DC1\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\ETX\DC2\ETX-\STX\NAK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ENQ\DC2\ETX-\STX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\SOH\DC2\ETX-\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ETX\DC2\ETX-\DC3\DC4\n\
    \y\n\
    \\EOT\EOT\SOH\STX\EOT\DC2\ETX1\STX(\SUBl directives are what this backend understands. tdl checks the target\n\
    \ block against them before generating.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\EOT\DC2\ETX1\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\ACK\DC2\ETX1\v\CAN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\SOH\DC2\ETX1\EM#\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\ETX\DC2\ETX1&'\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\ENQ\DC2\ETX3\STX\CAN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\ACK\DC2\ETX3\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\SOH\DC2\ETX3\v\DC3\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\ETX\DC2\ETX3\SYN\ETB\n\
    \\175\SOH\n\
    \\STX\EOT\STX\DC2\EOT:\NULK\SOH\SUB\162\SOH DirectiveSpec is the shape of one directive a backend accepts.\n\
    \\n\
    \ A directive in a target block that no spec declares is a warning and is\n\
    \ passed through anyway.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETX:\b\NAK\n\
    \\v\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETX;\STX\DC2\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\ETX;\STX\b\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETX;\t\r\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETX;\DLE\DC1\n\
    \\v\n\
    \\EOT\EOT\STX\STX\SOH\DC2\ETX<\STX\NAK\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ENQ\DC2\ETX<\STX\a\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\ETX<\b\DLE\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\ETX<\DC3\DC4\n\
    \[\n\
    \\EOT\EOT\STX\STX\STX\DC2\ETX@\STX\NAK\SUBN max_args is the largest number of arguments accepted, or -1 for any\n\
    \ number.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ENQ\DC2\ETX@\STX\a\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\SOH\DC2\ETX@\b\DLE\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ETX\DC2\ETX@\DC3\DC4\n\
    \\181\SOH\n\
    \\EOT\EOT\STX\STX\ETX\DC2\ETXE\STX/\SUB\167\SOH arg_kinds constrains each argument by position. An empty list accepts\n\
    \ any kind, and a list shorter than the argument count constrains only\n\
    \ the arguments it covers.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\EOT\DC2\ETXE\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\ACK\DC2\ETXE\v \n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\SOH\DC2\ETXE!*\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\ETX\DC2\ETXE-.\n\
    \\159\SOH\n\
    \\EOT\EOT\STX\STX\EOT\DC2\ETXJ\STX\SYN\SUB\145\SOH repeatable says several entries of this directive at the same\n\
    \ specificity all reach the backend in source order. Otherwise they are\n\
    \ an error.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\EOT\ENQ\DC2\ETXJ\STX\ACK\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\EOT\SOH\DC2\ETXJ\a\DC1\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\EOT\ETX\DC2\ETXJ\DC4\NAK\n\
    \Q\n\
    \\STX\EOT\ETX\DC2\EOTN\NULR\SOH\SUBE Features are the optional parts of the protocol a backend supports.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\ETX\SOH\DC2\ETXN\b\DLE\n\
    \y\n\
    \\EOT\EOT\ETX\STX\NUL\DC2\ETXQ\STX\DC1\SUBl reuse says the plugin can serve more than one request on a\n\
    \ connection. It must treat each as independent.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ENQ\DC2\ETXQ\STX\ACK\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\ETXQ\a\f\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\ETXQ\SI\DLE\n\
    \z\n\
    \\STX\EOT\EOT\DC2\EOTV\NULe\SOH\SUBn Request is everything a backend needs for one generation. Nothing\n\
    \ travels in argv or environment variables.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\EOT\SOH\DC2\ETXV\b\SI\n\
    \j\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\ETXY\STX\DC4\SUB] target names the block being served. A backend keeps the directives\n\
    \ tagged with this name.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\ETXY\STX\b\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\ETXY\t\SI\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\ETXY\DC2\DC3\n\
    \T\n\
    \\EOT\EOT\EOT\STX\SOH\DC2\ETX\\\STX\FS\SUBG model is one package, with the prelude's declarations merged into it.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\ACK\DC2\ETX\\\STX\DC1\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\SOH\DC2\ETX\\\DC2\ETB\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\ETX\DC2\ETX\\\SUB\ESC\n\
    \I\n\
    \\EOT\EOT\EOT\STX\STX\DC2\ETX_\STX\DC1\SUB< out is the directory the response's paths are relative to.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\STX\ENQ\DC2\ETX_\STX\b\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\STX\SOH\DC2\ETX_\t\f\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\STX\ETX\DC2\ETX_\SI\DLE\n\
    \\176\SOH\n\
    \\EOT\EOT\EOT\STX\ETX\DC2\ETXd\STX\DC3\SUB\162\SOH dry_run says tdl will diff the response against disk rather than\n\
    \ write it. A backend may skip work that cannot affect the files; ignoring\n\
    \ the flag is correct.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\ETX\ENQ\DC2\ETXd\STX\ACK\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\ETX\SOH\DC2\ETXd\a\SO\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\ETX\ETX\DC2\ETXd\DC1\DC2\n\
    \\141\SOH\n\
    \\STX\EOT\ENQ\DC2\EOTi\NULr\SOH\SUB\128\SOH Response is what a backend returns: file contents, which tdl writes, so\n\
    \ tdl enforces path confinement, --verify, and --clean.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\ENQ\SOH\DC2\ETXi\b\DLE\n\
    \\v\n\
    \\EOT\EOT\ENQ\STX\NUL\DC2\ETXj\STX\SUB\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\EOT\DC2\ETXj\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ACK\DC2\ETXj\v\SI\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\SOH\DC2\ETXj\DLE\NAK\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ETX\DC2\ETXj\CAN\EM\n\
    \\177\SOH\n\
    \\EOT\EOT\ENQ\STX\SOH\DC2\ETXo\STX\ESC\SUB\163\SOH post names commands to run over the written files, by name only. The\n\
    \ project decides what a name maps to; a name it has not declared is\n\
    \ skipped with a warning.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\SOH\EOT\DC2\ETXo\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\SOH\ENQ\DC2\ETXo\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\SOH\SOH\DC2\ETXo\DC2\SYN\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\SOH\ETX\DC2\ETXo\EM\SUB\n\
    \\v\n\
    \\EOT\EOT\ENQ\STX\STX\DC2\ETXq\STX&\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\STX\EOT\DC2\ETXq\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\STX\ACK\DC2\ETXq\v\NAK\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\STX\SOH\DC2\ETXq\SYN!\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\STX\ETX\DC2\ETXq$%\n\
    \\159\SOH\n\
    \\STX\EOT\ACK\DC2\EOTw\NULz\SOH\SUB\146\SOH File is one generated file, with a path relative to Request.out. An\n\
    \ absolute path, or one containing \"..\", is an error and nothing is\n\
    \ written.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\ACK\SOH\DC2\ETXw\b\f\n\
    \\v\n\
    \\EOT\EOT\ACK\STX\NUL\DC2\ETXx\STX\DC2\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\ENQ\DC2\ETXx\STX\b\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\SOH\DC2\ETXx\t\r\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\ETX\DC2\ETXx\DLE\DC1\n\
    \\v\n\
    \\EOT\EOT\ACK\STX\SOH\DC2\ETXy\STX\DC4\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\SOH\ENQ\DC2\ETXy\STX\a\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\SOH\SOH\DC2\ETXy\b\SI\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\SOH\ETX\DC2\ETXy\DC2\DC3\n\
    \9\n\
    \\STX\ENQ\NUL\DC2\ENQ}\NUL\129\SOH\SOH\SUB, Severity is how much a diagnostic matters.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\ENQ\NUL\SOH\DC2\ETX}\ENQ\r\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\NUL\DC2\ETX~\STX\ESC\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\SOH\DC2\ETX~\STX\SYN\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\STX\DC2\ETX~\EM\SUB\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\SOH\DC2\ETX\DEL\STX\NAK\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\SOH\SOH\DC2\ETX\DEL\STX\DLE\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\SOH\STX\DC2\ETX\DEL\DC3\DC4\n\
    \\f\n\
    \\EOT\ENQ\NUL\STX\STX\DC2\EOT\128\SOH\STX\ETB\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\STX\SOH\DC2\EOT\128\SOH\STX\DC2\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\STX\STX\DC2\EOT\128\SOH\NAK\SYN\n\
    \\162\SOH\n\
    \\STX\EOT\a\DC2\ACK\135\SOH\NUL\139\SOH\SOH\SUB\147\SOH Diagnostic is a problem a backend found.\n\
    \\n\
    \ It carries a position rather than a node ID, because an ID alone does not\n\
    \ say which table it indexes.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\a\SOH\DC2\EOT\135\SOH\b\DC2\n\
    \\f\n\
    \\EOT\EOT\a\STX\NUL\DC2\EOT\136\SOH\STX\CAN\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ACK\DC2\EOT\136\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\SOH\DC2\EOT\136\SOH\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ETX\DC2\EOT\136\SOH\SYN\ETB\n\
    \\f\n\
    \\EOT\EOT\a\STX\SOH\DC2\EOT\137\SOH\STX\NAK\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\ENQ\DC2\EOT\137\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\SOH\DC2\EOT\137\SOH\t\DLE\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\ETX\DC2\EOT\137\SOH\DC3\DC4\n\
    \\f\n\
    \\EOT\EOT\a\STX\STX\DC2\EOT\138\SOH\STX\"\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\ACK\DC2\EOT\138\SOH\STX\DC4\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\SOH\DC2\EOT\138\SOH\NAK\GS\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\ETX\DC2\EOT\138\SOH !b\beditionsp\233\a"