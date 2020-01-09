{ Jack Hueber }
program Caesar;
{global variable for the string}
var str: String;

function encrypt(str: String; shift: Integer): String;
	var
		i, temp: Integer;
		capStr: String;
	begin
		capStr := UpCase(str);
		for i := 1 to length(capStr) do
		begin
			{ Here we make this shift change by setting it to the integer temp }
			temp := (byte(capStr[i]) - 65 + shift) mod integer(26);
			if (temp < 0) then
				begin
					temp := temp + 26;
				end;
			temp := temp + 65;
			{ Change letter in the str for position i }
			if (byte(capStr[i]) = 32) then
				begin
					temp := 32;
				end;
			capStr[i] := chr(temp);
		end;
		encrypt := capStr;
	end;

function decrypt(str: String; shift: Integer): String;
	var
		i, temp: Integer;
		capStr: String;
	begin
		capStr := UpCase(str);
		for i := 1 to length(capStr) do
		begin
			{ Here we make this shift change by setting it to the integer temp.
				Also subtract the shift now }
			temp := (byte(capStr[i]) - 65 - shift) mod integer(26);
			if (temp < 0) then
				begin
					temp := temp + 26;
				end;
			temp := temp + 65;
			{ Change letter in the str for position i }
			if (byte(capStr[i]) = 32) then
				begin
					temp := 32;
				end;
			capStr[i] := chr(temp);
		end;
		decrypt := capStr;
	end;

procedure solve(str: String; fullShift: Integer);

var
	i: Integer;
begin
	for i := 0 to fullShift do
	begin
	{ Encrpyt is called the fullShift amount, i increments to the fullshift amount }
		Writeln('Caesar ', i, ': ', encrypt(str, i));
	end;
end;

{ Now we call all of the functions, the shift amount being 1 for encrypt and decrypt
	Solve has 26 so it does encrypt for 26 times}
begin
	str := 'hal';
	str := encrypt(str, 1);
	Writeln(str);
	str := decrypt(str, 1);
	Writeln(str);
	solve(str, 26);
end.