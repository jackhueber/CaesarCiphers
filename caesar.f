! Jack Hueber
program caeser
implicit none
 
  integer, parameter :: key = 1
  integer, parameter :: shift = 1
  character(50) :: str = "hal"
! print out results
  call to_upper(str)
  write(*, "(2a)") "Original str  = ", str
  call encrypt(str, shift)
  write(*, "(2a)") "Encrypted str = ", str
  call decrypt(str)
  write(*, "(2a)") "Decrypted str = ", str
  call solve(str, 26)
contains
 
! converts string to uppercase
   subroutine to_upper(msg)
     character(*), intent(in out) :: msg
     integer :: i
     do i = 1, len_trim(msg)
           msg(i:i) = achar(iachar(msg(i:i))-32)
     end do
   end subroutine To_upper
 
! encrypts the string
subroutine encrypt(msg, shift)
  character(*), intent(inout) :: msg
  integer :: shift
  integer :: i
  do i = 1, len_trim(msg)
        msg(i:i) = achar(modulo(iachar(msg(i:i)) - 65 + shift, 26) + 65)
  end do
end subroutine
 
! decrypts the string
subroutine decrypt(msg)
  character(*), intent(inout) :: msg
  integer :: i
 
  do i = 1, len_trim(msg)
        msg(i:i) = achar(modulo(iachar(msg(i:i)) - 65 - key, 26) + 65)
  end do
end subroutine
 
! solves the string
subroutine solve(msg, fullShift)
  character(*), intent(inout) :: msg
  integer :: fullShift
  integer :: i
  character(len=len(msg)) :: strCopy
    do i = 0, fullShift
       strCopy = msg
       call encrypt(strCopy, i )
       write(*, *) "Caesar ", i, ": ", strCopy
    end do
  
 
 
end subroutine
 
end program caeser
