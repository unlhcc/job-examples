//demo_c_serial
#include <stdio.h>

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
    for (i = 1; i <= N; i++){        
        w = i*1e0;
        x = proc(w);
        y[i-1] = x;
        printf("i,x= %d %lf\n", i, y[i-1]) ;
    }
    
    sum = 0e0;
    for (i = 1; i<= N; i++){
        sum = sum + y[i-1]; 
    }
    
    printf("sum(y)= %lf\n", sum);  
 
return 0; 
}
