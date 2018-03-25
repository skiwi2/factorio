module Lib
    ( blueprintJson
    ) where

import Codec.Compression.Zlib
import qualified Data.ByteString.Char8 as C
import qualified Data.ByteString.Lazy.Char8 as L
import Data.ByteString.Base64

blueprintJson :: [Char] -> Either String [Char]
blueprintJson str = fmap bpDeflate (bpDecode str)

bpDecode :: [Char] -> Either String C.ByteString
bpDecode "" = Left "bpDecode: Empty input"
bpDecode str = decode (C.pack (tail str))

bpDeflate :: C.ByteString -> [Char]
bpDeflate bstr = L.unpack (decompress (L.fromStrict bstr))