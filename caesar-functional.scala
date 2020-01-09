//Scala functional

object Main {
    // charShift function takes a char form the msg and shifts the chars
    def charShift(char:Char, shiftAmt:Int):Char =  {
        // Here if the letters are in the 26 character range
        if (char.toInt + shiftAmt > 'Z'.toInt) {
            return (char.toInt + shiftAmt -26).toChar
        } else {
            return (char.toInt + shiftAmt).toChar
        }
    }

    // Iterate through each character of the string and
    // for each char, send it to charShift() and then concat it
    // kinda like ML implode after explode and shift
    def encrypt(str:String, shiftAmt:Int):String = {
        var encoded:String = "";
        str.foreach((char: Char) => encoded = encoded.concat((charShift(char, shiftAmt).toString)));
        return encoded
    }

    // Same as encrypt but negate the shiftAmt
    def decrypt(str:String, shiftAmt:Int):String = {
        var decoded:String = "";
        str.foreach((char: Char) => decoded = decoded.concat((charShift(char, -shiftAmt).toString)));
        return decoded
    }

    // Call encrypt from current (cur = 0) to the end (26 in this case)
    def solve(str:String, cur:Int, end:Int) {
        println("Ceasar " + cur + ": " + Main.encrypt(str, cur));
        // increment cur until the end amount
        if(cur != end) {
            solve(str, cur+1 , end);
        }
    }

    def main(args: Array[String]): Unit = {
        val msg = "HAL";
        val shiftAmt = 1;
		// Call all of the functions here
        val encrypted = Main.encrypt(msg, shiftAmt);
        val decrypted = Main.decrypt(encrypted, shiftAmt);
		
		// Print for encrypt and decrpyt and call solve
        println("Original Text: " + msg);
        println("Encrypted: " + encrypted);
        println("Decrypted: " + decrypted);
        Main.solve(msg, 0, 26);
    }
}