//demo_c_mpi
#include <stdio.h>
//======= MPI ========
#include "mpi.h"    
#include <stdlib.h>   
//====================

double proc(double w){
        double x;       
        x = w;  
        return x;
}

int main(int argc, char* argv[]){
    int N=20;
    double w;
    int i;
    double x;
    double y[N];
    double sum;
//=============================== MPI ============================
    int ind;                                                    
    double *y_local;                                            
    int numnodes,myid,rc,ierr,start_local,end_local,N_local;    
    double allsum;                                              
//================================================================
//=============================== MPI ============================
    MPI_Init(&argc, &argv);
    MPI_Comm_rank( MPI_COMM_WORLD, &myid );
    MPI_Comm_size ( MPI_COMM_WORLD, &numnodes );
    N_local = N/numnodes;
    y_local=(double *) malloc(N_local*sizeof(double));
    start_local = N_local*myid + 1;
    end_local = N_local*myid + N_local;
//================================================================
    
    for (i = start_local; i <= end_local; i++){        
        w = i*1e0;
        x = proc(w);
        ind = i - N_local*myid;
        y_local[ind-1] = x;
//      y[i-1] = x;
//      printf("i,x= %d %lf\n", i, y[i-1]) ;
    }
    sum = 0e0;
    for (i = 1; i<= N_local; i++){
        sum = sum + y_local[i-1];   
    }
//  printf("sum(y)= %lf\n", sum);    
//====================================== MPI ===========================================
    MPI_Reduce( &sum, &allsum, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD );
    MPI_Gather( &y_local[0], N_local, MPI_DOUBLE, &y[0], N_local, MPI_DOUBLE, 0, MPI_COMM_WORLD );
    
    if (myid == 0){
    printf("-----------------------------------\n");
    printf("*Final output from... myid= %d\n", myid);
    printf("numnodes = %d\n", numnodes);
    printf("mpi_sum = %lf\n", allsum);
    printf("y=...\n");
    for (i = 1; i <= N; i++){
        printf("%lf\n", y[i-1]);
    }   
    sum = 0e0;
    for (i = 1; i<= N; i++){
        sum = sum + y[i-1]; 
    }
    
    printf("sum(y) = %lf\n", sum);
    
    }
    
    free( y_local );
    MPI_Finalize ();
//======================================================================================        

return 0;
}
