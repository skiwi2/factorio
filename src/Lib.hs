module Lib
    ( blueprintJson
    ) where

import Codec.Compression.Zlib
import qualified Data.ByteString.Char8 as C
import qualified Data.ByteString.Lazy.Char8 as L
import Data.ByteString.Base64

blueprintJson :: [Char] -> [Char]
blueprintJson str = bpDeflate (bpDecode str)

bpDecode :: [Char] -> C.ByteString
bpDecode str = let (Right decoded) = decode (C.pack (tail str)) in decoded

bpDeflate :: C.ByteString -> [Char]
bpDeflate bstr = L.unpack (decompress (L.fromStrict bstr))