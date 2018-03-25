module Lib
    ( blueprintJson
    ) where

import Codec.Compression.Zlib
import qualified Data.ByteString.Lazy.Char8 as L
import Data.ByteString.Base64.Lazy

blueprintJson :: [Char] -> Either String [Char]
blueprintJson = fmap bpDeflate . bpDecode

bpDecode :: [Char] -> Either String L.ByteString
bpDecode "" = Left "bpDecode: Empty input"
bpDecode str = decode . L.pack . tail $ str

bpDeflate :: L.ByteString -> [Char]
bpDeflate = L.unpack . decompress