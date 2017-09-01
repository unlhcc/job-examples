# Computes the minimum of Rosenbrock function (also known as banana function). Popular function to test robustness of an optimization method. 
# Before running the code, do module load python/3.4 and module load all-pkgs
# Program is executed with four optional arguments. program.py low_x1 high_x1 low_x2 high_x2
# If you skip the optional arguments, random values are assigned. 
import sys
import numpy
from scipy import optimize
from random import uniform

def rosenbrock(coordinates):   # The rosenbrock function
    x = coordinates[0]
    y = coordinates[1] 
    f = (1 - x)**2 + 100.0*(y - x**2)**2
    return f

if __name__ == "__main__":
#  assign defualt values from uniform random numbers
    x_low = uniform(-10,0)
    x_high = uniform(0,10)
    y_low = uniform(-10,0)
    y_high = uniform(0,10)
    bound_array = [x_low, x_high, y_low, y_high]
    for i in range(1,len(sys.argv)):
        if i < 5:
#  Replace the random values with the supplied values 
            bound_array[i-1] = float(sys.argv[i])
   
# The range for brute function requires in tuples  
    brute_range = ((bound_array[0],bound_array[1]), (bound_array[2], bound_array[3]))
    print('Search Boundary  x1= {0:3.3f} x2= {1:3.3f} x3= {2:3.3f} x4= {3:3.3f}'.format(*bound_array))
    
# Here we are doing a brute force optimization. The function is evaluated in grids of points. 
# brute_range is a tuple and defines the boundary for the grid points
# finish=None means no local search. To make the search efficient choose finish=optimize.fmin
    result_from_brute = optimize.brute(rosenbrock, brute_range, full_output=True, finish=None)
    function_min = result_from_brute[1]
    coordinate_of_min = result_from_brute[0]
    #print ('Initial Coordinates= ',brute_range)
    print ('Search Result= ',function_min, coordinate_of_min)

