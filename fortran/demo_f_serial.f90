Program demo_f_serial
    implicit none
    integer, parameter :: N = 20
    real*8 w
    integer i
    common/sol/ x
    real*8 x
    real*8, dimension(N) :: y
    do i = 1,N
        w = i*1d0
        call proc(w)
        y(i) = x
        write(6,*) 'i,x = ', i, y(i)
    enddo
    write(6,*) 'sum(y) =',sum(y)
Stop
End Program
Subroutine proc(w)
    real*8, intent(in) :: w
    common/sol/ x
    real*8 x
    x = w
Return
End Subroutine
