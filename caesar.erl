% Erlang
-module(main).
-export([encrypt/2,decrypt/2,start/0]).

shiftChar(Char, ShiftNum) when (Char /= " ") ->
	% We want to get the ascii value of the character to shift it
	ToAscii = fun([Character]) -> Character end,
	% Using the ascii value, shift the value by the ShiftNum
	(ToAscii(Char) - 65 + ShiftNum) rem (26) + 65.

% Same as always, map the characters to the function and shiftChar them by the ShiftNum
encrypt(Msg, ShiftNum) ->
    Shifted = lists:map(fun(Char) -> shiftChar([string:to_upper(Char)], ShiftNum) end, Msg),
	io:format("Encrypted: ~s~n", [Shifted]).
	
% Same as encrypt but negate the direction of the shift
decrypt(Msg, ShiftNum) ->
    Shifted = lists:map(fun(Char) -> shiftChar([string:to_upper(Char)], ShiftNum * -1) end, Msg),
	io:format("Decrypted: ~s~n", [Shifted]).

solve(Msg, MaxShift) ->
	% Create a list from 0 to MaxShift(26)
	ShiftList = lists:seq(0, MaxShift),
	% Iterate over all of the shift iterations in the list
	lists:foreach(fun(ShiftNum) ->
		io:fwrite("Caesar ~p: ", [ShiftNum]),
		encrypt(Msg, ShiftNum) end, ShiftList).

start() ->
    encrypt("HAL",1),
    decrypt("IBM",1),
    solve("HAL",26).