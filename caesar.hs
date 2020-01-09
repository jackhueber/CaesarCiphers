-- Haskell Cipher

import Data.Char (ord, chr, isUpper, isAlpha)

-- encrypt shifts each character using mapping and charShift
encrypt :: Int -> String -> String
encrypt = (<$>) . charShift

-- Same as encrypt but negate
decrypt :: Int -> String -> String
decrypt = (<$>) . charShift . negate
 
-- charShift takes each character and shifts them by the ShiftAmt
charShift :: Int -> Char -> Char
charShift shiftAmt ch
-- This section was partly brought to you by Google so
-- that we don't go out of bounds and have both upper and lowercase
  | isAlpha ch = chr $ intAlpha + mod ((ord ch - intAlpha) + shiftAmt) 26
  | otherwise = ch
  where
    intAlpha =
      ord  
        (if isUpper ch
           then 'A'
           else 'a')

--  Incrementing current number (cur = 0) to the end number (26 in this case)
-- call encrypt for each time  then print the output
solve :: String -> Int -> Int -> IO ()
solve msg cur end = do
    let encode = encrypt (cur) msg
    let out = "Ceasar " ++ show cur ++ ": " ++ encode
    putStrLn out
    let c = cur + 1
    if cur /= end
    then solve msg c end
    else putStrLn "" 

main :: IO ()
main = do
    -- Define the original msg and shiftAmt for the functions
    let msg = "HAL"
    let shiftAmt = 1

    -- Call each function and print out for encrypt and decrypt and solve
    let encoded = encrypt shiftAmt msg
    let encryptedStr = "Encrypt: " ++ encoded
    let msgOut = "Original Text: " ++ msg
    putStrLn msgOut
    putStrLn encryptedStr

    let decoded = decrypt shiftAmt encoded
    let decryptedStr = "Decrypt: " ++ decoded
    putStrLn decryptedStr
    
    solve msg 0 26