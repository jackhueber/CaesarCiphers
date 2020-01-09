// Jack Hueber
object Main extends App {
	class Caesar {

	// Global varible str as a string
	var str = ""

	// shift is how many letters we shift each position, we return the shifted string
	def encrypt(shift: Int): String = {
		val newShift = shift % 26
		
		//change to uppercase to make shifting easier
		val strArray = this.str.toUpperCase().toCharArray()
		var retString = ""

		for (i<-strArray) {
			if (i.toInt == 32) {
				retString += " ";
			} else {
				var temp = (i.toInt - 65 + newShift) % 26
				if (temp < 0) {
					temp += 26
				}
				retString += (temp + 65).toChar
			}
		}

		return retString
	}

	// shift is how many letters we shift each position, we return the shifted string
	// we substract the shift rather than add to be the opposite of encrypt
	def decrypt(shift: Int): String = {
		val newShift = shift % 26
		
		// change to upper case to make shifting easier
		val strArray = this.str.toUpperCase().toCharArray()
		var retString = ""

		for (i<-strArray) {
			if (i.toInt == 32) {
				retString += " ";
			} else {
				var temp = (i.toInt - 65 - newShift) % 26
				if (temp < 0) {
					temp += 26
				}
				retString += (temp + 65).toChar
			}
		}

		return retString
	}

	// full shift is the amount of times we loop through encrypt, we return the list of encrypted strings
	def solve(fullShift: Int) {
		for (i <- 0 to fullShift) {
			println("Caesar " + i + ": " + encrypt(i))
		}
	}
}
	var caesar = new Caesar()
		caesar.str = "HAL"
		caesar.str = caesar.encrypt(1)
		println(caesar.str)
		caesar.str = caesar.decrypt(1)
		println(caesar.str)
		println(caesar.solve(26))
}