(*ML*)

(*Basically doing exactly what we did in class*)
fun shiftChar (ch : char, shiftNum : int) : char =
	case ch of #" " => #" "
	|  _ => chr (((ord (Char.toUpper ch) - 65 + shiftNum) mod 26) + 65);

(*Implode the shifted characters after exploding the string and *)
fun encrypt (str : string, shiftNum : int) : string =
	String.implode(map (fn x => shiftChar (x, shiftNum)) (String.explode(str)));

fun decrypt (str : string, shiftNum : int) : string =
	encrypt (str, shiftNum * ~1);

fun solve (str, maxshiftNum) =
	map (fn x => print ("Caesar "^(Int.toString x)^": "^encrypt(str, x)^"\n")) (List.tabulate(maxshiftNum, fn x => x + 1))

(* Test cases *)
val str = "HAL";
val encryptStr = encrypt(str, 1);
decrypt(encryptStr, 1);
solve(str, 26);