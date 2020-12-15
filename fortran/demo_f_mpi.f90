Program demo_f_mpi
!====== MPI =====
    use mpi     
!================
    implicit none
    integer, parameter :: N = 20
    real*8 w
    integer i
    common/sol/ x
    real*8 x
    real*8, dimension(N) :: y 
!============================== MPI =================================
    integer ind
    real*8, dimension(:), allocatable :: y_local                    
    integer numnodes,myid,rc,ierr,start_local,end_local,N_local     
    real*8 allsum                                                   
!====================================================================
    
!============================== MPI =================================
    call mpi_init( ierr )                                           
    call mpi_comm_rank ( mpi_comm_world, myid, ierr )               
    call mpi_comm_size ( mpi_comm_world, numnodes, ierr )           
                                                                                                                                        !
    N_local = N/numnodes                                            
    allocate ( y_local(N_local) )                                   
    start_local = N_local*myid + 1                                  
    end_local =  N_local*myid + N_local                             
!====================================================================
    do i = start_local, end_local
        w = i*1d0
        call proc(w)
        ind = i - N_local*myid
        y_local(ind) = x
!       y(i) = x
!       write(6,*) 'i, y(i)', i, y(i)
    enddo   
!       write(6,*) 'sum(y) =',sum(y)
!============================================== MPI =====================================================
    call mpi_reduce( sum(y_local), allsum, 1, mpi_real8, mpi_sum, 0, mpi_comm_world, ierr )             
    call mpi_gather ( y_local, N_local, mpi_real8, y, N_local, mpi_real8, 0, mpi_comm_world, ierr )     
                                                                                                        
    if (myid == 0) then                                                                                 
        write(6,*) '-----------------------------------------'                                          
        write(6,*) '*Final output from... myid=', myid                                                  
        write(6,*) 'numnodes =', numnodes                                                               
        write(6,*) 'mpi_sum =', allsum  
        write(6,*) 'y=...'
        do i = 1, N
            write(6,*) y(i)
        enddo                                                                                       
        write(6,*) 'sum(y)=', sum(y)                                                                
    endif                                                                                               
                                                                                                        
    deallocate( y_local )                                                                               
    call mpi_finalize(rc)                                                                               
!========================================================================================================
    
Stop
End Program
Subroutine proc(w)
    real*8, intent(in) :: w
    common/sol/ x
    real*8 x
    
    x = w
    
Return
End Subroutine
