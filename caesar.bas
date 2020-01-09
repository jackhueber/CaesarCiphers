' Jack Hueber
Sub Encrypt(msg As String, shift As Integer)
  Dim temp As Integer
  For i As Integer = 0 To Len(msg) 
    ' Uppercase the msg and shift
    UCase(msg)
    temp = msg[i] + shift
    If temp > 90 Then temp -= 26
      msg[i] = temp
    Next
End Sub

Sub Decrypt(msg As String, shift As Integer)
  Dim temp As Integer
  For i As Integer = 0 To Len(msg) 
    ' Uppercase the msg and shift but subtract so opposite of encrypt
    UCase(msg)
    temp = msg[i] - shift
    If temp > 90 Then temp -= 26
      msg[i] = temp
    Next
End Sub

Sub Solve(fullShift As Integer, msg As String, org As String)
  for i As Integer = 0 to fullshift
    ' Run the encrypt function  the fullShift (26) times and print all the shifts
    msg = org
    Encrypt msg, i
    Print "Caesar:" + str(i) + " " + msg
  Next
End Sub

' Setting some varibles for the functions
Dim As String msg = "HAL" 
Dim As Integer shift = 1 
Dim As String org = msg
Dim As String Encrypted

Print "Original Str: " + msg
Encrypt msg, shift
Print "Encrypted: " + msg
Encrypted = msg
Decrypt msg, shift
Print "Decrypted: " +  msg
Solve 25, msg, org
Sleep